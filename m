Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6F4EE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:20:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeBBS-0003Hi-G4; Thu, 07 Sep 2023 05:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qeBBL-0003G3-5J
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:20:12 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qeBBH-0005pu-Ts
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:20:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31adc5c899fso817477f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694078405; x=1694683205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xj+bxDPowzdQrHRjKezmkoV8gF8Ee1dKxqXJe/8vnz4=;
 b=KdoHDV02oCgKA+lu3cLCITbljhGOeMStWZX9B4Jn33MhY7oXm6p4fCc3dBXpAyvv+b
 Imot1mj6i3kPSa6B4sX3i3TVoGTZEDv8IdamuClEFyWAaBF9g9oOe1aQi3pKm7shdQcg
 TXETpNjnkzz+nskjBoEHdLwSIgxCJiyCbURHjruKF0GWb2YTRs8YkWJy81f+VIZN0Z8R
 SolBRboPo+EFs09UPgRZMhR6BrINm/ZWc/GyRGAi+Egc7GUfn2os/6qUWa0lZkFpj8W1
 jdm/8/3uePSxW/mYgY3nuICJZiHNAHBZueI32sz70Bhkm+cibB8Vam2E6rvCOY/bXP55
 BKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694078405; x=1694683205;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xj+bxDPowzdQrHRjKezmkoV8gF8Ee1dKxqXJe/8vnz4=;
 b=jkcm+ebFSbdgSv5qGGsMyUV1Xb0JZO2jueAlUCLdjg2CiMV0royno4UaiIZdMOIRP2
 E+Yj66J2wv6vxORftu2Ytu9TbQ3lvfhgP64EVgeaL9JGHclyQTrhcEHuz8DM4DVcM+Nq
 dDc1rbsV7mNy5hA5vKTUXOpI9EFfxa3mQ9uvSiRqpC+8crxuGoQhgjjzymtlNJFdwNmQ
 pCyZwg4QQAuGhXThtXMByWkZaOsuv/7yHSZl+2at/NXTdYgi7Crm9dU7/sP95MSYBR8M
 d6rWhosZpNLaP8rfu/BxEbr8PnPRNL+QnIDo+z5hDsjDULZbQM2LraVipDR4Apz0b0+O
 pBTg==
X-Gm-Message-State: AOJu0Yyqt1ZO99Kla6WqV9ejthOjcVQsOloKPLnQ+EUFmkoB8mtcz+Rb
 bqX+9NI5q1qOi7VkETk8Fzg/Yw==
X-Google-Smtp-Source: AGHT+IEmkW7YFmKFi77zj6UUN+ArORYIkuNSh0tUC4bnyiRkw3Fp4ecMYgCdAdm2YQaBHMEwqKWLxQ==
X-Received: by 2002:adf:f988:0:b0:31a:e612:ae04 with SMTP id
 f8-20020adff988000000b0031ae612ae04mr4653566wrr.31.1694078405421; 
 Thu, 07 Sep 2023 02:20:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adfe711000000b0031773a8e5c4sm22653087wrm.37.2023.09.07.02.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 02:20:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 708B61FFBB;
 Thu,  7 Sep 2023 10:20:03 +0100 (BST)
References: <20230726120706.335340-2-ajones@ventanamicro.com>
User-agent: mu4e 1.11.17; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, peter.maydell@linaro.org, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: Add cross-compiling doc
Date: Thu, 07 Sep 2023 10:16:30 +0100
In-reply-to: <20230726120706.335340-2-ajones@ventanamicro.com>
Message-ID: <875y4m2vct.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


Andrew Jones <ajones@ventanamicro.com> writes:

> Add instructions for how to cross-compile QEMU for RISC-V. The
> file is named generically because there's no reason not to collect
> other architectures steps into the same file, especially because
> several subsections like those for cross-compiling QEMU dependencies
> using meson and a cross-file could be shared. Additionally, other
> approaches to creating sysroots, such as with debootstrap, may be
> documented in this file in the future.

Generally QEMU can be cross compiled with one of our suite of
cross-compile docker images, e.g.:

  make docker-test-build@debian-riscv64-cross J=3D9 V=3D1

see:

  make docker-help

for the details. The only thing that makes riscv64 a little tricky is we
currently rely on sid+ports for the toolchain and deps. Now riscv64 is a
target architecture for trixy we should soon be able to move to a better im=
age
with all the binary dependencies.

>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  docs/devel/cross-compiling.rst | 221 +++++++++++++++++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 docs/devel/cross-compiling.rst
>
> diff --git a/docs/devel/cross-compiling.rst b/docs/devel/cross-compiling.=
rst
> new file mode 100644
> index 000000000000..1b988ba54e4c
> --- /dev/null
> +++ b/docs/devel/cross-compiling.rst
> @@ -0,0 +1,221 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Cross-compiling QEMU
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Cross-compiling QEMU first requires the preparation of a cross-toolchain
> +and the cross-compiling of QEMU's dependencies. While the steps will be
> +similar across architectures, each architecture will have its own specif=
ic
> +recommendations. This document collects architecture-specific procedures
> +and hints that may be used to cross-compile QEMU, where typically the ho=
st
> +environment is x86.
> +
> +RISC-V
> +=3D=3D=3D=3D=3D=3D
> +
> +Toolchain
> +---------
> +
> +Select a root directory for the cross environment
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Export an environment variable pointing to a root directory
> +for the cross environment. For example, ::
> +
> +  $ export PREFIX=3D"$HOME/opt/riscv"
> +
> +Create a work directory
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Tools and several components will need to be downloaded and built. Create
> +a directory for all the work, ::
> +
> +  $ export WORK_DIR=3D"$HOME/work/xqemu"
> +  $ mkdir -p "$WORK_DIR"
> +
> +Select and prepare the toolchain
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Select a toolchain such as [riscv-toolchain]_ and follow its instructions
> +for building and installing it to ``$PREFIX``, e.g. ::
> +
> +  $ cd "$WORK_DIR"
> +  $ git clone https://github.com/riscv/riscv-gnu-toolchain
> +  $ cd riscv-gnu-toolchain
> +  $ ./configure --prefix=3D"$PREFIX"
> +  $ make -j$(nproc) linux
> +
> +Set the ``$CROSS_COMPILE`` environment variable to the prefix of the cro=
ss
> +tools and add the tools to ``$PATH``, ::
> +
> +$ export CROSS_COMPILE=3Driscv64-unknown-linux-gnu-
> +$ export PATH=3D"$PREFIX/bin:$PATH"
> +
> +Also set ``$SYSROOT``, where all QEMU cross-compiled dependencies will be
> +installed. The toolchain installation likely created a 'sysroot' directo=
ry
> +at ``$PREFIX/sysroot``, which is the default location for most cross
> +tools, making it a good location, ::
> +
> +  $ mkdir -p "$PREFIX/sysroot"
> +  $ export SYSROOT=3D"$PREFIX/sysroot"
> +
> +Create a pkg-config wrapper
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The build processes of QEMU and some of its dependencies depend on
> +pkg-config. Create a wrapper script for it which works for the cross
> +environment: ::
> +
> +  $ cat <<EOF >"$PREFIX/bin/${CROSS_COMPILE}pkg-config"
> +  #!/bin/sh
> +
> +  [ "\$SYSROOT" ] || exit 1
> +
> +  export PKG_CONFIG_PATH=3D
> + export
> PKG_CONFIG_LIBDIR=3D"\${SYSROOT}/usr/lib/pkgconfig:\${SYSROOT}/usr/lib64/=
pkgconfig:\${SYSROOT}/usr/share/pkgconfig"
> +
> +  exec pkg-config "\$@"
> +  EOF
> +  $ chmod +x "$PREFIX/bin/${CROSS_COMPILE}pkg-config"
> +
> +Create a cross-file for meson builds
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +meson setup, used by some of QEMU's dependencies, needs a "cross-file" to
> +configure the cross environment. Create one, ::
> +
> +  $ cd "$WORK_DIR"
> +  $ cat <<EOF >cross_file.txt
> +  [host_machine]
> +  system =3D 'linux'
> +  cpu_family =3D 'riscv64'
> +  cpu =3D 'riscv64'
> +  endian =3D 'little'
> +
> +  [binaries]
> +  c =3D '${CROSS_COMPILE}gcc'
> +  cpp =3D '${CROSS_COMPILE}g++'
> +  ar =3D '${CROSS_COMPILE}ar'
> +  ld =3D '${CROSS_COMPILE}ld'
> +  objcopy =3D '${CROSS_COMPILE}objcopy'
> +  strip =3D '${CROSS_COMPILE}strip'
> +  pkgconfig =3D '${CROSS_COMPILE}pkg-config'
> +  EOF
> +
> +Cross-compile dependencies
> +--------------------------
> +
> +glibc
> +^^^^^
> +
> +If [riscv-toolchain]_ was selected for the toolchain then this step is
> +already complete and glibc has already been installed into ``$SYSROOT``.
> +Otherwise, cross-compile glibc and install it to ``$SYSROOT``.
> +
> +libffi
> +^^^^^^
> +
> +::
> +
> +  $ cd "$WORK_DIR"
> +  $ git clone https://gitlab.freedesktop.org/gstreamer/meson-ports/libff=
i.git
> +  $ cd libffi
> +  $ meson setup --cross-file ../cross_file.txt --prefix=3D"$SYSROOT/usr"=
 _build
> +  $ ninja -C _build
> +  $ ninja -C _build install
> +
> +*Building libffi seperately avoids a compilation error generated when
> +building it as a subproject of glib.*
> +
> +glib
> +^^^^
> +
> +::
> +
> +  $ cd "$WORK_DIR"
> +  $ git clone https://github.com/GNOME/glib.git
> +  $ cd glib
> +  $ meson setup --cross-file ../cross_file.txt --prefix=3D"$SYSROOT/usr"=
 _build
> +  $ ninja -C _build
> +  $ ninja -C _build install
> +
> +libslirp [optional]
> +^^^^^^^^^^^^^^^^^^^
> +
> +::
> +
> +  $ cd "$WORK_DIR"
> +  $ git clone https://gitlab.com/qemu-project/libslirp.git
> +  $ cd libslirp
> +  $ meson setup --cross-file ../cross_file.txt --prefix=3D"$SYSROOT/usr"=
 _build
> +  $ ninja -C _build
> +  $ ninja -C _build install
> +
> +pixman
> +^^^^^^
> +
> +First ensure the 'libtool' package is installed, e.g.
> +``sudo dnf install libtool`` or ``sudo apt install libtool``
> +
> +::
> +
> +  $ cd "$WORK_DIR"
> +  $ git clone https://gitlab.freedesktop.org/pixman/pixman
> +  $ cd pixman
> +  $ ./autogen.sh
> +  $ ./configure --prefix=3D"$SYSROOT/usr" --host=3Driscv64-unknown-linux=
-gnu
> +  $ make -j$(nproc)
> +  $ make install
> +
> +Cross-compile QEMU
> +------------------
> +
> +::
> +
> +  $ cd "$WORK_DIR"
> +  $ git clone https://gitlab.com/qemu-project/qemu.git
> +  $ cd qemu
> +  $ mkdir -p build/install_dir
> +  $ cd build
> +  $ ../configure --target-list=3Driscv64-softmmu --cross-prefix=3D$CROSS=
_COMPILE --prefix=3D"$PWD/install_dir"
> +  $ make -j$(nproc)
> +  $ make install
> +
> +*Cross-compiling QEMU with different configurations may require more
> +dependencies to be built and installed in the sysroot.*
> +
> +Running QEMU
> +------------
> +
> +``build/install_dir`` may now be copied to the target and its bin
> +directory may be added to the target user's PATH. Prior to running
> +QEMU, ensure all the libraries it depends on are present, ::
> +
> +  $ ldd /path/to/bin/qemu-system-riscv64
> +
> +For example, it may necessary to install zlib libraries, e.g.
> +``sudo dnf install zlib-devel`` or ``sudo apt install zlib1g-dev``
> +
> +Subsequent QEMU Cross-compiling
> +-------------------------------
> +
> +Unless it's necessary to update and recompile the toolchain or
> +dependencies, then most steps do not need to be repeated for subsequent
> +compiles. Simply ensure the toolchain is in ``$PATH``, ``$SYSROOT`` poin=
ts
> +at the sysroot, and then follow the QEMU cross-compile steps in
> +"Cross-compile QEMU". For example, ::
> +
> +  $ export PATH=3D"$HOME/opt/riscv/bin:$PATH"
> +  $ export SYSROOT=3D"$HOME/opt/riscv/sysroot"
> +  $ cd /path/to/qemu
> +  $ mkdir -p build/install_dir
> +  $ cd build
> + $ ../configure --target-list=3Driscv64-softmmu
> --cross-prefix=3Driscv64-unknown-linux-gnu- --prefix=3D"$PWD/install_dir"
> +  $ make -j
> +  $ make install
> +
> +References
> +----------
> +
> +.. [riscv-toolchain] https://github.com/riscv/riscv-gnu-toolchain


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

