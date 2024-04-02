# CapAPI iOS Client

The CapAPI iOS Client, aims to be a simple yet effective application of the knowledge I posses of iOS app creation. This app not only allows users to view an array of random cat images but also enables the management of favorite cat images and their deletion. Below is an overview of the app's core features, architecture, and more.

## Core Functionality

- **Random Cat Images**: Discover and enjoy a variety of cat images sourced directly from The Cat API.
- **Favorites Management**: Save your beloved cat images to your favorites for quick access anytime.
- **Effortless Deletion**: Easily manage and remove cat images from your favorites list.

## Architecture

The application is built on the MVVM (Model-View-ViewModel) architecture, ensuring a clean separation of concerns. This structure enhances the maintainability of the codebase and simplifies unit testing, making the app robust and reliable.

## Network Layer

A testable and modular network layer, built using Swift's `URLSession`, allows for efficient communication with The Cat API. This setup ensures that adding new endpoints or changing existing ones is a streamlined process.

## User Interface

Utilizing SwiftUI, the app boasts a modern and responsive user interface. From browsing cat images to managing favorites and navigating through confirmation dialogs, every interaction is designed for simplicity and elegance.

## State Management

The app employs `@Published` properties within ViewModels for dynamic UI updates. This reactive approach ensures that the app responds promptly to state changes, providing a seamless user experience.

## Testing

A strong emphasis on unit testing for both the ViewModel and network layer underpins the app's development, ensuring its core functionality is reliable and bug-free.

## Areas for Improvement

While the app sets a high standard in functionality and design, there are always opportunities for enhancement:

- **UI Testing**: Incorporating comprehensive UI tests to guarantee a flawless user experience.
- **Offline Capabilities**: Implementing caching mechanisms for offline access to favorite cat images.
- **Accessibility**: Ensuring the app is accessible to all users, including those with disabilities.
- **App Icons and Visual Design**: Further polishing the app's visual appeal with custom icons and design elements.

## Challenges and Insights

Developing the CapAPI iOS Client within a short time frame presented unique challenges:

- **SwiftUI's Learning Curve**: Leveraging SwiftUI for its modern UI capabilities while navigating its intricacies.
- **Architecture vs. Design**: Prioritizing a solid architectural foundation over extensive visual design, focusing on long-term maintainability.
- **Advanced Features**: Incorporating iOS 17 specific features, custom decoders, and a mockable network layer to enhance the app's functionality and testability.
- **Selective Commenting**: The code is intended to be self-explanatory, with comments reserved for complex logic or important clarifications.


