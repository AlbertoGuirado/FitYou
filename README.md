# 👕 FitYou – Personalize, Create, Share

**FitYou** is a mobile application developed in **Flutter** for digital clothing management, inspired by Vinted. It allows users to create their virtual wardrobe, share clothing posts, and discover content from other users through a modern and intuitive interface.

*University project developed for the DSDM-23 course (Mobile Device Software Development)*

---

## 🚀 Main Features

### 🏠 **Home Screen**
- User post feed with algorithm based on interactions
- Favorites system with heart icon
- Integrated sponsored ads (small and full-screen)
- Smooth navigation between content

### 🔍 **Advanced Search**
- **Text search**: Search bar with character input
- **Category search**: Custom icons for each clothing type
- Smart filtering based on post titles
- Mark favorites from search results

### 👔 **Personal Wardrobe**
- Upload items from **gallery** or **direct camera**
- Complete post management (create, edit, delete)
- **Recovery function** with Command pattern (undo deletion)
- Optimized grid view

### 👤 **User Profile**
- Customizable profile picture
- Follower and following counter
- Social media links
- Favorite items list
- Published posts statistics

### 🔐 **Authentication**
- Registration and login with **Firebase Authentication**
- Guest navigation option (read-only)
- Secure session management

---

## 📋 Post Structure

Each published item includes:
- **📸 Image**: Captured with camera or uploaded from gallery
- **📝 Title and description**: Detailed clothing information
- **🏪 Store URL**: Link where to find the product
- **📏 Size**: Available size information
- **💰 Price**: Reference price found by the user

---

## 🛠️ Technologies and Architecture

### **Technology Stack**
- **Framework**: Flutter (Dart)
- **Backend**: Firebase Realtime Database
- **Authentication**: Firebase Authentication
- **Storage**: Firebase Storage (images)
- **Design**: Figma for prototyping and wireframes

### **Libraries Used**
- `CarouselSlider`: Item list visualization
- `ImagePicker`: Image capture and selection
- Native Flutter components for UI/UX

---

## 🏗️ Implemented Design Patterns

### **SOLID Principles**
- ✅ **Open-Closed Principle**: Classes inheriting from `StatefulWidget`
- ✅ **Liskov Substitution Principle**: Correct inheritance in `_ArmarioState`
- ✅ **DRY Principle**: Component reusability like buttons

### **Design Patterns**
- 🏗️ **Factory Pattern**: Dynamic widget creation based on context
- 🎯 **Command Pattern**: Undo action system (delete items)
- 👁️ **Observer Pattern**: Buttons listening to UI events
- 🔄 **Singleton Pattern**: Single instance of `ImagePicker`
- 📦 **Composite Pattern**: Element organization with `CarouselSlider`

---

## 🧪 Design and Testing Process

### **Design Methodology**
1. Initial **Wireframing** in Figma
2. **Physical mockup** at real scale (iPhone 12 Pro)
3. High-fidelity **Mockups**
4. **Functional prototype** in Flutter
5. **Testing** with real users

### **Usability Testing**
**Guerrilla testing** was conducted with 5+ real users to evaluate the experience.

#### ✅ **Identified Strengths**
- Attractive and appealing design (unanimous)
- Excellent fluidity and response speed
- Well-integrated camera functionality
- Very attractive login interface
- Intuitive navigation

#### ⚠️ **Areas for Improvement**
- Layout adjustments for different Android versions
- Market competition (competitive analysis)
- Additional text indicators for camera/gallery functions

---

## 📱 Screenshots and Demo

### **Navigation Flow**
```
Start → [Register/Login/Guest] → Home → [Search/Wardrobe/Profile]
    ↓
Upload item → [Camera/Gallery] → Form → Publication
    ↓
Interaction → [Favorites/Share] → Personal profile
```

### **Resource Links**
- 🎨 **Figma Design**: [View prototype](https://www.figma.com/file/wDTILbYfHaoR0mVtmwOQcm/Untitled?node-id=0%3A1&t=1g9G5DDzSRSOnGuX-1)
- 📹 **Demo Video**: [View demo on Google Drive](https://drive.google.com/file/d/1pwhAHsC3yhroIRLOkKmRAIGOKPHwTCnj/view?usp=sharing)

---

## 🚀 Installation and Setup

### **Prerequisites**
- Flutter SDK (stable version)
- Android Studio / VS Code
- Configured Firebase account
- Android/iOS device or emulator

### **Installation Steps**
```bash
# Clone the repository
git clone https://github.com/AlbertoGuirado/FitYou
cd fityou

# Install dependencies
flutter pub get

# Configure Firebase
# (Follow official Firebase for Flutter documentation)

# Run the application
flutter run
```

---

## 👥 Development Team

**Developers**:
- **Alberto Guirado Fernández**
- **Álvaro Rosales Zafra** 
**Year**: 2023

---

## 📚 References and Documentation

### **Technical Documentation**
- [Flutter Official Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [BLoC Pattern Library](https://bloclibrary.dev)

### **Learning Resources**
- [Flutter Community Medium](https://medium.com/flutter-community)
- [Flutter YouTube Playlist](https://www.youtube.com/playlist?list=PLl_hIu4u7P677H9f6zPOHiOz2izkvQq2E)

---

## 🤝 Contributions

For suggestions or questions about the implementation, contact the original developers.

---

*Developed with ❤️ and Flutter*