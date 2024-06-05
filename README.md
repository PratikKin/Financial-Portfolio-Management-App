# MoneAge - Finance Portfolio Management App

Welcome to MoneAge, the comprehensive Finance Portfolio Management App that helps you efficiently manage and track your investments. Whether you're handling fixed deposits, trading stocks, or keeping tabs on your real estate investments, MoneAge has got you covered.

## Features

- [Fixed Deposit Tracking](#fixed-deposit-tracking)
- [Virtual Stock Trading Platform](#virtual-stock-trading-platform)
- [Real Estate Investment Tracking](#real-estate-investment-tracking)

## Technologies Used

- **Frontend:** [Flutter](https://flutter.dev/), [Dart](https://dart.dev/)
- **UI Design:** [Figma](https://www.figma.com/)
- **Backend:** [Node.js](https://nodejs.org/), [Express](https://expressjs.com/)
- **Database:** [MongoDB](https://www.mongodb.com/)
- **API Testing:** [Postman](https://www.postman.com/)

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install) (latest version)
- [Node.js](https://nodejs.org/) (v14 or later)
- [npm](https://www.npmjs.com/) (v6 or later)
- [MongoDB](https://www.mongodb.com/) (for database)
- [Postman](https://www.postman.com/downloads/) (for API testing)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/moneage.git
   cd moneage
   
2. **Install backend dependencies::**
   ```sh
   cd backend
   npm install
   
3. **Install frontend dependencies:**
   ```sh
   cd ../frontend
   flutter pub get
   
4. **Set up environment variables:**
   
   Create a .env file in the backend directory and add the following:
   ```sh
   MONGO_URI = your_mongodb_connection_string
   API_KEY = your_api_key_for_stock_data
   AUTH_EMAIL = email_for_verification_mail
   AUTH_PASS = email_pass_key_to_send_mail
   
5. **Run the backend server:**
   ```sh
   cd backend
   npm start
   
6. **Run the Flutter app (prefered use android studio):**
   ```sh
   cd ../frontend
   flutter run
   
7. **Access the app:**
   Open your browser and go to http://localhost:3000 for the backend server. The Flutter app will run on your connected device or emulator.

## Features

### **Fixed Deposit Tracking**

  Keep track of all your fixed deposits in one place, with detailed insights and maturity dates notification.


  <div style="display: flex; justify-content: space-between; gap: 50;">
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/d9bc7533-4bb4-459a-9b95-1cac1c7c8195" width="240" />
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/d2dea894-d7cf-49dc-bb0c-a4c1a0956343" width="240" />
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/5e49baa4-1b43-41be-93d3-fe3ca94a98f5" width="240" />
  </div>



###  **Virtual Stock Trading Platform**

  Experience stock trading with real-time data in a virtual environment. Hone your trading skills without any financial risk.

  <div style="display: flex; justify-content: space-between; gap: 50;">
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/42e27cb6-4668-4c02-a9e0-d56e7ff35132" width="240" style="padding: 5px;" />
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/89d18fa8-c286-45aa-b730-a8628da601c2" width="240" />
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/a32952dd-e918-4354-841b-4590bd876ecc" width="240" />
  </div>

  <div style="display: flex; justify-content: space-between; gap: 50;">
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/d82db307-37ab-4cf6-b684-8c0697b92bb5" width="240" />
    <img src="https://github.com/VishalKumar369/Financial-Portfolio-Management-App/assets/88982969/62868e88-4ce7-4646-aeed-8feb7c2a126f" width="240" />
  </div>


  

### **Real Estate Investment Tracking**
   
  Monitor your real estate investments, including property values, rental income, and more . - (under development)


## Usage

- **Dashboard:** View a summary of your portfolio including total investments, returns, and more.
- **Fixed Deposits:** Add, edit, and delete fixed deposits. View interest rates, maturity dates, and total returns.
- **Stock Trading:** Engage in virtual stock trading. Analyze stock performance with real-time data.
- **Real Estate:** Add properties to your portfolio, track their current market value, rental income, and related expenses.


## Contributing

We welcome contributions to MoneAge! To contribute:

- Fork the repository.
- Create a new branch (git checkout -b feature/YourFeature).
- Make your changes.
- Commit your changes (git commit -m 'Add some feature').
- Push to the branch (git push origin feature/YourFeature).
- Open a pull request.

## Contact

If you have any questions or feedback, please contact us at association.moneage@gmail.com.

