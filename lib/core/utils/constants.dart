import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/models/place_model.dart';
import 'package:tourista/widgets/paragraph_widget.dart';

TextStyle speedDialChildLabelStyle = TextStyle(
    // textBaseline: TextBaseline.alphabetic,
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
          blurRadius: 8,
          color: Colors.black,
          offset: Offset(
            0,
            3,
          ))
    ]);
TextStyle titleStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
);
List<PlaceModel> places = [
  PlaceModel(
    locationAddress: 'https://maps.app.goo.gl/zjbjLaafikUaVgcM8',
    shortVideoAddress: 'assets/pyramids.mp4',
    fullVideoUrl: 'https://youtu.be/opoZaIVWcHA',
    title: 'The Pyramids Of Giza',
    thumbnailAddress: 'assets/icons/thePyramids.jpg',
    ticketAddress: "https://egymonuments.com/locations/details/Pyramids",
    paragraphs: [
      const ParagraphWidget(
        header: 'The Eternal Enigma of the Pyramids',
        text:
            'For millennia, the pyramids of ancient Egypt have stood as monolithic testaments to human ingenuity and ambition. Their geometric precision and sheer scale continue to amaze architects and historians alike, fueling endless debates and hypotheses regarding their construction techniques. The Great Pyramid of Giza, the most iconic of them all, is thought to have been built some 4,500 years ago during the reign of Pharaoh Khufu. This staggering structure, composed of over 2 million massive stone blocks, ascends to a dizzying height of 481 feet, captivating generations with the mysteries of its creation.',
      ),
      const ParagraphWidget(
        header: 'The Workforce: Myth an1 n nn d Reality',
        text:
            "Contrary to popular depictions, it's widely accepted by Egyptologists that skilled laborers—not slaves—were the cornerstone of the pyramid construction effort. Discoveries of workers' settlements near the pyramids reveal evidence of organized communities with access to food, medical care, and burial chambers. These insights paint a less exploitative picture of their lives.",
      ),
      const ParagraphWidget(
        header: 'The Pyramid of Khufu: A Colossus Piercing the Heavens',
        text:
            "They say Khufu, mighty pharaoh, wished not merely for a tomb, but a stairway to the sun itself. So rose his pyramid, each block a testament to his ambition.  Imagine the desert alive with the clamor of quarrymen, the groan of sledges bearing behemoth stones, the shouts of foremen echoing against the growing titan. Some whisper of secret knowledge employed, of ramps spiraling towards the sky, of star alignments more crucial than mortar. Yet, when tomb raiders breached the pharaoh's chamber centuries later, they found not golden ascent, but an echo of departed power.",
      ),
      const ParagraphWidget(
        header: 'The Pyramid of Khafre: Enigma Beside the Sphinx',
        text:
            "The sands hold many riddles, but none rival Khafre's monument and the silent sentinel beside it.  The Sphinx, some murmur, bears Khafre's own visage, carved from the living bedrock - a guardian of king and kingdom eternal. His pyramid, though scaled a touch smaller than his father's, tricks the eye. On its higher perch, it seems to challenge the elder. Its limestone crown gleams yet, hinting at the pristine beauty that once cloaked these giants. And within... corridors lead not just to tomb chambers, but to questions of rituals now lost to time.",
      ),
      const ParagraphWidget(
        header: 'The Pyramid of Menkaure: A Tale Left Unfinished',
        text:
            "In Menkaure's monument, one senses a shift. Granite, stark and strong, now graces the lower courses – a king seeking distinction, or a kingdom struggling with resources? Its inner chambers speak of haste, the finest polish left undone. Did fate cut Menkaure's reign short, leaving his pyramid a masterpiece incomplete? Smaller though it stands, a poignant majesty lingers – a tale left unfinished, etched into the stones themselves.",
      ),
    ],
  ),
  PlaceModel(
    locationAddress: 'https://maps.app.goo.gl/SrAwTzRLYmeVXGZr5',
    shortVideoAddress: 'assets/cairoTower.mp4',
    fullVideoUrl: 'https://youtu.be/Rcd4TLEIP6U',
    title: 'The Cairo Tower',
    thumbnailAddress: 'assets/icons/cairoTower.jpg',
    paragraphs: [
      const ParagraphWidget(
        header: "Cairo's Iconic Beacon: The Cairo Tower",
        text:
            "Standing tall as an emblem of modern Cairo, the Cairo Tower soars 187 meters above the bustling cityscape. Inspired by the graceful lotus flower, its latticework design creates a mesmerizing pattern against the sky. Ascend to the observation deck for breathtaking panoramic views that encompass iconic landmarks like the Pyramids of Giza, the Nile River, and the Citadel. As night falls, the tower transforms into a beacon of light, illuminating the skyline with vibrant colors. Whether enjoyed from afar or experienced from its summit, the Cairo Tower is a symbol of Egypt's enduring legacy and its place in the contemporary world.",
        // "For millennia, the pyramids of ancient Egypt have stood as monolithic testaments to human ingenuity and ambition. Their geometric precision and sheer scale continue to amaze architects and historians alike, fueling endless debates and hypotheses regarding their construction techniques. The Great Pyramid of Giza, the most iconic of them all, is thought to have been built some 4,500 years ago during the reign of Pharaoh Khufu. This staggering structure, composed of over 2 million massive stone blocks, ascends to a dizzying height of 481 feet, captivating generations with the mysteries of its creation.",
      ),
      const ParagraphWidget(
        header: "The Cairo Tower: A Legacy of a Nation's Rebirth",
        text:
            "The Cairo Tower stands as a testament to a pivotal era in Egyptian history. During the presidency of Gamal Abdel Nasser, this architectural marvel was conceived as a symbol of Egypt's modernization and independence. Designed by renowned architect Naoum Shebib, the tower's construction took place between 1956 and 1961. Its form, reminiscent of the lotus flower, pays homage to ancient Egypt while its imposing concrete structure speaks to the nation's industrial ambitions. Built by the labor of hundreds of Egyptian workers, the Cairo Tower embodies the spirit and aspirations of a nation embracing its future.",
        // "Contrary to popular depictions, it's widely accepted by Egyptologists that skilled laborers—not slaves—were the cornerstone of the pyramid construction effort. Discoveries of workers' settlements near the pyramids reveal evidence of organized communities with access to food, medical care, and burial chambers. These insights paint a less exploitative picture of their lives.",
      ),
    ],
  ),
  PlaceModel(
    locationAddress: 'https://maps.app.goo.gl/DNvnGXefyhFWsCmY8',
    shortVideoAddress: 'assets/KhanElkhalili.mp4',
    fullVideoUrl: 'https://youtu.be/MY3kolw6mNI',
    title: 'The Khan El-Khalili',
    thumbnailAddress: 'assets/icons/khanElkhalili.jpg',
    paragraphs: [
      const ParagraphWidget(
        header: 'A Labyrinth of Treasures: The Khan El-Khalili Experience',
        text:
            'The Khan El-Khalili bazaar is a vibrant labyrinth of commerce and culture, a place where the echoes of centuries mingle with the spirited haggling of modern-day Cairo.  Narrow alleyways twist and turn, lined with shops spilling over with gleaming brass lanterns, hand-woven carpets, aromatic spices, and intricately carved wooden treasures. The air buzzes with the calls of merchants, the clinking of tea glasses, and the scents of sizzling street food. More than just a market, Khan El-Khalili is a living slice of Egyptian history, a testament to the enduring traditions of craftsmanship and the timeless allure of the souk.',
      ),
      const ParagraphWidget(
        header: "The Rise of Khan El-Khalili: A Market's Legacy",
        text:
            "The roots of Khan El-Khalili stretch back to the Fatimid era when a burial ground for caliphs, known as the Saffron Tomb, occupied the site. In the late 14th century, the powerful Mamluk emir Djaharks el-Khalili transformed the area, building a massive caravanserai (a traveler's inn) to centralize trade in the heart of Cairo. Over centuries, the Khan expanded into a sprawling network of souks and workshops.  It has weathered empires, plagues, and fires, evolving into a beloved symbol of Cairo's enduring spirit and its rich mercantile heritage.",
      ),
    ],
  ),
  PlaceModel(
    locationAddress: 'https://maps.app.goo.gl/RAffQK7gSHhkdxXm9',
    shortVideoAddress: 'assets/GrandMusuem.mp4',
    fullVideoUrl: 'https://youtu.be/-r2PRe3L-lw',
    title: 'The Grand Egyptian Museum',
    thumbnailAddress: 'assets/icons/newEgyptianMuseum.jpg',
    ticketAddress: "https://visit-gem.com/en/tut",
    paragraphs: [
      const ParagraphWidget(
        header: "A Pharaoh's Ransom:",
        text:
            "The Grand Egyptian Museum stands as a monument to both ancient ingenuity and modern ambition, having cost over a billion dollars in construction. A sum worthy of kings indeed!",
      ),
      const ParagraphWidget(
        header: "The Sands of Time Unveiled:",
        text:
            "Within its walls, the GEM  houses a breathtaking trove of over 100,000 artifacts – a tapestry of history spanning pharaohs, gods, and the everyday lives of ancient Egyptians.",
      ),
      const ParagraphWidget(
        header: "The Jewel of Giza:",
        text:
            "Residing near the iconic Pyramids of Giza, the museum itself is an architectural marvel. Its triangular facade echoes the ancient structures, a visual bridge between past and present.",
      ),
      const ParagraphWidget(
        header: "King Tut's Grand Debut:",
        text:
            "For the first time in history, Tutankhamun's entire collection of treasures, over 5,000 items, will be showcased in its dazzling entirety.  A pharaoh's legacy finally displayed as he intended.",
      ),
      const ParagraphWidget(
          header: "A Museum Fit for the Ages:",
          text:
              "The GEM isn't simply a storehouse; its state-of-the-art facilities are designed to conserve the wonders of Egypt for generations, using the latest advancements in preservation science."),
    ],
  ),
];
