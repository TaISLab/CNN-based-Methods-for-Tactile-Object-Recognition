# CNN-based Methods for Tactile Object Recognition

![](https://komarev.com/ghpvc/?username=jmgandarias&color=blue)

## Abstract
Novel high-resolution pressure-sensor arrays allow treating pressure readings as standard images. Computer vision algorithms and methods such as Convolutional Neural Networks (CNN) can be used to identify contact objects. In this work, a high-resolution tactile sensor has been attached to a robotic end-effector to identify contacted objects. Two CNN-based approaches have been employed to classify pressure images. These methods include a transfer learning approach using a pre-trained CNN on an RGB-images dataset and a custom-made CNN (TactNet) trained from scratch with tactile information. The transfer learning approach can be carried out by retraining the classification layers of the network or replacing these layers with an SVM. Overall, 11 configurations based on these methods have been tested: 8 transfer learning-based, and 3 TactNet-based.

For more details, please visit: https://doi.org/10.1109/JSEN.2019.2912968



## Dataset
The dataset formed by tactile images can be found in this link: https://drive.google.com/file/d/1N-He8pv-XD9bgjAgo0KDFq3YJJOx2f0P/view?usp=sharing


## Recent work
If you are interested on tactile perception and tactile object recognition, please check out newest works on: 
- Multimodal haptic object recognition: https://github.com/fpastorm/LSTM-Haptic-Fusion (paper: https://doi.org/10.1109/LRA.2020.3038377)
- Tactile object recognition with 3D convnets: (paper: https://doi.org/10.3390/s19245356)


## Cite this work
J.M. Gandarias, A.J. Garcia-Cerezo, and J.M. Gomez-de-Gabriel, “CNN-based methods for object recognition with high-resolution tactile sensors”, IEEE Sensors Journal, 19(16), 6872-6882, 2019

@article{gandarias2019cnn,
  title={CNN-based methods for object recognition with high-resolution tactile sensors},
  author={Gandarias, Juan M and Garcia-Cerezo, Alfonso J and Gomez-de-Gabriel, Jesus M},
  journal={IEEE Sensors Journal},
  volume={19},
  number={16},
  pages={6872--6882},
  year={2019},
}
