# Online Shop

By using firebase as a backend, I developed a flutter app for shoping online.

<br/>

### State Management

✔️ Bloc Pattern <br />

<br/>

### Features and components

✔️ Paymob Integration.     
✔️ Google Maps with multiple themes.    
✔️ Authentication with Email & Password.             
✔️ Authentication with Google Account.               
✔️ Cart           
✔️ Animations           
✔️ Branches screen             
✔️ Product details screen      
✔️ Intro Screen     
✔️ Bottom Nav Bar      
✔️ Products Screen      
✔️ Profile Screen

### Dependencies

**firebase**

- firebase_core:
- firebase_auth:
- cloud_firestore:
- google_sign_in:

**state management**

- bloc:
- equatable:
- flutter_bloc:

**common**

- cached_network_image:
- flutter_staggered_grid_view:
- font_awesome_flutter:
- dio:
- webviewx:
- google_maps_flutter:

<br/>

### Attention

secrets.dart is missing from this repo so you need to add the following consts
<br/>

```dart
final String GoogleMapsKey="xxxxxxx";
final String PaymobAPIKey="xxxxxx";
final String IntegrationIDCard="xxxxx";
final String IntegrationIDKiosk="xxxxx";
```
<br/>

and in AndroidManifest.xml add
<br/>

```
<meta-data android:name="com.google.android.geo.API_KEY"
android:value="xxxxxxxxxxxx"/>

```

<br/>

### Demo Video
<a href="https://youtu.be/N5Xv-QDSUWI"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/2560px-Logo_of_YouTube_%282015-2017%29.svg.png" width="100"></img></a>
<br/>

### Screenshots

<br/>

For more screen shots [Here](https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots)

<br/>

<p float="left">
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots/intro-m.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots/products-m.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots/cart-m.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots/profile-m.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/1dfb6a28d5c9e8a125bd998f383517d387e86013/onlineshop_screenshots/branches.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/1dfb6a28d5c9e8a125bd998f383517d387e86013/onlineshop_screenshots/details1-m.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/1dfb6a28d5c9e8a125bd998f383517d387e86013/onlineshop_screenshots/map-dark.jpg" width="150" />
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/1dfb6a28d5c9e8a125bd998f383517d387e86013/onlineshop_screenshots/paymob.jpg" width="150" />
</p>
<p float="left">
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots/intro-wide.jpg" width="520" />
</p>
<p float="left">
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/88f2b2729c754b6ed54cd423c8fb9f57bd283b06/onlineshop_screenshots/intro1-wide.jpg" width="520" />
</p>
<p float="left">
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/1dfb6a28d5c9e8a125bd998f383517d387e86013/onlineshop_screenshots/fire.png" width="550" />
</p>
<p float="left">
<img src="https://github.com/mo7amedaliEbaid/online-shop/blob/acf750d791b0e2444d7cff66e3e2a7788a94ced0/onlineshop_screenshots/firestore.png" width="550" />
</p>


