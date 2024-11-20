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
| ![Search Screen](screenshots/search_screen.png) | ![Bookmark Screen](screenshots/bookmark_screen.png) | ![Theme Switching](screenshots/theme_switching.png) |  

---

## App Demo Video  

Watch the app in action:  
[![Mirror Wall App Demo](screenshots/video_thumbnail.png)](path/to/demo_video.mp4)  
*Click on the image to view the video.*  

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

  
  
