-- Flyway migration V1: create initial schema

-- Users and roles
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    role VARCHAR(20) CHECK (role IN ('VISITOR','STUDENT','TEACHER','ADMIN')) NOT NULL,
    email_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT now()
);

-- Progress tracking
CREATE TABLE progress (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    module_id BIGINT REFERENCES modules(id),
    completed BOOLEAN DEFAULT FALSE,
    started_at TIMESTAMP,
    completed_at TIMESTAMP
);

-- Modules and lessons
CREATE TABLE modules (
    id BIGSERIAL PRIMARY KEY,
    slug VARCHAR(100) UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    order_index INT NOT NULL,
    description TEXT
);

CREATE TABLE lessons (
    id BIGSERIAL PRIMARY KEY,
    module_id BIGINT REFERENCES modules(id) ON DELETE CASCADE,
    slug VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content_md TEXT,
    order_index INT NOT NULL
);

-- Quizzes
CREATE TABLE quizzes (
    id BIGSERIAL PRIMARY KEY,
    module_id BIGINT REFERENCES modules(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE quiz_questions (
    id BIGSERIAL PRIMARY KEY,
    quiz_id BIGINT REFERENCES quizzes(id) ON DELETE CASCADE,
    question TEXT NOT NULL,
    correct_option INT NOT NULL,
    options JSONB NOT NULL
);

CREATE TABLE quiz_attempts (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    quiz_id BIGINT REFERENCES quizzes(id) ON DELETE CASCADE,
    started_at TIMESTAMP,
    finished_at TIMESTAMP,
    score NUMERIC(5,2)
);

CREATE TABLE quiz_answers (
    attempt_id BIGINT REFERENCES quiz_attempts(id) ON DELETE CASCADE,
    question_id BIGINT REFERENCES quiz_questions(id),
    chosen_option INT,
    is_correct BOOLEAN,
    PRIMARY KEY (attempt_id, question_id)
);

-- Datasets and documents
CREATE TABLE datasets (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    source VARCHAR(255),
    url TEXT,
    license VARCHAR(255),
    language VARCHAR(20) DEFAULT 'pt-BR',
    doc_count INT,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE documents (
    id BIGSERIAL PRIMARY KEY,
    dataset_id BIGINT REFERENCES datasets(id) ON DELETE CASCADE,
    title VARCHAR(255),
    content TEXT,
    published_at DATE,
    source_url TEXT
);
