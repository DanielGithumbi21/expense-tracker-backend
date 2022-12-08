# README

Expense Tracker App

Backend Configuration
 The app is bootstrapped using rails new command

 To run the app after cloning, run bundle install then run rails server to start the server.


 The application contains four models and four tables, spendings which conatains, expected income and the budgeted income, expenses which contain expenses incurred in the period, incomes which contain the incomes collected during the period, and finally a users table containing the user details.

 A user can have many expenses and many incomes, but both incomes and expenses must belong to a user


 The type of authentication used is json web tokens, where a token is generated and sent from the frontend with the headers to be verified, if no token or invalid token, som information cannot be retrieved.

 There are three resources containing all endpoints apart from show.
 Other endpoints include, signup,login, getUsers for getting users and information related to them.


 The link to the frontend repository is : https://github.com/DanielGithumbi21/expense-tracker-frontend.git

 The link to the frontend hosted link is https://superlative-toffee-3b2424.netlify.app

 The client side allowas you to enter the expexted budget and income, then afterwards you can add expenses or incomes and there is a dashboard comparing expense and incomes.

 The frontend runs through vite (a vue package)

 npm install
 npm run dev

 using material ui, bootstrap for ui.

