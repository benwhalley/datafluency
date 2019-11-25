## What do confidence intervals mean? {#confidence-intervals-explanation}



> Imagine we replicated our study many times. We can't know what the *true mean* is. But if we calculate the confidence interval many times then we expect the *true* mean to fall within it, a certain percentage of the time.

If that seems quite a tricky thing to get your head around, you are not alone. There is a [long history of misinterpreting confidence intervals in psychology](http://www.ejwagenmakers.com/inpress/HoekstraEtAlPBR.pdf).

![Thousands of monkeys helping Homer run thousands of replications of his analysis.](media/monkeys.jpg)

It might help to know that in classical statistics, the probabilities that *p* values and intervals refer to are *attributes of the test procedure itself*... and don't refer to your hypothesis (for example, that there is a difference between experimental groups, or that there is a relationship between mother and child IQ scores). That is, the *p* value is the probability the test procedure will mislead you. It's NOT the probability your hypothesis is right or wrong.

To interpret the CI you have to assume there is a true, unknown, unchanging value for the thing you are estimating. Imagine there is a *true* slope which defines the relationship betweem mother and child IQ, and this is equal to exactly 0.52. We then need to imagine repeating a study many times. We employ thousands of monkeys to help us, and each time we run a regression and calculate the slope and the 95% confidence interval from the sample.  In 95% of these replications, the confidence interval we calculate will include the true value of 0.52.

To reiterate: the 95% CI *does not* tell us the range in which the true value will be 95% of the time, which is what you probably wanted to know.

Despite frequently misinterpreting them, psychologists often use confidence intervals to report uncertainty. They are also very easy to compute, so we cover how in the workshop.


### An example with some common misinterpretations



Reality: "70% of children prefer chocolate icecream to vanilla"

Your hypothesis: "More children like chocolate ice cream than vanilla."

Your sample: 62 out of 100 children said they preferred ice cream.

The *p* value says: "If children didn't have any preference in ice cream (50:50 preference) then you would only collect a sample which is this different from the expected 50:50 split about 0.02 times."

The *confidence interval* says: "Based on the sample you collected, it would be unlikely for you to collect another sample where fewer than 52 children said they preferred chocolate ice cream, or more than 71 children said they did prefer chocolate ice cream. By unlikely, we mean less than 1 time in 20."


Common misinterpretations include:

- The *p* value is 0.0214482 so we are 98% sure children prefer chocolate ice cream.

- We are 95% sure than more than 52 in 100 children prefer chocolate ice cream.


What we'd (really) like to say is:



- It's 4 times more likely that a majority of children prefer chocolate ice cream, than that they have no preference).

But that isn't possible with classical/frequentist statistics.
