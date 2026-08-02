#!/bin/bash
# Install open-interpreter
echo "Installing open-interpreter..."
# Assuming Python environment is available (as per FastAPI integration)
pip install open-interpreter

# Create a wrapper or configure it to use the local llama-cli
# Open Interpreter supports local LLMs. We need to point it to the llama-cli binary or 
# configure its model backend.
# A common way is to configure it via its CLI: `interpreter --local`
# Then, when prompted, specify the path to the llama-cli or use a model path.

echo "Open Interpreter installed."
echo "To use with local llama.cpp NPU binary, run: interpreter --local"
echo "When prompted, you can point it to your model in ~/models/llm/"
