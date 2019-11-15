# Recognition of Degraded Pattern 
## Single vs Multilayer Perceptron 

Pattern is the alphabet from A to Z. 
The two networks are trained on the intact Pattern.
Then, they test to recognise the pattern which is progressively degraded. 

Graphic representation:
    - Intact Pattern
    - Degraded Pattern
    - Error for both neural networks during training (y axis = epochs)
    - Error for both neural networks during testing (y axis = noise or degradation)

The single layer perceptron is faster to train, but it is a way less robust than the MLP when the pattern are degraded. 
    
![Screen Shot 2019-11-15 at 23 51 14](https://user-images.githubusercontent.com/55028120/68981168-dd102100-0802-11ea-8565-979f30855ec2.png)

