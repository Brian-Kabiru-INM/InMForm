# **InMform**

**InMform** is a SwiftUI application that replicates InM onboarding form, reusable components, and full validation logic — all structured using the **MVVM architecture pattern**.  

***

## Features

### **SwiftUI‑based Form System**

The entire form experience is built using **SwiftUI**, leveraging:

*   Modern declarative UI
*   Smooth animations and transitions
*   Reactive validation updates
*   Simple composition of reusable elements

***

### **Reusable Form Components**

InMform introduces a library of custom SwiftUI components, including:

*   **DropdownField** (salutation selection)
*   **RadioButtonGroup** (gender)
*   **FormTextField** (names, ID, email, phone)
*   **DateInputGroup** (DD/MM/YYYY segmented style)
*   **SectionHeader**
*   **InfoBanner** (warning/info text)
*   **PrimaryActionButton** (Continue button)

Each is reusable and configurable across onboarding screens.

***

### **MVVM Architecture**

The project follows a clean MVVM structure:

*   **Models** store structured personal data
*   **ViewModels** handle validation, business logic, and publish screen updates
*   **Views** focus solely on UI composition and state rendering

This separation ensures scalability, clarity, and testability.

***

### **Robust Form Validation**

The form replicates enterprise‑level input validation with:

*   Required field checks
*   Email format validation
*   Date of birth format rules
*   National ID number rules (length, numeric)
*   Phone number structure validation
*   Dropdown selection validation
*   Real‑time validation feedback

Validation is triggered both **on input** and **on Continue button tap**.

***

###  **Onboarding – Personal Details Form**

Inspired by the provided screenshots, the Personal Details screen includes:

*   Salutation / Title dropdown
*   Gender selection
*   First & Middle Names
*   Surname
*   Segmented Date of Birth (DD/MM/YYYY)
*   National ID Number
*   Email Address
*   Phone Number with fixed prefix (+254)
*   Informational notice with icon
*   Continue Button (enabled only when the form passes validation)

All elements are fully implemented in SwiftUI with scrollable, responsive layout.

***

## Tech Stack

*   **SwiftUI**
*   **MVVM Architecture**
*   **Combine**
*   **Reusable SwiftUI components**
*   **Form validation extensions**

***

## Getting Started

Clone the repository:

```bash
git clone https://github.com/your-username/InMform.git
```

Open the project:

```bash
cd InMform
open InMform.xcodeproj
```

Run on **iOS 16+**
