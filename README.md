# Tax Calculator

### Overview

Tax calculator is an app that allows you to enter your gross income and calculate your tax owed based on your location. At present this app only supports New Zealand's income tax rates.

Here are the 2025 NZ income tax rates used for individuals from IRD (New Zealand's HRMC equivalent)

|For each dollar of income| Tax rate |
| ----------------------- | -------- |
| Up to $15,600           | 10.5%    |
| $15,601 - $53,500       | 17.5%    |
| $53,501 - $78,100       | 30%      |
| $78,101 - $180,000      | 33%      |
| $180,001 and over       | 39%      |


### Calculator.rb

 ```Calculator.rb``` resides in ```app\services```. This module is where the majority of the heavy lifting is done in terms of the calculation itself.

I initially wasn't entirely clear on how incremental tax brackets were calculated, so I researched the topic and learned the following:

To determine the tax owed on an income using incremental tax brackets, you need to apply each tax rate only to the portion of the income that falls within that specific bracket. This means breaking the total income into segments and applying the corresponding tax rate to each segment.

For each tax bracket, calculate how much of your income falls within it, and then multiply that amount by the tax rate for that bracket.

With this understanding, I applied what I learned to reach the final solution.

### Testing 
Module testing has been added using [RSpec](https://rspec.info/).

**To run tests please use**
```
bundle exec rspec
```