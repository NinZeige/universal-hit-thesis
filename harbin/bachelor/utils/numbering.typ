#let thesis-heading-numbering(..nums) = {
  let nums-vec = nums.pos()

  if nums-vec.len() == 1 [
    #numbering("第 1 章", ..nums-vec) #h(0.75em)
  ] else [
    #numbering("1.1", ..nums-vec) #h(0.75em)
  ]
}

#let proposal-heading-numbering(..nums) = {
  let nums-vec = nums.pos()
  [#numbering("1.1", ..nums-vec) #h(0.75em)]
}