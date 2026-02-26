FROM python:3.10

WORKDIR /app

# Install system dependencies (important for ML + tokenizers)
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    curl \
    libglib2.0-0 \
    libgl1 \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (better caching)
COPY requirements.txt .

# Upgrade pip tools
RUN pip install --upgrade pip setuptools wheel

# Install dependencies (with timeout + no cache)
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

# Copy project files
COPY src/ src/
COPY docs_dir/ docs_dir/
COPY start.sh ./start.sh

# Make script executable
RUN chmod +x start.sh

# Expose ports
EXPOSE 8000 8501

# Env variables
ENV DOCUMENTS_DIR="/app/docs_dir"
ENV VECTOR_STORE_DIR="/app/doc_vector_store"
ENV COLLECTION_NAME="document_collection"
ENV MODEL_NAME="llama-3.3-70b-versatile"
ENV MODEL_TEMPERATURE=0.0
ENV CHAT_ENDPOINT_URL="http://localhost:8000/chat/answer"

# Run app
CMD ["/app/start.sh"]