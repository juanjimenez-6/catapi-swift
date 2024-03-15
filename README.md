CapAPI iOS Client:

Core Functionality: The iOS app provides users with the ability to view random cat images, manage a list of favorite cat images, and delete favorites from the list.

Architecture: Utilized MVVM (Model-View-ViewModel) for clean separation of concerns, facilitating easier testing and maintenance.

Network Layer: Implemented a testable and modular network layer using Swift's URLSession to consume endpoints from The Cat API.

User Interface: SwiftUI was used to create a modern and responsive UI, including lists of cat images, favorites management, and confirmation dialogs.

State Management: Used @Published properties in ViewModels to manage and update the UI in response to state changes.

Testing: Focused on unit testing the ViewModel and network layer to ensure reliability and correctness of the app's core functionality.


Improvement Areas: UI Tests, offline capabilities, caching, accesibility