## Flutter Simple Auth

<h1 align="center">Flutter Simple Auth with Riverpod & Strapi</h1>

<br>

<a href="https://flutter.io/">Flutter</a> Flutter allows you to build beautiful native apps on iOS and Android Platforms from a single codebase. The main goal of this repository is to learn how to implement simple login authentication Riverpod (flutter state management) & Strapi (Rest API) 

<div>
<img src="https://raw.githubusercontent.com/iniakunhuda/flutter_auth_riverpod_strapi/main/preview/preview_1.png" alt="feed example" width="200">
<img src="https://raw.githubusercontent.com/iniakunhuda/flutter_auth_riverpod_strapi/main/preview/preview_2.png" alt="feed example" width="200">
<img src="https://raw.githubusercontent.com/iniakunhuda/flutter_auth_riverpod_strapi/main/preview/preview_3.png" alt="feed example" width="200">
<img src="https://raw.githubusercontent.com/iniakunhuda/flutter_auth_riverpod_strapi/main/preview/preview_4.png" alt="feed example" width="200">
</div>
</p>

### Package

- RiverPod Hooks (https://riverpod.dev/)
- flutter_hooks (https://pub.dev/packages/flutter_hooks)
- Strapi API (https://strapi.io/)
- dio (https://pub.dev/packages/dio)
- dartz (https://pub.dev/packages/dartz)
- shared_preferences (https://pub.dev/packages/shared_preferences)

### Strapi Setup

Running in local / deploy to production
<br/>
<br/>
<img src="https://raw.githubusercontent.com/iniakunhuda/flutter_auth_riverpod_strapi/main/preview/strapi.png" alt="feed example" width="100%">

<br/><br/>

### Rest API


#### Happy Scenario

Body
```json
{
    "identifier": "miftahulinc@gmail.com",
    "password": "huda12345"
}
```

Response
```json
{
    "jwt": "generated_jwt_token",
    "user": {
        "id": 1,
        "username": "miftahulinc",
        "email": "miftahulinc@gmail.com",
        "provider": "local",
        "confirmed": true,
        "blocked": false,
        "createdAt": "2023-04-02T02:46:58.297Z",
        "updatedAt": "2023-04-02T02:47:39.939Z"
    }
}
```

#### Bad Scenario

Body
```json
{
    "identifier": "miftahulinc@gmail.com",
    "password": "huda123453"
}
```

Response
```json
{
    "data": null,
    "error": {
        "status": 400,
        "name": "ValidationError",
        "message": "Invalid identifier or password",
        "details": {}
    }
}
```
