---
layout: post
title: "Having Agency over AI Agents"
date: "2025-02-12 00:00:00 -0000"
categories: ai
---

As AI systems become more sophisticated, there's growing interest in AI Agents, but there is also growing confusion about what an AI Agent actually is. It is often difficult to see where the hype ends and the real-world implementations start.

Work on AI Agents goes back to the 1950s, albeit in a more limited form given the AI Models available at the time. In the 1980s, expert systems were introduced that relied on domain-specific knowledge, but they often used rule-based logic that could work in that specific domain but could not generalize well beyond that. In more recent times, voice-assistants such as Alexa, Google or Siri have been able to tackle tasks such as amending shopping lists or interacting with smart home appliances, but only within specific predefined rules. The new AI Models of the late 2010s and the 2020s have opened up new possibilities, because of their ability to understand almost any supplied natural language (as well as other forms of input), and because of their ability to plan and reason through a problem. This has changed the AI Agent landscape so much that newer definitions of AI Agents may even exclude earlier academic work on the subject.

There are many possible definitions for AI Agents, and many articles and papers giving sometimes quite distinct answers. There is always some ambiguity about what separates an AI Model from an AI Agent - where the model ends and the agent begins. In the vein of [one more standard to make the other standards obsolete](https://xkcd.com/927/), here is (yet) another approach. Some descriptions start from concrete examples, and then generalize from there; but here, I’ll state the principles up front and give examples later on.

## What is an AI Agent

An ‘AI Agent’ accomplishes a __human supplied goal__ by __autonomously__ performing a set of __tasks__, where the set of tasks to run is decided by an __AI Model__. An agent takes agency and control from the user, and uses it autonomously to plan and run the tasks needed to achieve the supplied goal.

An __AI Model__ is a model with very high dimensional input, output, or both. It is a processing engine, mapping input to output, but without other side-effects. The mapping has not been directly given to it as a set of rules, but instead learned from a large amount of data. Although not used here, sometimes this definition is replaced with a reference to model that can solve ‘tasks that typically require human-like intelligence’ (https://openreview.net/forum?id=GrkgKtOjaH), or models that can plan and reason. The models often used in AI Agents are LLMs (Large Language Models), where the inputs and outputs are text, possible combined with other media. But other models can be used depending on the desired input or environment, for example vision models for a game-playing agent or a self-driving car, but there must be a decision making component to the model. AI Model interfaces such as ChatGPT sometimes augment an AI Model with tools, such as searching the web, in some cases becoming AI Agents.

The __tasks__ to be performed may be driven (or orchestrated) by an AI Model or involve invoking an AI Model. Some of the tasks will involve the AI Model interacting with a supplied set of tools or an environment. Here, we will not label an AI Model that only interacts with itself or with other AI Models as an AI Agent, but instead term it a ‘Reasoning System’. If the set of tasks to be done to achieve the goal is predefined, then this is usually described as a workflow rather than an agent (even if one of more of those tasks involves invoking an AI Model). If the orchestration of tasks is directed by an AI Model (eg an LLM), then this is an AI Agent (although there is a broad area that could be debated as either workflow or agent).

The tools or environment for the model(s) can vary. A ‘tool’ is something external that usually involves a call-and-response. It could be as simple as a read-only database that can be queried, or something more involved. An environment is something that has its own dynamics, and is evolving in parallel to the model, although the model can observe and interact with it in specific ways.

The __human supplied goal__ could involve a specific end-point and be time-limited, or be open-ended in time. Often, the definition of AI Agent includes a long timeframe - for example, ‘autonomous systems that operate independently over extended periods’ (https://www.anthropic.com/research/building-effective-agents) (although usually without specifying what ‘an extended period’ means). Here, I will separate a ‘long-running agent’ and a ‘short-running agent’ (again, without specifying the point of separation). A short-running agent might be invoked many times (have many episodes) over a long time period, but with no interaction between each execution. Bridging the gap (and blurring the boundaries) between short- and long-running is short-running-with-memory, where each execution of the agent starts from the same point, but with a memory of inputs or outputs from previous executions.

The __autonomous__ execution of tasks involves an AI Model deciding on which tasks to run and in which order (including in parallel and series). Again, if the task execution is predetermined, then it is a workflow rather than an agent. Some ‘Agentic Systems’ (groups of interacting agents) may involve a human-in-the-loop, but each AI Agent has at least some autonomy in achieving its goal. 

## Implementations of AI Agents

When describing approaches to implementing AI Agents, it is tempting to jump straight to the most autonomous version. This is an approach where the AI Model makes all the decisions about what tasks to run and when. The sequence of tasks is not predefined beyond an initialization task, which involves calling an AI Model and telling it the goals and how to interact with the environment, tools or other AI Models.

However, articles and [frameworks](https://www.langchain.com/langgraph) for AI Agents often focus on systems with only partial autonomy, where the tasks form a predefined graph, but where the decisions on branching in the graph are taken by an AI Model. These can be termed ‘AI Workflows’ or ‘AI Agents’ depending on the author, and may comprise many of the useful ‘AI Agent’ implementations in the real world. Hence, describing the different building blocks from a workflow up to a fully autonomous system can be illustrative.

### A Workflow Using AI Models

A workflow is a predefined sequence of tasks to achieve a goal. These tasks may run in series or in parallel, and have branches dependent on specific decisions - decisions that are driven by predefined rules, as opposed to an AI Agent. (The boundary between workflow and agent may blur when an AI Model’s output is the direct input into a set of predefined rules). These tasks form a graph of dependencies. Some of these tasks may involve invoking an AI Model - to eg summarize some text or extract information from a picture, but the AI Model is not driving the decision making on which tasks to run.

As there is a predefined sequence of tasks, a workflow can be visualized by a flow diagram or a task-graph diagram, showing the sequencing of tasks and the decision or branching points between them.

Workflows are easy to reason about (or at least easier than more autonomous agents). In the event of the failure of one task, the other tasks leading up to the failure are already known. Workflows involving AI Models can also be very powerful, but this is still a rules-based approach, one which does not fully exploit the possibilities and power of new AI Models. Specialist workflows may at some point be overtaken by more general, autonomous AI Agents.

An example of a short-running workflow is Retrieval Augmented Generation (RAG).

### A Partially Predetermined, Partially Autonomous Agent

While a workflow has decision points that are all rules-based, an AI Agent requires at least some decision points that are driven by an AI Model. These decision points may be preceded or followed by some predefined sequences, but the branching is controlled by an AI Model. This usually implies that an AI Model is orchestrating the tasks - calling tools and using the responses in further content in the context of the AI Model - but is not confined to that situation.

Sometimes it is difficult to determine the level of autonomy, for example when the sequence of tasks is supplied to an AI Model in natural language. The boundary in the other direction, between this and a pure workflow, is blurred by rules-driven decisions based on outputs from an AI Model (eg ‘if LLM returns JSON with “terminate”: true then finish execution).

It may or may not be possible to visualize the general flow of a partially autonomous agent using a flow diagram. Visualizing a specific realization of the agent (ie the sequence of tasks the agent actually took in a specific run or episode) is always possible, and can help debug failures. Other visualizations can also be useful, for example plotting the flow between Human - Interface - Model - Environment (examples [here](https://www.anthropic.com/research/building-effective-agents)).

The partial autonomy brings extra power but also extra complication and even danger. If the tools or interaction with the environment effect actions, then it may not be possible to determine in advance (or even after the fact) why the agent will take / took a specific action. 

### A Fully Autonomous Agent

As described above, the fully autonomous AI Agent is supplied with the goals, the tools (possibly including other AI Models) and the environment, and is then set loose to achieve the goals. For some, this is the only ‘real’ AI Agent, as it is the only case with full autonomy (up to the limits set by the available tools and interactions with the environment).

While this brings the most power to play, the AI Model can only be steered in a specific direction (eg for an LLM through using specific prompts), but without full control of the training data it is not possible to fully control the actions of the agent (except by gating the actions on an approval process). Without projecting human values too far, similar to dealing with people it then becomes a case of trust: does repeated usage of the AI Agent lead to trust in its usual flows and actions? Even then, care must be taken to avoid outliers - such as the model ‘rabbit holing’ by going in infinite (or just very extensive) loops - or using tools in unexpected ways (eg by emailing outside of the company or just spamming a large number of people). Creating a demo of a fully autonomous agent may be easy, but covering off all the edge cases may not be.

The general flow of a fully autonomous agent cannot be visualized in a flow diagram - but similar to the case with partial autonomy, realizations of runs of an agent can be.

## Components of an AI Agent

An AI Agent will have at least some of the following components:

- __An entry point__: how is the agent triggered, and how are the goals supplied? For an LLM with a chat interface, it may be triggered by the user entering text and pressing enter, with goals added  by enriching the text to make the full LLM prompt. But for others, the trigger may be audio (eg ‘Hey Siri’) or visual, with at least some of the goals also supplied through audio or video.
- __An orchestrator__ (optional): how do the different tasks get triggered throughout the agent’s episode? A common approach is to have a central orchestrator dictating what gets triggered and when, with that orchestrator being an AI Model itself. The tools can then follow call-and-response, returning information back to the orchestrator so that it can decide on the next steps. Another approach is message passing: each model takes its inputs, and then sends its outputs onto the next task through a message, where no central orchestrator is needed. This is potentially more powerful, but probably more difficult to create, follow and debug.
- __Linear tasks__ (tasks with only one output path)
- __Branching Tasks__ (tasks with more than one output path)

## Other References

- [https://huyenchip.com/2025/01/07/agents.html](https://huyenchip.com/2025/01/07/agents.html)
- [https://www.anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)
- [https://www.ibm.com/think/insights/top-ai-agent-frameworks](https://huyenchip.com/2025/01/07/agents.html)
