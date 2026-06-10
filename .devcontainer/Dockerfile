# =============================================================================
# BLOCK B — IMAGE / LAYER / CACHE CONCEPT
# =============================================================================
# Docker builds images in layers. Each instruction (FROM, RUN, ENV, etc.) 
# creates a new layer on top of the previous one, like a layer cake.
# The most important thing is that Docker caches each layer.
# If a layer hasn't changed since the last time you built the image, 
# Docker reuses it instead of rerunning it, this does the rebuilds 
# much faster.

# =============================================================================
# BLOCK A — FROM: choosing the base image
# =============================================================================
# FROM is the first required statement in the Dockerfile.
# Tells Docker: "start from this pre-built OS."
# A base image is like a snapshot of the OS ready to use instead of
# install Linux from scratch, we start from one that already exists.

# Why Kali Linux?
# Kali is a Debian-based distribution, created for pentesting.
# The book describes it like this: "Kali is a Linux distribution created for
# penetration testing. Based on Debian, it was designed by OffSec. We'll use
# Kali as our lab's operating system because it comes bundled with some of the
# libraries, dependencies, and tools we'll need." (BHB Ch.3 — Installing Kali)
# "kali-rolling" means that packages are continually updated
# (no fixed versions). "latest" always downloads the most recent snapshot.
FROM kalilinux/kali-rolling:latest

# =============================================================================
# BLOCK C — ENV: environment variables
# =============================================================================
# ENV defines environment variables available during the build AND within the
# running container.
#
# DEBIAN_FRONTEND=noninteractive
# Tells apt NOT to ask interactive questions during installation.
#
# LANG=es_ES.UTF-8
# Defines the main language of the system: Spanish from Spain with encryption
#UTF-8. Affects date formats, number separators, and valid characters.
#
# LC_ALL=es_ES.UTF-8
# Overrides ALL locale categories at the same time. It's the "switch" 
# language master" — takes priority over any other LC_ variable.
#
# TERM=xterm-256color
# Tells programs that the terminal supports 256 colors.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color