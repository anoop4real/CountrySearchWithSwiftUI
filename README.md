# CountrySearchWithSwiftUI
# CountrySearchWithSwiftUI

![Country](https://user-images.githubusercontent.com/6782228/104825171-9976d400-5858-11eb-864d-7212df6dd3b0.gif)


## Country Search

A small app to search for details of a country using SwiftUI.

* Supported IDE: `XCode 12, iOS 14 SDK`
* API Used: `https://restcountries.eu/rest/v2/alpha/{code}`
* `Codable` protocol for JSON to object.
* `SVGKit` used for SVG rendering
* `Alamofire` used for Network Activities

### Building

Please do a pod update and Swift package. update after cloning so that libraries are properly updated

### SwiftUI Higlights
1. Used SwiftUI for rendering the UI
2. Used the power of Combine to realtime update the data
3. Used UIKit (ViewRepresentable) to create custom views for Searchbar and SVG images
4. SwiftUI Map used to render country location

### Data Displayed
* Name
* Native Name
* Region
* Capital
* Area
* Flag
* Location in map

### Thought Process

Initially the idea was to do an online search while user types in each character for the country, since the API doesnot support plain list of countries, we may have to parse the complete JSON which seem to be not optimal.

Found that list of countries and their code can be obtained from NSLocale, and used that for initial list which turns out to be faster for filtering without any API call. Once user selects the country , API call is being made to retrieve the required info of a country.

### Known Issues and Debts

Flags - Some flags have wrong colors not sure why, aspect ratio is not fully correct
Maps - Some locations need more zooming in

