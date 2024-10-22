
# Video Pixely

(Overview) This project seeks to build a Haskell module that converts short videos into pixel art. It aims to enrich the Haskell community by providing a fun and artistic tool that can be used in Haskell-based applications, such as Discord bots. Our solution will allow developers to take short clips and transform them into a pixel art style, adding a creative dimension to Haskell's ecosystem.
This project is in fulfillment of the CPSC 312 2024W1 project requirements.

This project is in fulfillment of the [CPSC 312 2024W1 project requirements](https://steven-wolfman.github.io/cpsc-312-website-2024W1/project.html).

## Team Members

Our team is:

+ Yasser Sanobar (student # 1): Burger 1
+ Evan Dien   (student # 2): EP 2
+ Tony Huang  (student # 3): HY 3
+ If you have a fourth member: Team Member Name 4 (student # 4): optional awesome nickname 4

We call ourselves: Burger Pixelizers.

## Acknowledgments

Acknowledgments
We want to acknowledge the resources and support that helped shape our project:

Medium Article on ASCII Art Conversion in Haskell: This article provided initial guidance on manipulating images using Haskell, which was adapted to suit our project’s needs.

CPSC 312 Image Blending Project (2023): We drew inspiration from this previous project, particularly in the way they handled image data within Haskell.

Github Copilot: We used Github Copilot extensively to draft first-pass code for image processing. We then manually fine-tuned the generated code to fit our project’s requirements.

ChatGPT: We used ChatGPT to generate ideas, structure documentation, and get feedback on the overall project workflow and design.

## Product Pitch

**Pixel Inspiration: Unleash Your Creativity in Pixels**

In a world where perspectives shape creativity, why not explore a new way of seeing things? **Pixel Inspiration** offers a creative tool that transforms your videos into stunning pixel art animations, each with its own unique style, color palette, and dynamic motion. Whether you want to evoke nostalgia or add a retro touch to your content, our platform empowers users to craft personal, artistic interpretations of their favorite videos.

But we’re not stopping at individual creation. Pixel Inspiration taps into the power of Haskell, providing the community with a fresh opportunity to blend art with functional programming. 

By using our tool, Haskell developers can easily incorporate pixel art into their own projects, be it for a creative touch on personal websites or engaging animations in discussions and forums.

Imagine Haskell-powered websites where user avatars or banners can come alive with pixelated animations, creating more dynamic and visually appealing interfaces.

With **Pixel Inspiration**, we’re blending the world of art and code to offer a new perspective. Join us in transforming how we experience video content—pixel by pixel!

## Minimal Viable Project

Our MVP is a Haskell application that transforms a short video clip (approximately 5 seconds) into a pixel art animation, resembling a cartoon-like style. Users will have the option to either upload an existing video file or record a new 5-second video using their webcam directly through the application. The program processes the video frame by frame, reducing the resolution and applying pixel art effects to create a stylized, low-resolution animation that captures the essence of the original video in a retro, pixelated form.

Building Toward the Product Pitch:

This MVP meaningfully advances our product pitch by implementing the core functionality of video-to-pixel art conversion. By focusing on short videos, we manage the project's complexity while tackling essential challenges such as video decoding, frame extraction, and image transformation into pixel art. This approach lays a solid foundation for future enhancements, such as processing longer videos, offering various artistic styles, or integrating more sophisticated effects.

Leveraging Haskell's Strengths:

The project capitalizes on Haskell's powerful functional programming paradigm and strong type system, which are ideal for complex data transformations required in video processing and image manipulation. Haskell's efficient handling of lists, higher-order functions, and recursion facilitates the processing of pixel data across multiple frames.

We plan to utilize specialized libraries to handle multimedia data effectively:

ffmpeg-light or haskell-ffmpeg: For video decoding and frame extraction, allowing us to process various video formats within Haskell.
JuicyPixels: For image processing tasks, such as accessing and manipulating pixel data from each frame.
haskell-opencv: For advanced image and video processing functionalities, including webcam integration for real-time video capture.
By leveraging these libraries, we can focus on the transformation logic while relying on well-tested tools for low-level multimedia handling. Haskell's purity and strong typing ensure that our transformations are reliable and maintainable.

Learning and Applying New Elements of Haskell:

This project naturally leads us to explore and apply advanced Haskell concepts and libraries beyond our current coursework:

Advanced Image Processing Techniques:

What we'll learn: How to implement image processing algorithms in Haskell, such as pixelation effects, color quantization, and edge detection.
Application in the project: We'll apply these algorithms to transform video frames into pixel art, learning how to manipulate images at the pixel level.
Foreign Function Interface (FFI):

What we'll learn: How to interface Haskell with C libraries to utilize functionalities not natively available in Haskell.
Application in the project: We'll use FFI to interact with multimedia libraries like FFmpeg and OpenCV, enabling video decoding and webcam access.
Parallel and Concurrent Processing:

What we'll learn: Techniques to process data concurrently using Haskell's concurrency primitives and libraries like async or parallel.
Application in the project: We'll implement parallel processing of video frames to improve performance, handling multiple frames simultaneously.
Custom Data Types and Typeclasses:

What we'll learn: Designing custom data types and leveraging Haskell's type system to create more expressive and safer code.
Application in the project: We'll define types for representing frames, pixels, and transformation parameters, ensuring type safety and clarity in our transformations.
Monad Transformers and Advanced Monadic Patterns:

What we'll learn: How to use monad transformers to combine multiple effects, such as state management, I/O, and error handling.
Application in the project: We'll manage complex computations that involve stateful transformations and I/O operations, enhancing our code's modularity and readability.
Optimization and Performance Tuning:

What we'll learn: Techniques for optimizing Haskell programs, such as strictness annotations, unboxed types, and profiling tools.
Application in the project: We'll optimize computationally intensive parts of our code, such as image transformations and data processing loops, to ensure smooth video playback.


## Proof of Concept

Our proof-of-concept demonstrates the ability to intake an image and convert it into a black version with the same dimensions, a critical step in the process of converting visuals into pixel art. This task involves reading an image, processing it by adjusting each pixel's rgb values, and outputting the transformed image. Since a video is essentially a series of pictures, we establish the foundation for our ultimate goal of building a Haskell module capable of processing short videos and turning them into pixel art. If we can modify images, then we can also modify videos in the future. 

Key Element:
There are two core elements ot our proof-of-concept:
1. We need to load an image file with the correct type of image.
    - First, we ask the user to input a filename and path to the program. 
    https://github.students.cs.ubc.ca/yassersa/cpsc312project/blob/67a4be42e6ac518339847dd907d8e53dfd2df483/haskell/app/Main.hs#L5-L10
    In the main function we ask for a user input and then that user input will be used as a parameter for the function loadPrintTurnBlackAndSave. 
   

    - in JuicyPixel, the DynamicImage class have lots of different constructors for different image types. Instead of making a case for each image type, we decided to convert every DynamicImage into an RGB8 image. 

    https://github.students.cs.ubc.ca/yassersa/cpsc312project/blob/67a4be42e6ac518339847dd907d8e53dfd2df483/haskell/src/Lib.hs#L22
    This line uses a function from the JuicyPixel library to convert all DynamicImages to RGB8

    
    https://github.students.cs.ubc.ca/yassersa/cpsc312project/blob/67a4be42e6ac518339847dd907d8e53dfd2df483/haskell/src/Lib.hs#L26-L32
    This link shows the part where we take an input file name from the user and then handles errors as using the Left and Right error handling by using the Either type built into haskell. Left handles errors, right proceeds. 

Why It’s Important:
    - It's important because we eventually need to load a video file into the program where there might be a lot of file compatability issues. So this is good practice for us. 

2. The image processing step that transforms the image into black with the same dimensions

    - which will be applied frame-by-frame to video files in the final product. This capability is necessary for building the pixel art aesthetic we envision.

    https://github.students.cs.ubc.ca/yassersa/cpsc312project/blob/67a4be42e6ac518339847dd907d8e53dfd2df483/haskell/src/Lib.hs#L54-L56
    This is the turnToBlack function that changes every pixel's rgb value to 0. 

Why It’s Important:
    - Ensuring the black with the same dimensions transformation is efficient and accurate allows us to proceed with confidence that more complex tasks like frame extraction from video and pixel manipulation will work as intended. This is a vital step toward completing our minimal viable project (MVP).

Testing this proof-of-concept reassures us that the basic image transformation functions in Haskell can be built upon to handle multiple frames and videos in later stages.


### How to test and run the code: Haskell

How to Test and Run the Code: Haskell
Clone the repository and navigate to the Haskell subdirectory:

cd haskell

Build the project using stack:

stack build

This will download all necessary dependencies and compile the project. Please be patient as it might take some time to complete.


After the project is built, to run the image processor, input this line in the terminal:
stack exec image-processor

And then it will ask for a user input of the file name. You can use the existing images in the images folder of the project, or you can place your own images that you want to test into the images folder. 

For example, you can input something like 
images/bird.png

The output image will be stored as output.png in the output_images folder. You can check and see if the output image is indeed a full black image will the same dimensions as the input image. 


### How to test and run the code: Prolog

Replace this section with instructions to us for how to test and run your code.

We have set up a simple test file for you to extend using [Prolog Unit Testing](https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/plunit.html%27)) library for testing. Included among your tests should be some that demonstrate the core functionality of your code. Please remove the example tests before you submit or you will lose marks. (We will be running `make prolog-eval` from the project root.)

In the `prolog` directory, you can run `make test` to run the unit tests. You can also load the test file into the swipl repl with `make test-repl` and in that repl you can run `run_tests.` to run those tests.

If you include instructions different from these, be **absolutely sure** that they will work well for us in whatever environment we run your code and that they will be as easy to use as the instructions above!
