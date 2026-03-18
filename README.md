# Rashtraveer Fitness Challenge

A **Nationwide digital fitness initiative** designed to promote physical health, mental well-being, and community engagement through a technology-driven platform.

The system includes:

- Mobile Application (Android & iOS) for participants
- Web Admin Portal for coaches and administrators

## Project Overview

The **Rashtraveer Fitness Challenge** empowers users to build sustainable health habits through:

- Personalized fitness and diet plans
- GPS-based activity tracking
- Expert guidance (fitness trainers, dieticians, yoga teachers)
- Gamification (badges, streaks, leaderboards)
- Community engagement

## Objectives

- Provide **accessible and affordable fitness programs**
- Deliver **personalized health guidance**
- Enable **real-time activity tracking (GPS-based)**
- Facilitate **two-way communication with experts**
- Build a **habit-forming ecosystem using gamification**
- Encourage **community participation through groups & leaderboards**

## System Architecture

### 1. Mobile Application (User-End)

- OTP-based authentication
- Personalized onboarding & BMI calculation
- Daily workout, diet, and meditation plans
- GPS tracking for walking/running
- Video content library
- Expert chat system
- Gamification (badges, streaks, leaderboard)
- Payments & subscriptions

### 2. Web Admin Portal

- Role-based access (Admin, Coach, Dietician)
- User management & verification
- Task and challenge assignment
- Content (video/document) upload
- Analytics & reporting dashboard
- Payment and subscription tracking

## Mobile App Features

### Authentication

- OTP-based login
- Secure token-based sessions

### Onboarding & Personalization

- Profile setup (age, height, weight, etc.)
- BMI calculator
- Blood group & previous disease input
- Medical certificate upload (if required)
- Fitness level & goal selection

### Activity & Progress Tracking

- Daily task tracking (Workout/Diet/Meditation)
- Weekly goals and streak tracking
- Points and badge system

### Content & Interaction

- Video library (Workout / Diet / Meditation)
- Expert chat (real-time interaction)

### Activity Monitoring

- GPS-based tracking (Walk/Run)
- Performance analytics

### Notifications

- Workout reminders
- Goal alerts
- Plan updates

### Payments

- Razorpay integration (Android)
- Apple In-App Purchase (iOS)

### Community Features

- Group creation & chat
- Leaderboards
- Social motivation

## Admin Portal Features

### User Management

- Role-based access control
- User verification (BMI & certificates)

### Task & Content Management

- Assign workout/diet plans
- Upload videos & documents

### Communication

- Chat support with users

### Analytics & Reporting

- User activity tracking
- Engagement metrics
- Progress reports

### Payments

- Subscription tracking
- Transaction monitoring

## Database Design (High-Level)

### Core Tables:

- Users
- NormalUsers (user-specific details)
- Experts (coach/dietician details)
- FitnessPlans
- UserProgress
- CommunityGroups
- Chats
- Badges
- Payments
- Certificates
- GPS Activity Logs

## Gamification Features

- Badges & achievements
- Daily streak tracking
- Leaderboards
- Goal completion rewards

## 🛠 Tech Stack (Suggested)

### Frontend

- Mobile: Flutter
- Web Admin: React.js or Next.js

### Backend

- Firebase

### Database

- Firestore

### Integrations

- Firebase (Notifications)
- Razorpay (Payments)
- Google Maps API (GPS tracking)

## UI/UX Design

- Designed using **Figma**
- Primary Color: `#7F7BFF` (Violet)
- Marathi-first multilingual support
- Clean, minimal, and gamified UI
- Mobile-first design approach

## MVP Scope

### Mobile App:

- Authentication
- Profile setup & BMI
- Assigned plans
- Progress tracking
- Video library
- Payments

### Admin Portal:

- Role-based access
- User management
- Task assignment
- Content upload
- Analytics

## Future Enhancements

- Wearable device integration
- AI-based personalized fitness recommendations
- Advanced analytics dashboard
- Social feed & challenges
- Multi-language expansion

## Project Status

Currently in **Design & Planning Phase**

- ER Diagram ✔
- UI Design (Figma) ✔
- Development (In Progress)
