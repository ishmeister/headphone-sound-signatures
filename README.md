# headphone-sound-signatures
This project contains EQ profiles generated from the AutoEQ project that are intended to transform the sound signature of one headphone into another. These files are the result of running [this command](https://github.com/jaakkopasanen/AutoEq#using-sound-signatures) and a shared here just as a convenience in case you're unable to run the command yourself. 

All the headphone targets come from the results/oratory1990/harman_over-ear_2018 result set and were generated, for example, like this:

    python autoeq.py --input_dir="measurements/oratory1990/data/onear/Sennheiser HD 800" --output_dir="my_results/Sennheiser HD 800 (HD 600)" --compensation="compensation/harman_over-ear_2018_wo_bass.csv" --sound_signature="results/oratory1990/harman_over-ear_2018/Sennheiser HD 600/Sennheiser HD 600.csv" --equalize --parametric_eq --max_filters=5+5 --ten_band_eq --bass_boost=4 --convolution_eq --fs=44100,48000
