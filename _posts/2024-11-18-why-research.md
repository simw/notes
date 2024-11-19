---
layout: post
title: "Why do companies do research, and how should they approach it?"
date: "2024-11-18 00:00:00 -0000"
categories: research
---

In today’s fast changing world, innovation is the route to success for many companies. Innovation often comes from successful research, and continued innovation is almost always the product of a systematic research process.

But what is ‘Research’ in this context? And how should a company, large or small, approach building a systematic research process?

### What is Research?

The term ‘Research’ is overloaded - including in customer research, market research, UX research and financial research. Here, I am referring to technical research in companies that have a technological, scientific or other technical component.

‘Research’ isn’t (just) a team or a job, although sometimes there are teams that specialize in doing research. Much more than that, ‘Research’ is a process, focused on answering technical questions which, at least initially, have unknown or uncertain solutions. These questions may even be ill defined, where the setting is ambiguous with no clear way to approach it. Research requires systematic investigation and usually some experimentation, first to fully define the problem and then to find the optimal solution.

This is in contrast with ‘Development’, which is usually defined as focused on implementing (mostly) known solutions. While there is no clear separation between the two (and an ideal implementation often blurs the lines even further), the concepts of research and development can be used to refer to two ends of a research-development continuum.

A research project can be anything from a week or two up to years. At the short end, it might not even be seen as ‘Research’, often labeled as a ‘spike’ task in Agile engineering settings. But it can be beneficial to recognize its similarity in structure to longer research projects and to approach it in a similar way.

There can be many different outputs from research. The traditional output of research would be a paper, detailing the methodology, results and conclusions, perhaps accompanied by a presentation. But in a corporate setting, waiting on the completed documentation is often not the most productive workflow (even though documentation can be very useful), but instead a dynamic back-and-forth between research and development can often produce the fastest results.

### Why do companies do research?

The first reason to do research is the most obvious: to improve existing products and create new ones. In a technical space, it may be that both revolutionary and incremental updates are non-obvious, and require answering ill defined questions with uncertain solutions. Without this, a development process may be unfocused or wasteful - although it is still often useful to launch both in parallel rather than series.

But there are more reasons to do research. Even if a company is happy not to launch new products in the near future, or has a sufficient development pipeline, it will likely want to know the risk of competitors jumping ahead. A research project can uncover these possibilities.

There are two other, linked reasons for research: prestige and the public good. Research that is released to the public can lead to increased prestige for the company. This prestige can then aid in fund raising or public relations, as well as recruitment or retention of staff. The best staff may want to alternate between frontier research projects and more mundane implementations. As well as the prestige of research, a company may want to contribute public research for altruistic reasons.

These different reasons for doing research may impact the approach and the products, and it is usually important to set this out at the inception of a project. For example, a product-development research project is likely to have more internal than external deliverables, in contrast to a prestige or public good driven project. 

### Principles of Research

While each technical area has its own specifics, there are some general principles that apply in many or most research projects:

#### 1. Collaboration makes research more productive

Research is sometimes seen as a task to be done in isolation, left to an individual and possibly a moment of inspiration. However, anything beyond a small, short term project or a very small team, collaboration between team members can significantly boost productivity. Even if just one person is the primary researcher, frequent opportunities for feedback can bring in wider perspective and more expertise. With more than one researcher, ‘pair researching’ can work well (depending on the researchers), or parallel work streams can be setup to start attacking different parts of the problem at once. Both can benefit significantly from planning ahead and breaking down larger pieces into smaller chunks.

Collaboration can come in many forms: synchronous (presentations in meetings) or asynchronous (review of shared documentation); in-person (chatting over lunch) or online (non-distracting chat messages which can be addressed later).

#### 2. Research needs support and infrastructure

In fields like chemistry, engineering and medicine, the need for specialist equipment and infrastructure is obvious. But it extends beyond that to many more fields, including those that are data and computing intensive. Yes, it is possible to ask each researcher to start from scratch with every project, setting up an environment and customizing it to the specific needs of each project, but it can be more productive to have environments already set up, and to have encoded the learnings from previous projects into the infrastructure for the new one. One version of this is the MLOps approach to iterating on machine learning models, where the infrastructure is in place to allow researchers to focus on research, and as much as possible of the process is automated. Models have automated validation, registries of versions, and all the infrastructure in place to allow fast iteration and improvement.

#### 3. Research and development should overlap as much as possible (when doing research for new and existing products)

Traditionally, research and development are ordered in series. First, the research project is done and outputs the details needed to specify all of the development process, followed by implementing the development. In some cases, where the cost of development is significantly higher than the cost of research, where the resources for development are severely constrained for other reasons, or where the smaller chunks of development cannot be carved off the whole, this is necessary. Don’t start to build a bridge without having complete, detailed plans. However, in other cases, iteration and improvement will be much faster with parallel tracks, where the known parts of development can start in parallel to researching the unknowns. This can produce a beneficial feedback loop, where research influences development which then influences research. And even in cases with high up-front development costs, a process of rapid prototyping and experimentation can work well.
