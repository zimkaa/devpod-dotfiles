#!/bin/bash

curl -fsSL https://pi.dev/install.sh | sh

mkdir -p $HOME/.pi/agent/
# touch ~/.pi/agent/models.json
cat << EOF > $HOME/.pi/agent/models.json
{
  "providers": {
    "lmstudio": {
      "baseUrl": "http://192.168.0.170:1234/v1",
      "api": "openai-completions",
      "apiKey": "sk-lm-znB8PQcE:8jk0dEPSjkyUnh91UHRj",
      "models": [
        {
          "id": "google/gemma-4-12b"
        },
        {
          "id": "mistrali/mistral-3-14b-reasoning"
        },
        {
          "id": "google/gemma-4-12b-qat"
        },
        {
          "id": "qwen3.6-35b-a3b-uncensored-hauhaucs-aggressive"
        },
        {
          "id": "qwen/qwen3.5-9b"
        }
      ]
    }
  }
}
EOF
