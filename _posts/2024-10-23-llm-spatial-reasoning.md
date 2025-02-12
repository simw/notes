---
layout: post
title: "Can an LLM do spatial reasoning?"
date: "2024-10-23 00:00:00 -0000"
categories: ai
---

Ask your favorite LLM a simple geometry question, and it is likely to get it right. Triangles, shapes, angles, it knows all the basics. But delve a little deeper, and it can quickly go off the rails.

> #### Question 1
>
> A straight line goes from the center of the circle at O through point B on the circumference to point P. A tangent to the circle goes from P touching the circumference of the circle at C. If distance OB = 1, BP = 1, what is the distance PC?
>
> #### Gemini Advanced's Answer
>
> **1. Visualize the Problem**
>
> Imagine a circle with center O. Draw a line from O to a point B on the circle's edge (circumference). Extend that line to a point P outside the circle. Now, draw a line from P that just grazes the circle at point C (this is the tangent).
>
> **2. Key Geometric Facts**
>
> * **Radius and Tangent:** A tangent line to a circle is always perpendicular to the radius at the point of tangency. This means angle OCP is a right angle (90 degrees).
> * **Pythagorean Theorem:** In a right-angled triangle, the square of the hypotenuse (the side opposite the right angle) is equal to the sum of the squares of the other two sides.
>
> **3. Solve**
>
> * **Find OP:** Since OB = 1 and BP = 1, then OP = OB + BP = 1 + 1 = 2
> * **Find OC:** OC is a radius of the circle, so OC = OB = 1
> * **Use the Pythagorean Theorem:** In right-angled triangle OCP, we have:
>    * OP² = OC² + PC²
>    * 2² = 1² + PC²
>    * 4 = 1 + PC²
>    * PC² = 3
>    * PC = √3
> 
> **Answer:** The distance PC is √3. [Correct!]
>
> (Gemini Advanced, Claude Sonnet and ChatGPT 4o all give similar answers. As of October 2024. With some similarity to a question at https://mathverse-cuhk.github.io/)

> #### Question 2
>
> I have the number 811001000 written on paper. I put a two-sided mirror perpendicular to the paper between the 4th and 5th characters from the left. Looking from the left, what number do I see?
>
> #### Claude Sonnet's Answer
>
> Let me solve this step by step.
> 
> 1) First, let's break down what happens with a mirror:
>    * The digits to the right of the mirror will appear reversed and attached to the digits on the left
>    * The original number is 811001000
>    * After the 4th digit from left means splitting it as: 8110\|01000
> 
> 2) Looking from the left:
>    * I see "8110" (the first 4 digits) normally
>    * The mirror shows "01000" reversed, which becomes "00010"
> 
> 3) Putting it together:
>    * The number I see is 811000010
> 
> The answer is 811000010
> 
> To verify:
> * Original number: 811001000
> * Split at mirror: 8110\|01000
> * Right side reversed: 00010
> * Final: 811000010 [Wrong!]
> 
> (Gemini Advanced and ChatGPT 4o give a similar, wrong answer. ChatGPT o1-preview gives the correct answer. As of October 2024.)

So clearly, some models can do some spatial reasoning (putting aside that these are technically multi-modal, the answers here seem to be text-driven).

The state of the art on some of these questions may be AlphaGeometry from DeepMind, which specializes in (geometry driven) Math Olympiad questions. However, technically AlphaGeometry is not just an LLM, it combines an LLM with a rule-bound deduction engine. The LLM is trained on 100 million synthetic examples, and it generates fast, 'intuitive' ideas when the rule-bound engine gets stuck.

But in theory, can a text-based model do geometric spatial reasoning? Geometry can be reduced to axioms, so once a text-based model has seen these axioms or learned related principles from examples, it can apply them in a chain to calculate any geometrical result (as somewhat demonstrated in the examples above). No internal spatial representation is needed, just enough space to apply enough steps for the problem at hand, for example through chain-of-thought reasoning (perhaps with the chain implemented behind the scenes, as in eg OpenAI's o1, which is able to get the mirrored number question above correct).

Alternatively, a text-based model could develop an internal spatial representation in order to help generalize from examples. But this is difficult: while in theory it is possible to derive a multi-dimensional picture from the axioms (or axioms plus many examples), it seems unlikely that a spatial representation would be found through an unaided optimization. As humans, we are presented with a 3-dimensional world (or 2 very similar 2-dimensional representations and the ability to move an interact in 3-dimensions), which gives us a head start on building an internal up-to-3-dimensional representation of problems (while some people claim to be able to visualize 4 dimensions, most of us stop at 3). Hence, it could be that multi-modal models, ones that take both text and images (and even video), will be better at spatial reasoning.

As with many mathematical and other reasoning questions, how can we tell whether the model is generalizing or just remembering? I'm sure that every maths teacher has seen a similar situation to a student given the example 'Factorizing (x^2 - y^2) gives (x + y)(x - y)', cannot then answer 'Factorize (a^2 - b^2)'. The generalization is a compressed version of the examples: we don't have to remember every combination of letters, just the one, and then recognize that the new question is the same as the old up to the switch in letters. For language models, there is likely to be a large space of parameters close to the minimum of the objective function, or even a number of other local minima. Some of these represent the model 'remembering'; others may represent the version with the compressed, spatial internal state. The challenge is finding the compressed state through optimization, and then knowing when you have found it.

And as with many questions with LLMs, it also makes us question how our own brains work. Are we truly reasoning in multiple dimensions, or taking shortcuts and telling ourselves a story as to how we got there? It's likely that different people do not reason on these problems in the same way. Some people are more visual, others less so. Many years ago, when taking a differential geometry class some of the ideas started clicking for me with simple pictures of 2D surfaces embedded in 3D spaces (as visualized on a 2D blackboard). The spatial intuition worked for me.

Similarly, we will likely see models finding different approaches to the same problems, with different strengths and weaknesses based on the specific low-points they stumble into in their optimization. Some of those models struggle with basic spatial reasoning, others may get to non-Euclidean geometries, and maybe others will be able to understand string theory and beyond.

Links:

- AlphaGeometry: An Olympiad-level AI system for geometry [[https://deepmind.google/discover/blog/alphageometry-an-olympiad-level-ai-system-for-geometry/]](https://deepmind.google/discover/blog/alphageometry-an-olympiad-level-ai-system-for-geometry/)
- Can Large Language Models Create New Knowledge for Spatial Reasoning Tasks? [[https://arxiv.org/abs/2405.14379]](https://arxiv.org/abs/2405.14379)
- Does Your Multi-modal LLM Truly See the Diagrams in Visual Math Problems? [[https://mathverse-cuhk.github.io/]](https://mathverse-cuhk.github.io/)


## Now asking the LLM ...

### Gemini Advanced

> Yes, LLMs are developing spatial reasoning capabilities, although they're not as naturally adept at it as humans are. Here's a breakdown of their progress and limitations:
>
> **How LLMs are learning spatial reasoning:**
>
> * **Specialized training:**  LLMs are being trained on datasets that specifically focus on spatial relationships and problems. This helps them learn to understand concepts like "above", "below", "inside", "outside", and how objects relate to each other in space.
> * **Multimodal learning:**  The latest LLMs can process both text and images. This allows them to "see" spatial relationships in images and diagrams, which enhances their understanding.
> * **Step-by-step reasoning:** LLMs can break down complex spatial problems into smaller steps. They might translate a textual description into a mental model, manipulate that model, and then translate the result back into text.
>
> **Examples of spatial reasoning tasks LLMs can perform:**
>
> * **Mental rotation:**  Given an image of an object, an LLM can predict what it would look like if rotated.
> * **Pathfinding:**  LLMs can navigate through virtual environments or mazes described in text.
> * **Object tracking:** LLMs can follow the movement of objects in a scene, even when those objects are obscured or change appearance.
> * **Spatial problem-solving:**  LLMs can solve puzzles that require spatial reasoning, such as block stacking or jigsaw puzzles.
>
> **Limitations:**
>
> * **Abstraction:** LLMs can struggle with abstract spatial concepts, such as those found in geometry or topology.
> * **Common sense:**  While LLMs can learn spatial relationships, they may lack the common sense knowledge that humans have about how objects behave in the real world. This can lead to errors in reasoning.
> * **Complex scenarios:**  LLMs may find it difficult to reason about complex spatial scenarios with many objects and relationships.
>
> **Overall:**
>
> LLMs are making significant strides in spatial reasoning, but they still have room to grow. As they continue to be trained on more diverse and complex data, their abilities in this area are likely to improve.
>
> **Want to learn more? Check out these resources:**
>
> * **Language Models and Spatial Reasoning: What's Good, What Is Still Terrible, and What Is Improving:** [https://towardsdatascience.com/language-models-and-spatial-reasoning-whats-good-what-is-still-terrible-and-what-is-improving-175d2099eb4c](https://towardsdatascience.com/language-models-and-spatial-reasoning-whats-good-what-is-still-terrible-and-what-is-improving-175d2099eb4c)
> * **Can Large Language Models Create New Knowledge for Spatial Reasoning Tasks?:** [https://arxiv.org/abs/2405.14379](https://arxiv.org/abs/2405.14379)
> * **Advancing Spatial Reasoning in Large Language Models: An In-Depth Evaluation and Enhancement Using the StepGame Benchmark:** [https://ojs.aaai.org/index.php/AAAI/article/view/29811/31406](https://ojs.aaai.org/index.php/AAAI/article/view/29811/31406)


### Claude Sonnet

> This is an interesting question about LLMs' capabilities that deserves careful consideration. From my knowledge cutoff in April 2024, research on LLMs' spatial reasoning abilities showed both capabilities and limitations.
>
> LLMs can handle certain types of spatial reasoning tasks, particularly when they can be reduced to language-based descriptions or logical rules. For example:
>
> 1. Basic spatial relationships ("the box is on top of the table")
> 2. Simple geometric problems 
> 3. Navigation instructions
> 4. Relative positioning of objects
>
> However, LLMs face significant challenges with:
>
> 1. Complex 3D visualization
> 2. Precise geometric calculations
> 3. Understanding detailed spatial configurations that humans would grasp intuitively through visual processing
>
> Unlike humans who have dedicated neural systems for spatial processing through visual and motor experience, LLMs process everything through text. This means their "spatial reasoning" is more akin to symbolic manipulation and pattern matching based on training data rather than true spatial understanding.
>
> Would you like me to elaborate on any specific aspect of LLM spatial reasoning capabilities or limitations?

### ChatGPT o1-preview

> As of my knowledge cutoff in October 2023, Large Language Models (LLMs) like GPT-4 are primarily designed to understand and generate human language. While they excel at processing textual information, their ability to perform spatial reasoning is limited.
>
> **Understanding Spatial Descriptions**: LLMs can interpret and generate descriptions of spatial relationships when they are explicitly stated in text. For example, they can understand sentences like "The cat is under the table" or "The book is to the left of the lamp" and can reason about these relationships to some extent within the context of language.
>
> **Limitations**:
>
> - **Lack of Visual Perception**: LLMs do not process visual or spatial data directly. They lack the ability to perceive images or physical spaces, which is crucial for complex spatial reasoning tasks.
> - **No Embodied Experience**: Spatial reasoning often relies on embodied experience—interacting with and navigating through physical space—which LLMs do not possess.
> - **Abstract Reasoning Only**: Their reasoning is confined to abstract representations derived from text, limiting their ability to handle tasks that require visual-spatial manipulation or understanding beyond linguistic descriptions.
>
> **Advancements and Integrations**:
>
> - **Multimodal Models**: Recent developments involve integrating LLMs with other AI systems that process visual data, such as computer vision models. Multimodal models can handle both text and images, allowing for improved spatial reasoning capabilities.
> - **External Tools**: LLMs can be connected with external tools or databases that provide spatial information, enhancing their ability to perform certain spatial tasks when guided appropriately.
>
> **Conclusion**:
>
> While LLMs have some capacity to reason about spatial relationships described in text, they are not inherently equipped for comprehensive spatial reasoning. Specialized models or integrated systems are more suitable for tasks that require understanding and manipulating spatial information.
