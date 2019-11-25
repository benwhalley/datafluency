## More on Tibbles {#more-on-tibbles}

This material was adapted from
[Andy Wills' RminR](https://ajwills72.github.io/rminr/).



![Kitten that might be called Tibbles. Possibly. Image: [0x010C; CC BY-SA 4.0](https://commons.wikimedia.org/w/index.php?curid=42929793)](media/kitten.jpg)

In the [Exploring Data](#exploring-data-brief) worksheet, you got the mean
income of your sample like this:


```r
cpsdata %>% summarise(mean(income))
```

```
# A tibble: 1 x 1
  `mean(income)`
           <dbl>
1         87293.
```

The answer (the mean) is the last number on the bottom right -- but what about
all that other stuff in the output? What the hell is a tibble? You can safely
ignore the extra stuff but, if you're curious, here's what it all means...

1. The first line, `A tibble: 1 x 1`, says your output is a data frame (aka.
   `tibble`) with one row and one column ... so, a single number. No, I don't
   think anyone knows why it's called a tibble.

2. The second line tells you what summary you calculated -- `mean(income)`, the
   mean of the incomes.

3. The third line, `<dbl>` tells you that what you calculated is a number (in
   case you were wondering `dbl` is short for 'double precision floating point
   number', but that's probably more detail than you needed...).

4. The fourth line gives you the number you calculated, the mean income of
   `87293`. The `1` at the beginning is a row number, which you can ignore.

If you look at the number `87293.` really closely in your output, you'll notice
two more things about it:

a. The first two numbers, `87` are underlined, while the others are not. This is
just a way of making big numbers easier to read, much like writing 87,293 rather
than 87293. This underlining shows up in your R Console window, but not on these
worksheets -- sorry about that!

b. There's a decimal point at the end, but no numbers following the decimal
point. This lets you know that the answer has been rounded to the nearest whole
number. You'll always get an answer that is correct to at least three
significant figures, which is generally enough for reporting your findings.
There are ways to get a more precise output if you need it, but we don't cover
those in this class.

---

Here's another example. In the [Group Differences](#group-differences-briefly) worksheet, we calculate the mean income of your sample by sex like
this:

<!-- LINK THIS TO DATA HANDLING WORKSHOP INSTEAD -->


```r
cpsdata %>%
    group_by(sex) %>%
    summarise(median(income))
```

```
# A tibble: 2 x 2
  sex    `median(income)`
  <chr>             <dbl>
1 female           52558.
2 male             61746.
```

This can be read much the same way as the last example. These are the
differences:

-   Your tibble is now 2 x 2 because it has two rows (female, male) and two
    columns (sex, median income).

-   The `<chr>` in sex column says that column contains letters (male, female)
    rather than numbers -- chr is short for "characters" (another word for
    letters).

---

This material is distributed under a
[Creative Commons](https://creativecommons.org/) licence. CC-BY-SA 4.0.
