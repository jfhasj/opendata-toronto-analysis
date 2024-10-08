# An Analysis of Firearm-Related Shooting Occurrences in Toronto

## Overview

This paper analyzes the number of firearm-related shooting occurrences in Toronto using an existing dataset from the Open Data Toronto, which was sourced from the Toronto Police Service. In particular, this paper analyzes potential patterns and trends of shooting occurrences from 2014-2023.

## File Structure

The repo is structured as:

-   `inputs/data` contains the raw data as obtained from Open Data Toronto.
-   `inputs/pictures` contains a picture of the map of the divisions of Toronto used in this analysis.
-   `other/llm` contains chat history with Perplexity used to generate code to produce figures in this paper.
-   `other/sketches` contains sketches of all figures used in this paper.
-   `outputs/data` contains the cleaned dataset and simulated dataset.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download, clean, and test data.

## Statement on LLM usage

Aspects of the code were written with Perplexity, and chat history is available in `other/llm/usage.txt`.
