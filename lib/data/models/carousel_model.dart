class CarouselModel {
  String headline;
  String categoryName;
  String image;
  int likes;
  CarouselModel({
    required this.headline,
    required this.categoryName,
    required this.image,
    required this.likes,
  });
}

class CarouselData {
  List<CarouselModel> carouselsList = [];

 List<CarouselModel> getCarousels() {
    CarouselModel model1 = CarouselModel(
        likes: 30,
        categoryName: 'Entertainment',
        headline: 'RRR inches away from 1000Crores',
        image:
            'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cnJyJTIwbW92aWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60');

    CarouselModel model2 = CarouselModel(
        likes: 12,
        categoryName: 'Sports',
        headline: 'KKR beats punjab',
        image:
            'https://images.unsplash.com/photo-1607734834519-d8576ae60ea6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');
    CarouselModel model3 = CarouselModel(
        likes: 15,
        categoryName: 'International',
        headline: 'Imran khan to lose no motion',
        image:
            'https://images.unsplash.com/photo-1580905325386-dfa16677a1f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGltcmFuJTIwa2hhbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');
    CarouselModel model4 = CarouselModel(
        likes: 9,
        categoryName: 'Politics',
        headline: 'Congress lashes modi about rising fuel prices',
        image:
            'https://images.unsplash.com/photo-1561995708-904fbc0430fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmFyZW5kcmElMjBtb2RpfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');
    CarouselModel model5 = CarouselModel(
        likes: 27,
        categoryName: 'International',
        headline: 'Latest news about Russia-Ukraine War',
        image:
            'https://images.unsplash.com/photo-1565711561500-49678a10a63f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dWtyYWluZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');

    carouselsList.add(model1);
    carouselsList.add(model2);

    carouselsList.add(model3);

    carouselsList.add(model4);

    carouselsList.add(model5);

    return carouselsList;
  }
}
