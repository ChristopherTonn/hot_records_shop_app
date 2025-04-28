# 🎶 Hot Records Shop – An Online Store for Vinyl Lovers

## ✨ Features

- 🔎 Browse products across categories like **New in Stock**, **Newest Entry**, **This Week New**, and **All Products**.
- ⚡ Products are dynamically loaded via **AJAX** and cached for faster navigation.
- 🔐 Users can **sign up, log in, and manage their accounts**.
- ⭐ Logged-in users can **leave reviews and ratings** on product pages, contributing to the product's average score.
- 🔄 **Comments and ratings update live** using **ActionCable** (real-time WebSocket updates).
- 💳 Users can **purchase products securely using Stripe Checkout**.
- 🛠️ **Admins** can **create and edit products**, **manage users**, and **delete inappropriate comments**.

---

## 🛠 Tech Stack

- 🛤 **Ruby on Rails 5.1.5**
- 🎨 **Bootstrap 4**
- 🔗 **jQuery**
- 🎨 **CSS3**
- 🧱 **HTML5**
- ⭐ **raty.js** (star rating system)

---

## 📦 Gems Used

- [`devise`](https://github.com/heartcombo/devise) – 🔒 User Authentication
- [`cancancan`](https://github.com/CanCanCommunity/cancancan) – 🛡️ Authorization
- [`stripe`](https://github.com/stripe/stripe-ruby) – 💳 Payment Integration
- [`will_paginate`](https://github.com/mislav/will_paginate) – 📄 Pagination

---

## 🚀 Deployment Notes

- 🌍 The server is **live and running** on **Render**.
- ⚙️ Due to **legacy Ruby 2.3** and **Rails 5.1** dependencies, **database seeding** on the production server could not be fully completed within the time constraint.
- 🔧 All application logic, routes, controllers, models, and views are fully operational.
- 📂 Codebase is ready for local setup and review.

---

## 🖥️ Local Setup Instructions

```bash
git clone https://github.com/ChristopherTonn/hot_records_shop_app.git
cd hot_records_shop_app
bundle install
rails db:setup
rails server
```
