# PetPix

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

A media-sharing social media app focused around pets. From dogs and cats, to monkeys and lizards. All sorts of furry and non-furry friends are welcome.

### App Evaluation

- **Category:** Social, Lifestyle, Pets & Animals
- **Mobile:** Mobile only (currently)
- **Story:** Shows the inside world of pet-owners and their friends. The good, bad, and ugly parts of the responsibility of owning a pet.
- **Market:** Pet owners & animal lovers
- **Habit:** Daily use
- **Scope:** Narrow

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create an account
* User can sign into an account
* User can dictate what their feed will look like by answering a few introductory questions when they first create an account
* User can scroll through their timeline and see a variety of different posts (from their selected interests, accounts they follow, topics they're interested in, etc.).

**Optional Nice-to-have Stories**

* User can create profiles for their pets, including details such as breed, age, personality traits, and favorite activities.
* User can plan pet playdates or matches based on location, pet preferences, and compatibility assessments.
* User can track their pet's health and care routines, including vaccination records, medical appointments, grooming schedules, and dietary preferences.

### 2. Screen Archetypes

- [ ] **Login Screen**
* Required user feature: User can log in / create an account.
- [ ] **Introductory Questions Screen**
* Required user feature: User can determine their timeline.
- [ ] **Home Screen / Timeline**
* Required user feature: User can scroll through their timeline and see a variety of different posts (from their selected interests, accounts they follow, topics they're interested in, etc.).

### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [ ] Home Feed
- [ ] Profile
- [ ] Post/Create/Upload
- [ ] Search & Explore

**Flow Navigation** (Screen to Screen)

- [ ] **Home Screen**
  * Leads to **Private messaging**
  * Leads to **User profile**
  * Leads to **User on timeline**
  * Leads to **Post/Create/Upload**
  * Leads to **User on timeline**
  * Leads to **Search & Explore**
- [ ] **Profile**
  * Leads to **Edit profile picture**
  * Leads to **Settings**
  * Leads to **Privacy**
- [ ] [**Create**]
  * Leads to **Camera**
  * Leads to **Photo Gallery**


## Wireframes

![PetPix-Wireframe](https://github.com/MurtajizMehdi/COP4655-Project/assets/90480945/b166be3a-d94b-4665-9881-8e4d29d0639e)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 


### Models

[User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)  |
| password | String | user's password for login authentication     |
| Name     | String | User's name that's displayed on their account|
| email    | String | user's email where they'll get account info  |

[Pet]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| Name     | String | Pet's name that's displayed on their profile |
| Animal   | String | Type of animal pet is                        |
| Breed    | String | Breed or mix of breeds that pet is           |


### Networking

- Login Screen
- * [POST] /auth/login - to authenticate user login
  * [POST] /auth/signup - to create a new user account
 
- Home Feed Screen
- * [GET] /posts - to retrieve posts from users followed by the current user
  * [POST] /posts - to create a new post
 
- Explore Pets Screen
- * [GET] /pets/explore - to fetch a list of pets for users to explore
  * [POST] /pets/follow - to follow a pet
 
- User Profile Screen
- * [GET] /profile/{username} - to retrieve user profile information
  * [PUT] /profile/{username} - to update user profile information
  * [GET] /profile/{username}/posts - to retrieve posts from a specific user
 
- Pet Profile Screen
- * [GET] /pet/{pet_id} - to retrieve pet profile information
  * [PUT] /pet/{pet_id} - to update pet profile information
  * [GET] /pet/{pet_id}/posts - to retrieve posts associated with a specific pet
 
- Post Details Screen
- * [GET] /posts/{post_id} - to retrieve detailed information about a specific post
  * [POST] /posts/{post_id}/like - to like a post
  * [POST] /posts/{post_id}/comment - to add a comment to a post
