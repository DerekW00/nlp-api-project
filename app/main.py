from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from transformers import pipeline

# Initialize FastAPI app
app = FastAPI(title="NLP API",
              description="An API for NLP tasks using Hugging Face models")

# Load Hugging Face pipelines
try:
    sentiment_pipeline = pipeline("sentiment-analysis")
    # Load GPT-2 for text generation
    text_gen_pipeline = pipeline("text-generation", model="gpt2")
except Exception as e:
    raise RuntimeError(f"Error loading model: {e}")

# Request Models


class TextRequest(BaseModel):
    text: str


class PromptRequest(BaseModel):
    prompt: str
    max_length: int = 50  # Default length of generated text

# Sentiment Analysis Endpoint


@app.post("/analyze")
async def analyze_sentiment(request: TextRequest):
    if not request.text.strip():
        raise HTTPException(
            status_code=400, detail="Input text cannot be empty.")

    results = sentiment_pipeline(request.text)
    return {"results": results}

# Text Generation Endpoint


@app.post("/generate")
async def generate_text(request: PromptRequest):
    if not request.prompt.strip():
        raise HTTPException(status_code=400, detail="Prompt cannot be empty.")

    try:
        generated = text_gen_pipeline(
            request.prompt, max_length=request.max_length, num_return_sequences=1)
        return {"generated_text": generated[0]['generated_text']}
    except Exception as e:
        raise HTTPException(
            status_code=500, detail=f"Error generating text: {e}")

# Root Endpoint


@app.get("/")
def read_root():
    return {"message": "Welcome to the NLP API! Use /analyze for sentiment analysis or /generate for text generation."}
