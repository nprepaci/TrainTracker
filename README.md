# TrainTracker

TrainTracker utilizes the [MTA's realtime subway feed](https://api.mta.info/#/landing) to display live subway information. Users can select their preferred subway line and view any of its associated stations. Clicking a station will display inbound trains (uptown and downtown) and arrival times. Users can personalize the app by selecting a custom color theme.

## Architecture

This project was developed entirely with SwiftUI/MVVM architecture.

## Resources

This project could not have been developed without the use of [MTA Realtime API JSON Proxy](https://github.com/jonthornton/MTAPI)

## Running The Project

You will first need to set up your own local MTAPI server. Instructions can be found via the following link: [MTA Realtime API JSON Proxy](https://github.com/jonthornton/MTAPI)

Please note: in order utilize the server linked above, you will need your own MTA API key. Please use the following link to get started: [MTA's realtime subway feed](https://api.mta.info/#/landing)

Once you have your server set up & running (by completing the above), open the project in XCode.

Within XCode, navigate to the "API" file found within the "Model" folder.

Inside the API file you will need to modify the string that points to your local server address: "URL(string: "http://127.0.0.1:5000/by-route/......". Please be sure to only modify the data between and including "http...5000". Do not modify anything else.

Once the URL is updated, the app can be launched. If successful, you will see a list of stations. Nice job!

## Project Features

Users can click on a station from the main view. Clicking on a station will show arrival details of trains going both uptown and downtown (denoted by an up or down arrow). This arrivals view will refresh every minute. This is denoted by the "Updated X seconds ago" label.

The default train line selected is "A". Users can change the train line by clicking the button on the top right of the landing screen. Selecting a new station will automatically bring the user back to the Station View. The Station View will be refreshed and show all stations for a given train line.

Users can change the color scheme. This can be done by selecting the gear icon on the top left of the Station View. This will take the user to the settings page where the color theme can be changed.

## Help

Submit a [GitHub Issues request](https://github.com/nprepaci/TrainTracker/issues). 