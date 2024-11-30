# 🛒 Flutter Shop Cart App

A dynamic e-commerce application built with Flutter that showcases products fetched from an API. Users can browse, add products to the cart, manage quantities, and proceed to checkout seamlessly. The app leverages **Riverpod** for state management, ensuring a reactive and scalable architecture.

---

## 🚀 Features

- **Dynamic Product Fetching**: Fetch and display products dynamically from an API.  
- **State Management**: Powered by **Riverpod** for efficient and maintainable state management.  
- **Cart Management**:  
  - Add products to the cart.  
  - Increase or decrease product quantities directly from the cart page.  
  - Remove products from the cart with a confirmation dialog.  
- **Real-Time Price Updates**: The total price updates dynamically based on the cart contents and product quantities.  
- **Checkout Functionality**: A simple checkout button (dummy implementation for now).

---

## 🛠️ Tech Stack

- **Framework**: Flutter  
- **State Management**: Riverpod  
- **API Handling**: HTTP package (or any API client used)  
- **Design**: Material Design principles  

---

## 📸 Screenshots

1. **Product Listing Page**
     ![Screenshot_20241130_125310](https://github.com/user-attachments/assets/9efc7290-be03-4580-8603-7ecc38929698)


2. **Cart Page with Quantity Management**  

![Screenshot_20241130_125335](https://github.com/user-attachments/assets/3fdda85c-f626-464a-af27-a4b5491cf4d8)


## ⚙️ Setup and Installation

Follow these steps to run the project locally:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Siddiqui145/shop_cart.git
   cd shop_cart
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

4. **Build for Production**
   ```bash
   flutter build apk
   ```

---

## 🗂️ Project Structure

```
lib/
├── api_service.dart            # API client for fetching product data
├── models/                     # Data models for the application
│   └── product.dart            # Product model
├── providers/                  # Riverpod state management providers
│   └── product_provider.dart   # Providers for product and cart state
├── screens/                    # UI Screens
│   ├── product_list_page.dart  # Product listing page
│   ├── cart_details_page.dart  # Cart page with quantity management
│   └── splash_screen.dart      # Splash screen
└── main.dart                   # Entry point of the application
```

---

## 📂 API Details

### Endpoint Used
**Base URL**: `https://api.example.com/products`  
- Fetch products: `GET /products?page=<page_number>`

---

## 🌟 Key Functionalities

1. **Product Listing**
   - Products are fetched dynamically from an external API.
   - Each product displays an image, title, and price.

2. **Cart Management**
   - **Add to Cart**: Products can be added to the cart from the listing page.  
   - **Quantity Adjustment**: Users can increase or decrease the quantity of products directly from the cart page.  
   - **Remove Items**: Users can remove items from the cart with a confirmation dialog.  

3. **Real-Time Updates**
   - The total cart price updates dynamically based on the product quantities.

4. **Checkout**
   - A simple checkout button to proceed (dummy implementation).

---

## 🔧 Configuration

### API Integration
Update the **base URL** in `api_service.dart` if needed:
```dart
const String baseUrl = 'https://api.example.com/products';
```

---

## 🧩 Dependencies

| Package         | Version |
|------------------|---------|
| Flutter          | Latest |
| Flutter Riverpod | Latest |
| HTTP             | Latest |

---

## 🚧 Known Issues

- Checkout functionality is currently a placeholder.
- Error handling for API requests can be improved.

---

## 🛠️ Future Enhancements

- Implement real-time checkout functionality.
- Add user authentication and personalized carts.
- Improve error handling and offline support.

---

## 🙌 Contribution

Contributions are welcome! Please follow these steps:

1. Fork the repository.  
2. Create a new branch (`git checkout -b feature-branch`).  
3. Commit your changes (`git commit -m "Add feature"`).  
4. Push to the branch (`git push origin feature-branch`).  
5. Open a pull request.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🧑‍💻 Author

- **Your Name**: Siddiqui Taha  
- **Email**: [tahasiddiqui541@gmail.com](mailto:tahasiddiqui541@gmail.com)  
- **GitHub**: [Siddiqui145](https://github.com/Siddiqui145)

---

### 💡 Happy Coding!
