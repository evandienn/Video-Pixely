
# Video Pixely

(Overview) This project seeks to build a Haskell module that converts short videos into pixel art. It aims to enrich the Haskell community by providing a fun and artistic tool that can be used in Haskell-based applications, such as Discord bots. Our solution will allow developers to take short clips and transform them into a pixel art style, adding a creative dimension to Haskell's ecosystem.
This project is in fulfillment of the CPSC 312 2024W1 project requirements.

This project is in fulfillment of the [CPSC 312 2024W1 project requirements](https://steven-wolfman.github.io/cpsc-312-website-2024W1/project.html).

## Team Members

Our team is:

+ Team Member Name 1 (student # 1): optional awesome nickname 1
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

Replace this with a description of the minimal viable project you will actually build for CPSC 312 (if this becomes your final project).
It may be as short as a few paragraphs, or it may be longer. It should **definitely** take less than 4 minutes
to read carefully and thoroughly.

Make clear:
+ how this builds meaningfully toward your product pitch above, without being nearly as much work,
+ how it builds on the strength and power of the language, and
+ how it leads naturally to learning and applying some new element of the language (including what that element is!)

Good goals to aim for are from the top two rubric items for proposal grading:

> The minimal viable project (MVP) builds on the strengths and power of the language in exciting ways that will clearly lead to excellent learning for students.

Or:

> The MVP clearly builds significantly on the language and will lead in interesting and natural ways to learning for the students.

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
