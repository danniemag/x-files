Thanks for your interest in joining the ChangeX team!

[Jump to the exercise instructions](#exercise-instructions)

As the next step in our hiring process we ask you to complete a technical exercise, we know this takes time, but we do this for a number of reasons:

- It's hard to gauge how someone will work with us from a CV/Resume alone
- Most people don't have a body of public work we can look through
- We don't like to ask you to perform technical exercises during interviews, so we hope by doing this in your own time you can show us the true standard of your work.

## What will happen after you submit your work?

Once you have submitted your work a member of our team will review it. This person will be looking for things like readability of the code, separation of concerns, reasonable spec coverage, etc. This process can take a few days.

If we are impressed with your work, we will organise a call to discuss your submission and application further, usually via a video chat.

## Thank you!

We hugely appreciate you taking the time to undertake this exercise – we don't expect you to spend more than 2-3 hours on this.

We are really looking forward to receiving your completed submission, thank you once again.

---

# Exercise instructions

This is your own personal fork of a little internal app which is used by our Community Success team to manage and process all Applicants to receive funding for specific Projects. They require a new feature to be added and they have also found a bug with the system.

Our Operations team also uses this app to keep track of the upcoming Payments that will be made to successful Applicants, however this is proving problematic as the number of applicants increases.

We are hoping to receive 3 separate pull requests to your forked repository for each of the following:

1. There is a bug in the Applicants index page, the Project title is the same for every Applicant, this needs to be fixed. Once this is fixed, we are interested to know your thoughts on how this bug could have been avoided?
2. The Community Success team have asked for a feature to be able to attach a comment to every change in status they make to an Applicant, noting the reason for the status change. The complete history of these changes and reasons should be available in the app for future review.
3. The Operations team need the Payments page to be more performant as they are receiving 504 timeouts when accessing this in our production environment sometimes. Please describe where you think the issue(s) lie and provide your thoughts on how they might be resolved. If time permits, implement your solution (or implement just enough to prove your ideas).

## Some extra notes:

This is a Rails 7.0 application, using RSpec for specs, run on Ruby 3.1. Once you have the app checked out and have installed all gems, you should run `rails db:reset` to setup the database.

We are assuming that you are familiar with the process of getting an existing Rails app setup and started, but please do let us know if you require any pointers.

Please implement your solutions as if this was a production application.

Feel free to approach the exercise solutions using whatever approach/libraries you feel most appropriate, and shows off your skills and capabilities. If you felt there were other ways the app could be improved and you had some time please implement these, or just let us know what you think could be better.

Finally, if you have any questions regarding this exercise please do not hesitate to ask.
