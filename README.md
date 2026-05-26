# 🛡️ ArenaX — Premium AI-Powered Chess Arena

[![Docker Build](https://img.shields.io/badge/docker-build-blue.svg?logo=docker&logoColor=white)](./Dockerfile)
[![Tech Stack](https://img.shields.io/badge/tech--stack-HTML5%20%7C%20Tailwind%20%7C%20Chess.js-orange.svg)](#tech-stack)
[![Security](https://img.shields.io/badge/security-100%25%20Client--Side-brightgreen.svg)](#security--privacy)

**ArenaX** is an immersive, state-of-the-art, single-page chess platform that bridges the ancient game of kings with modern Artificial Intelligence. Featuring a gorgeous, minimalist glassmorphic design, dynamic animations, high-fidelity soundscapes, and five revolutionary gameplay modes, ArenaX transforms chess from a standard board game into a cinematic, educational battlefield.

---

## 🌟 Immersive Game Modes

ArenaX is designed to cater to casual players, competitive thinkers, and aspiring grandmasters alike:

1. **Anonymous Battle 🕵️**
   Play a high-stakes match against a hidden LLM bot. Test your pure chess instinct, study their playing style, and guess which model you just faced (e.g., GPT-4o or Gemini) once the match concludes.
   
2. **Direct Battle ⚔️**
   Hand-select your AI opponent and dial in their caliber. Match up against premium LLMs including **GPT-4o**, **GPT-3.5 Turbo**, **Gemini 2.5 Flash**, or **Gemini 1.5 Pro** across three difficulty settings (*Easy*, *Medium*, *Hard*).

3. **Learn Mode (AI Chess Coach) 💡**
   Receive real-time position coaching and masterclass insights from an active AI Tutor. The tutor evaluates your positional advantages, explains tactical opportunities, and holds the game state until you are ready to authorize the opponent's engine response.

4. **Scenario Battle 🌀**
   Skip the slow openings and dive straight into tactical chaos. Load historic grandmaster setups, legendary endgames, or chaotic mid-game positions to test your tactical ingenuity under pressure.

5. **Local Friend (Pass & Play) 👥**
   Challenge a friend sitting next to you. Enjoy a clean, distraction-free board layout with physical timers and custom capture audio.

---

## 🛠️ The Tech Stack

ArenaX is built from the ground up to be ultra-fast, responsive, and completely standalone:

* **Core Structure**: Semantic, lightweight HTML5.
* **Layout & Styling**: [Tailwind CSS](https://tailwindcss.com/) paired with highly customized **Vanilla CSS variables** (`:root`) for flawless, fluid Light & Dark Mode theme transitions.
* **Chess Logic Engine**: [Chess.js](https://github.com/jhlywa/chess.js) running entirely on the client-side to enforce strict FEN parsing, move generation, and state evaluation (check, checkmate, draw, stalemates).
* **AI Integrations**: Direct API handshakes with **OpenAI API** (`v1/chat/completions`) and **Google AI Studio Gemini API** (`v1beta/models`).
* **Visuals & Icons**: [FontAwesome 6 Pro](https://fontawesome.com/) icons and premium Google Fonts (*Outfit* & *Cormorant Garamond*).
* **Audio System**: Immersive high-fidelity sound effects including dynamic move feedback, chess capture snaps, checkmate sequences, ticking clocks, and ambient background music.

---

## 🔒 Security & Privacy First

We believe that your credentials and gameplay remain your property. ArenaX implements a **strict zero-trust, 100% client-side security architecture**:

* **Direct Browser-to-API Connectivity**: ArenaX has **no middleman backend server**. When you enter your OpenAI or Google Gemini API keys in the settings menu, all API queries are made **directly** from your local browser to secure Google and OpenAI endpoints (`api.openai.com` and `generativelanguage.googleapis.com`).
* **Local Storage Sandbox**: Your API keys are stored exclusively inside your browser's private `localStorage` partition. They are never sent, cached, or logged by any third party.
* **Zero Telemetry**: No tracking cookies, no Google Analytics, no session recordings. Pure, uninterrupted chess.

---

## 🐳 Docker Deployment & Quick Start

ArenaX is fully containerized using a high-performance, lightweight alpine-based Nginx container.

### Prerequisites
- [Docker](https://www.docker.com/) installed on your machine.

### 1. Build the Docker Image
Navigate to the project root directory and run:
```bash
docker build -t arenax-chess .
```

### 2. Run the Container
Launch the container mapping port `8080` (or your preferred local port):
```bash
docker run -d -p 8080:8080 --name arenax-game arenax-chess
```

### 3. Play the Game
Open your web browser and navigate to:
```
http://localhost:8080
```

---

## 💻 Local Development & Offline Play

Because ArenaX is a beautifully packaged static single-page application (SPA), you don't even need Docker to get started!

1. Clone or download the repository.
2. Open `index.html` directly in any modern web browser (Chrome, Firefox, Safari, Edge).
3. (Optional) Run a lightweight local server if you'd like to host it within your local network:
   ```bash
   # Using Python 3
   python -m http.server 8000
   ```
   Then navigate to `http://localhost:8000`.

---

## 🧠 LLM Prompt Architecture & Core Loop

ArenaX translates the current board state into structured instructions that LLMs can interpret deterministically.

### The Turn loop
```
[ User Makes Move ] ➡️ [ Local Chess.js Validates ] ➡️ [ Compile FEN + Legal Moves ] 
                                                                  ⬇️
[ Execute Move ] ⬅️ [ Local Regex Clean & Validate ] ⬅️ [ LLM Returns Single Move (SAN) ]
```

### The System Prompt
When the AI makes a move, ArenaX compiles the exact board state and feeds a strict system constraint:
```
You are an expert chess engine playing as Black. The current difficulty is set to Hard.
Strict constraints: 
1. The current FEN is: {FEN_STRING}
2. The legal moves array in SAN format is: ["e5", "Nf6", "d6", ...]
3. You MUST respond with exactly ONE of the legal moves from the array above.
4. Do NOT include ANY other text, markdown, or explanation. Just the exact move string.
```
This forces the model to respond with a mathematically valid, string-matching move, which is then parsed, double-checked by `Chess.js` locally, and visually rendered with dynamic transitions.

---

## 📜 License

This project is open-source and available under the [MIT License](https://opensource.org/licenses/MIT). 

*Built with ❤️ for chess players and AI enthusiasts.*
