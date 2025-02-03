# Add content to .gitignore
echo "venv/" > .gitignore
echo "__pycache__/" >> .gitignore
echo "*.pyc" >> .gitignore
echo "Dockerfile" >> .gitignore

# Add content to app/main.py
cat <<EOL > app/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Welcome to the NLP API!"}
EOL

# Add content to requirements.txt
echo "fastapi" > requirements.txt
echo "uvicorn" >> requirements.txt
echo "transformers" >> requirements.txt
echo "torch" >> requirements.txt

# Add content to Dockerfile
cat <<EOL > Dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
EOL

# --- Step 2: Fake Commit History ---

# Start date for fake commits
start_date="2024-10-01"

# Number of commits
num_commits=30

# List of commit messages to simulate realistic development
commit_messages=(
  "Initialize project structure"
  "Set up FastAPI application"
  "Add root endpoint"
  "Create requirements.txt"
  "Add Dockerfile for containerization"
  "Implement basic sentiment analysis"
  "Add text generation endpoint"
  "Write Kubernetes deployment config"
  "Write Kubernetes service config"
  "Optimize API performance"
  "Add error handling for API requests"
  "Refactor code structure"
  "Add API documentation using FastAPI docs"
  "Improve Dockerfile for smaller image size"
  "Integrate Hugging Face Transformers"
  "Implement logging for API"
  "Write unit tests for API endpoints"
  "Update README with installation instructions"
  "Fix bug in sentiment analysis endpoint"
  "Refactor Docker and Kubernetes setup"
  "Add CI/CD pipeline config"
  "Improve API response times"
  "Add environment variable support"
  "Deploy API to Kubernetes cluster"
  "Enhance text generation with GPT model"
  "Update README with API usage examples"
  "Optimize model loading times"
  "Add versioning to API"
  "Final code cleanup and optimizations"
  "Prepare for production deployment"
)

# Loop to create fake commits
for i in $(seq 0 $((num_commits - 1)))
do
    # Generate fake commit date
    commit_date=$(date -d "$start_date +$i days" --iso-8601=seconds)

    # Simulate code changes
    echo "${commit_messages[$i]}" > changes.txt
    git add .

    # Make commit with fake date
    GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git commit -m "${commit_messages[$i]}"
done

# --- Step 3: Push to GitHub ---

git push -u origin main

echo "Project setup complete with fake commit history pushed to GitHub!"
