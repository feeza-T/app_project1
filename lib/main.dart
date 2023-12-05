import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsScreen(),

    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAC COSMETICS'),
        centerTitle: true,
        toolbarOpacity: 1,
        toolbarHeight: 100,
        elevation: 60,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/lipstick.png',

              height: 400,
              width: 400,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Mac Matte Lipstick',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Shade: Ruby Woo\nType: Matte\nPrice: \$19.99\n2,1,750.00TK',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Buy Now'),

            ),
          ],
        ),
      ),
    );
  }
}




class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUY NOW'),
        centerTitle: true,
        toolbarOpacity: 1,
        toolbarHeight: 100,
        elevation: 60,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            PaymentOptionCard(
              optionName: 'bKash',
              optionImage: 'assets/bkash.png',
              onPressed: () {

                showPaymentResultDialog(context, 'bKash');
              },
            ),
            PaymentOptionCard(
              optionName: 'nagad',
              optionImage: 'assets/nagad.png',
              onPressed: () {

                showPaymentResultDialog(context, 'nagad');
              },
            ),
            PaymentOptionCard(
              optionName: 'paypal',
              optionImage: 'assets/paypal.png',
              onPressed: () {

                showPaymentResultDialog(context, 'paypal');
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  void showPaymentResultDialog(BuildContext context, String paymentMethod) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Result'),
          content: Text('Payment successful using $paymentMethod.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final String optionName;
  final String optionImage;
  final VoidCallback onPressed;

  const PaymentOptionCard({
    required this.optionName,
    required this.optionImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                optionImage,
                height: 60, // Adjust the height as needed
              ),
              SizedBox(height: 15,width: 20),
              Text(
                optionName,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}