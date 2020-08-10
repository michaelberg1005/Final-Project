# Final-Project
Team Project on predicting election results - Michael Berg, Evan Goodwin, Brian Riordan & Ho Kuan Ivy Leong.
## Selected Topic
For our topic of analysis we decided to look at election datasets to see how predictive dollars spent, incumbent, challenger and other data tiems were in determining the winner of a number of types of elections
## Reason why we selected the topic
We were all interested to see factors that could deliver victories in elections, especially given the significance of the upcoming elections in November. Also, we liked that the data set had a clear categorical dependent variable, which made the analysis clearer.
## Questions we hope to answer with the data
The primary questions we hope to answer are: 1.) how predictive is money, party and other key items on election results? 2.) how predictive is an incumbent or challenger on winning or losing an election? 3.) we could break it down further by the state level, and then hopefully use the model as a feature to predict future senate and other local governmental races. We also would also like to see if there. Depending on what further data we could find, we would also like to find out if it varies by district, state, population size or location, or simply how much is spent or how often incumbents or challenger win in various locations, districts, states or population sizes.
### Description of communication protocols
1.) Open communication on slack chat first and foremost to always keep up to date on what each person is doing, task, timelines and what's left.
2.) A semi-formal meet up once a day (even if for just 10 minutes) to formally fiscuss updates on each persons taks, assigning roles, or simply figuring out questions together as a group.
3.) Submit all work throug hour group GitHub, and assing one team member to review each others work. Then prior to submitting, each person has a direct line of contact with who they are in charge of reviewing.
4.) If we agree on slack that we are lost or need some sort of assistance, one (or all members) of the team will make time for an additional 10 minute zoom, or phone call as needed to resolve an issue where we are stuck.
5.) communicate pull requests to review work done by others
### Technologies Used
For our project we plan to use a number of technologies. Some of these include: 1.) PostgreSQL for hosting our database of all of our data we pulled that we care to analyze; 2.) pgAdmin to use PostgreSQL; 3.)Python to manipulate and store the data 4.)jupyter notebook platform within python to utilize various libraries; 5.) javascript, excel and/or Tableau for visualization, also potentially using JavaScript for pulling data, as well as presenting it; 6.) libraries such as PySpark and BeautifulSoup to run certain functions in the ETL process
## Outline of the project
1. We set out to discover what elements are important and predictive (and to what degree) from past elections are on future elections. This way we could use this data analysis to make hypothetical suggestions to our client of what areas to focus on in a campaign to help a candidate win.
2. After having our question figured out of what we wanted to answer we had to dig around to discover what data we could use. In that process we discovered there was a ton of data on past elections including: spend, candidate name, candidate tenure, challenger or incumbent, where they spent money, location, size of populous area, type of community and many more features. Our sources for our data included many public forums including: fec.gov, census.org, hisotry.housr.org, and opensecrets.com.
3. Once we discovered the data our team had to clean it up using a number of technologies including: python (and a number of librarires within it), jupyter notebook, Google Collab.
4. After cleansing the data in an ETL process, we had to do the final loading into a Psotgre SQL databse in order to properly store it, and one that was tied to our RDS in AWS.
5. Once the data was cleaned and stored we had to run a machine learning lagorithm on top, teach it, and come up with the best possible algorithm to accurately and precisely determine what drives a winning candidate based on historical election data.
6. After we do all of these steps we then need to present our findings in a clean presentation that is easy to understand for our clients, as well as easy to use for any interactive functioanlity.

## Machine Learning - "Machine_Learning_model.ipynb"
1. We made the dollar amounts into integers.
2. We dropped all the duplicated columns, not useful data and some data that did not appy to all the candidates.
3. Subtracted the election date to the start in office date.
4. Made dummies for the party and incumbent_challenger_open column.
5. We used a Random Forest decision tree model.  This was used for the following reasons.
      - We have 50 features, so the model will be able to utilize the weak learners.
      - It can handle thousands of input variables without variable deletion..
      - Helps against overfitting and doesn't get effected by outliars.
      - The cons are it can take a long time to process, but our data is less than 5,000 rows, so the processing should not overload our system.

## Google Slides Link
https://docs.google.com/presentation/d/10xKFB5ryPeV8kz6_exZ6RQkto3ELsfqogb9BG6I9I3k/edit?usp=sharing

## Dashboard Blueprint Link
https://docs.google.com/presentation/d/1oOW0D1sCvxATtmq60Iprb_xR4831wRUckPhUXoE_nt4/edit?usp=sharing
