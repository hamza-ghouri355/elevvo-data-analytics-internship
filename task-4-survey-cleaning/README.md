Task 4: Survey Data Cleaning

For this task I cleaned the Kaggle survey data for 2017 to 2021 and then used it to answer a few simple questions. The notebook is survey_cleaning.ipynb. I did not upload the dataset itself because it is a big file, but it is the Kaggle survey file kaggle_survey_2017_2021.csv and it needs to be in the same folder as the notebook to run it.

What the data looks like

The file has five years of the survey stacked together, around 106 thousand respondents and 293 columns. Every year asked slightly different questions, so most people left most of the columns empty. The average respondent answered only about 31 of the 293 questions. The first row was also not a person, it was the full text of the questions, so I removed that and ended up with 106,301 respondents.

I only kept the 7 columns that were asked in every year: year, age, gender, country, education, job title and years of coding. The other columns are specific to one year and mostly empty, so I did not think they would give a reliable comparison.

What I cleaned

The year column was a mix of numbers and text, so 2021 showed up as two different years. I turned it all into numbers.

The apostrophes in the education answers were broken (Master's showed up as Masterâ€™s), which also split the same degree into two groups. I repaired the text and the groups merged.

Some answers meant the same thing but were worded differently in different years, like the two ways of saying no formal education past high school, and professional doctorate (only used in 2021) and professional degree. I merged them. Treating those two as the same level is my own judgement call.

The United States was written in two ways, so I merged those, and I shortened the long United Kingdom name.

Blank answers became "Not answered" so nobody disappears from the counts.

I turned education and coding experience into ordered categories so they sort in a real order (for example less than a year, then 1 to 3 years, and so on). The survey used different answer ranges in different years, like 1 to 2 years in one and 1 to 3 in another, so I grouped coding experience into six buckets that every wording fits into. That is a small approximation.

About duplicates

If I only check the 7 columns I get 42,477 duplicates, but that is not real, because lots of different people have the same age, country and job. On the full data there are 4,456 rows with an identical earlier copy. But those rows answered a median of only 7 questions compared to 31 for everyone, so they are mostly people who answered a few basic questions and stopped, and the same few answers can easily match by chance. I decided to keep them instead of deleting real respondents.

What I found

Coding experience stays fairly similar over the years. Around half of the respondents have under 3 years of coding in every year, and only about 4 to 6 percent have never written code.

By job title, students are the most junior (about 73 percent have under 3 years) and research scientists are the most experienced (49 percent have 5 or more years). Data scientists are more experienced than data analysts, about 65 percent of them have 3 or more years compared to 42 percent of data analysts, so analyst looks like the more entry level role in this survey.

Master's is the biggest education group in every year. The share with a bachelor's goes up from 32.2 percent in 2017 to 39.1 percent in 2021 and the share with a doctoral degree goes down from 15.7 to 11.0 percent.

India (25,192 respondents) and the United States (16,885) are by far the biggest countries, together about 40 percent of everyone.

There is a stacked bar chart in the notebook showing the education change by year.

Things to keep in mind

It is not one group of people followed over time, it is a different group of volunteers each year, mostly from India and the US, so these results describe who answered the survey and not data people in general. The survey also changed its wording between years, so small differences from year to year should not be taken too seriously. For example professional degree drops to 1.4 percent in 2021, which is probably partly because of the different wording.

Tools: Python, pandas, matplotlib, Jupyter notebook in VS Code.
