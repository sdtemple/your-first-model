# Building your first AI model

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

This repository is built to accomodate at workshop and hack-a-thon at University of Michigan. The goal is to build an AI model from scratch that performs a classification task (which bird species is vocalizing). The target audience is STEM professionals with some amount of coding experience, but not necessarily ML/Statistics researchers and Python experts.

Advertisement for event: Making your first neural network can be intimidating, and just looking at code and online videos isn't the same learning experience as a hands-on exercise. From 10:00 AM to 12:00 PM, we will cover the basics of tree ensemble methods for tabular data, convolutional neural networks and vision transformers for image data, and developing and publishing your model on Hugging Face. From 12 to 1 PM, we will have lunch provided. From 1:00 to 2:00 PM, there will be a guest speaker presenting on data visualization. From 2 to 5 PM, we will split into groups of 2-3 to build models predicting which of 20 bird species (categorical classification) can be identified based on acoustic data and metadata. Workshop facilitators will be available to assist and provide guidance to the groups. Starter code examples and some preprocessed code will be provided to focus on modeling and make the hack-a-thon accessible to all expertise levels.

<img src="the_state_of_michigan_with_a_bird.jpeg" align="center" width="600px"/>


## The data

You can see an example of what raw univariate audio and a spectrogram look like in a [Xenocanto recording](https://xeno-canto.org/412450).

Those with at umich dot edu emails can view the hack-a-thon files [here](https://drive.google.com/drive/folders/1N5SpfOMnYQjVGgKJlpowfEcYMGJF404D?usp=sharing).

Much of the data comes from the Kaggle BirdClef competitions.
- [BirdCLEF 2025](https://www.kaggle.com/competitions/birdclef-2025)
- [BirdCLEF 2024](https://www.kaggle.com/competitions/birdclef-2024)
- [BirdCLEF 2023](https://www.kaggle.com/competitions/birdclef-2023)
- [BirdCLEF 2022](https://www.kaggle.com/competitions/birdclef-2022)
- [BirdCLEF 2021](https://www.kaggle.com/competitions/birdclef-2021)

I also included acoustics data that are not bird sounds from the following:
- Different colored noise from [starter-code/sim-color-noise.ipynb](starter-code/sim-color-noise.ipynb)
- The Urban8K data [here](https://urbansounddataset.weebly.com/urbansound8k.html)
- Rain sounds from the DBR dataset at the Freesound repos [here](https://labs.freesound.org/datasets/)

I processed the data to include the acoustics of 10 species. More details:
- All species have between 100 - 150 audio files
- All files have [high probabilities](https://huggingface.co/sdtemple/xgb_bird_present) of including birds in every 5 sec clip
- The train/val/test split is 80/10/10.

The folder `birds` has common names and labels for abbreviated bird names and some metadata from the Birdclef competitions. You may find the metadata of some of your files useful.


## Installation



## Starter code

The `tensorize-birds.ipynb` and `tensorize-no-bird.ipynb` files compute Mel spectrograms based on parameter settings in the file `tensorize.json`. Modifying the parameters for audio processing may be one component of your modeling effort.

You should run these commands for your data:
```
papermill -p input_folder path/to/bird/audio/data -p params_file path/to/parameters/file -p audiomentations_file path/to/audiomentations/file tensorize-birds.ipynb path/to/run/notebook
```
```
papermill -p input_folder path/to/non/bird/audio/data -p params_file path/to/parameters/file -p audiomentations_file path/to/audiomentations/file tensorize-no-bird.ipynb path/to/run/notebook
```

Do not name `path/to/run/notebook` the same as the notebook, lest you overwrite things.

The `audiomentations.json` file has example parameters for data augmentation of the audio files. This will measurably increase your runtime and memory usage if `num_audiomentations > 0`. You can read more about the [audiomentations](https://iver56.github.io/audiomentations/) package. I appended the suffix of the method, like `Gain()` becomes `_gain`, in defining the parameters in the notebook.



The following files provide examples for fitting different models:
- [starter-code/random_forest.ipynb](starter-code/random_forest.ipynb)
- [starter-code/gradient_boosting_trees.ipynb](starter-code/gradient_boosting_trees.ipynb)
- [starter-code/xgboost.ipynb](starter-code/xgboost.ipynb)
- [starter-code/convolutional_neural_network.ipynb](starter-code/convolutional_neural_network.ipynb)
- [starter-code/convolutional_recurrent_neural_network.ipynb](starter-code/convolutional_recurrent_neural_network.ipynb)
- [starter-code/vision_transformer.ipynb](starter-code/vision_transformer.ipynb)
- [starter-code/pretrained_model.ipynb](starter-code/pretrained_model.ipynb)
