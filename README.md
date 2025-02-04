# try! Swift — Technology Experience Prototyping
Facilitators: Carson Ramsden & Mark Stuenkel

Feel free to use these xcode projects as a start if you want! There are two avaliable Xcode projects with an already configured data layer. Feel free to build out your prototype using any API avaliable if you would rather.

## Other potential API Resources
https://www.programmableweb.com/category/all/apis

## Setup
### Server
#### Getting Setup with NPM
- If you don't have homebrew get it with this: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- if you don't have node/npm:
  - `brew update`
  - `brew install node`

#### Running Server
We are using a simple npm server to serve up `JSON`. To use:
- `cd server`
- `npm install`
- `npm start`

### Xcode projects
There are 2 avaliable Xcode projects:
- TrySwiftPrototype: A project using **SwiftUI**
  - Minimum compatability is Xcode 11 beta 5 (Let me know if you need the beta!)
- TrySwiftPrototype2: A project using **UIKit**
  - Minimum compatability is Xcode 10.2

On the master branch you should find a barebones app in which the networking layer has already been built out and the data is being stored in codable objects that represent these api objects. 

We also went through and built a prototype based on this use case. If you are looking for more insperation feel free to check out `prototype_done` for our final product!

## API Summary
`/labs`: Provides a list of labs associated with your target personna. This patient has been monitoring elevated cholesterol for a while now and recently recieved a lab that indicated a spike. An example lab response is:
```
  {
      "id": 5,
      "status": "Reviewed",
      "title": "Cholesterol Panel",
      "collected_at": "2018-07-16T23:30:09Z",
      "ordering_provider_id": 1,
      "follow_up_notes": ["Start on standard dose of Statin.", "Continue to monitor diet, exercise and alcohol consumption", "We will keep monitoring levels and adjust medicaiton as needed. I have attached some documentation on the medication. If you have any questions or concerns please get in touch."],
      "follow_up_links": ["https://www.mayoclinic.org/diseases-conditions/high-blood-cholesterol/in-depth/statins/art-20045772"],
      "interpritation": "This most recent lab has shown an increase in your cholesterol levels which has increased your risk score to a relatively high level. I think it is time we took in to consideration adding medication to help moderate these levels along with diet and exercise and limited alcohol consumption",
      "is_flagged": true,
      "panels": [
        {
          "name": "Cholesterol Panel",
          "measurements": [
            {
              "name": "Total Cholesterol",
              "reference_range": {
                "min": 100,
                "max": 199
              },
              "value" : 300
            },
            {
              "name": "LDL",
              "reference_range": {
                "min": 0,
                "max": 99
              },
              "value" : 190
            },
            {
              "name": "HDL",
              "reference_range": {
                "min": 40
              },
              "value" : 45
            },
            {
              "name": "Triglycerides",
              "reference_range": {
                "min": 0,
                "max": 150
              },
              "value" : 190
            },
            {
              "name": "VLDL",
              "reference_range": {
                "min": 5,
                "max": 40
              },
              "value" : 55
            }
          ]
        }
      ]
    }
```

`/riskScores`: Provides a list of risk scores associated with labs with cholesterol panels. The ACSVD risk (risk of heart attack or stroke) score is the value that the provider actually uses to determine if cholestorol measurements are not withen an acceptable range. There are many available risk calculators but this is one we [liked]( https://statindecisionaid.mayoclinic.org). An example risk score response is:
```
    {
      "id": 4,
      "lab_id": 4,
      "risk_score": 14,
      "with_medicaiton": 9
    }
```

`/providers`: Provides a list of doctors who can be associated with particular labs. An example provider response is:
```    
  {
      "id": 1,
      "email": "dhjalmar@doctors.com",
      "display_name": "Dalila Hjalmar, MD",
      "profile_image_name": "DHjalmarProfile",
      "is_pcp": true,
      "bio": "Dalila has been with the practice for 6 years and focuses on nutritional coaching to help members live their most full lives. She also enjoys CrossFit and Dogs.",
      "specialty": "Nutritional Coaching"
    }
  ```
  `/offices`: Provides a list of office locations for practices in the NY area. An example office response is:
  ```
      {
      "id": 6,
      "name": "Midtown - 42nd St",
      "phone": "212-441-4400",
      "hours": "Mon - Fri: 8am - 7pm",
      "lab_hours": "Mon - Fri: 8am - 5:30pm<br>RN/Vaccine Walk-in Hours: all ages,<br>Mon, Tue, Thur, Fri: 9am - 12pm",
      "title": "Midtown – 42nd St",
      "directions": "<h4>Public Transportation</h4><h5>Nearby Subway Stations</h5><ul>  <li>B, D, F, M, 7 to Bryant Park</li>  <li>4, 5, 6 to Grand Central</li>  <li>1, 2, 3 to Time Square</li></ul><a href=\"http://www.mta.info/\" target=\"_blank\" rel=\"external nofollow\">NYC MTA Home Page</a><h4>Additional Information</h4><p>  Our Midtown - 42nd Street office is at 489 Fifth Avenue, across the street from Bryant Park and the New York Public Library. Our doctor's office is also directly next to Orvis Clothing Store. </p><p>Unfortunately, bikes are not allowed inside the building at this time.</p>",
      "map_link": "https://www.google.com/maps/place/489+5th+Ave,+New+York,+NY+10017/@40.7531364,-73.9830508,17z/data=!3m1!4b1!4m2!3m1!1s0x89c2590045cfd5dd:0x6f00d1e5bb20dd82",
      "email_account": "489fifth",
      "address1": "489 5th Avenue",
      "address2": "3rd Floor",
      "city": "New York",
      "state": "NY",
      "zip": "10017",
      "latitude": 40.753132,
      "longitude": -73.980862,
      "image_url_small": "https://s3.amazonaws.com/www.onemedical.com/images/nyc-489fifth-doctors-office.jpg",
      "image_url_large": "https://s3.amazonaws.com/www.onemedical.com/images/nyc-489fifth-large.jpg"
    }
  ```
