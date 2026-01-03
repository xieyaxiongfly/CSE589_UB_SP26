#!/usr/bin/env python3
"""
Course Dashboard Launcher
Run this script to start the course management dashboard
"""

import os
import sys
import subprocess

def check_requirements():
    """Check if required packages are installed"""
    try:
        import flask
        import yaml
        print("✓ All required packages are installed")
        return True
    except ImportError as e:
        print(f"✗ Missing required package: {e}")
        print("Installing requirements...")
        try:
            subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
            print("✓ Requirements installed successfully")
            return True
        except subprocess.CalledProcessError:
            print("✗ Failed to install requirements")
            return False

def main():
    """Main function to start the dashboard"""
    print("=" * 50)
    print("Course Website Dashboard")
    print("=" * 50)
    
    # Check if we're in the right directory
    if not os.path.exists("app.py"):
        print("✗ Error: app.py not found")
        print("Please run this script from the dashboard directory")
        sys.exit(1)
    
    # Check requirements
    if not check_requirements():
        sys.exit(1)
    
    # Import and run the app
    try:
        from app import app
        print("\n🚀 Starting dashboard server...")
        print("📝 Default password: admin123")
        print("🌐 Dashboard will be available at:")
        print("   Local:  http://localhost:8080")
        print("   Network: http://0.0.0.0:8080")
        print("\n💡 Tip: Change the password in app.py for production use")
        print("=" * 50)
        
        app.run(debug=True, host='0.0.0.0', port=8080)
        
    except KeyboardInterrupt:
        print("\n\n👋 Dashboard stopped by user")
    except Exception as e:
        print(f"\n✗ Error starting dashboard: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()