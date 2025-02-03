from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from transformers import pipeline

# Initialize FastAPI app
app = FastAPI(title="NLP API",
              description="An API for NLP tasks using Hugging Face models")

# Load sentiment analysis pipeline from Hugging Face
try:
    sentiment_pipeline = pipeline("sentiment-analysis")
except Exception as e:
    raise RuntimeError(f"Error loading model: {e}")

# Define request model


class TextRequest(BaseModel):
    text: str

# Define sentiment analysis endpoint


@app.post("/analyze")
async def analyze_sentiment(request: TextRequest):
    """
    Analyze the sentiment of the provided text.
    """
    if not request.text.strip():
        raise HTTPException(
            status_code=400, detail="Input text cannot be empty.")

    results = sentiment_pipeline(request.text)
    return {"results": results}

# Root endpoint


@app.get("/")
def read_root():
    return {"message": "Welcome to the NLP API! Use /analyze to perform sentiment analysis."}
