# Mirror Wall App - Flutter  

**Mirror Wall** is a Flutter-based web browsing app that combines user-friendly functionality with dynamic features such as multiple search engines, theming, bookmarking, and persistent user preferences. The app is powered by **Provider** for state management and **SharedPreferences** for data persistence, offering a seamless user experience.  

---

## Features  

### 1. **Multiple Search Engine Integration**  
- Easily switch between search engines like **Google** and **Yahoo** using buttons.  
- Powered by **InAppWebView** for a smooth and dynamic web browsing experience.  

### 2. **Theme Customization**  
- Switch between **light** and **dark** themes.  
- The selected theme persists across sessions using **SharedPreferences**.  

### 3. **Search Functionality**  
- Search your queries directly through your chosen search engine.  
- Results are displayed within the app's integrated browser.  

### 4. **Bookmark Functionality**  
- Save favorite web pages for future access.  
- View and manage bookmarks from the **Bookmark Screen**.  

### 5. **Browser Controls**  
- **Back**: Navigate to the previous page.  
- **Forward**: Move forward in the browsing history.  
- **Reload**: Refresh the current page.  
- **Pull to Refresh**: Reload the page by swiping down.  

### 6. **Dynamic Screens**  
- **Search Screen**: Perform web searches and interact with results.  
- **Bookmark Screen**: Access and manage bookmarked web pages.  

---

## Screenshots  

| **Search Screen** | **Bookmark Screen** | **Theme Switching** |  
|-------------------|---------------------|----------------------|  
| <img src="https://github.com/user-attachments/assets/e06c4020-deee-4562-93da-1e9c0d27b46d" width="200px"> | <img src="https://github.com/user-attachments/assets/723267ac-6363-449c-a59b-205f012b7d78" width="200px"> | <img src="https://github.com/user-attachments/assets/a80175a4-e426-4110-b776-1c795b688fe2" width="200px"> |  
| <img src="https://github.com/user-attachments/assets/f1598553-5d45-47e8-a93f-30b08d06892e" width="200px"> | <img src="https://github.com/user-attachments/assets/e1ffa60e-5111-48cb-8f0f-f54c784652ef" width="200px" > | <img src="https://github.com/user-attachments/assets/daf14261-24b1-4016-a4f1-4b883b0d784e" width="200px" > |
| <img src="https://github.com/user-attachments/assets/919848a3-7f43-4cf4-946d-2ced95b1f24f" width="200px"> | <img src="https://github.com/user-attachments/assets/596fd80b-a18d-4a99-8f28-e3d50eaf9cc7" width="200px"> |
---

## App Demo Video  

Watch the app in action:  
<video src="https://github.com/user-attachments/assets/f420c051-4209-4033-9368-7551928c0512"> 

---

## Technologies Used  

- **Flutter**: Cross-platform UI toolkit.  
- **InAppWebView**: For advanced webview capabilities.  
- **Provider**: For efficient state management.  
- **SharedPreferences**: For persistent storage of user preferences and data.  

---

## Installation  

1. Clone the repository:  
   ```bash  
   git clone https://github.com/your-repository/mirror-wall.git  
   cd mirror-wall  
2. Install dependencies: 
   ```bash
   flutter pub get
3. Run the application: 
   ```bash
   flutter run

## Usage  

### **Search Engine Switching**  
1. Choose a search engine by clicking the corresponding button.  
2. Type your query in the search bar to view results within the app.  

### **Theme Customization**  
1. Switch themes using the toggle in the settings section.  
2. Your preference will persist across app restarts.  

### **Bookmark Management**  
1. Bookmark pages using the browser view’s bookmark button.  
2. Access and manage saved bookmarks from the **Bookmark Screen**.  

### **Browser Controls**  
- Use **Back**, **Forward**, and **Reload** buttons for navigation.  
- Swipe down to refresh the current page.  

---

## State Management  

The app uses **Provider** for managing app state efficiently:

- **Theme Changes**: Managed with `ThemeProvider`.  
- **Bookmarks**: Controlled using `BookmarkProvider`.  
- **Search Engine Updates**: Handled via `SearchProvider`.  

Persistent data (e.g., theme preferences, bookmarks) is stored using **SharedPreferences**.  

---

  
  
