---
layout: story
author: Ricardo Rauch, Partido De La Red
title: The Net Party
description: 
image: /images/net-party.png
category: open government
---

A year ago I received an email from Santiago Siri, telling me that he and a group of people in my city, Buenos Aires, wanted to make some innovations in an area no one else was, bringing their experience with the world of the Internet to the world of politics.
 
We decided that our party’s objective would be to allow everyone living in the city of Buenos Aires to have an opinion within the House of Representatives. To this end, we are developing a web application that would allow exactly that, including the option to delegate one’s vote to another person if that person doesn't feel sufficiently prepared to vote herself. This concept is known as "liquid democracy."
 
At the same time, we've put together a slate of 30 candidates who will attempt to bring our methodology to the House of Representatives of the City of Buenos Aires, voting according to what our users decide online.
 
The idea of the Net Party (or "Partido de la Red," in Spanish) is influenced by international movements such as the Pirate Party in Germany, or the Internet Party in Spain. However the Net Party is different in that we plan to open participation on the platform not only to members of the party, but to all citizens.
 
### Technical Aspects
 
I began my work with this organization by putting up a Wiki page in order to make the Party's manifesto and ideology visible to the world. Later on we had the idea to configure a blog with Wordpress and thus publish news as well as the personal experiences of our members.
 
[image site] [image blog] [image wiki]
 
Cristian Douce and I designed the initial structure for the application and decided to develop it in the Node.js language; along with Express.js as a framework and MongoDB to store information. The decision to use Node.JS came from the idea that interactions between human beings occur in real time, and that this technology will bring many advantages when it comes to implementing debates over ideas. This project is developed under the name of DemocracyOS.
 
#### Prototype #1
 
After we got the communication tools for our party up and running, we started on the first prototype. We designed it so that users could upload suggestions grouped by problem type, and then vote on them.
 
![DemocracyOS Screenshot](https://i.cloudup.com/wTTj1VdFmj.png)
 
When we tested the tools internally in the party the main issue we found was with how difficult it was to communicate the difference between a problem and a proposal. So we decided to KISS, simplifying the application in order to reflect the current functioning of the House of Representatives in the city legislature. 
 
#### Prototype #2 (Current Version)
 
In an earlier version, only legislative projects were voted upon just as legislators would do in session. To do this, we had to import the bills coming up for a vote from the page of the Buenos Aires legislation, as well as define a blueprint for future imports.
 
The current version offers the possibility to vote and delegate the vote to other people by topic (Health, Environment, Transportation, Justice, etc.).
 
As we develop the web application DemocracyOS, we're also building an authentication system for users based on Symfony and OAuth. This would allow for verification that the people voting are real as well as registered in the corresponding district. This side project is called NetID and someday soon it will hopefully be a service provider for other organizations in Argentina who need to validate users.
 
### Promotion of the Party
 
Our publicity is divided into three parts:
*Facebook and Twitter: We create short video ads or images to be virally distributed by people interested in the project.
*Informational Talks: Every week we invite people to get to know the party in our offices in downtown Buenos Aires.
*Traditional Media: In recent months we've received attention from the main media outlets of Argentina. We have near daily presence on radio stations, television programs and in the newspapers.
 
### On a Personal Note
 
The Net Party is the most interesting project that I've been a part of, and luckily I also get to work with an interesting and fun group of people. Today we are 30 altogether, from different places and different professions, from 22 to 74 years old. We get together every Friday in an office in downtown Buenos Aires where we plan for the present and future of our organization.
  
What I like most about this project is that it's only based on building something new, and not just criticizing or making a campaign based on insults against another politician or party. It's something I've never seen before in Argentine politics.
 
On October 27, 2013, we won 21,368 votes in the races for city legislators. In just three months, we organized a political campaign, and with an extremely small budget wound up being the second most-voted local party.

 
### Links
· Web Site
· Twitter
· Facebook
· Wiki


