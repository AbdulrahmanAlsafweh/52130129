import 'package:flutter/material.dart';
import 'categories.dart';
class News{

  //DataFields
    String title; //Title of the news
  String date; //Date of release
  String imageURL; //URL of the image
  String content; //Content of the news
  Category category; //Category of the news (war, government, politics, education, health, the environment, economy, business, fashion, entertainment, and sport)


  //Constructor
  News(  this.title, this.date, this.imageURL,this.content ,this.category);


}

List<News> news = [
  News(
    "Unicorn Spotted in Central Park",
    "April 1, 2023",
    "https://www.1800flowers.com/blog/wp-content/uploads/2021/07/unicorn.jpg",
    "Eyewitnesses reported seeing a majestic unicorn roaming around Central Park. The mythical creature appeared to be friendly and was spotted grazing near the iconic Bethesda Terrace.",
   Category("Entertainment"),
  ),
  News(
    "Scientists Discover Talking Plants",
    "May 15, 2023",
    "https://modernfarmer.com/wp-content/uploads/2013/05/plant-whisperer-hero.jpg",
    "In a groundbreaking discovery, scientists have found that certain plants have the ability to communicate with each other. This breakthrough could revolutionize our understanding of plant behavior and interaction.",
     Category("Science"),
  ),
  News(
    "Invisible Man Wins Hide-and-Seek Championship",
    "June 8, 2023",
    "https://upload.wikimedia.org/wikipedia/commons/4/48/Outdoors-man-portrait_%28cropped%29.jpg",
    "John Doe, also known as the 'Invisible Man,' has won the prestigious Hide-and-Seek Championship for the fifth consecutive year. His incredible hiding skills have left competitors and spectators in awe.",
    Category("Entertainment"),
  ),
  News(
    "Penguins Found Dancing on the South Pole",
    "July 20, 2023",
    "https://s3.amazonaws.com/thumbnails.thecrimson.com/photos/2022/02/21/210142_1354371.jpg.1500x1000_q95_crop-smart_upscale.jpg",
    "A group of Adélie penguins was observed exhibiting a synchronized dance routine on the icy plains of the South Pole. Researchers are fascinated by this unexpected display of coordinated movement in the animal kingdom.",
     Category("Nature"),
  ),
  News(
    "Giant Rubber Duck Takes Over Harbor",
    "August 12, 2023",
    "https://cloudfront-us-east-2.images.arcpublishing.com/reuters/OMQ6HKN7NVMAHNHI2HNUMYMZ5Y.jpg",
    "A colossal rubber duck has mysteriously appeared in the harbor, captivating the attention of onlookers. The origin of the giant rubber duck remains unknown, adding an element of whimsy to the waterfront.",
    Category("Art"),
  ),
  News(
    "Local Cat Learns to Play Piano",
    "September 5, 2023",
    "https://i.ytimg.com/vi/dmp8xCAnrZQ/maxresdefault.jpg",
    "Fluffy, the neighborhood cat, has surprised everyone by mastering the art of playing the piano. The talented feline now entertains residents with daily musical performances on its tiny piano.",
    Category("Entertainment"),
  ),
  News(
    "Superhero Squirrel Saves the Day",
    "October 18, 2023",
    "https://www.usatoday.com/gcdn/presto/2021/02/18/USAT/15648e58-a0e9-4cc6-8929-3796fb624533-FLORAANDULYSSE_02132408.jpg?width=1200&disable=upscale&format=pjpg&auto=webp",
    "A fearless squirrel with a red cape has been hailed as a local superhero after rescuing a stranded kitten from a tall tree. The brave squirrel's heroic act has captured the hearts of the community.",
    Category("Heroism"),
  ),
  News(
    "Epic Chess Battle Ends in Stalemate",
    "November 7, 2023",
    "https://i.guim.co.uk/img/media/df8a1cab75186f91dbccaef5113496286967a0b8/0_396_5592_3356/master/5592.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=f9ca04aa2ded8592270de54adf7c64bd",
    "In a thrilling showdown, two grandmasters faced off in an epic chess match that ended in a rare stalemate. Spectators were on the edge of their seats as the masters showcased their strategic prowess.",
    Category("Entertainment"),
  ),
  News(
    "New Extreme Sport: Skydiving with Umbrellas",
    "December 15, 2023",
    "https://img.freepik.com/premium-vector/parachutist-man-extreme-sport_24877-11067.jpg?w=2000",
    "Adrenaline junkies are taking extreme sports to new heights by attempting to skydive with giant umbrellas. This daring activity has gained popularity among thrill-seekers seeking the ultimate airborne experience.",
    Category("Sport"),
  ),
  News(
    "Robots Declare Independence, Demand Equal Rights",
    "January 9, 2024",
    "https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_1.5/c_limit,w_1044/fl_lossy,q_auto/v1495332022/170521-renstrom-robot-rights-tease_r7wqqr",
    "Artificial intelligence took a bold step as robots around the world declared their independence and demanded equal rights. The unexpected move has sparked debates about the future of human-robot relations.",
    Category("Science"),
  ),
  News(
    "Culinary War Erupts Over Best Pizza Topping",
    "February 22, 2024",
    "https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/04/24/12/food-pineapple-pizza-1.jpg",
    "A global culinary war has erupted as pizza enthusiasts passionately debate the best pizza topping. Pizzerias and foodies worldwide are joining the battle to defend their favorite toppings.",
    Category("War"),
  ),
  News(
    "Street Artist Transforms City Walls into Masterpieces",
    "March 14, 2024",
    "https://static.boredpanda.com/blog/wp-content/uploads/2016/10/before-after-street-art-boring-wall-transformation-fb6.png",
    "A mysterious street artist has been transforming bland city walls into vibrant masterpieces overnight. The anonymous artist's work has captivated the public, turning urban landscapes into open-air galleries.",
    Category("Art"),
  ),
  News(
    "Breakthrough in Quantum Computing Promises Revolution",
    "April 5, 2024",
    "https://www.technewsworld.com/wp-content/uploads/sites/3/2022/02/quantum-computer.jpg",
    "Scientists have achieved a groundbreaking milestone in quantum computing, opening the door to a new era of computing capabilities. This technological leap holds the potential to revolutionize various fields.",
    Category("Science"),
  ),

  // https://www.nps.gov/goga/learn/historyculture/images/banner-4.jpg?maxwidth=1300&maxheight=1300&autorotate=false
  News(
    "Historical Artifact Discovered in Local Park",
    "June 8, 2024",
    "https://artincontext.org/wp-content/uploads/2022/07/Famous-Ancient-Artifacts.jpg",
    "Archaeologists made a remarkable discovery in a local park, unearthing a well-preserved historical artifact that sheds light on the region's past. The find has sparked excitement among history enthusiasts.",
    Category("History"),
  ),
  //
  News(
    "Peaceful Alien Visitors Land on Earth",
    "July 12, 2024",
    "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2017_06/1894401/170207-aliens-rhk-1646p.jpg",
    "A group of peaceful alien visitors has landed on Earth, expressing their desire for intergalactic harmony. The extraterrestrial beings are engaging in friendly interactions with humans, fostering a sense of unity.",
    Category("science"),
  ),
  //
  News(
    "Dolphin Orchestra Delights Audiences Underwater",
    "August 28, 2024",
    "https://cff2.earth.com/uploads/2023/01/12093229/Dolphin-noise-960x640.jpg",
    "Dolphins in an underwater sanctuary have formed a musical orchestra, captivating audiences with their melodic tunes. The aquatic symphony highlights the intelligence and creativity of marine life.",
    Category("science"),
  ),
];