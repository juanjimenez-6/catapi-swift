CapAPI iOS Client:

Core Functionality: The iOS app provides users with the ability to view random cat images, manage a list of favorite cat images, and delete favorites from the list.

Architecture: Utilized MVVM (Model-View-ViewModel) for clean separation of concerns, facilitating easier testing and maintenance.

Network Layer: Implemented a testable and modular network layer using Swift's URLSession to consume endpoints from The Cat API.

User Interface: SwiftUI was used to create a modern and responsive UI, including lists of cat images, favorites management, and confirmation dialogs.

State Management: Used @Published properties in ViewModels to manage and update the UI in response to state changes.

Testing: Focused on unit testing the ViewModel and network layer to ensure reliability and correctness of the app's core functionality.


Improvement Areas: UI Tests, offline capabilities, caching, accesibility, app icons

Challenges for the short time period: 
- SwiftUI can be nitpicky sometimes, but I wanted a nice blurry background to accompany the simple experience
- The project is simple but I wanted to go for a strong architecture rathern than being distracted on visual design
- There's some nice things like custom decoders, Mockable network layer, a custom background helper which I ended up not even using, and some iOS 17 specific features
- The code should be straight forward to read but I left a small amount of comments in some specific cases