#!/usr/bin/env python
# coding: utf-8

# Methods:
# 1. __init__
# 2. load_and_clean_data
# 3. predicted_probability
# 4. predicted_output_category
# 5. predicted_outputs

# In[2]:


import numpy as np
import pandas as pd
import pickle
from sklearn.preprocessing import StandardScaler
from sklearn.base import BaseEstimator, TransformerMixin

class CustomScaler(BaseEstimator,TransformerMixin): 
    
    def __init__(self,columns,copy=True,with_mean=True,with_std=True):
        self.scaler = StandardScaler(copy,with_mean,with_std)
        self.columns = columns
        self.mean_ = None
        self.var_ = None

    def fit(self, x, y=None):
        self.scaler.fit(x[self.columns], y)
        self.mean_ = np.array(np.mean(x[self.columns]))
        self.var_ = np.array(np.var(x[self.columns]))
        return self

    def transform(self, x, y=None, copy=None):
        init_col_order = x.columns
        x_scaled = pd.DataFrame(self.scaler.transform(x[self.columns]), columns=self.columns)
        x_not_scaled = x.loc[:,~x.columns.isin(self.columns)]
        return pd.concat([x_not_scaled, x_scaled], axis=1)[init_col_order]

class absenteeism_model():
    def __init__(self,absenteeism_model,absenteeism_scaler):
        with open('absenteeism_model','rb') as absenteeism_model, open('absenteeism_scaler','rb') as absenteeism_scaler:
            self.reg=pickle.load(absenteeism_model)
            self.scaler=pickle.load(absenteeism_scaler)
            self.data=None
            
    def load_and_clean_data(self,data_file):
        df=pd.read_csv(data_file,delimiter=',')
        self.df_with_predictions=df.copy()
        df=df.drop(['ID'],axis=1)
        
        reason_columns=pd.get_dummies(df['Reason for Absence'],drop_first=True)
        
        reason1=reason_columns.loc[:,1:14].max(axis=1)
        reason2=reason_columns.loc[:,15:17].max(axis=1)
        reason3=reason_columns.loc[:,18:21].max(axis=1)
        reason4=reason_columns.loc[:,22:].max(axis=1)
        
        df=df.drop(['Reason for Absence'],axis=1)
        df=pd.concat([df,reason1,reason2,reason3,reason4],axis=1)
        column_names=['Date', 'Transportation Expense', 'Distance to Work', 'Age','Daily Work Load Average', 'Body Mass Index','Education', 'Children','Pets', 'Reason_1', 'Reason_2', 'Reason_3', 'Reason_4']
        df.columns=column_names
        
        column_names_reordered=['Reason_1', 'Reason_2', 'Reason_3', 'Reason_4', 'Date', 'Transportation Expense','Distance to Work', 'Age', 'Daily Work Load Average', 'Body Mass Index', 'Education', 'Children', 'Pets']
        df=df[column_names_reordered]
        
        df['Date']=pd.to_datetime(df['Date'],format='%d/%m/%Y')
        
        list_months=[]
        for i in range(df.shape[0]):
            list_months.append(df['Date'][i].month)
        
        df['Month']=list_months
        df['Day of the Week']=df['Date'].apply(lambda x: x.weekday())
        
        df=df.drop(['Date'],axis=1)
        
        new_column=['Reason_1', 'Reason_2', 'Reason_3', 'Reason_4', 'Month', 'Day of the Week','Transportation Expense', 'Distance to Work', 'Age','Daily Work Load Average', 'Body Mass Index', 'Education', 'Children','Pets']
        df=df[new_column]
        
        df['Education']= df['Education'].map({1:0,2:1,3:1,4:1})
        df=df.fillna(value=0)
        df=df.drop(['Day of the Week','Daily Work Load Average','Distance to Work'],axis=1)
        
        self.preprocessed_data=df.copy()
        self.data=self.scaler.transform(df)
        
    def predicted_probability(self):
        if(self.data is not None):
            pred=self.reg.predict_proba(self.data)[:,1]
            return pred
        
    def predicted_output_category(self):
        if(self.data is not None):
            pred_outputs=self.reg.predict(self.data)
            return pred_outputs
        
    def predicted_outputs(self):
        if(self.data is not None):
            self.preprocessed_data['Probability']=self.reg.predict_proba(self.data)[:,1]
            self.preprocessed_data['Prediction']=self.reg.predict(self.data)
            return self.preprocessed_data

