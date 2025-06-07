# iOS assessment

## 📱 Overview
Hola!

I was asked to do an Instagram-like Stories feature built that implements infinite pagination, seen/unseen states, and like functionality.

## ✅ Implemented Features

### Core Requirements
- **Story List Screen**: Horizontal scroll with infinite pagination. Current user list comes from a json file with limited users.
- **Story Viewer**: Full-screen navigation between stories-
- **Visual States**: Seen/unseen indicators with custom gradients for stories.
- **Like Functionality**: Heart button with persistence.
- **Navigation**: Tap left/right to navigate + swipe down to close stories.

### UI/UX
- **Colours**: Simple custom color palette and gradients
- **Smooth Interactions**: Native iOS gestures and animations
- **Loading States**: Progress indicators for pagination

## 🏗️ Architecture
### Design Pattern: MVVM + ObservableObject + EnvironmentObject
```
App/
├── BRSilviaApp.swift (App entry point + EnvironmentObject injection)
└── ContentView.swift (Main feed with stories header)

Views/
├── StoryListView.swift (Horizontal scroll)
├── StoryContentView.swift (Full-screen viewer)
└── PostListCard.swift (Posts card)

Components/
├── AvatarImageView.swift (Reusable avatar)
└── CircularIconButtonView.swift (Reusable button)

ViewModels/
└── StoryListViewModel.swift (Pagination logic)

Services/
├── DataService.swift (JSON data loading)
└── PersistenceService.swift (State management via EnvironmentObject)

Models/
├── User.swift, Story.swift, StoryState.swift
└── LoadingState.swift

Resources/
├── Resources+Color.swift
├── Resources+LinearGradient.swift
└── users.json
```
### State Management Pattern
EnvironmentObject: PersistenceService shared across all views
ObservableObject: Automatic UI updates via @Published properties
UserDefaults: Simple persistence for seen/liked states

### Key Technical Decisions
- **SwiftUI + iOS 15**: Native performance and gestures
- **EnvironmentObject**: Shared state across views
- **UserDefaults**: Simple persistence for 4-hour timeline
- **Infinite Pagination**: Cycling through JSON data
- **Custom Gradients**: To enhance visual indicators in stories states

## Data Flow
1. **DataService** loads users from JSON
2. **StoryListViewModel** generates infinite stories via pagination
3. **PersistenceService** tracks seen/liked states
4. **UI updates** automatically via @Published properties

## Time Management (4 hours total)

### Time Constraints
- **Testing**: Limited to manual testing due to time
- **Edge Cases**: Basic error handling implemented
- **Performance**: Optimized for demo, production could need memory management
  
## Future Improvements
- Comprehensive unit tests for PersistenceService
- Story auto-progression with timers
- Allow more than one story per user
- Video story support
- VoiceOver labels, haptic feedback

## 💻 Technical Highlights
- **Clean Architecture**: Separated concerns and responsabilities
- **Performance**: LazyHStack for memory efficiency
- **Accessibility**: Semantic UI structure and use of SFSymbols
- **Modularity**: Reusable components (AvatarImageView, CircularIconButtonView)

## 🎯 Assessment Focus
Tried to prioritized core feature and user experience given the time constraint.

---
