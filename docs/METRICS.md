# [Heart Framework](https://docs.google.com/presentation/d/1sFD5LBsgFg1o2OLPEOdqMxO5248AhKwhmHrn1zC6zEc/edit?usp=sharing)

See [Section 8.5](https://learn.zybooks.com/zybook/URICSC305Spring2025/chapter/8/section/5) for more directions.

#### NPS
    - A pop up will display after each first workout of the week is completed asking the user to rate their experience on a scale of 1-10. This is logged in the backend in Firebase.
#### Adoption
    - Account is created and is tracked through the create account button.  once authentication is set up the next action sends to google analytics.
#### Daily Active Users
    - Firebase is notified when a workout is started 
    - Firebase is notified when a newly created workout is started for the first time
    - Firebase is notified when user attempts to create a workout but decides not to finish
    - Firebase is notified each time a user logs a workout
    - Firebase is notified by how many consecutive days a user logs a workout
    - Firebase is notified if a user returns after 3, 7, or 14 days of inactivity.
#### Retention 
#### CTR for an event on the Golden Path. This is done with Firebase Analytics custom event.

#### Task Success
    - Firebase logs when a user starts but doesn’t finish a workout creation.
    - Helps identify where users drop off during the creation process.
    
<!-- At least one other metric specific to your app. Example : 
    Average number of new ToDo tasks created per active user (those who login) each day reported daily for the past month; 
    this is a way to measure the extent to which users are actually using the app. -->

