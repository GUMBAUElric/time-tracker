<p align="center">
  <a href="https://example.com/">
    <img src="https://pbs.twimg.com/profile_images/979714483387092994/PMI-aUXp_400x400.jpg" alt="Logo" width=85 height=85>
  </a>

<h3 align="center">Ynov - M2 Dev Logiciel, Mobile & IoT</h3>
</p>

## Flutter

- [About me](#about-me)
- [About this project](#about-this-project)
- [Prerequisites](#prerequisites)
- [What's included](#whats-included)
- [How its work](#how-its-work)
- [How to install](#how-to-install)
- [Docs](#docs)

## About me

### Elric

- elric.gumbau@ynov.com (mail)
- [GUMBAUElric](https://github.com/GUMBAUElric) (github)
- [GUMBAU Elric](https://fr.linkedin.com/in/elric-gumbau-30943417a/) (linkedIn)

## About this project

Time tracker is a intuitive and elegant mobile flutter application to manage tasks more easily.

The project is based on the [following model](https://dribbble.com/shots/17447511-Time-management-iOS-mobile-app)

<p align="center">
    <img src="https://cdn.dribbble.com/users/1998175/screenshots/17447511/media/e5c9c2407b87a7cae14ea6aff31c227b.jpg" alt="Logo" width=450 height=350>
</p>

## Prerequisites

Here are the prerequisites necessary for this project

| Prerequisites |         
|---------------|
| Flutter       | 

    > Ask google how to install if you don't have them 😉

## What's included

Here is the content of the lib folder containing the source files

```text
time_tracker/
└── lib/
    ├── base/ (contains the files that define the foundations of the application)
    ├── components/ (store blocks that are more independent, like buttons)
    ├── layouts/ (blocks that contain what is reusable)
    ├── models/ (contains the models for data manipulation)
    ├── pages/ (contains the files that define the foundations of the application)
    ├── router/ (used for navigation within the home page)
    ├── store/ (implements flutter_redux to persist the data)
    ├── utils/ (contains the utility files)
    └── main.dart (entry point of the application)
```

## How its work

Most of the functionalities are implemented.

You can :

- Log in with any username
- Log out
- Add / Update / Delete a Task
- Filter tasks according to the dates of the current month

When you add a task, it must contain the following data:

- A name
- A priority
- A date
- A start time
- An end time

> **_NOTE:_** You can if you wish add users who will work on the task you create, you can add any name of any size.

Data persistence is done with the flutter_redux package.

Due to lack of time, here are the features that remains to be done :

- Internationalization with flutter
- Persist the data when the application is restarted
- Optimization

## How to install

- Open your emulator (ios or android)

- Open a terminal, go to the folder 'time_tracker' and type

      flutter run

> 'flutter run' launches the application

> it may take a while, be patient ! 👍

The application must launch and you arrive on the home page !

## Docs

flutter : https://docs.flutter.dev/

flutter_redux : https://pub.dev/packages/flutter_redux

dribbble model : https://dribbble.com/shots/17447511-Time-management-iOS-mobile-app

Enjoy ! 😉
