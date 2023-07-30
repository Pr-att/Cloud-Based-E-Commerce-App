# Cloud-Driven E-Commerce Solution

## Introduction

Welcome to the Cloud-Driven E-Commerce Solution, a comprehensive platform that empowers you to establish 
and manage your online store effortlessly. This solution includes an Admin Panel to oversee products, orders
, and more. The application is developed using Node.js, Express, MongoDB for the backend, and Flutter with 
Provider for the frontend.

## Key Features

- **User Authentication:** Seamlessly register and log in using your email and password to access all platform functionalities securely.

- **Product Search:** Effortlessly locate products using the integrated search feature.

- **Product Filtering:** Sort products based on categories to find your desired items effortlessly.

- **Product Details:** Access detailed information about each product to make informed decisions.

- **Product Rating:** Review product ratings and user feedback to assess product quality.

- **Deal of the Day:** Don't miss daily deals featuring attractive discounts.

- **Shopping Cart:** Add products to your cart and efficiently manage your shopping items.

- **Fast Checkout:** Benefit from a swift and secure checkout process by integrating Google/Apple Pay.

- **Order Tracking:** Keep track of your order history and monitor order statuses conveniently.

- **Admin Panel:** Admin users enjoy additional features:

    - Product Management: View, add, and delete products to maintain inventory efficiently.
    - Order Management: Monitor and update order statuses for streamlined fulfillment.
    - Revenue Tracking: Keep tabs on total earnings and category-based earnings with graphical representations.

## Getting Started

To run this cloud-driven e-commerce solution locally, follow these steps:

1. **Configure MongoDB:** Set up a MongoDB Project & Cluster and obtain the MongoDB URI.

2. **Configure the Server:** In the `server` directory, replace the `MONGODB_URI` in `index.js` with your MongoDB URI.

3. **Set IP Address:** In the client-side code, navigate to `lib/constants/global_variables.dart` and update `<yourip>` with your IP address.

4. **Cloudinary Setup:** Create a Cloudinary Project and enable unsigned operations in settings. In `lib/features/admin/services/admin_services.dart`, replace `denfgaxvg` and `uszbstnu` with your Cloud Name and Upload Preset respectively.

5. **Run the Application:**
    - Server Side:
      ```bash
      cd server
      npm install
      npm run dev (for continuous development) OR npm start (to run the script one time)
      ```

    - Client Side:
      ```bash
      flutter pub get
      open -a simulator (to get iOS Simulator)
      flutter run
      ```

## Technology Stack

**Server:** Node.js, Express, Mongoose, MongoDB, Cloudinary

**Client:** Flutter, Provider

## Feedback

We value your feedback! If you have any suggestions or questions, please don't hesitate to reach 
out to us at pp56355@gmail.com. Get started with our Cloud-Driven E-Commerce Solution 
and witness your online store thrive. Happy selling!