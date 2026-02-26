#let cheatsheet(
  title: [],
  authors: (),
  font-size: 5.5pt,
  x-margin: 20pt,
  y-margin: 25pt,
  num-columns: 5,
  column-gutter: 16pt,
  numbered-units: false,
  body,
) = {
  let color-index = (
    rgb("ff595e"),
    rgb("ff751f"),
    rgb("E0A500"),
    rgb("B1B62B"),
    rgb("82BC24"),
    rgb("36949d"),
    rgb("1982c4"),
    rgb("4267ac"),
    rgb("565aa0"),
    rgb("6a4c93"),
  )

  set page(
    paper: "a4",
    flipped: true,
    margin: (x: x-margin, y: y-margin),
    header: context [
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        gutter: 0pt,
        [
          #text(datetime.today().display("[month repr:long] [day], [year]"), weight: "bold")
        ],
        [
          #text(title, weight: "bold")
        ],
        [
          #text(authors, weight: "bold")
        ],
      )
      #v(-3pt)
      #line(length: 100%, stroke: black)
    ],
    numbering: "1 of 1",
  )

  set text(size: font-size)
  set list(body-indent: 0.25em)
  set enum(body-indent: 0.25em)

  // Required to allow heading counting
  set heading(numbering: (..) => "")

  show heading: it => {
    let index = counter(heading).at(it.location()).first()
    let hue = color-index.at(calc.rem(index - 1, color-index.len()))
    let color = hue.darken(0% * (it.depth - 1))

    if (it.depth == 1) {
      set text(white)
      block(
        radius: 2pt,
        outset: (x: 4pt),
        inset: (y: 3pt),
        width: 100%,
        above: 8pt,
        below: 5pt,
        fill: color,
        it,
      )
    } else {
      let stroke = if it.depth == 2 { 1pt } else { 0.5pt } + color
      block(
        inset: (x: -4pt),
        above: 6pt,
        below: 5pt,
        grid(
          columns: (1fr, auto, 1fr),
          align: horizon + center,
          column-gutter: 1em,
          line(length: 100%, stroke: stroke), text(weight: "bold", it), line(length: 100%, stroke: stroke),
        ),
      )
    }
  }

  columns(
    num-columns,
    gutter: column-gutter,

    body,
  )
}

#let statement(title: none, breakable: false, color: blue, content) = {
  let colorOutset = 4pt
  v(0.25em)
  block(
    radius: (right: 2pt),
    stroke: (left: 2pt + color),
    outset: colorOutset,
    fill: silver.lighten(60%),
    breakable: breakable,
    width: 100%,
    [*#title*] + content,
  )
  v(0.25em)
}

#let definition(number: none, breakable: false, content) = {
  statement(title: if number != none { "Def " + number } else { "Def" }, color: blue, breakable: breakable, content)
}

#let algorithm(number: none, breakable: false, content) = {
  statement(title: if number != none { "Alg " + number } else { "Alg" }, color: blue, breakable: breakable, content)
}

#let lemma(number: none, breakable: false, content) = {
  statement(title: if number != none { "Lem " + number } else { "Lem" }, color: black, breakable: breakable, content)
}

#let observation(number: none, breakable: false, content) = {
  statement(title: if number != none { "Obs " + number } else { "Obs" }, color: black, breakable: breakable, content)
}

#let corollary(number: none, breakable: false, content) = {
  statement(title: if number != none { "Cor " + number } else { "Cor" }, color: black, breakable: breakable, content)
}

#let fact(number: none, breakable: false, content) = {
  statement(title: if number != none { "Fact " + number } else { "Fact" }, color: black, breakable: breakable, content)
}

#let remark(number: none, breakable: false, content) = {
  statement(title: if number != none { "Rmk " + number } else { "Rmk" }, color: black, breakable: breakable, content)
}

#let proposition(number: none, breakable: false, content) = {
  statement(title: if number != none { "Prop " + number } else { "Prop" }, color: black, breakable: breakable, content)
}


#let theorem(number: none, breakable: false, content) = {
  statement(title: if number != none { "Thr " + number } else { "Thm" }, color: red, breakable: breakable, content)
}

#let fitWidth(content) = {
  layout(size => {
    style(styles => {
      let measures = measure(content, styles)
      let scaleFactor = if measures.width > size.width { 100% * (size.width / measures.width) } else { 100% }

      // Scale does not yet affect layout. place it - hidden box to adjust layout
      let scaled = scale(x: scaleFactor, y: scaleFactor, content)
      place(scaled)
      hide(box(height: measures.height * scaleFactor))
    })
  })
}
