# Nimbus Contacts

Nimbus Contacts is a feature-rich application that allows users to manage their contacts seamlessly across multiple devices through cloud synchronization. The application leverages Firebase Authentication for secure user login and Cloud Firestore for data storage, ensuring real-time synchronization of contact data.

## Features
- **Create, Edit, Delete, and Search Contacts**: Users can perform all essential contact management operations.
- **Cloud Synchronization**: Contacts are synchronized in real-time across all devices using Cloud Firestore.
- **User Authentication**: Secure login and user management via Firebase Authentication.
- **Advanced Search and Organization**: Enhanced features for contact search and organization using tags.
- **Responsive and Aesthetic UI**: The application features a responsive and visually appealing interface built with Flutter Widgets, following Material 3 Design guidelines.

## Technical Choices
- **State Management with Cubits**: The application uses Cubits for state management, offering a lightweight and straightforward approach to managing state changes. Stateful widgets are employed for simpler state management scenarios to reduce complexity.
- **Modular Code Structure**: The division into data, logic, and presentation layers enhances code readability and maintainability, and scalability.
- **Reusable Widgets**: By creating reusable widgets, the codebase becomes more maintainable and scalable, allowing for consistent UI elements and reducing redundancy.

## Project Structure
The project is structured in a way to present a clear separation of concerns, facilitating future enhancements and maintenance

1. **data**
    - **data_provider**: Contains the classes responsible for interacting with external data sources, such as Firebase.
    - **models**: Defines the data models used in the application.
    - **repositories**: Contains repository classes that provide a clean API for data access, abstracting the underlying data sources.

2. **logic**
    - **cubits**: Contains the Cubit classes for managing the application state. Cubit is chosen for its simplicity and efficiency in handling state management.
    - **states**: Defines the different states managed by the Cubits.

3. **presentation**
    - **screens**: Contains the UI components and screens presented to the user. These are further divided into custom widgets for better organization and maintainability.

## Running Instructions

## Using a built application
You can download the apk [here](apk/app-release.apk) and install in an Android device (either physical or virtual)

OR

### Prerequisites
1. **Install Android Studio**: Download and install [Android Studio](https://developer.android.com/studio).
2. **Set Up Android Emulator**: Set up an Android emulator in Android Studio by following the instructions [here](https://developer.android.com/studio/run/emulator).
   
### Steps
1. **Clone the Repository**:
     ```bash
    git clone  https://github.com/LygiaGarrido/nimbus-contacts.git
    ```
2. **Open Project in Android Studio**:
    - Launch Android Studio.
    - Select "Open an existing Android Studio project" from the welcome screen.
    - Navigate to the cloned `nimbus-contacts` directory and select it.
    - You man want to run pub
   
3. **Install Dependencies**:
    - Open a terminal in Android Studio or navigate to the project directory using a command prompt.
    - Run the command:
      ```bash
      flutter pub get
      ```
    - This will ensure that all dependencies specified in the `pubspec.yaml` file are installed.
   
4. **Configure Emulator**:
    - Ensure that the Android emulator is configured and running. If not, launch the emulator from the AVD Manager in Android Studio.

5. **Run the Application**:
    - Click on the green "Play" button (Run) in the toolbar.
    - Choose the configured emulator from the device list.
    - Click "OK" to start the application installation on the emulator.

6. **Explore Nimbus Contacts**:
    - Once the application is installed, it will automatically launch on the emulator.
    - Explore the features of Nimbus Contacts and test its functionality.

## Demonstration Videos
To see Nimbus Contacts in action, check out the following videos demonstrating various features of the application:

- **Creating an Account**: [Watch Video](media/1_create_new_user.mp4)
- **Login**: [Watch Video](media/2_login.mp4)
- **Adding Contacts**: [Watch Video](media/3_add_new_contact.mp4)
- **Searching Contacts By Name**: [Watch Video](media/4_search_by_name.mp4)
- **Searching Contacts By Tag**: [Watch Video](media/5_search_by_tag.mp4)
- **Editing a Contact**: [Watch Video](media/6_edit_contact.mp4)
- **Deleting a Contact**: [Watch Video](media/7_delete_contact.mp4)

## Room for improvement!
If there was more time to complete this challenge, there are some implementations that I believe would be suitable and enhance the user experience, such as:

- Using other login possibilities (google, social networks...)
- Verifying the user's email
- Adding tag management, allowing the creation of custom tags

and, of course

- Tests

## I hope you enjoy it!
I certainly had fun with this challenge and learned a lot during the process!