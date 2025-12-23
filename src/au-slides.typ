#import "@preview/polylux:0.4.0": slide as polylux-slide, toolbox
#import "utils.typ": *


#let au-dark = rgb("#002546")
#let au-light = rgb("#37a0cb")
#let au-green = rgb("#8bad3f")
#let au-magenta = rgb("#e2007a")
#let au-red = rgb("#d73f58")
#let au-orange = rgb("#e67e22")
#let au-white = rgb("#ffffff")
#let au-gray = rgb("#f5f5f5")
#let au-dark-gray = rgb("#333333")


#let m-pages = counter("m-page")
#let m-metadata = state("m-metadata", (:))
#let m-sections = state("m-sections", ())
#let m-current-section = state("m-current-section", none)


#let au-logo(size: 2.1em, fill: white) = {
  text(font: "AU Logo", size: size, fill: fill, [\u{F030}])
}

#let au-seal(size: 2.1em, fill: white) = {
  text(font: "AU Logo", size: size, fill: fill, [\u{F031}])
}



#let header(title, color) = {
  if title != none {
    place(top + left, dx: 1.2em, dy: 1em, {
      set text(fill: color, weight: "bold", size: 1.8em)
      upper(title)
      v(-0.5em)
      line(length: 1.3cm, stroke: 3pt + color)
    })
  }
}

#let footer-title(text-color, institute: [], date: none) = {
  set text(fill: text-color, font: "AU Passata", size: 0.45em)

  place(bottom + left, dx: 0.4em, dy: -1.2em, {
    grid(
      columns: (auto, 0.3fr, 1fr, auto),
      column-gutter: 0.8em,
      align: (left + bottom, left + bottom, center + bottom, right + bottom),

      au-logo(size: 3.5em, fill: text-color),

      align(bottom, stack(
        spacing: 1.0em,
        text(weight: "bold", size: 1.2em)[AARHUS],
        text(weight: "bold", size: 1.2em)[UNIVERSITY],
        if institute != none and institute != [] {
          text(weight: "light", size: 0.9em, institute)
        },
      )),

      if date != none {
        context align(right + horizon, text(size: 0em, ""))
        context align(right + horizon, text(size: 0.9em, date))
      } else {
        none
      },

      au-seal(size: 3.5em, fill: text-color),
    )
  })
}

#let footer(text-color, institute: []) = {
  set text(fill: text-color, font: "AU Passata", size: 0.45em)

  place(bottom + left, dx: 0.4em, dy: -1.2em, {
    grid(
      columns: (auto, 0.3fr, 1fr, auto),
      column-gutter: 0.8em,
      align: (left + bottom, left + bottom, center + bottom, right + bottom),

      au-logo(size: 3.5em, fill: text-color),

      align(bottom, stack(
        spacing: 1.0em,
        text(weight: "bold", size: 1.2em)[AARHUS],
        text(weight: "bold", size: 1.2em)[UNIVERSITY],
        if institute != none and institute != [] {
          text(weight: "light", size: 0.9em, institute)
        },
      )),

      context align(right + horizon, text(size: 0.9em)[SLIDE #m-pages.get().first() IN #m-pages.final().first()]),

      au-seal(size: 3.5em, fill: text-color),
    )
  })
}




#let au-theme(
  aspect-ratio: "16-9", // "16-9" or "4-3"
  text-size: 20pt,
  accent-color: au-light,
  body,
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: (top: 4.5em, bottom: 4.5em, left: 3em, right: 3em),
    header: none,
    footer: none,
  )

  set text(
    font: "AU Passata",
    fill: au-dark,
    size: text-size,
    lang: "en",
  )

  show math.equation: set text(font: "STIX Two Math")

  show strong: set text(weight: "bold")
  show emph: set text(style: "italic")


  show heading.where(level: 1): it => {
    set text(size: 1.5em, weight: "bold", fill: au-dark)
    it.body
  }

  show heading.where(level: 2): it => {
    set text(size: 1.2em, weight: "bold", fill: au-dark)
    it.body
  }


  set list(marker: ([•], [◦], [▪]))


  set enum(numbering: "1.", indent: 1em)


  show raw.where(block: true): block.with(
    fill: au-gray,
    inset: 1em,
    radius: 0.3em,
    width: 100%,
  )

  body
}




#let title-slide(
  title: [],
  subtitle: none,
  author: [],
  institute: [AARHUS UNIVERSITY],
  date: datetime.today().display(),
  logo: none,
) = {
  set page(fill: au-dark)
  set text(fill: au-white)

  let content = {
    if logo != none {
      place(top + right, dx: -2em, dy: 1.5em, logo)
    }

    set align(left + horizon)
    v(1em)

    text(size: 1.8em, weight: "bold", upper(title))

    if subtitle != none {
      v(-0.3em)
      text(size: 1.5em, weight: "light", subtitle)
    }

    v(2.5em)
    text(size: 1.1em, weight: "light", author)
  }

  set page(footer: footer-title(au-white, institute: institute, date: date))
  polylux-slide(content)
}


#let slide(
  title: none,
  new-section: none,
  body,
  institute: [],
) = {
  if new-section != none { toolbox.register-section(new-section) }
  m-pages.step()

  set page(
    fill: au-white,
    header: header(title, au-dark),
    footer: footer(au-dark, institute: institute),
  )

  set text(fill: au-dark)
  polylux-slide(body)
}


#let slide-dark(
  title: none,
  bg-color: au-dark,
  fg-color: au-white,
  accent-color: au-light,
  new-section: none,
  body,
  institute: [],
) = {
  if new-section != none { toolbox.register-section(new-section) }
  m-pages.step()

  set page(
    fill: bg-color,
    header: header(title, fg-color),
    footer: footer(fg-color, institute: institute),
  )

  set text(fill: fg-color)
  polylux-slide(body)
}


#let slide-color(
  title: none,
  bg-color: au-white,
  fg-color: au-dark,
  new-section: none,
  body,
  institute: [],
) = {
  if new-section != none { toolbox.register-section(new-section) }
  m-pages.step()

  set page(
    fill: bg-color,
    header: header(title, fg-color),
    footer: footer(fg-color, institute: institute),
  )

  set text(fill: fg-color)
  polylux-slide(body)
}


#let section-slide(
  title: [],
  subtitle: none,
) = {
  m-pages.step()


  m-sections.update(sections => {
    if title not in sections {
      sections + (title,)
    } else {
      sections
    }
  })


  m-current-section.update(title)

  toolbox.register-section(title)

  set page(fill: au-dark)
  set text(fill: au-white)

  let content = {
    set align(center + horizon)

    text(size: 3em, weight: "bold", upper(title))

    if subtitle != none {
      v(-0.5em)
      text(size: 1.5em, weight: "light", subtitle)
    }
  }


  polylux-slide(content)


  [#hide[#title] <m-section>]
}


#let outline-slide(
  title: "Outline",
  sections: (),
  highlight-current: true,
) = {
  m-pages.step()

  set page(
    fill: au-white,
    header: header(title, au-dark),
    footer: footer(au-dark, institute: []),
  )

  set text(fill: au-dark)


  let should-highlight = highlight-current


  polylux-slide({
    set list(indent: 2em, body-indent: 1em)
    context {
      let all-sections = if sections.len() > 0 {
        sections
      } else {
        let query-result = query(<m-section>)
        query-result.map(elem => {
          if elem.has("body") {
            elem.body
          } else if elem.has("text") {
            elem.text
          } else {
            elem
          }
        })
      }

      let current = m-current-section.get()

      if all-sections.len() > 0 {
        list(
          ..all-sections.map(section => {
            let is-current = if should-highlight {
              repr(section).slice(1, -1) == current
            } else {
              false
            }

            if is-current {
              text(weight: "bold", section)
            } else {
              section
            }
          }),
        )
      } else {
        text(fill: au-dark, style: "italic", [Sections will appear as they are defined.])
      }
    }
  })
}


#let bib-slide(title: "References", bib-content) = {
  m-pages.step()

  set page(
    fill: au-white,
    header: header(title, au-dark),
    footer: footer(au-dark, institute: []),
  )

  set text(fill: au-dark, size: 0.75em)
  set par(justify: true)

  polylux-slide(bib-content)
}




#let alert(
  title: none,
  body,
  bg-color: au-light.lighten(85%),
  stroke-color: au-light,
  text-color: au-dark,
) = {
  block(
    fill: bg-color,
    stroke: 1.5pt + stroke-color,
    width: 100%,
    inset: 1em,
    radius: 0.4em,
    {
      set text(fill: text-color)
      if title != none {
        text(weight: "bold", size: 1.1em, title)
        v(-0.3em)
        line(length: 100%, stroke: 1pt + stroke-color.lighten(30%))
        v(0.5em)
      }
      body
    },
  )
}


#let box(
  title: none,
  body,
  bg-color: au-gray,
  text-color: au-dark,
) = {
  block(
    fill: bg-color,
    stroke: none,
    width: 100%,
    inset: 1em,
    radius: 0.4em,
    {
      set text(fill: text-color)
      if title != none {
        text(weight: "bold", size: 1.1em, title)
        v(-0.3em)
        v(0.5em)
      }
      body
    },
  )
}


#let cols(
  col1,
  col2,
  gutter: 2em,
) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: gutter,
    col1, col2,
  )
}


#let cols3(
  col1,
  col2,
  col3,
  gutter: 1.5em,
) = {
  grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: gutter,
    col1, col2, col3,
  )
}




#let accent-line(color: au-light, thickness: 3pt, length: 100%) = {
  line(length: length, stroke: thickness + color)
}


#let big-quote(text-content, author: none) = {
  set text(size: 1.6em, weight: "light", style: "italic", fill: au-dark)

  stack(
    spacing: 0.5em,
    quote(text-content),
    if author != none {
      align(right, text(size: 0.8em, weight: "light", [— #author]))
    },
  )
}
