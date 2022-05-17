# book_reading_mobile_app

How to build API?
+ Step 1: To define API url in configs/api_config.dart
+ Step 2: To create an abstract class in domain/repositories. Example: auth_repository.dart
+ Step 3: To create an implement of abstract class in data/repositories_impl. Example: auth_repository_impl.dart
+ Step 4: In implement class, declare an instance of RestClient(). 
+ Step 5: Writing method to call API from backend. The method is based on form which i wrote. 

Dow you want to add new entity?
+ Step 1: To create new class and declare attribute in domain/entities. Example: user.dart
+ Step 2: Typing two lines on the top of file: "part 'user.g.dart';" and "@JsonSerializable(explicitToJson: true)"
+ Step 3: Type this command line in the terminal: "flutter pub run build_runner build --delete-conflicting-outputs" to auto generate file convert json. Example: user.g.dart
+ Step 4: In your class, coding the fromJson method and toJson method.  
