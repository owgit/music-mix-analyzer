# Music Mix Analyzer - Professional Audio Analysis Tool

<p align="center">
  <img src="app/static/img/music-analyzer-icon.svg" alt="Music Mix Analyzer Logo" width="180" />
</p>

A powerful Flask-based web application for audio mixing analysis, mastering assistance, and professional music production visualization. Perfect for sound engineers, music producers, and audio enthusiasts.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🎧 Features

- **Audio Analysis**: Upload and analyze audio files (mp3, wav, flac) with professional-grade tools
- **Visualization Suite**: Generate high-resolution spectrograms and waveform visualizations
- **Stereo Field Analysis**: Comprehensive stereo imaging and phase correlation analysis
- **AI-Powered Mix Feedback**: Get intelligent suggestions using advanced audio algorithms
- **Frequency Response**: Analyze frequency distribution and identify problematic areas
- **Dynamic Range**: Measure compression levels and dynamic range in your mixes
- **Security**: Enterprise-grade file handling with robust security measures

## 🚀 Getting Started

### Prerequisites

- Python 3.7+
- Virtual environment (recommended)
- Basic understanding of audio engineering concepts

### Installation

#### Option 1: Standard Installation

1. Clone the repository
```bash
git clone <repository-url>
cd music
```

2. Create and activate a virtual environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install the dependencies
```bash
pip install -r requirements.txt
```

4. Set up environment variables
```bash
cp .env.example .env
# Edit the .env file with your actual API keys
# Generate a secret key: python scripts/generate_secret_key.py --update-env
```

#### Option 2: Docker Installation

1. Clone the repository
```bash
git clone <repository-url>
cd music
```

2. Set up environment variables
```bash
cp .env.example .env
# Edit the .env file with your actual API keys
# Generate a secret key: python scripts/generate_secret_key.py --update-env
```

3. Run the application using Docker Compose
```bash
docker-compose up -d
```

Or use the provided script:
```bash
chmod +x run.sh
./run.sh
```

4. To stop the Docker container:
```bash
docker-compose down
```

Or use the provided script:
```bash
chmod +x stop.sh
./stop.sh
```

### Running the Application

#### Standard Run
```bash
python app.py
```

The application will start on `http://127.0.0.1:5002`.

#### Docker Run
When using Docker, the application will be available at `http://localhost:5001`.

## 🔌 API Endpoints

### Upload Audio File

```
POST /upload
```

Parameters:
- `file`: Audio file (mp3, wav, flac)
- `isInstrumental`: Boolean indicating if the track is instrumental

### Regenerate Visualizations

```
GET /regenerate_visualizations/<file_id>
```

Parameters:
- `file_id`: UUID of the uploaded file

### Regenerate Stereo Field

```
GET /regenerate_stereo_field/<file_id>
```

Parameters:
- `file_id`: UUID of the uploaded file

## 🔒 Security Features

- Rate limiting with Flask-Limiter
- Content Security Policy (CSP) headers
- Secure file uploads with:
  - File extension validation
  - MIME type validation
  - UUID-based filenames
  - Maximum file size limit (100MB)
- Input validation for all endpoints
- Directory traversal protection
- X-Content-Type-Options, X-Frame-Options, X-XSS-Protection headers
- Strict-Transport-Security in production

## 💡 Development

### Project Structure

```
music/
├── app/
│   ├── __init__.py          # Application factory
│   ├── static/              # Static files
│   │   ├── css/             # CSS files
│   │   ├── js/              # JavaScript files
│   │   └── uploads/         # Uploaded files
│   └── templates/           # HTML templates
├── app.py                   # Main application
├── requirements.txt         # Dependencies
├── security_check.py        # Security audit script
├── Dockerfile               # Docker configuration
└── docker-compose.yml       # Docker Compose configuration
```

### Docker Configuration

The Docker setup includes:

- Base image: `python:3.9-slim`
- Required system dependencies (libsndfile1, ffmpeg)
- Volume mapping for persistent storage of uploads
- Port mapping: 5001 (host) -> 5000 (container)
- Environment variable support, including OpenAI API key

### Security Audit

Run the security check script to identify potential security issues:

```bash
python security_check.py
```

## 🔍 How It Works

The application combines advanced DSP (Digital Signal Processing) algorithms with modern web technologies to provide deep insights into your mix:

- **Frequency Balance**: Evaluates if your mix has proper distribution across the frequency spectrum (20Hz-20kHz)
- **Dynamic Range**: Measures the difference between the loudest and quietest parts using industry-standard metrics
- **Stereo Field**: Analyzes the stereo image, panning, and phase correlation between channels
- **Clarity**: Detects potential masking issues or muddiness that could affect mix translation

Additionally, the application can leverage OpenAI's GPT-4o to provide AI-powered insights and professional suggestions for improving your mix quality.

## 📊 Technical Details

### Audio Analysis

The application performs these professional-grade analyses:

1. **Frequency Balance Analysis**:
   - Divides the frequency spectrum into critical bands (sub-bass, bass, low-mids, mids, high-mids, highs, air)
   - Measures energy distribution using FFT analysis
   - Compares to industry-standard reference curves
   - Identifies potential issues like muddy bass (200-300Hz buildup) or harsh highs (2-5kHz peaks)

2. **Dynamic Range Analysis**:
   - Calculates dynamic range in dB
   - Measures crest factor
   - Evaluates peak-to-loudness ratio
   - Detects over-compression

3. **Stereo Field Analysis**:
   - Measures correlation between channels
   - Analyzes mid/side balance
   - Detects phase issues
   - Evaluates stereo width

4. **Clarity Analysis**:
   - Measures spectral contrast
   - Analyzes spectral flatness
   - Evaluates spectral centroid
   - Identifies potential masking issues

### Visualizations

The application generates several visualizations to help you understand your mix:

1. **Waveform**: Shows the amplitude of the audio over time
2. **Spectrogram**: Displays frequency content over time
3. **Frequency Spectrum**: Shows the average energy at each frequency
4. **Stereo Field**: Visualizes the relationship between left and right channels

All visualizations are interactive:
- Click on any visualization to open it in a larger view
- Use the zoom controls (+ and -) to zoom in and out
- Drag to pan around when zoomed in
- Press the Reset button to return to the original view
- Keyboard shortcuts: + to zoom in, - to zoom out, 0 to reset, Esc to close

### AI Insights

When an OpenAI API key is provided, the application uses GPT-4o to:

- Provide a summary of the mix quality
- Identify strengths of the mix
- Point out areas for improvement
- Offer specific suggestions for enhancing the mix

## 🔧 Requirements

- Python 3.8+
- Dependencies listed in requirements.txt
- OpenAI API key (optional, for AI-powered mix recommendations)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request or create issues for bugs and feature requests.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

Developed by Uygar Duzgun - [uygarduzgun.com](https://uygarduzgun.com)

## 🔑 Keywords

audio analysis, music production tool, mix analyzer, mastering assistant, frequency analysis, stereo field analyzer, dynamic range measurement, phase correlation, music production software, audio engineering, sound engineering, spectral analysis, waveform visualization, audio processing

---

© 2023 Uygar Duzgun. All rights reserved.

