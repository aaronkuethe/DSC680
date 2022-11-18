{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "disabled-turning",
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Registered S3 methods overwritten by 'ggplot2':\n",
      "  method         from \n",
      "  [.quosures     rlang\n",
      "  c.quosures     rlang\n",
      "  print.quosures rlang\n",
      "Registered S3 method overwritten by 'rvest':\n",
      "  method            from\n",
      "  read_xml.response xml2\n",
      "-- Attaching packages --------------------------------------- tidyverse 1.2.1 --\n",
      "v tibble  2.1.1       v dplyr   0.8.0.1\n",
      "v tidyr   0.8.3       v stringr 1.4.0  \n",
      "v purrr   0.3.2       v forcats 0.4.0  \n",
      "-- Conflicts ------------------------------------------ tidyverse_conflicts() --\n",
      "x dplyr::filter() masks stats::filter()\n",
      "x dplyr::lag()    masks stats::lag()\n"
     ]
    }
   ],
   "source": [
    "# ASSIGNMENT 3.2\n",
    "# KUETHE, AARON\n",
    "# 4 April 2021\n",
    "\n",
    "# Load and Activate ggplot2 and pastecs package.\n",
    "library(ggplot2)\n",
    "library(readr)\n",
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "immediate-ideal",
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Parsed with column specification:\n",
      "cols(\n",
      "  month = col_character(),\n",
      "  day = col_double(),\n",
      "  attend = col_double(),\n",
      "  day_of_week = col_character(),\n",
      "  opponent = col_character(),\n",
      "  temp = col_double(),\n",
      "  skies = col_character(),\n",
      "  day_night = col_character(),\n",
      "  cap = col_character(),\n",
      "  shirt = col_character(),\n",
      "  fireworks = col_character(),\n",
      "  bobblehead = col_character()\n",
      ")\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "    month                day            attend      day_of_week       \n",
       " Length:81          Min.   : 1.00   Min.   :24312   Length:81         \n",
       " Class :character   1st Qu.: 8.00   1st Qu.:34493   Class :character  \n",
       " Mode  :character   Median :15.00   Median :40284   Mode  :character  \n",
       "                    Mean   :16.14   Mean   :41040                     \n",
       "                    3rd Qu.:25.00   3rd Qu.:46588                     \n",
       "                    Max.   :31.00   Max.   :56000                     \n",
       "   opponent              temp          skies            day_night        \n",
       " Length:81          Min.   :54.00   Length:81          Length:81         \n",
       " Class :character   1st Qu.:67.00   Class :character   Class :character  \n",
       " Mode  :character   Median :73.00   Mode  :character   Mode  :character  \n",
       "                    Mean   :73.15                                        \n",
       "                    3rd Qu.:79.00                                        \n",
       "                    Max.   :95.00                                        \n",
       "     cap               shirt            fireworks          bobblehead       \n",
       " Length:81          Length:81          Length:81          Length:81         \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Load in dodgers dataset and run summary of the data\n",
    "dodgers <- read_csv(\"dodgers.csv\")\n",
    "summary(dodgers)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "african-liberia",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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",
      "text/plain": [
       "Plot with title \"Temperature Impact on Attendance\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Initial Scatter Plot of Temperature and Attendance Data\n",
    "plot(dodgers$attend/1000~dodgers$temp,las=1,xlab = \"Temperature\",\n",
    "     ylab = \"Attendance(in thousands)\",col=\"blue\",pch=17,\n",
    "     main = \"Temperature Impact on Attendance\")\n",
    "# There does not appear to be much of a correlation here. I will run correlations later on to confirm.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "stock-grave",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Rearrange the months to plot appropriately in order\n",
    "dodgers$ordered_month <- with(data=dodgers,\n",
    "                              ifelse ((month == \"APR\"),4,\n",
    "                                      ifelse ((month == \"MAY\"),5,\n",
    "                                              ifelse ((month == \"JUN\"),6,\n",
    "                                                      ifelse ((month == \"JUL\"),7,\n",
    "                                                              ifelse ((month == \"AUG\"),8,\n",
    "                                                                      ifelse ((month == \"SEP\"),9,10)))))))\n",
    "dodgers$ordered_month <- factor(dodgers$ordered_month, levels=4:10,\n",
    "                                labels = c(\"April\", \"May\", \"June\", \"July\", \"Aug\", \"Sept\", \"Oct\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "horizontal-breathing",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\nRU5ErkJggg==",
      "text/plain": [
       "Plot with title \"Attendance by Month\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Plotting attendance by month with box plots\n",
    "plot(dodgers$attend~dodgers$ordered_month,las=1,xlab = \"Month\",\n",
    "     ylab = \"Attendance\",col=\"blue\",pch=17,\n",
    "     main = \"Attendance by Month\")\n",
    "# From this we can see May seemed to be a low month for attendance, as well as at the end of the season there seemed to be a decline in attendance as time went on.\n",
    "# This could be due to the team not being in playoff contention and thus decresaed attendance, or the weather turning colder and therefore decreasing attendance.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "affecting-object",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Rearrange the day of the week to plot appropriately in order\n",
    "dodgers$ordered_day_of_week <- with(data=dodgers,\n",
    "                                    ifelse ((day_of_week == \"Monday\"),1,\n",
    "                                            ifelse ((day_of_week == \"Tuesday\"),2,\n",
    "                                                    ifelse ((day_of_week == \"Wednesday\"),3,\n",
    "                                                            ifelse ((day_of_week == \"Thursday\"),4,\n",
    "                                                                    ifelse ((day_of_week == \"Friday\"),5,\n",
    "                                                                            ifelse ((day_of_week == \"Saturday\"),6,7)))))))\n",
    "dodgers$ordered_day_of_week <- factor(dodgers$ordered_day_of_week, levels=1:7,\n",
    "                                      labels=c(\"Mon\", \"Tue\", \"Wed\", \"Thur\", \"Fri\", \"Sat\", \"Sun\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "welsh-sudan",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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",
      "text/plain": [
       "Plot with title \"Attendance by Day\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Plotting attendance by day of week with box plots\n",
    "plot(dodgers$attend~dodgers$ordered_day_of_week,las=1,xlab = \"Day of Week\",\n",
    "     ylab = \"Attendance\",col=\"blue\",pch=19,\n",
    "     main = \"Attendance by Day\")\n",
    "# Tuesday surprisingly was the highest day for attendance. Monday and Wednesday seemed to be the two lowest days of attendance, with Monday being the lowest."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "planned-sculpture",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAMAAADKOT/pAAAAM1BMVEUAAAAAAP9NTU1oaGh8\nfHyMjIyampqnp6eysrK9vb3Hx8fQ0NDZ2dnh4eHp6enw8PD////UNI3wAAAACXBIWXMAABJ0\nAAASdAHeZh94AAAfF0lEQVR4nO3d62KiOhhG4WwEzwr3f7WbgwdUOgq8CV/Cen5MnU5JkGZV\noU7rKgCzuaV3AEgBIQEChAQIEBIgQEiAACEBAoQECBASIEBIgAAhAQKEBAgQEiBASIAAIQEC\nhAQIEBIgQEiAACEBAoQECBASIEBIgAAhAQKEBAgQEiBASIAAIQEChAQIEBIgQEiAACEBAoQE\nCBASIEBIgAAhAQKEBAgQEiBASIAAIQEChAQIEBIgQEiAACF55/rmjfPTVNf25vXn6ba/jo5/\n4Oh5FzqkY3vz+ON058z9Ojr+gaPnXeiQ8vZm/uN09w8ipHk4emEI1umvIbn3mz+NSkjzcPTC\n6K/Tcpe5bHd9vP+wcZtzVR0yl5/773Tb6/sQ9Xuz9r3OZbd3Z72R6w8pnDvVt07trdu/nLb1\nze3pOcypfrzaXqrHo+Xt3ef8fU78ipDC6IV0zbrVe769v3sSdt29vLNo/5ZdX4fIH1tuu17a\nYnb9DznULVTtvx/uc962csX9Y7qp3OUtpN3nnPgVIYXRC+nWUfeQ8jh5ynqL/XlKtXkd4rnl\n+d5FcYvv/iGHoh04c8U9pOKx3dvg27eQnu/GaIQUxjOken3nZVVuu8trrv1bs+Y3l+q+9JtW\n6jpO2f1h5z5EdureW2+56a5zX19iax5mDk1ZdWeHSzfaqamrnnDvutFuw2yfc1W9OXfP54wY\ng5DCeIZUP0CU3XuK7v3nlze3D26vYZ9eHh5uIbSnP1W1757S1Qv/8PIhlzqtffOv11tI2/tH\n7LrRbsOUnyH1342ROGphPNfnyzO06nU5vy3u6v3hpnejdLencF2Wj3+51O/a1I9XWXV5PGfr\nPuL6+Ht/uLe/cvVuIo5aGEMh9Zb1nyG5gSG6G+3ludfHrC6k5jpE8+7Lazj3W4TkBUctjOf6\nzF5W6l8hlW9bfb731HzrNX85i+pCOtaPY81zw4FHpN5jICFpcdTCeDlHOn28/+NNe1pzul+a\nu3/osf/erH3kebk00IbUvcrueg+p+DxHGpiZkGbiqIXxXJ/H7vLYsXstz18hNc001+deryTc\n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\n",
      "text/plain": [
       "Plot with title \"Temp by Month\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Plotting temperature by month to see if cold weather had an impact on attendance\n",
    "plot(dodgers$temp~dodgers$ordered_month,las=1,xlab = \"Month\",\n",
    "     ylab = \"Temp\",col=\"blue\",pch=19,\n",
    "     main = \"Temp by Month\")\n",
    "# It appears that the temperature was warmer every month from April to September, so cold weather did not decrease attendance, but maybe the warmer weather caused\n",
    "# fans to stay home."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "least-inquiry",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.0989507309062371"
      ],
      "text/latex": [
       "0.0989507309062371"
      ],
      "text/markdown": [
       "0.0989507309062371"
      ],
      "text/plain": [
       "[1] 0.09895073"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.0469160553836998"
      ],
      "text/latex": [
       "0.0469160553836998"
      ],
      "text/markdown": [
       "0.0469160553836998"
      ],
      "text/plain": [
       "[1] 0.04691606"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.0906279821652194"
      ],
      "text/latex": [
       "0.0906279821652194"
      ],
      "text/markdown": [
       "0.0906279821652194"
      ],
      "text/plain": [
       "[1] 0.09062798"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Correlations between Attendance and Temperature\n",
    "cor(dodgers$temp, dodgers$attend, method = c(\"pearson\"))\n",
    "cor(dodgers$temp, dodgers$attend, method = c(\"kendall\"))\n",
    "cor(dodgers$temp, dodgers$attend, method = c(\"spearman\"))\n",
    "# Can confirm that there is little to no correlation between temperature and attendance."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "forward-credits",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     ordered_month\n",
       "      April May June July Aug Sept Oct\n",
       "  NO     12  18    9   11  14   12   3\n",
       "  YES     0   0    0    1   1    0   0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "     ordered_month\n",
       "      April May June July Aug Sept Oct\n",
       "  NO     11  18    8   12  15   11   3\n",
       "  YES     1   0    1    0   0    1   0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "     ordered_month\n",
       "      April May June July Aug Sept Oct\n",
       "  NO     10  15    7   10  12   10   3\n",
       "  YES     2   3    2    2   3    2   0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "     ordered_month\n",
       "      April May June July Aug Sept Oct\n",
       "  NO     11  16    7    9  12   12   3\n",
       "  YES     1   2    2    3   3    0   0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Cap promotions by month\n",
    "with(dodgers, table(dodgers$cap,ordered_month))\n",
    "# There was a cap giveaway in July and August\n",
    "\n",
    "# T-shirt promotions by month\n",
    "with(dodgers, table(dodgers$shirt,ordered_month))\n",
    "# There was a shirt giveaway in April, June, and September\n",
    "\n",
    "# Firework promotions by month\n",
    "with(dodgers, table(dodgers$fireworks,ordered_month))\n",
    "There was multiple firework shows every month except October\n",
    "\n",
    "# Bobblehead promotions by month\n",
    "with(dodgers, table(dodgers$bobblehead,ordered_month))\n",
    "#There were multiple bobblehead giveaways from May to August"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "previous-classics",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     ordered_day_of_week\n",
       "      Mon Tue Wed Thur Fri Sat Sun\n",
       "  NO   12  12  12    5  13  13  12\n",
       "  YES   0   1   0    0   0   0   1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "     ordered_day_of_week\n",
       "      Mon Tue Wed Thur Fri Sat Sun\n",
       "  NO   11  12  12    5  13  13  12\n",
       "  YES   1   1   0    0   0   0   1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "     ordered_day_of_week\n",
       "      Mon Tue Wed Thur Fri Sat Sun\n",
       "  NO   12  13  11    5   0  13  13\n",
       "  YES   0   0   1    0  13   0   0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "     ordered_day_of_week\n",
       "      Mon Tue Wed Thur Fri Sat Sun\n",
       "  NO   12   7  12    3  13  11  12\n",
       "  YES   0   6   0    2   0   2   1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Cap promotions by day of week\n",
    "with(dodgers, table(dodgers$cap,ordered_day_of_week))\n",
    "\n",
    "# T-shirt promotions by day of week\n",
    "with(dodgers, table(dodgers$shirt,ordered_day_of_week))\n",
    "\n",
    "# Firework promotions by day of week\n",
    "with(dodgers, table(dodgers$fireworks,ordered_day_of_week))\n",
    "\n",
    "# Bobblehead promotions by day of week\n",
    "with(dodgers, table(dodgers$bobblehead,ordered_day_of_week))\n",
    "\n",
    "# Overall, the cap and tshirt giveaways happened on Tuesdays and Sundays, Fireworks happened on Fridays, and Tuesdays were the\n",
    "# most popular days for bobbleheads. Based off this data, it looks like most promotions were run on Tuesday overall, which\n",
    "# could be why Tuesday has the highest attendance. Looks like the promotions are doing their jobs."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "outdoor-garage",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "       ordered_day_of_week\n",
       "        Mon Tue Wed Thur Fri Sat Sun\n",
       "  Day     0   1   2    0   0   1  11\n",
       "  Night  12  12  10    5  13  12   2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "       ordered_month\n",
       "        April May June July Aug Sept Oct\n",
       "  Day       3   2    2    2   3    3   0\n",
       "  Night     9  16    7   10  12    9   3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Night or Day game by day of week\n",
    "with(dodgers, table(dodgers$day_night,ordered_day_of_week))\n",
    "\n",
    "# Night or Day game by Month\n",
    "with(dodgers, table(dodgers$day_night,ordered_month))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "unlimited-graphics",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Call:\n",
      "lm(formula = dodgers.model, data = dodgers)\n",
      "\n",
      "Residuals:\n",
      "    Min      1Q  Median      3Q     Max \n",
      "-8947.1 -3805.6  -279.1  2295.2 16656.0 \n",
      "\n",
      "Coefficients:\n",
      "                         Estimate Std. Error t value Pr(>|t|)    \n",
      "(Intercept)              34795.01    3640.36   9.558 8.30e-14 ***\n",
      "ordered_monthMay         -2318.27    2412.73  -0.961  0.34036    \n",
      "ordered_monthJune         6341.23    2740.47   2.314  0.02400 *  \n",
      "ordered_monthJuly         2324.08    2627.29   0.885  0.37979    \n",
      "ordered_monthAug          2689.52    2559.19   1.051  0.29737    \n",
      "ordered_monthSept         -356.22    2469.69  -0.144  0.88578    \n",
      "ordered_monthOct            32.87    3960.93   0.008  0.99341    \n",
      "ordered_day_of_weekTue    8313.17    2704.55   3.074  0.00314 ** \n",
      "ordered_day_of_weekWed    1651.47    2578.27   0.641  0.52418    \n",
      "ordered_day_of_weekThur   1263.02    3353.42   0.377  0.70773    \n",
      "ordered_day_of_weekFri  -10406.41    7000.10  -1.487  0.14219    \n",
      "ordered_day_of_weekSat    6978.54    2486.47   2.807  0.00668 ** \n",
      "ordered_day_of_weekSun    6115.29    3384.34   1.807  0.07562 .  \n",
      "bobbleheadYES            10939.44    2482.37   4.407 4.24e-05 ***\n",
      "capYES                   -5233.42    4585.43  -1.141  0.25813    \n",
      "fireworksYES             15874.95    6460.09   2.457  0.01681 *  \n",
      "shirtYES                  5761.18    3715.87   1.550  0.12613    \n",
      "day_nightNight           -1075.52    2752.17  -0.391  0.69729    \n",
      "skiesCloudy              -1110.73    1854.12  -0.599  0.55131    \n",
      "---\n",
      "Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n",
      "\n",
      "Residual standard error: 5810 on 62 degrees of freedom\n",
      "Multiple R-squared:   0.62,\tAdjusted R-squared:  0.5097 \n",
      "F-statistic:  5.62 on 18 and 62 DF,  p-value: 1.486e-07\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Model 1\n",
    "# Creating model to see what had biggest impact on attendance.\n",
    "\n",
    "dodgers.model <- (attend ~ ordered_month + ordered_day_of_week + bobblehead + cap + fireworks + shirt + day_night + skies)\n",
    "dodgers.model.fit <- lm(dodgers.model, data = dodgers)\n",
    "print(summary(dodgers.model.fit))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "id": "residential-dollar",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Call:\n",
      "lm(formula = dodgers.model2, data = dodgers)\n",
      "\n",
      "Residuals:\n",
      "     Min       1Q   Median       3Q      Max \n",
      "-10786.5  -3628.1   -516.1   2230.2  14351.0 \n",
      "\n",
      "Coefficients:\n",
      "                        Estimate Std. Error t value Pr(>|t|)    \n",
      "(Intercept)             33909.16    2521.81  13.446  < 2e-16 ***\n",
      "ordered_monthMay        -2385.62    2291.22  -1.041  0.30152    \n",
      "ordered_monthJune        7163.23    2732.72   2.621  0.01083 *  \n",
      "ordered_monthJuly        2849.83    2578.60   1.105  0.27303    \n",
      "ordered_monthAug         2377.92    2402.91   0.990  0.32593    \n",
      "ordered_monthSept          29.03    2521.25   0.012  0.99085    \n",
      "ordered_monthOct         -662.67    4046.45  -0.164  0.87041    \n",
      "ordered_day_of_weekTue   7911.49    2702.21   2.928  0.00466 ** \n",
      "ordered_day_of_weekWed   2460.02    2514.03   0.979  0.33134    \n",
      "ordered_day_of_weekThur   775.36    3486.15   0.222  0.82467    \n",
      "ordered_day_of_weekFri   4883.82    2504.65   1.950  0.05537 .  \n",
      "ordered_day_of_weekSat   6372.06    2552.08   2.497  0.01500 *  \n",
      "ordered_day_of_weekSun   6724.00    2506.72   2.682  0.00920 ** \n",
      "bobbleheadYES           10714.90    2419.52   4.429 3.59e-05 ***\n",
      "---\n",
      "Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n",
      "\n",
      "Residual standard error: 6120 on 67 degrees of freedom\n",
      "Multiple R-squared:  0.5444,\tAdjusted R-squared:  0.456 \n",
      "F-statistic: 6.158 on 13 and 67 DF,  p-value: 2.083e-07\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Model 2\n",
    "# Narrowing model down. Does not appear that skies, day or night have much impact on the model. Bobblehead seems to be the most\n",
    "# productive promotion.\n",
    "\n",
    "dodgers.model2 <- (attend ~ ordered_month + ordered_day_of_week + bobblehead)\n",
    "dodgers.model2.fit <- lm(dodgers.model2, data = dodgers)\n",
    "print(summary(dodgers.model2.fit))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "id": "miniature-macintosh",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Analysis of Variance Table\n",
      "\n",
      "Response: attend\n",
      "                    Df     Sum Sq   Mean Sq F value    Pr(>F)    \n",
      "ordered_month        6  948958117 158159686  4.6849 0.0005453 ***\n",
      "ordered_day_of_week  6 1314813030 219135505  6.4911 2.376e-05 ***\n",
      "bobblehead           1  734587177 734587177 21.7594 1.695e-05 ***\n",
      "cap                  1   76817856  76817856  2.2754 0.1365172    \n",
      "fireworks            1  231345578 231345578  6.8527 0.0111074 *  \n",
      "shirt                1   88943911  88943911  2.6346 0.1096308    \n",
      "day_night            1    7257573   7257573  0.2150 0.6445170    \n",
      "skies                1   12115527  12115527  0.3589 0.5513135    \n",
      "Residuals           62 2093094118  33759583                      \n",
      "---\n",
      "Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n",
      "Analysis of Variance Table\n",
      "\n",
      "Response: attend\n",
      "                    Df     Sum Sq   Mean Sq F value    Pr(>F)    \n",
      "ordered_month        6  948958117 158159686  4.2225  0.001158 ** \n",
      "ordered_day_of_week  6 1314813030 219135505  5.8504 6.002e-05 ***\n",
      "bobblehead           1  734587177 734587177 19.6118 3.590e-05 ***\n",
      "Residuals           67 2509574563  37456337                      \n",
      "---\n",
      "Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n"
     ]
    }
   ],
   "source": [
    "print(anova(dodgers.model.fit))\n",
    "\n",
    "print(anova(dodgers.model2.fit))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "id": "aquatic-problem",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Looking at the question we are trying to solve, I could see it being taken 2 ways. The first is what promotion, day, and month\n",
    "# are the most successful. The second would be, if we wanted to leave everything as is, but increase attendance at another time,\n",
    "# when would that be. Below both are addressed.\n",
    "\n",
    "# Based off the summary of the model, it appears that games where bobbleheads are given away on Tuessdays in June have\n",
    "# the highest impact on attendance. Those promotions appear to be working, as well as the Firework displays on Fridays. I was\n",
    "# able to determine this from the low p-values.\n",
    "\n",
    "#If the Dodgers wanted to increase attendance, they might want to consider giving away a bobblehead on a Thursday in September."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "norman-waters",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "3.6.1"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
