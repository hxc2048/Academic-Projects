# Video games industry analysis
### Introduction:
The video games industry has seen a considerable growth in the past two decades. Video games stocks have been on quite a tear over the past 5 years. According to a report from Newzoo’s Global Games market, gamers around the world would likely to spend a $130 billion on games. Newzoo is a market research firm that tracks and usage of video games, mobiles and esports. This figure represents a 13.3 percent increase in revenue from previous year. Video games engagement continues to grow and that could mean some good returns for the investors interested in this market, Samantha Greenberg, chief investment officer and managing partner at Margate capital management, told CNBC.

### Economic Questions:
The growth in the industry revenue could be attributed to increase in the number of gamers along the past two decades. Advancement in technology, creativity, better graphics, game streaming services could be the key factors which makes the game content appealing to every type of gamer with different preferences thus increasing the number of gamers as the industry evolves. According to a report from Newzoo, there are around 2.2 billion active gamers in the world.

### This paper sought to answer the following questions: 
 (1) How the number of gamers has evolved over the years?<br/> 
 (2) What gender type plays more video games?<br/> 
 (3) How the number of gamers from different races have evolved over the years?<br/> 
 (4) How the gamers growth is like across different age groups?

### Data Source:
The data for the analysis has been obtained from the Bureau of Labor Statistics – United States Department of Labor. The American Time Use Survey (ATUS) measures the amount of time people spend doing various activities such as paid work, childcare, volunteering and socializing which are used for economic research. The ATUS datafiles includes information for over 190,000 respondents from 2003 to 2017. 

### Data Overview:
The data that we are interested in is the ATUS summary data file which contains the information about total number of minutes each respondent spent doing each activity. The variable TUCASEID is a unique identifier for each respondent. ‘t120308’ is our variable of interest that has the number of minutes people spent playing videogames. 

### Modelling approach:
This analysis involves the use of linear probability model as our focus is to find how the gamers have increased over the years. It involved a creation of dummy dependent variable for the respondents who played videogames (t120308>0). Then dummy variables for male, different races, different age groups were created. The appropriate model for our analysis is estimated by regressing game dummy on sex, races, age groups. The results are below

<table style="text-align:center"><tr><td colspan="4" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td colspan="3"><em>Dependent variable:</em></td></tr>
<tr><td></td><td colspan="3" style="border-bottom: 1px solid black"></td></tr>
<tr><td style="text-align:left"></td><td colspan="3">dum_games</td></tr>
<tr><td style="text-align:left"></td><td>(1)</td><td>(2)</td><td>(3)</td></tr>
<tr><td colspan="4" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">years</td><td>0.005<sup>***</sup></td><td>0.005<sup>***</sup></td><td>0.006<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td>(0.0002)</td><td>(0.0002)</td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">male</td><td>6.450<sup>***</sup></td><td>6.440<sup>***</sup></td><td>6.395<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td>(0.649)</td><td>(0.646)</td><td>(0.647)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.male</td><td>-0.003<sup>***</sup></td><td>-0.003<sup>***</sup></td><td>-0.003<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td>(0.0003)</td><td>(0.0003)</td><td>(0.0003)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">black</td><td></td><td>-0.040<sup>***</sup></td><td>2.635<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.002)</td><td>(0.951)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">Asian</td><td></td><td>0.060<sup>***</sup></td><td>-3.828<sup>**</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.004)</td><td>(1.812)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">Alnative</td><td></td><td>-0.032<sup>***</sup></td><td>-0.032<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.008)</td><td>(0.008)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">others</td><td></td><td>0.007</td><td>4.397<sup>*</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.006)</td><td>(2.632)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">aged_15to25</td><td></td><td>0.100<sup>***</sup></td><td>6.246<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.003)</td><td>(1.506)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">aged_26to35</td><td></td><td>0.049<sup>***</sup></td><td>2.557<sup>*</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.003)</td><td>(1.402)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">aged_36to45</td><td></td><td>0.055<sup>***</sup></td><td>1.549</td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.003)</td><td>(1.366)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">aged_46to55</td><td></td><td>0.050<sup>***</sup></td><td>0.952</td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.003)</td><td>(1.390)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">aged_56to75</td><td></td><td>0.048<sup>***</sup></td><td>-1.518</td></tr>
<tr><td style="text-align:left"></td><td></td><td>(0.003)</td><td>(1.321)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.black</td><td></td><td></td><td>-0.001<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.0005)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.Asian</td><td></td><td></td><td>0.002<sup>**</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.others</td><td></td><td></td><td>-0.002<sup>*</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.aged_15to25</td><td></td><td></td><td>-0.003<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.aged_26to35</td><td></td><td></td><td>-0.001<sup>*</sup></td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.aged_36to45</td><td></td><td></td><td>-0.001</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.aged_46to55</td><td></td><td></td><td>-0.0004</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">time.aged_56to75</td><td></td><td></td><td>0.001</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td>(0.001)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td style="text-align:left">Constant</td><td>-9.544<sup>***</sup></td><td>-10.144<sup>***</sup></td><td>-11.593<sup>***</sup></td></tr>
<tr><td style="text-align:left"></td><td>(0.431)</td><td>(0.430)</td><td>(1.188)</td></tr>
<tr><td style="text-align:left"></td><td></td><td></td><td></td></tr>
<tr><td colspan="4" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>191,558</td><td>191,558</td><td>191,558</td></tr>
<tr><td style="text-align:left">R<sup>2</sup></td><td>0.003</td><td>0.012</td><td>0.012</td></tr>
<tr><td style="text-align:left">Adjusted R<sup>2</sup></td><td>0.003</td><td>0.012</td><td>0.012</td></tr>
<tr><td style="text-align:left">Residual Std. Error</td><td>0.307 (df = 191554)</td><td>0.305 (df = 191545)</td><td>0.305 (df = 191537)</td></tr>
<tr><td style="text-align:left">F Statistic</td><td>199.353<sup>***</sup> (df = 3; 191554)</td><td>191.642<sup>***</sup> (df = 12; 191545)</td><td>118.247<sup>***</sup> (df = 20; 191537)</td></tr>
<tr><td colspan="4" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td colspan="3" style="text-align:right"><sup>*</sup>p<0.1; <sup>**</sup>p<0.05; <sup>***</sup>p<0.01</td></tr>
</table>







	
From the results above, it is statistically significant that the number of players has increased by 0.6% every year. The positive coefficient on male suggests that males play more video games than females. Though, the negative coefficient on the male and time interaction term shows that over time male gamers are decreasing by 0.3% every year.
Also, over the years, the number of Asian gamers has increased by 0.2% every year. African American gamers have decreased by 0.1% each year. Surprisingly, the number of young gamers – people aged 15 to 25 has decreased by 0.3% each year.

 ![github pic1](https://user-images.githubusercontent.com/51522957/59155448-816d8a80-8a4f-11e9-892c-24db2fe7d886.png)




 
### Conclusion:
It is evident form the above results that the number of gamers has increased over the years which has attributed to the increase in revenue in the video game industry. With the advancements in technology it is expected to grow further. With currently 2.2 billion gamers, a 0.6% increase a year would add 13.2 million gamers each year.








### References:
https://www.bls.gov/tus/datafiles_0317.htm
https://newzoo.com/insights/articles/newzoo-2017-report-insights-into-the-108-9-billion-global-games-market/
https://www.cnbc.com/2018/07/18/video-game-industry-is-booming-with-continued-revenue.html
file:///C:/Users/Hariprasath%20C/Desktop/Video%20games%20project/intergames.htm
https://www.fool.com/investing/2018/11/09/5-trends-explain-the-growth-of-the-video-game-indu.aspx


