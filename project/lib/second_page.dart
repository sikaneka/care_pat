// import 'package:flutter/material.dart';

// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Second Page"),
//       ),
//       body: const Center(
//         child: Text("second page"),
//       ),
//     );
//   }
  
// }



import 'package:flutter/material.dart';
// import 'third_page.dart';
class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String nextPage; 

  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, nextPage);
      },
      child: Card(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: 150,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          ImageCard(
            imageUrl: "",
            title: "Temperature",
            nextPage: "/third_page",
          ),
          ImageCard(
            imageUrl: "",
            title: "Blood pressure",
            nextPage: "/fourth_page",
          ),
          // Add more ImageCard widgets here...
        ],
      ),
    );
  }
}