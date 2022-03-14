class Experience {
  String? jobTitle, organization, description, duration;

  Experience(
      {this.duration, this.jobTitle, this.organization, this.description});

  factory Experience.fromMap(map) {
    return Experience(
      jobTitle: map['jobtitle'],
      organization: map['organization'],
      duration: map['duration'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobtitle':jobTitle,
      'organization':organization,
        'duration':duration,
        'description':description

    };
  }
}

final List<Experience> experience = [
  Experience(
    jobTitle: "Front-End Devloper",
    organization: "Freelance (Track My HNT)",
    duration: "2019-2020",
    description:
        "I have had the pleasure of working with Anwar on two flutter projects and what strikes me the most about his work is his ability to write clean and reusable codes with best practices. He is hardworking and makes it so easy to transcribe ideas into beautiful and testable flutter apps. He is a Flutter/Dart gem and has my highest recommendation",
  ),
  Experience(
    jobTitle: "Flutter App Developer",
    organization: "The Techrotics Lab",
    duration: "2021-Present",
    description:
        "Abu is great asset for any organization. It's a true pleasure working with him at TakeIn. His flutter skill is amazing as well as his professionalism and being a good team player. Abu's problem solving skill is also one of his great skills.",
  ),
  Experience(
    jobTitle: "Front-End Developer",
    organization: "Freelance (Zabuka)",
    duration: "2021-Present",
    description:
        "I like your way you doing your project and you taught us. After I watch this I like and hit the subscribe button and then watch your video playlist one by one!! Within three hours, I learned a lot! I share your channel in my college WhatsApp group!",
  ),
  Experience(
    jobTitle: "Flutter Developer",
    organization: "University Project",
    duration: "2021-Present",
    description:
        "Very straightforward, professional and also the best flutter videos in the youtube! It will be great if you add some comments to your steps with 0.5 seconds pause before implementing this step. By meaning of steps, I mean not the basic, but structural steps, like 10-20 steps per video. However, thank you very much!",
  ),
];
