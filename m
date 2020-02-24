Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6JK1-0007XY-Bb
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 14:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6JJy-0007Uw-2v
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 14:23:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6JJv-0008JF-I8
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 14:23:14 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34613)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6JJs-0008Fb-2T; Mon, 24 Feb 2020 14:23:08 -0500
Received: by mail-lj1-x241.google.com with SMTP id x7so11424724ljc.1;
 Mon, 24 Feb 2020 11:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f+WrzGPi9LdZONqGSGEOmJiNSYp/XVgP1eRp33dxT5E=;
 b=O36wpSYxykerRRrDngn5t9HPZPRN4c1w+FsEjUo68wlEJggAjS/QZpJe9Cnx9EHw6M
 U4EXU+XbWY347xyNqlx69Y1p7BInSdyLzDUuB5grThI3trrdrWVk7AOI9ZgptJFvieUj
 vfxB7iCcZrZUtNArCG6ybBYMPQNLDAb9pKFlgoPRAA1EyGWMUQOZ0rPvZo4porMYXPa7
 5c+JHo92BVB8uSCF4YXxuW4eoLvcrw4griel0AzsLIxBJ6R2G0/N6aTDb8SJZbJnHU/e
 7hLH4RBjRHn69wfMB0TfFf6zGXHtYACoKS6hAKx0LyZiXNXEvLHUVDbjqzh/gIPChjZ0
 oD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f+WrzGPi9LdZONqGSGEOmJiNSYp/XVgP1eRp33dxT5E=;
 b=hOvc3VLSEa5o8t0YadjsJAuRb3IMO27S7yBBvY/xGO2GnxLjKovEWa2wKiVCKQCML+
 ZZemJ3k9Bzxj1wnl2srwD32rdJc+mpRCMJsGTinNLmwCuaPpGN0stZVe38UNqJXN1bQ/
 dE+7BVqIildNYeeqOeHmZjR5RyaoaF7Wfv1THasNo+uAtN3Yw+/2XGF2O+5QUBlnJycJ
 EXmV0fnD02xXlwWHIOuOTTj1Q+n/MD39125qsp/cur1clYv8hnf2om8KqKo/XHEYFiu9
 qWc+ITV4tSi9hvlMaws92TCswe/YnrcC+KcZT/cYg8MvhKMuk8Cv8XO/nkTlcdEv2wUX
 XFXg==
X-Gm-Message-State: APjAAAXshcAz89Ya8qTAbBOI+0Qeg8o5SirUClVN/bGMxUtiBLU66XIg
 jY1Ajd+YafzIQjXvRUBGBL0qLiqJvlNGZIoBP9Q=
X-Google-Smtp-Source: APXvYqzLnLC4GhMRWq6GXhx3yy3Dw3K6JggHRJsuHbm3iPLKOPxVnL9oW5RBS58JIZ6vPxiqr95O/kIre1w/HJlXXe8=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr30576516ljc.195.1582572186344; 
 Mon, 24 Feb 2020 11:23:06 -0800 (PST)
MIME-Version: 1.0
References: <1582551584-20093-1-git-send-email-bmeng.cn@gmail.com>
 <1582551584-20093-5-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1582551584-20093-5-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 11:15:30 -0800
Message-ID: <CAKmqyKMkrg0fjO5yA-sz1Qva2ET9fmT28tFYfDzhtc=53Hrd+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gitlab-ci.yml: Add jobs to build OpenSBI firmware
 binaries
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Mon, 24 Feb 2020 19:23:15 -0000

On Mon, Feb 24, 2020 at 5:40 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
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
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - new patch: Add GitLab jobs to build OpenSBI firmware binaries
>
>  .gitlab-ci-opensbi.yml          | 63 +++++++++++++++++++++++++++++++++++=
++++++
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
> + - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGIST=
RY
> + script:
> + - docker pull $IMAGE_TAG || true
> + - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COM=
MIT_SHA
> +                                        --tag $IMAGE_TAG .gitlab-ci.d/op=
ensbi
> + - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
> + - docker push $IMAGE_TAG
> +
> +build-opensbi:
> + rules: # Only run this job when ...
> + - changes: # ... roms/opensbi/ is modified (submodule updated)
> +   - roms/opensbi/*
> +   when: always
> + - if: '$CI_COMMIT_REF_NAME =3D~ /^opensbi/' # or the branch/tag starts =
with 'opensbi'
> +   when: always
> + - if: '$CI_COMMIT_MESSAGE =3D~ /opensbi/i' # or last commit description=
 contains 'OpenSBI'
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
> + - export JOBS=3D$(($(getconf _NPROCESSORS_ONLN) + 1))
> + - echo "=3D=3D=3D Using ${JOBS} simultaneous jobs =3D=3D=3D"
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi32-virt 2>&1 1>opensbi32-virt-stdout.lo=
g | tee -a opensbi32-virt-stderr.log >&2
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi64-virt 2>&1 1>opensbi64-virt-stdout.lo=
g | tee -a opensbi64-virt-stderr.log >&2
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi32-sifive_u 2>&1 1>opensbi32-sifive_u-s=
tdout.log | tee -a opensbi32-sifive_u-stderr.log >&2
> + - make -j${JOBS} -C roms/opensbi clean
> + - make -j${JOBS} -C roms opensbi64-sifive_u 2>&1 1>opensbi64-sifive_u-s=
tdout.log | tee -a opensbi64-sifive_u-stderr.log >&2
> diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Docke=
rfile
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
> +    DEBIAN_FRONTEND=3Dnoninteractive \
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
> +# Manually install the kernel.org "Crosstool" based toolchains for gcc-8=
.3
> +RUN wget -O - \
> +    https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64=
/8.3.0/x86_64-gcc-8.3.0-nolibc-riscv32-linux.tar.xz \
> +    | tar -C /opt -xJ
> +RUN wget -O - \
> +    https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64=
/8.3.0/x86_64-gcc-8.3.0-nolibc-riscv64-linux.tar.xz \
> +    | tar -C /opt -xJ
> +
> +# Export the toolchains to the system path
> +ENV PATH=3D"/opt/gcc-8.3.0-nolibc/riscv32-linux/bin:${PATH}"
> +ENV PATH=3D"/opt/gcc-8.3.0-nolibc/riscv64-linux/bin:${PATH}"
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
> --
> 2.7.4
>
>

