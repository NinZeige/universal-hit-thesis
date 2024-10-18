#import "../../../common/theme/type.typ": 字体, 字号
#import "../config/constants.typ": current-date, special-words
#import "../utils/states.typ": thesis-info-state

#let cover-primary(
  title-cn: "",
  title-en: "",
  author: "",
  student-id: "",
  supervisor: "",
  profession: "",
  collage: "",
  reply-date: "",
  institute: "",
  year: current-date.year(),
  month: current-date.month(),
  day: current-date.day(),
) = {
  align(center)[

    #let space-scale-ratio = 1.25

    #v(字号.小四 * 6 * space-scale-ratio)

    #text(size: 字号.小一, font: 字体.宋体, weight: "bold")[*本科毕业论文（设计）*]

    #v(字号.小四 * 2 * space-scale-ratio)

    #text(size: 字号.二号, font: 字体.黑体)[#title-cn]

    #v(字号.小四 * 2 * space-scale-ratio)

    #par(justify: false)[
      #text(size: 字号.小二, font: 字体.宋体, weight: "bold")[#title-en]
    ]

    #v(字号.小四 * 1 * space-scale-ratio)
    #v(字号.二号 * 2 * space-scale-ratio)

    #align(center)[
      #text(size: 字号.小二, font: 字体.宋体, weight: "bold")[
        #author
      ]
    ]

    #v(字号.小二 * 2 * space-scale-ratio)
    #v(字号.小四 * 6 * space-scale-ratio)

    #align(center)[
      #text(size: 字号.小二, font: 字体.楷体, weight: "bold")[#institute]

      #text(size: 字号.小二, font: 字体.宋体, weight: "bold")[
        #[#year]年#[#month]月
      ]
    ]
  ]
}

#let cover-secondary(
  title-cn: "",
  author: "",
  student-id: "",
  supervisor: "",
  profession: "",
  collage: "",
  institute: "",
  year: current-date.year(),
  month: current-date.month(),
  day: current-date.day(),
) = {
  align(center)[

    #let space-scale-ratio = 1.4

    #align(right)[
      #text(size: 字号.四号, font: 字体.宋体)[密级：公开]
    ]

    #v(字号.小四 * 3 * space-scale-ratio)

    #text(size: 字号.小二, font: 字体.宋体)[*本科毕业论文（设计）*]

    #v(字号.小四 * 2 * space-scale-ratio)

    #text(size: 字号.二号, font: 字体.黑体)[#title-cn]

    #v(字号.小四 * 1 * space-scale-ratio)

    #v(字号.二号 * 4 * space-scale-ratio)

    // #v(字号.小四 * space-scale-ratio)

    #let cover-info-key(content) = {
      align(right)[
        #text(size: 字号.四号, font: 字体.黑体)[#content]
      ]
    }

    #let cover-info-colon(content) = {
      align(left)[
        #text(size: 字号.四号, font: 字体.黑体)[#content]
      ]
    }

    #let cover-info-value(content) = {
      align(left)[
        #text(size: 字号.四号, font: 字体.宋体)[#content]
      ]
    }

    #let base-space = 0.8
    #let key-width = 字号.四号 * (4 + base-space * 3)

    #grid(
      columns: (auto, 1em, auto),
      rows: (字号.四号, 字号.四号),
      row-gutter: 1.5em,
      cover-info-key(text(spacing: (key-width - 3em) / 2)[本 科 生]),
      cover-info-colon[：],
      cover-info-value(author),
      cover-info-key(text(spacing: (key-width - 2em))[学 号]),
      cover-info-colon[：],
      cover-info-value(student-id),
      cover-info-key(text(spacing: base-space * 1em)[指 导 教 师]),
      cover-info-colon[：],
      cover-info-value(supervisor),
      cover-info-key(text(spacing: (key-width - 2em))[专 业]),
      cover-info-colon[：],
      cover-info-value(profession),
      cover-info-key(text(spacing: (key-width - 2em))[学 院]),
      cover-info-colon[：],
      cover-info-value(collage),
      cover-info-key(text(spacing: base-space * 1em)[答 辩 日 期]),
      cover-info-colon[：],
      cover-info-value([#[#year]年#[#month]月]),
      cover-info-key(text(spacing: (key-width - 2em))[学 校]),
      cover-info-colon[：],
      cover-info-value(institute),
    )
  ]
}

// 毕业设计开题的封面 仿照官网格式
#let cover-proposal(
  title-cn: "",
  author: "",
  student-id: "",
  supervisor: "",
  profession: "",
  reply-date: "",
  collage: "",
  institute: "",
  year: current-date.year(),
  month: current-date.month(),
  day: current-date.day(),
) = {
  align(center)[
    #let space-scale-ratio = 1.25
    #let right-width = 2.5in
    #let base-space = 0.8

    #v(字号.小四 * 6 * space-scale-ratio)

    // Title of the cover
    #text(size: 字号.小初, font: 字体.华文新魏, weight: "bold")[#special-words.proposal-title]  

    #v(字号.小四 * 3 * space-scale-ratio)

    #let key-width = 字号.小二 * (4 + base-space * 3)
    #let cover-info-key(content) = {
      align(right)[
        #text(size: 字号.小二, font: 字体.黑体)[#content]
      ]
    }
    #let cover-info-value(content, title: false) = {
      // 标题加粗且用小二字号
      let (size, weight,baseline) = if title {(字号.小二, "bold", 0.15em)} else {(字号.小三, "regular", 0.15em)};
      set par(leading: 26pt)
      let ctnt = align(center)[
        #text(size: size, font: 字体.宋体, weight: weight, baseline: baseline)[#content]
      ]

      // The underline of the table, not so elegant
      box(underline(ctnt, offset: 0.25em + baseline, extent: 10em), 
        clip: true,
        outset: (x: 0em, y: 0.7em),
        width: right-width,
      )
    }
    // Information table
    #grid(
      columns: (auto, right-width),
      row-gutter: 2em,
      column-gutter: 1.5em,
      cover-info-key(text(spacing: (key-width - 2em))[题 目]),
      cover-info-value(title-cn, title: true),
      cover-info-key(text(spacing: (key-width - 2em))[姓 名]),
      cover-info-value(author),
      cover-info-key(text(spacing: (key-width - 2em))[学 号]),
      cover-info-value(student-id),
      cover-info-key(text(spacing: (key-width - 2em))[学 院]),
      cover-info-value(collage),
      cover-info-key(text(spacing: (key-width - 2em))[专 业]),
      cover-info-value(profession),
      cover-info-key(text(spacing: base-space * 1em)[指 导 教 师]),
      cover-info-value(supervisor),
      cover-info-key(text(spacing: (key-width - 2em))[日 期]),
      cover-info-value([#[#year]年#[#month]月]),

    )
  ]
}

#let thesis-style-cover(thesis-info) = {
  cover-primary(
    title-cn: thesis-info.at("title-cn"),
    title-en: thesis-info.at("title-en"),
    author: thesis-info.at("author"),
    student-id: thesis-info.at("student-id"),
    supervisor: thesis-info.at("supervisor"),
    profession: thesis-info.at("profession"),
    collage: thesis-info.at("collage"),
    institute: thesis-info.at("institute"),
    year: thesis-info.at("year"),
    month: thesis-info.at("month"),
    day: thesis-info.at("day"),
  )

  pagebreak()

  cover-secondary(
    title-cn: thesis-info.at("title-cn"),
    author: thesis-info.at("author"),
    student-id: thesis-info.at("student-id"),
    supervisor: thesis-info.at("supervisor"),
    profession: thesis-info.at("profession"),
    collage: thesis-info.at("collage"),
    institute: thesis-info.at("institute"),
    year: thesis-info.at("year"),
    month: thesis-info.at("month"),
    day: thesis-info.at("day"),
  )
}

#let proposal-style-cover(info) = {
    cover-proposal(
    title-cn: info.at("title-cn"),
    author: info.at("author"),
    student-id: info.at("student-id"),
    supervisor: info.at("supervisor"),
    profession: info.at("profession"),
    collage: info.at("collage"),
    institute: info.at("institute"),
    year: info.at("year"),
    month: info.at("month"),
    day: info.at("day"),
  )
}

#let cover() = {
  context {
    let thesis-info = thesis-info-state.get()
    let dtype = thesis-info.at("doc-type")

    if dtype == "thesis" {
      thesis-style-cover(thesis-info)
    } else if dtype == "proposal" {
      proposal-style-cover(thesis-info)
    } else {
      panic("Not supported type: " + dtype)
    }
  }
}