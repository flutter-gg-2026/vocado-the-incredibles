# 🎙️ VocaDo: Your Task Manager

VocaDo is a Flutter task management application that helps admins create and assign tasks to users in a simple and organized way.

The app is connected to Supabase and supports authentication, task assignment, member management, and role-based screens.

## ✨ Features

### 🔐 Authentication
- User login and signup
- Role-based access
- Admin and user flow

### 👥 Members
- Admin can view users
- Admin can add members to a group
- View members added by the current admin
- Members display name, email, and role

### ✅ Tasks
- Admin can create tasks
- Tasks can be assigned to specific users
- Users can view only tasks assigned to them
- Tasks are separated into:
  - New tasks
  - Late tasks
  - Completed tasks
- Users can mark tasks as done

### 📊 Admin Dashboard
- View created tasks
- Track assigned tasks
- Organized task cards

## 🧱 Project Structure


lib
┣ core
┃ ┣ common
┃ ┣ di
┃ ┣ errors
┃ ┣ navigation
┃ ┣ services
┃ ┗ theme
┣ features
┃ ┣ auth
┃ ┣ add_members
┃ ┣ view_members
┃ ┣ user_task
┃ ┗ admin_dashboard
┗ main.dart


## 🛠️ Tech Stack
Flutter
Dart
Supabase
BLoC / Cubit
GoRouter
GetIt
Injectable
Freezed
JSON Serializable
Easy Localization
🗄️ Database Tables
users

Stores user information such as name, email, and role.

members

Stores relationships between admins and their group members.

tasks

Stores tasks assigned to users.

## 🎥 Demo
auth:
<img width="459" height="828" alt="Screenshot 1447-11-09 at 12 52 20 am" src="https://github.com/user-attachments/assets/be4d9f4a-9845-416e-86f7-743b24e40655" />
<img width="459" height="828" alt="Screenshot 1447-11-09 at 12 52 06 am" src="https://github.com/user-attachments/assets/1c4e309e-8ef6-463a-9d10-6016452c7755" />

admin screens:

<img width="459" height="828" alt="Screenshot 1447-11-09 at 12 55 03 am" src="https://github.com/user-attachments/assets/888cbbff-886b-4e9d-961c-81c19fe5cb03" />

<img width="459" height="828" alt="Screenshot 1447-11-09 at 12 55 51 am" src="https://github.com/user-attachments/assets/2d936d1d-4f85-4c06-bd03-78d9de5001f8" />


<img width="450" height="828" alt="Screenshot 1447-11-09 at 1 17 24 am" src="https://github.com/user-attachments/assets/490747e4-2ffb-480c-8ff8-d179a1112d96" />

user screens:
<img width="459" height="828" alt="Screenshot 1447-11-09 at 12 53 47 am" src="https://github.com/user-attachments/assets/241b7074-b411-4991-bdb1-36c2a535a9d6" />


profile:
<img width="453" height="828" alt="Screenshot 1447-11-09 at 1 18 50 am" src="https://github.com/user-attachments/assets/a4f9312b-0e12-43ac-a158-433e5208cc59" />


👩‍💻 Developed By
Jalnar
Dalal
Hatem
