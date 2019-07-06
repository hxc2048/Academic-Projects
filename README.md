# Video games industry analysis
### Introduction:
The video games industry has seen a considerable growth in the past two decades. Video games stocks have been on quite a tear over the past 5 years. According to a report from Newzoo’s Global Games market, gamers around the world would likely to spend a $130 billion on games. Newzoo is a market research firm that tracks and usage of video games, mobiles and esports. This figure represents a 13.3 percent increase in revenue from previous year. Video games engagement continues to grow and that could mean some good returns for the investors interested in this market, Samantha Greenberg, chief investment officer and managing partner at Margate capital management, told CNBC.

### Economic Questions:
The growth in the industry revenue could be attributed to increase in the number of gamers along the past two decades. Advancement in technology, creativity, better graphics, game streaming services could be the key factors which makes the game content appealing to every type of gamer with different preferences thus increasing the number of gamers as the industry evolves. According to a report from Newzoo, there are around 2.2 billion active gamers in the world.

### This paper sought to answer the following questions: 
 (1) How the number of gamers has evolved over the years? (2) What gender type plays more video games? (3) How the number of gamers from different races have evolved over the years? (4) How the gamers growth is like across different age groups?

### Data Source:
The data for the analysis has been obtained from the Bureau of Labor Statistics – United States Department of Labor. The American Time Use Survey (ATUS) measures the amount of time people spend doing various activities such as paid work, childcare, volunteering and socializing which are used for economic research. The ATUS datafiles includes information for over 190,000 respondents from 2003 to 2017. 

### Data Overview:
The data that we are interested in is the ATUS summary data file which contains the information about total number of minutes each respondent spent doing each activity. The variable TUCASEID is a unique identifier for each respondent. ‘t120308’ is our variable of interest that has the number of minutes people spent playing videogames. 
Total observations	191558
Males interviewed	83979
Females interviewed	107579
 
### Modelling approach:
This analysis involves the use of linear probability model as our focus is to find how the gamers have increased over the years. It involved a creation of dummy dependent variable for the respondents who played videogames (t120308>0). Then dummy variables for male, different races, different age groups were created. Three models were estimated by regressing game dummy on sex, races, age groups. The results are found below.
![R result1](https://user-images.githubusercontent.com/51522957/59155544-60a63480-8a51-11e9-96d1-c492638b1f03.JPG)
![r results2](https://user-images.githubusercontent.com/51522957/59155550-76b3f500-8a51-11e9-8ab9-5c59b55da80b.JPG)
![r results3](https://user-images.githubusercontent.com/51522957/59155555-7e739980-8a51-11e9-8564-eac1051a5747.JPG)
![r results 4](https://user-images.githubusercontent.com/51522957/59155559-84697a80-8a51-11e9-87c2-9cd378cda252.JPG)
	
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


