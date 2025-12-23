#import "@preview/polylux:0.4.0": *
#import "@local/au-slides:0.1.0": *


#show: au-theme.with(
  aspect-ratio: "16-9",
  text-size: 20pt,
)


#let today = datetime.today()
#let formatted-date = today.display("[day] [month repr:long] [year]")

#title-slide(
  title: "AU Slides",
  subtitle: "A Typst template for Aarhus University",
  author: "Your Name\nDepartment of Computer Science",
  institute: "Department of Computer Science",
  date: formatted-date,
)


#outline-slide(
  title: "Contents",
)



#section-slide(
  title: "Basic Slides",
)

#slide(title: "Standard Layout", new-section: "Basic Slides")[
  Each slide has a title at the top and a content area below. The footer shows the slide number and university branding.

  #v(1em)

  Content supports:
  - Bullet lists
  - Text formatting (_italic_ and *bold*)
  - Code blocks
  - Tables and images
]

#slide(title: "Colors")[
  The template includes the official Aarhus University color palette:

  #v(1em)

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 1em,
    [
      #block(fill: au-dark, width: 100%, height: 60pt, radius: 0.3em)
      Dark\
      #text(size: 0.75em, weight: "light", "#002546")
    ],
    [
      #block(fill: au-light, width: 100%, height: 60pt, radius: 0.3em)
      Light\
      #text(size: 0.75em, weight: "light", "#37a0cb")
    ],
    [
      #block(fill: au-green, width: 100%, height: 60pt, radius: 0.3em)
      Green\
      #text(size: 0.75em, weight: "light", "#8bad3f")
    ],
    [
      #block(fill: au-magenta, width: 100%, height: 60pt, radius: 0.3em)
      Magenta\
      #text(size: 0.75em, weight: "light", "#e2007a")
    ],
  )
]



#section-slide(
  title: "Slide Variants",
)

#outline-slide(
  title: "Contents",
  highlight-current: true,
)

#slide(title: "White Background", new-section: "Slide Variants")[
  This is the standard slide type with white background and dark text. You can use it for most of your content.

  #v(1.5em)

  Good for:
  - Regular content and explanations
  - Lists and comparisons
  - Code examples
]

#slide-dark(title: "Dark Background")[
  Dark slides work well for transitions between sections or to emphasize a particular point.

  #v(1.5em)

  Use them for:
  - Section breaks
  - Important statements
  - Visual contrast
]

#slide-color(title: "Custom Colors", bg-color: au-green, fg-color: au-white)[
  You can use any of the AU colors for slide backgrounds, or define your own.

  #v(1.5em)

  Available colors:
  - Green, Magenta, Red, Orange
  - Or mix your own with the `slide-color()` function
]



#section-slide(
  title: "Components",
)

#slide(title: "Message Boxes", new-section: "Components")[
  Use colored boxes to highlight different types of information:

  #v(0.8em)

  #success[This completed successfully]

  #v(0.5em)

  #info[This is informational]

  #v(0.5em)

  #warning[This needs attention]

  #v(0.5em)

  #error[This is an error]
]

#slide(title: "Statistics")[
  Statistics boxes work well for displaying key numbers or results:

  #v(1.5em)

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    stat-box("95%", "Completion"), stat-box("1.2s", "Response Time"), stat-box("48", "Tests Passing"),
  )
]

#slide(title: "Code Example")[
  Code blocks use syntax highlighting. This example shows Rust:

  #v(1em)

  ```rust
  fn main() {
      println!("Hello, world!");
  }
  ```
]



#section-slide(
  title: "Layouts",
)

#slide(title: "Side-by-Side", new-section: "Layouts")[
  Use two columns to compare ideas or show parallel information:

  #v(0.5em)

  #cols(
    [
      *Left side*

      Put related information here. The columns adjust to the content width.
    ],
    [
      *Right side*

      This layout works well for pros/cons, before/after, or comparisons.
    ],
  )
]

#slide(title: "Three Columns")[
  Split content across three columns:

  #v(0.5em)

  #cols3(
    [
      *First*

      #stat-box("45%", "Value")
    ],
    [
      *Second*

      #stat-box("62%", "Value")
    ],
    [
      *Third*

      #stat-box("88%", "Value")
    ],
  )
]

#slide(title: "Process Steps")[
  Timeline items show a sequence of steps:

  #v(0.5em)

  #stack(
    spacing: 1.5em,
    timeline-item(1, "First Step", "Initialize the system and prepare data"),
    timeline-item(2, "Second Step", "Process input and apply transformations"),
    timeline-item(3, "Third Step", "Output results and verify correctness"),
  )
]



#section-slide(
  title: "Summary",
)

#slide(title: "What You Can Do", new-section: "Summary")[
  AU Slides gives you:

  #v(1em)

  #cols(
    [
      *Structure*
      - Multiple slide layouts
      - Consistent styling
      - Section management
    ],
    [
      *Components*
      - Message boxes
      - Statistics displays
      - Timeline items
      - Custom backgrounds
    ],
  )
]

#slide-dark(title: "End")[
  #align(center + horizon)[
    #text(size: 2.2em, weight: "bold")[Thank You]

    #v(2em)

    Questions?
  ]
]
