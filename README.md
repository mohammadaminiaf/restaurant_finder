# Mystery Dining with Yelp - Project Documentation

## Introduction

This project utilizes the Yelp API to create a "mystery dining" experience for users.  They'll be presented with clues about a restaurant based on Yelp data, and then have to guess the restaurant's identity!

## Features:

User Preferences: Ask users about their preferences before search for restaurants.
Mystery Restaurant Selection: Uses the Yelp API to randomly select a restaurant based on user preferences (e.g., cuisine, price range).
Clue Generation: Generates clues based on various Yelp data points like restaurant name, address, cuisine type, rating, reviews, and photos.
Guessing Interface: Allows users to submit their guesses for the mystery restaurant.
Reveal: Shows the actual restaurant information

### Yelp Fusion API

I integrated Yelp Fusion Api to access the large database of restaurants and also the ability to filter them. Using Yelp Api I was able to search for restaurants based on location and also user preferences. I took the location from the user device's GPS and using the latitude and logitude I searched for the restaurants nearby. Yelp Api also allows you to search for businesses based on different preferences like:

#### KeyWord Search
You can Search restaurants by different keywords. These keywords can be about names of the foods or business names.

#### Price
This Api can find restaurants based on the price. There are 4 categories of price that are display by $, $$, $$$ and $$$$ symbols. You can pick on or multiple categories of price.

#### Categories
You can search restaurants based on the food categories. Like you can search for a food by nationality like Chinese, Japanses or Thai. You can also search foods by its type like Noodles and Pizza.

#### Distance
You can also search restaurants by how far they are from your location and if they are open.

#### Special Attribute
There are also many other attributes that contribute to finding the best restaurant for you like if they're pet friendly or accessible to people with wheelchair.

#### Overall steps
First the user sets their preferences and with the help of Api a bunch of results show up. Once the results are ready, there's a wheel of fortune that you can turn in order for one restaurant to be assigned to you. And once a restaurant is selected you can open it in details.

Video Intro:

https://github.com/mohammadzamaniaf/restaurant_finder/assets/132151000/16129872-6b6f-45c1-8afd-c6f598f435d9

