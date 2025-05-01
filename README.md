# HSpam

**HSpam** is a Haskell-based spam filter designed for Discord bots. It uses a **Naive Bayes classifier** to detect and filter out spam messages in real time.

## ✨ Features

- 🧠 Naive Bayes classification
- ⚡ Real-time message filtering for Discord
- 🧪 Customizable training data
- 📦 Written in pure Haskell
- 🔧 Easily integratable with existing Discord bots

## 🚀 Getting Started

### Prerequisites

- [GHC (The Glasgow Haskell Compiler)](https://www.haskell.org/ghc/)
- [Cabal](https://www.haskell.org/cabal/) or [Stack](https://docs.haskellstack.org/en/stable/README/)
- [discord-haskell](https://github.com/aquarial/discord-haskell) (for Discord integration)

### Installation

Clone the repository:

```bash
git clone https://github.com/Turtel216/hspam.git
cd hspam 
```

Build with Cabal:

```bash
cabal build
```

## 🔍 How It Works

HSpam uses a **Naive Bayes text classifier** trained on labeled datasets of spam and non-spam (ham) messages. It computes the probability that a given message is spam based on word frequencies and flags it accordingly.

### Example Workflow:

1. Preprocess incoming messages
2. Tokenize and clean text
3. Classify using Naive Bayes
4. Flag or delete messages based on threshold

## 🛠 Usage

Integrate `HSpam` into your Discord bot logic. Here's a simplified example:

```haskell
import HSpam (isSpam)

handleMessage :: Message -> IO ()
handleMessage msg = do
  let content = messageContent msg
  spam <- isSpam content
  when spam $
    deleteMessage msg
```

## 📚 Training the Classifier

You can provide your own dataset of spam/ham messages in plain text files. The project includes basic scripts for training the model:

```bash
cabal run train -- ./data/spam.txt ./data/ham.txt
```

## 🧪 Testing

Run the test suite:

```bash
cabal test
```

Or with Stack:

```bash
stack test
```

## 🤖 Discord Integration

This project is designed to work with `discord-haskell`, but can be adapted to any Haskell-based Discord bot framework.

## 📂 Project Structure

```
HSpam/
├── src/
│   ├── Classifier.hs
│   ├── Preprocess.hs
│   └── DiscordHandler.hs
├── data/
│   ├── spam.txt
│   └── ham.txt
├── test/
├── README.md
└── LICENSE
```

## 📜 License

MIT License. See `LICENSE` for more details.

## 🙌 Contributing

Pull requests, issues, and suggestions are welcome! Feel free to open a PR or file an issue.
