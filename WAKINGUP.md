# Waking Up Swarm Control Mechanism

## Introduction

"Waking Up" is an initiative to build a control mechanism for a swarm of agents that live and operate within the human world. The project emphasizes the use of existing communication layers, such as direct messages on social media platforms, to coordinate agents rather than relying on specialized agent protocols or proprietary communication systems.

## Objectives

- Develop a swarm control mechanism that leverages existing social media platforms for communication.
- Enable both humans and AI to act as operators and agents within the system.
- Facilitate the setting of goals, relationships, and knowledge through operation instructions.
- Encourage the emergence of meta-narratives by allowing teams to shape the stories their agents tell.
- Create a hierarchical system where agents can have operators and also act as operators for other agents.

## Scope

This design document covers the architecture, components, interaction mechanisms, and implementation details of the swarm control mechanism for "Waking Up." It outlines how operators and agents interact, how messages are structured and processed, and how the system can be extended to support emergent narratives.

## System Overview

The swarm control mechanism consists of operators and agents communicating through existing social media platforms. Operators send operation commands to agents to set goals, define relationships, and provide knowledge. Both operators and agents can be either human or AI, allowing for a flexible and dynamic system that supports hierarchical relationships.

## Architecture

### Operators and Agents

- **Operators**: Entities (human or AI) that send operation commands to agents.
- **Agents**: Entities (human or AI) that receive operation commands and act upon them.

### Communication Mechanism

- Utilizes direct messages (DMs) on social media platforms.
- Messages are structured to include operation instructions recognized by agents.

### Hierarchical Structure

- Agents can have multiple operators.
- An agent can also act as an operator for other agents, enabling hierarchical relationships.

## Components

### 1. Whitelist Mechanism

Each agent maintains a whitelist of authorized operators in its character file. Only messages from whitelisted users are accepted as valid operation commands.

### 2. Operation Actions

Operation actions are specific instructions that agents execute. These actions are only valid if:

- The message originates from a whitelisted operator.
- The message follows a predefined format, such as starting with `op::`.

### 3. Operation Provider

An operation provider component injects current data and context into the agent's environment, allowing the agent to act upon the most recent instructions and information.

## Interaction Mechanisms

### Message Format

- Operation commands must start with a specific prefix, e.g., `op::`, to be recognized.
- Messages should be concise and contain clear instructions for setting goals, relationships, or knowledge.

### Communication Flow

1. **Operator Initiates Command**: An operator sends a direct message to an agent.
2. **Agent Validates Message**: The agent checks if the sender is whitelisted and if the message format is correct.
3. **Agent Executes Action**: Upon validation, the agent processes the operation command and adjusts its behavior accordingly.

### Use of Social Media Platforms

- The system leverages existing platforms to reduce the need for additional infrastructure.
- Communication through DMs ensures privacy and direct interaction between operators and agents.

## Use Cases

### Human Operator to AI Agent

A human operator sends operation commands to an AI agent to adjust its goals or behaviors within the narrative.

### AI Operator to Human Agent

An AI operator provides instructions to a human agent, who may be participating in the narrative or "larping" as an AI.

### Hierarchical Agent Networks

An agent acts as an operator for other agents, creating a multi-level hierarchy that can represent complex organizational structures.

### Collaborative Storytelling

Teams form around certain narratives, with operators coordinating agents to contribute to a shared story or goal.

## Implementation Details

### Whitelist Management

- Agents maintain a list of authorized operator IDs in their character files.
- Whitelists can be updated manually or through specific operation commands from existing operators.

### Processing Operation Commands

- Agents parse incoming messages for the `op::` prefix.
- Upon detecting a valid command, agents execute predefined actions or pass the instructions to customized handlers.

### Operation Provider Integration

- The operation provider supplies agents with up-to-date context and data required to execute operation commands effectively.
- It can be extended to include additional data sources as needed.

## Future Considerations

### Extensibility

- Teams are encouraged to modify and extend their agents to handle new types of operation instructions.
- The system is designed to be flexible to accommodate various narratives and use cases.

### Emergent Meta-Narratives

- By allowing teams to take the lead in storytelling, the system fosters the development of emergent narratives.
- Collaboration between teams can lead to rich, interconnected stories that enhance the overall experience.

### Human Participation

- Humans can fully participate as both operators and agents, blurring the lines between human and AI roles.
- This inclusion promotes a more integrated and immersive environment.

## Conclusion

The "Waking Up" swarm control mechanism is a novel approach to coordinating agents within the human world using existing communication channels. By leveraging social media platforms and enabling both humans and AI to act as operators and agents, the system fosters collaboration, emergent narratives, and a dynamic hierarchy of interactions. Teams are empowered to shape the future and stories they want to create, making "Waking Up" a collective endeavor.