Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jA0S0-0006Ud-JU
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 19:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jA0Ry-0006U9-6v
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 19:02:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1jA0Rv-00064S-Co
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 19:02:45 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37187)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1jA0Rv-00063W-4H
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 19:02:43 -0500
Received: by mail-pl1-x643.google.com with SMTP id b8so87273plx.4
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 16:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9yQNGls13ewER796wf/FCuUB59kKomvL3VVXnrt/464=;
 b=mH58HdCARBY6rjqkDUPslGKymzlcq7hrJAL4vEXyVeKiVQsSd9GaOBxzkfZJCs14oI
 r1beRRUBACy6RwUZgD9DdYd9b0VXPjNbcmIiC0OPTuYXL5H+JvEBBCEvIW2P76GjWAwz
 Ge/h0BzhG98oaq20FcolYD1b1Eua/+kYEuTs9LJ05sIcYzF9RipUfE4AftNtttTtrgwY
 7VSyEHIwBNQ7nWLP8eaiuV/88LcYFl12Oh3i/r+knmfX0SqWTBtdR61e4GJszDQZwY2O
 aAnR9jydgrElqcorgKWdt8FW5e+ukXwP6PAKwza08rSAUXkPcxXu1vA6YTFMIXVsy+bW
 Pfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9yQNGls13ewER796wf/FCuUB59kKomvL3VVXnrt/464=;
 b=KZND4HfkuRt+Pm/B9PnQOdz6LD+k/BoAHc5W9F7Y+ag2oVLrqwWQ9dVyI4VKP6RewW
 TzAuBd49uwuxBXlO7bSpkMM2ztVGrCz3H2X0V/Cr/uPoH1G81CnlU66/h7LXQ2Q52hSa
 JUSiejHWOrrouEaUxGBuF/k9RYsLcYCny34+KYJ7SHi0S2/3amEXb3UfKjDUjykh4W68
 03Jb8DhXJXgbJnHIKqWLYpFg9uzdvt/e6hWfiFXE7GSkE4mBA1/Pn+kFTX7i4LETtalw
 lIbuACPZv/kYRv2G6nY87lJkA5LJt6gbUKRXLUdkWdmBbft+mcTcBl+Snny3uh74FO07
 r+iw==
X-Gm-Message-State: ANhLgQ2XiLvETMY4GXhZzRbpOmF64w8sgy9yxxRF4aiE4Bdko81kgjQg
 B5U9XGLRRPf6rGm+bhnfNPA8gQ==
X-Google-Smtp-Source: ADFU+vuN8uOEU6Ybkltl1vFiNAnGhvh+0YglqOUGDR0rcYfimcYqheWy/SSNoQOQ1WKDi3iZRBczUQ==
X-Received: by 2002:a17:90a:6545:: with SMTP id f5mr703789pjs.42.1583452961708; 
 Thu, 05 Mar 2020 16:02:41 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id g18sm33741021pfi.80.2020.03.05.16.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 16:02:41 -0800 (PST)
Date: Thu, 05 Mar 2020 16:02:41 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 16:00:39 PST (-0800)
Subject: Re: [PATCH v2 4/4] gitlab-ci.yml: Add jobs to build OpenSBI firmware
 binaries
In-Reply-To: <1582551584-20093-5-git-send-email-bmeng.cn@gmail.com>
CC: philmd@redhat.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-16530630-a9cf-4c46-a6fb-55065ed8927d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Mar 2020 00:02:47 -0000

On Mon, 24 Feb 2020 05:39:44 PST (-0800), bmeng.cn@gmail.com wrote:
> Add two GitLab jobs to build the OpenSBI firmware binaries.
>
> The first job builds a Docker image with the packages requisite
> to build OpenSBI, and stores this image in the GitLab registry.
> The second job pulls the image from the registry and builds the
> OpenSBI firmware binaries.
>
> The docker image is only rebuilt if the GitLab YAML or the
> Dockerfile is updated. The second job is only built when the
> roms/opensbi/ submodule is updated, when a git-ref starts with
> 'opensbi' or when the last commit contains 'OpenSBI'. The files
> generated are archived in the artifacts.zip file.
>
> With OpenSBI v0.6, it took 2 minutes 56 seconds to build
> the docker image, and 1 minute 24 seconds to generate the
> artifacts.zip with the firmware binaries (filesize: 111KiB).
>
> See: https://gitlab.com/lbmeng/qemu/pipelines/120520138
>
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

I don't really understand how this works well enough to be comfortable putting
my Reviewed-by on it -- I'm certainly not opposed to it, it's just not really
my thing.  I've put it in my queue without a review, but my understanding is
that we need one to send it up (and I usually avoid putting things in my queue
until they have a review).

If nobody else has time to review it then I'll do so before sending the PR, but
that may delay things.  It'd be great if someone could save me the time... :)

Thanks for doing this, though -- wve're sorely lacking in CI!

>
> ---
>
> Changes in v2:
> - new patch: Add GitLab jobs to build OpenSBI firmware binaries
>
>  .gitlab-ci-opensbi.yml          | 63 +++++++++++++++++++++++++++++++++++++++++
>  .gitlab-ci.d/opensbi/Dockerfile | 33 +++++++++++++++++++++
>  .gitlab-ci.yml                  |  1 +
>  3 files changed, 97 insertions(+)
>  create mode 100644 .gitlab-ci-opensbi.yml
>  create mode 100644 .gitlab-ci.d/opensbi/Dockerfile
>
> diff --git a/.gitlab-ci-opensbi.yml b/.gitlab-ci-opensbi.yml
> new file mode 100644
> index 0000000..dd051c0
> --- /dev/null
> +++ b/.gitlab-ci-opensbi.yml
> @@ -0,0 +1,63 @@
> +docker-opensbi:
> + stage: build
> + rules: # Only run this job when the Dockerfile is modified
> + - changes:
> +   - .gitlab-ci-opensbi.yml
> +   - .gitlab-ci.d/opensbi/Dockerfile
> +   when: always
> + image: docker:19.03.1
> + services:
> + - docker:19.03.1-dind
> + variables:
> +  GIT_DEPTH: 3
> +  IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
> +  # We don't use TLS
> +  DOCKER_HOST: tcp://docker:2375
> +  DOCKER_TLS_CERTDIR: ""
> + before_script:
> + - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
> + script:
> + - docker pull $IMAGE_TAG || true
> + - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
> +                                        --tag $IMAGE_TAG .gitlab-ci.d/opensbi
> + - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
> + - docker push $IMAGE_TAG
> +
> +build-opensbi:
> + rules: # Only run this job when ...
> + - changes: # ... roms/opensbi/ is modified (submodule updated)
> +   - roms/opensbi/*
> +   when: always
> + - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
> +   when: always
> + - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
> +   when: always
> + artifacts:
> +   paths: # 'artifacts.zip' will contains the following files:
> +   - pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
> +   - pc-bios/opensbi-riscv32-virt-fw_jump.bin
> +   - pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> +   - pc-bios/opensbi-riscv64-virt-fw_jump.bin
> +   - opensbi32-virt-stdout.log
> +   - opensbi32-virt-stderr.log
> +   - opensbi64-virt-stdout.log
> +   - opensbi64-virt-stderr.log
> +   - opensbi32-sifive_u-stdout.log
> +   - opensbi32-sifive_u-stderr.log
> +   - opensbi64-sifive_u-stdout.log
> +   - opensbi64-sifive_u-stderr.log
> + image: $CI_REGISTRY_IMAGE:opensbi-cross-build
> + variables:
> +   GIT_DEPTH: 3
> + script: # Clone the required submodules and build OpenSBI
> + - git submodule update --init roms/opensbi
> + - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
> + - echo "=== Using ${JOBS} simultaneous jobs ==="
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi32-virt 2>&1 1>opensbi32-virt-stdout.log | tee -a opensbi32-virt-stderr.log >&2
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi64-virt 2>&1 1>opensbi64-virt-stdout.log | tee -a opensbi64-virt-stderr.log >&2
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi32-sifive_u 2>&1 1>opensbi32-sifive_u-stdout.log | tee -a opensbi32-sifive_u-stderr.log >&2
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi64-sifive_u 2>&1 1>opensbi64-sifive_u-stdout.log | tee -a opensbi64-sifive_u-stderr.log >&2
> diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Dockerfile
> new file mode 100644
> index 0000000..4ba8a4d
> --- /dev/null
> +++ b/.gitlab-ci.d/opensbi/Dockerfile
> @@ -0,0 +1,33 @@
> +#
> +# Docker image to cross-compile OpenSBI firmware binaries
> +#
> +FROM ubuntu:18.04
> +
> +MAINTAINER Bin Meng <bmeng.cn@gmail.com>
> +
> +# Install packages required to build OpenSBI
> +RUN apt update \
> +    && \
> +    \
> +    DEBIAN_FRONTEND=noninteractive \
> +    apt install --assume-yes --no-install-recommends \
> +        build-essential \
> +        ca-certificates \
> +        git \
> +        make \
> +        wget \
> +    && \
> +    \
> +    rm -rf /var/lib/apt/lists/*
> +
> +# Manually install the kernel.org "Crosstool" based toolchains for gcc-8.3
> +RUN wget -O - \
> +    https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.3.0/x86_64-gcc-8.3.0-nolibc-riscv32-linux.tar.xz \
> +    | tar -C /opt -xJ
> +RUN wget -O - \
> +    https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.3.0/x86_64-gcc-8.3.0-nolibc-riscv64-linux.tar.xz \
> +    | tar -C /opt -xJ
> +
> +# Export the toolchains to the system path
> +ENV PATH="/opt/gcc-8.3.0-nolibc/riscv32-linux/bin:${PATH}"
> +ENV PATH="/opt/gcc-8.3.0-nolibc/riscv64-linux/bin:${PATH}"
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index c15e394..4c3a72b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,5 +1,6 @@
>  include:
>    - local: '/.gitlab-ci-edk2.yml'
> +  - local: '/.gitlab-ci-opensbi.yml'
>
>  before_script:
>   - apt-get update -qq

