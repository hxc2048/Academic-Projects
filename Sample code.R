library(vars)
library(forecast)
library(urca)
library(uroot)

######
#DATA#
######
temp = read.csv('UNRATENSA.csv')
full  = ts(temp[2:5],start=c(1972,1),end = c(2018,10),frequency=12)
ue = ts(full[,1],start=c(1972,1),frequency = 12)
ue_hold = ts(full[,1],start=c(1972,1),end = c(2018,6),frequency = 12)
ip = ts(full[,2],start=c(1972,1),frequency = 12)
ip_hold = ts(full[,2],start=c(1972,1),end = c(2018,6),frequency = 12)
ffr = ts(full[,3],start=c(1972,1),frequency = 12)
ffr_hold = ts(full[,3],start=c(1972,1),end = c(2018,6),frequency = 12)
cpi = ts(full[,4],start=c(1972,3),frequency = 12)
cpi_hold = ts(full[,4],start=c(1972,1),end = c(2018,6),frequency = 12)
test1 = ts(tail(ue,4),start = c(2018,7),end = c(2018,10),frequency = 12)
#SARIMA

# We do not need to take a logarithm transformation first. The 
# data does not exhibit exponential growth and it is not obvious that there are periods of 
# varying volatility relative to other parts of the sample. Finally, the growth rate of the civilian
# unemployment rate is not a variable with a natural interpretation. 

#There is no evidence of potential trend in the civilian unemployment rate. The
#  mean of the civilian unemployment rate is non-zero as there are no values in the sample less than 
# 2%. The test will include a drift (meaning a constant), with no trend. 

## Now we will perform a unit root test to determine whether or not our sample is covariance stationary.
# we will perform a dickey-Fuller Test



summary(ur.df(ue_hold,type="drift",lags=30,selectlags="AIC"))

# Value of test-statistic is: -3.635 6.6252

#Critical values for test statistics: 
#  1pct  5pct 10pct
#tau2 -3.43 -2.86 -2.57
#phi1  6.43  4.59  3.78
# Here the t-statistic (-3.635) is less than the critical values of: -3.43,-2.86,-2.57! We reject the unit root test
# We do not need to difference the data.

acf((ue_hold),72)
## There is a a lot of correlation present for the acf! at everylag we do have
## coefficient that are statistically significant.From this plot  We can say that we do have the presense of a non-seasonal Ar
## and we also have a seosonal Ar present 
pacf(ue_hold,72)
## Give us that there is a possibility that we do not  have a moving average for the seasonal component! because at every 12 lags, mainly for
## we have a zero  statistcally significant coefficient.

## However we might have some moving average component for the non- seasonal part because of the few
## correlation present in the plot.

# Initial Guess would be :

iniguess= Arima(ue_hold,order=c(1,0,1),seasonal=c(3,0,0), include.drift = TRUE)
iniguess_2= Arima(ue_hold,order=c(3,0,2),seasonal=c(2,0,0), include.drift = TRUE)
iniguess_3= Arima(ue_hold,order=c(3,0,1),seasonal=c(1,0,0), include.drift = TRUE)
iniguess_4= Arima(ue_hold,order=c(2,0,1),seasonal=c(2,0,0), include.drift = TRUE)
iniguess_5= Arima(ue_hold,order=c(2,0,1),seasonal=c(3,0,0), include.drift = TRUE)

acf(iniguess$residuals,60)
acf(iniguess_2$residuals,60)
acf(iniguess_3$residuals,60)
acf(iniguess_4$residuals,60)
acf(iniguess_5$residuals,60)

iniguess$aic
iniguess$bic
iniguess_2$aic
iniguess_2$bic
iniguess_3$aic
iniguess_3$bic
iniguess_4$aic
iniguess_4$bic
iniguess_5$aic
iniguess_5$bic

#iniguess_4 model lowest AIC and BIC and also in ACF plot, all the coefficients are well contained 
# in the bands


sarima=Arima(ue_hold,order=c(2,0,1),seasonal=c(3,0,0),include.drift = TRUE)
sar_full = Arima(ue,order=c(2,0,1),seasonal=c(2,0,0),include.drift = TRUE)
sar_fore = forecast(sarima,h=4)
sar_fore
##Box Pierce###
Box.test(sarima$residual,60,type='Box-Pierce')
##Plot of the forceast 4-step ahead###
upper=ts(sar_fore$upper[,2],start=c(2018,7),frequency=12)
lower=ts(sar_fore$lower[,2],start=c(2018,7),frequency=12)
windowD=window(ue,start=c(2017,1))
plot(cbind(windowD,upper,lower,sar_fore$mean),plot.type='single',col=c('BLACK','RED','RED','BLUE'),ylab='FORECAST')



sar_full_fore = forecast(sar_full,h=2)
sar_full_fore
sar_mean = sar_fore$mean
sar_mean
sar_mean_full = sar_full_fore$mean
sar_mean_full
sar_upper = sar_fore$upper[,2]
sar_lower = sar_fore$lower[,2]

###SAR ENDS

plot(cbind(windowDATA,var_fore_lower,var_fore_upper,var_fore_mean,sar_mean,sar_upper,sar_lower),plot.type="single",col=c("BLACK","RED","RED","BLUE","PINK","green",'green'),ylab="FORECAST")
legend("bottomleft", c("VAR(13) confidence bands", "Sarima confidence bands", "Sarima Forecast","Var(13) Forecast","Series"),lty=c(1,1,1,1,1),col=c("RED","GREEN","PINK","BLUE","BLACK"))

plot(cbind(windowDATA,mean,sar_mean),plot.type="single",col=c("BLACK","RED","BLUE"),ylab="FORECAST")
legend("bottomleft", c("Origional series", "Var forecast", "Sarima Forecast"),lty=c(1,1,1,1,1),col=c("BLACK","RED","BLUE"))
acf(ue_hold,60)

mean_full
upper_full_ts
lower_full_ts
sar_full_fore$mean
sar_full_fore$upper[,2]
sar_full_fore$lower[,2]

plot(cbind(windowDATA,var_fore_mean_full,var_fore_upper_full,var_fore_lower_full,sar_full_fore$mean,sar_full_fore$upper[,2],sar_full_fore$lower[,2]),
     plot.type = "single",col = c("BLACK","BLUE","RED","RED","PINK","green",'green'),ylab = "forecast")
legend("bottomleft", c("VAR(13) confidence bands", "Sarima confidence bands", "Sarima Forecast","Var(13) Forecast","Series"),lty=c(1,1,1,1,1),col=c("RED","GREEN","PINK","BLUE","BLACK"))


var_fore_mean_full
sar_mean_full

forevar24_full = forecast(VAR12_full,24)
forevar24_mean = forevar24_full$forecast$X.ue.$mean
plot(cbind(windowDATA,forevar24_mean),plot.type="single",col=c("BLACK","RED"),ylab="FORECAST")
legend("bottomleft", c("Origional series", "VAR forecast-24 motnhs"),lty=c(1,1,1,1,1),col=c("BLACK","RED"))

forevar24_upper = forevar24_full$forecast$X.ue.$upper[,2]
accuracy(forevar12$forecast$X.ue_hold., test1)
accuracy(sar_fore$mean,test1)
test1





#test2 = ts(tail(ue,5),start = c(2018,6),end = c(2018,10),frequency = 12)



#checking for co-integration test
jotest=ca.jo(full, type="eigen", K=2, ecdet="none", spec="longrun")
summary(jotest)
plot(decompose(ue_hold))

#checking for stationary
plot(decompose(ue_hold))
acf(ue_hold,50)
summary(ur.df(ue_hold,type = 'drift',lags = 30,selectlags = 'AIC'))
#differencing not needed

plot(decompose(ffr_hold))
acf(ffr_hold,50)
acf(diff(ffr_hold),50)
summary(ur.df(ffr_hold,type = 'trend',lags = 30,selectlags = 'AIC'))
#differencing needed

plot(decompose(cpi_hold))
acf(cpi_hold,100)
summary(ur.df(cpi_hold,type = 'trend',lags = 30,selectlags = 'AIC'))
summary(ur.df(diff(cpi_hold),type = 'drift',lags = 30,selectlags = 'AIC'))
plot(acf(diff(cpi_hold),50))
#differencing needed

plot(decompose(ip_hold))
acf(ip_hold,100)
summary(ur.df(ip_hold,type = 'trend',lags = 30,selectlags = 'AIC'))
summary(ur.df(diff(ip_hold),type = 'drift',lags = 30,selectlags = 'AIC'))
#differencing needed
acf(diff(ip_hold),50)

plot(cbind(ue_hold,ip_hold,cpi_hold,ffr_hold))
plot(cbind(ue_hold,diff(ip_hold),diff(cpi_hold),diff(ffr_hold)))

###BEGIN OF VECTOR AUTO REGRESSION
x = cbind((ue_hold),diff(ip_hold),diff(cpi_hold),diff(ffr_hold))
x_full = cbind((ue),diff(ip),diff(cpi),diff(ffr))
x <- na.omit(x)
x_full = na.omit(x_full)
VARselect(x,lag.max = 20,type = 'const')
VARselect(x_full,lag.max = 20,type = 'const')
VAR12 = VAR(x,p=13,type = 'const')
VAR12_full = VAR(x_full,p=13,type='const')
forevar12 = forecast(VAR12,4)
forevar12_full = forecast(VAR12_full,2)
forevar12$forecast
forevar12_full$forecast

var_fore_mean = forevar12$forecast$X.ue_hold.$mean
var_fore_upper = forevar12$forecast$X.ue_hold.$upper[,2]
var_fore_lower = forevar12$forecast$X.ue_hold.$lower[,2]


var_fore_mean_full = forevar12_full$forecast$X.ue.$mean
var_fore_upper_full = forevar12_full$forecast$X.ue.$upper[,2]
var_fore_lower_full = forevar12_full$forecast$X.ue.$lower[,2]

residuals = resid(VAR12)
acf(residuals)

#upper_full_ts=ts(upper_full,start=c(2018,10),frequency=12)
#upper_full_ts
#lower_full_ts=ts(lower_full,start=c(2018,10),frequency=12)
#lower_full_ts

windowDATA=window(full[,1],start=c(2015,1))
plot(cbind(windowDATA,var_fore_mean,var_fore_lower,var_fore_upper),plot.type="single",col=c("BLACK","BLUE","RED","RED"),ylab="FORECAST")
legend("bottomleft", c("Origional series", "Var forecast","Var 95% confidance bands"),lty=c(1,1,1,1,1),col=c("BLACK","BLUE","RED"))


####VAR ENDS

