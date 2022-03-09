class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
    title: "Saved & Organised",
    image: "assets/images/onboard1.svg",
    description: "Have your customers’ order information saved and organised."
  ),
  UnboardingContent(
    title: "Secured & Processed",
    image: "assets/images/onboard2.svg",
    description: "Accurate and precised treatments alongside with security & confidentiality"
  ),
  UnboardingContent(
    title: "Realtime Stats",
    image: "assets/images/onboard3.svg",
    description: "And finally get instant statistics and detail reports about your business"
  ),
];