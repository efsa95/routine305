# A/b Testing
See [zybook 8.8](https://learn.zybooks.com/zybook/URICSC305Spring2025/chapter/8/section/8) for directions.

# Elijah
### A/B Test Name: Simple UI
### User Story Number: 13
### Metrics:  
  - Engagement: Useres actually start a workout, which can be tracked easily by seeing when a user actually logs something
  - Retention: Users will spend less time on main page and more time working out
### Hypothesis:  busy UI like the one we have will cause people to decide to just not use our app
### Experiment:  Keeps the same UI for 50% of our useres and designe a new UI that has less options, only containing create a workout and start a workout.
### Variations:  Maximalist page with all info vs Minimal UI with two options

# Sully
### A/B Test Name: Progress Message - "X Workouts Toward Goal" vs. "Keep Going! X Workouts Logged"
### User Story Number: US10 Track User Retention
### Metrics:  
- Happiness: User-reported satisfaction with tracking their progress (if feedback is collected).
- Engagement: Number of users who log at least one additional workout after seeing the message.
- Retention: Percentage of users who return to the app within a week of seeing the message.
### Hypothesis: 
If we change the progress message from "You are now X workouts toward your weekly goal" to "Keep Going! X Workouts Logged," then users will be more motivated to continue logging workouts, leading to increased engagement and retention.
### Experiment: Use one message for 50% of the users, and one message for the other 50% and track how that impacts retention, and the users reaching their goals.
### Variations: "You are now X workouts toward your weekly goal" vs "Keep Going! X Workouts Logged"

# Mason
### A/B Test Name: Post-Workout Summary Screen: With Progress vs No Progress
### User Story Number: US4 (Workout Tracking)
### Metrics:
- Engagement: Number of workouts logged per user after seeing the summary.
- Satisfaction: User perception of progress and motivation (if collected through feedback or ratings).
### Hypothesis:
If users see a small progress summary after each workout (e.g., “You lifted 3% more than last time”), they will feel more accomplished and motivated, which will lead to increased workout logging and better retention.
### Experiment:
Keep the current post-workout screen (just “Workout Logged”) for 50% of users (Group A). Show the other 50% (Group B) a simple progress message after they log a workout (e.g., “+5 lbs from last time” or “3% more volume today”). Use Firebase Remote Config to control the variation, and Firebase Analytics to track workout logs and CTA taps.
### Variations:
- Variation A: Plain confirmation screen after workout logging.
- Variation B: Confirmation screen with personalized progress summary (e.g., “+5 lbs since last workout”).



# Anthony
### A/B Test Name: SIMPLE UI
### User Story Number: 14
### Metrics:  
- Engagement: Users interact more with the habit tracker by logging habits consistently and viewing progress
- Retention: Users return to the app more frequently to maintain streaks and earn achievement badges.
### Hypothesis: A visually engaging habit tracker with streaks and achievement badges will increase motivation and consistency compared to a simple checkbox tracker
### Experiment: 50% of users will use the current habit tracker with basic checkboxes, while the other 50% will have access to a redesigned version featuring progress visualization, streaks, and badges
### Variations: Basic checkbox tracker vs. Gamified tracker with streaks and achievement badges
