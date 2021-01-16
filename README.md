# FlaskReactHerokuQuickstart

This is a guide for quickly setting up a single repository (monorepo) that has a [Flask](https://flask.palletsprojects.com/en/1.1.x/) backend and a [React](https://reactjs.org/) front end deployed onto Heroku.

This will set up:
1. A simple Flask boiler plate code for a basic API
2. A React starter layout based on [create-react-app](https://reactjs.org/docs/create-a-new-react-app.html)
3. Deploying the web client and API to two separate Heroku applications
4. Connecting the web client to the API to pull data from the API

## Getting Started

1. Click on the "Use this template" option and follow the on screen instructions. This will set you up with a clean repository under your own account.
2. Clone your new repo onto your local machine
3. Run `./create_remote_apps -c [your-new-web-app-client-name] -a [your-new-api-name]` 

## Prerequisites

```
Heroku CLI installed locally
```

## Additional notes

Learn more about Github templates [here](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-template-repository)

This work is based on inspiration from this [article](https://medium.com/softup-technologies/how-to-deploy-a-monorepo-to-multiple-heroku-apps-using-github-actions-65e87dc27878)

For more control over automated deploy options, check out this cool [repo](https://github.com/AkhileshNS/heroku-deploy)



