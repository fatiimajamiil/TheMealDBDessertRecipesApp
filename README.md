# TheMealDBDessertRecipesApp
The MealDBDessertRecipesApp is a mobile application that provides a collection of dessert recipes for users to explore and try out. It offers a variety of dessert options and allows users to view detailed information about each recipe.

Features
Browse a list of dessert recipes.
View detailed information about a specific recipe.
Sort recipes alphabetically.

![Simulator Screenshot - iPhone 14 Pro - 2023-06-16 at 02 01 14](https://github.com/fatiimajamiil/TheMealDBDessertRecipesApp/assets/113564184/05d21b9a-ea4c-4aef-b666-84856e1086b3){:height="150px" width="200px"}

![Simulator Screenshot - iPhone 14 Pro - 2023-06-16 at 02 00 55](https://github.com/fatiimajamiil/TheMealDBDessertRecipesApp/assets/113564184/1ba85bc0-bfcd-479f-80ff-30fe908944fc){:height="150px" width="200px"}




MVVM Architecture
The app follows the MVVM architectural pattern, which separates the user interface (View) from the underlying data (Model) by introducing a mediator component called ViewModel. Here's how the components are organized in the app:

Models:
- Defining the structure of the data received from the API
- DessertListResponse: Represents the response structure for the desserts list API (https://themealdb.com/api/json/v1/1/filter.php?c=Dessert). It contains an array of Meal objects
- DessertDetailResponse: Represents the response structure for the dessert detail API (https://themealdb.com/api/json/v1/1/lookup.php?i=). It contains an array of RecipeDetail objects


View: 
- Rendering the user interface and handling user interactions
- DessertListView: Rendering the list of desserts
- DessertDetailView: Rendering the details of a selected dessert 

ViewModel: 
- Acts as a bridge between the View and the Model
- Retrieves the necessary data from the Model and prepares it for presentation in the View
- DessertListViewModel: Responsible for fetching the dessert list from the API and managing the list of desserts. It holds an instance of DessertDetailViewModel to handle the details of the selected dessert. It provides methods for populating the dessert list, selecting a dessert, and updating the state of the selected dessert.
- DessertDetailViewModel: Handles the fetching and presentation of the details for a selected dessert

Screens:
- DessertListScreen: Brings together multiple views (DessertListView + DessertDetailView)

The MVVM architecture helps to maintain a clear separation of concerns, making the code more modular and testable. It enables easier maintenance and extensibility as the application grows.
