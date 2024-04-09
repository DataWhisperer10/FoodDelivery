class OnBoardingContent {
  String image;
  String title;
  String description;
  OnBoardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    description: "Pick Your Choice from our Menu \n Unlimitedly ",
    image: "assets/rajeev_kitchen.png",
    title: "Select from our Best Menu",
  ),
  OnBoardingContent(
      description:
          "You can Pay in Cash on Delivery\n or by Card \n or by Digital Payment",
      image: "assets/payment.jpg",
      title: "Easy and Safe Payment"),
  OnBoardingContent(
      description: "Get your Order Delivered \n At Your DoorStep",
      image: "assets/delivery.jpg",
      title: "Fastest Delivery")
];
