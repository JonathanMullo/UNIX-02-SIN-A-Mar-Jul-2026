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

# =============================================================================
# BLOCK D — debconf-set-selections: pre-answer installer questions
# =============================================================================
# Some packages ask questions during installation using debconf.
# Wireshark (tshark) asks if non-root users can capture packets
# an interactive yes/no dialogue.
#
# Since we have DEBIAN_FRONTEND=noninteractive, that dialog cannot be shown
# and the build freezes or fails. The solution is to "pre-answer" the question
# before the installation begins.
#
# The pipe | takes the output of echo and sends it as standard input to
# debconf-set-selections — We respond false = only root can capture packets.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections

# =============================================================================
# BLOCK E — The big RUN: update and install all the tools
# ===========================================================================
# Each RUN creates a Docker layer.
#
# apt-get update: Download the updated list of available packages.
#
# apt-get install: Download and install the listed packages.
#
# -y: Automatically responds "yes" to all commits. The book uses
# this flag exactly: "sudo apt install nuclei -y" (BHB Ch.3 — Nuclei).
#
# --no-install-recommends: only install strictly necessary dependencies,
# no "recommended" extras. Keeps the image lighter.
#
# && - execute the next command ONLY if the previous one
# was successful.
#
#\ - continues the command on the next line only for
# readability.
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
     # Editores de texto y shells
    # El libro menciona en Cap.1 "Installing a Text Editor": "Terminal-based
    # text editors (such as vi or GNU nano) are useful because during a
    # penetration test they may be the only available options when you need to
    # develop a script on the spot." neovim y vim son esa opción.
    # zsh: el libro menciona en Cap.3 que Kali usa zsh por defecto:
    # "Newer Kali releases use the Z Shell (zsh) by default" (BHB Cap.3).
    # bash-completion: agrega autocompletado con Tab para comandos de bash.
    neovim \
    vim \
    zsh \
    bash-completion \
    \

# Classic text processing tools
    # grep   searches lines matching a pattern; used to filter command output
    # sed    stream editor; finds and replaces text in files or piped output
    # gawk   processes and extracts fields from structured text and columns
    # perl   general-purpose scripting language; also used for text one-liners
    # make   build automation tool; runs tasks defined in a Makefile
    make \
    gawk \
    sed \
    grep \
    \
# Basic UNIX utilities
# coreutils provides cat, ls, head, tail, sort, cut, tr, wc, etc.
    # findutils provides find and xargs to search for files on the system.
    # procps provides ps, top, kill.
    # less pager to read long files screen by screen.
    # tree displays the directory structure as an ASCII tree.
    # jq processes JSON from the command line.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # Manual pages: reinstalled because Kali removes them by default to save space
    # manpages       documentation for standard Linux commands
    # manpages-posix POSIX standard documentation for cross-system portability
    man-db \
    manpages \
    manpages-posix \
    \
    # Networking and download utilities
    # curl        transfers data from/to URLs; used to call web APIs from scripts
    # wget        downloads files from URLs in a simple way
    # git         version control; needed to clone and push to the course repo
    # git-lfs     Git extension for handling large binary files in repositories
    # ca-certificates SSL certificates to verify https connections
    # locales     provides locale-gen and language data to configure Spanish
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # shellcheck analyzes Bash scripts and warns about errors before running them
    shellcheck \
    \
    # Network scanning
    # nmap    port scanner; detects services and versions on remote hosts
    # masscan high-speed massive scanner for large IP ranges
    nmap \
    masscan \
    \
    # Packet capture
    # tcpdump captures raw network traffic from the terminal
    # tshark  terminal version of Wireshark; decodes packets by protocol
    tcpdump \
    tshark \
    \
    # Miscellaneous network utilities
    # netcat-traditional  opens raw TCP/UDP connections; useful for scanning and file transfer
    # socat               like netcat but supports more protocols
    # dnsutils            provides dig and nslookup for DNS queries
    # whois               queries domain and IP registration information
    # traceroute          shows network hops between this host and a destination
    # mtr-tiny            combines ping and traceroute into a live view
    # iproute2            modern network tools: ip addr, ip route, ss
    # net-tools           legacy tools: ifconfig, netstat, route
    # iputils-ping        provides the standard ping command
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # Anonymity and traffic obfuscation
    # tor           routes traffic through multiple encrypted relays to hide the origin IP
    # torsocks      forces any command to send its traffic through Tor
    # proxychains4  chains multiple proxies together for network pivoting
    # obfs4proxy    disguises Tor traffic as HTTPS to bypass censorship
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # httpie  HTTP client with readable colored output; easier than curl for learning
    httpie \
    \
# =============================================================================
# BLOCK F — sed and locale-gen: activate the Spanish locale
# =============================================================================
    # sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen
    # sed is the stream editor 
    #
    # locale-gen: compiles the activated locales into binaries that
    # use the system at runtime.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
# =============================================================================
# BLOCK G — Cleanup: reduce final image size
# =============================================================================
    # After installing, apt leaves unnecessary files:
    # - Downloaded .deb files (the installers)
    # - The package index downloaded with update
    #
    # apt-get clean: remove cached .deb files.
    # rm -rf /var/lib/apt/lists/*: remove files from the index.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
# =============================================================================
# BLOCK H — SHELL: change the interpreter for the following RUNs
# =============================================================================
# By default Docker executes RUNs using /bin/sh the minimal shell
# POSIX, more limited than bash or zsh.
#
# SHELL: switch the interpreter for the following RUN instructions from /bin/sh to bash
# By default Docker uses /bin/sh which is a minimal POSIX shell, more limited than bash
# Switching to bash allows later RUN steps to use bash-specific syntax if needed
SHELL ["/bin/bash", "-c"]
