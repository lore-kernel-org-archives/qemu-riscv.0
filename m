Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F14EE14DB
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 10:30:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeCHB-0003RS-Ln; Thu, 07 Sep 2023 06:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qeCH2-0003QY-WD
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 06:30:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qeCGy-0003mE-TR
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 06:30:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401d2e11dacso12719135e9.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694082602; x=1694687402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAU/eCijxBZO8nbM/sAU7ipHlJLprGMJlMr6ppg0vZU=;
 b=IAQ42NgKt96wRgTLkzqpKuTsThum/DTe//4HdG0vf+Qz3txnwfrKBZZnBexNLl05tj
 GqEMDEhdAjqc/kOJ+I3TxeA3ef4KSjlIa1HWy1AB2s6y7JqunCsyV3rtTg/oFu18yGPW
 /vBshqdqhw2X4dBsLBzBG5Qy3tFqRwhKqmiyLTE89ZqWcIF43Og4q8B9m1aK5TjJow83
 X0cNbVDxYj8DV0H/WSQhBHZ7Brlgk5IchQLf+tt/Sua4DjUcMv4jHPhQbGToaDd8YHIr
 t5tOmbbLLkzenSN2roZOMZAkl6zjUT8gVe17c0mK31vtjCDbAZMnbRvFC0Rw2bhevfOO
 c6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694082602; x=1694687402;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hAU/eCijxBZO8nbM/sAU7ipHlJLprGMJlMr6ppg0vZU=;
 b=FZ3vpyle9wGGStaV7g+9EC1Qhj9Eci1LRQ0jc31JdD/FnD85apvH2HShbPkcJU0tp8
 HKnTfejFCBPVf7SqNbj35BqjJ0NK6NVJAZkkII5YkGTqEvqLYAjSzMGpt/2T0I/KzDZj
 Qe4AVWlnMxSMIGkLC4zq4Nkf0GEUPdGAsOboHWUfN6pgGO/eRO2DjZ+NijlFbHs2JgSk
 ESNpqrVrfCvrQOJqaIo05LxWhI3oTICINxMsxzS72HuI7oT+fzg19blF4jCuKbUw8jGD
 ULSa4zMEjuGYOsLjAquokwLKtxaHq/qNyRlqxAQxGxE30fJJ2t80tahPLuqiyueDb3Am
 T/Fw==
X-Gm-Message-State: AOJu0YyBCwae2GqWswZQG6m4w4nJWs3Kko649ACqcGL6CPhgO6IpwlIi
 kjBJlg/lXVXDssbhrhhmdodR6Q==
X-Google-Smtp-Source: AGHT+IHCbJgD+rKlDSEVH+m0Qd6NfGAvzzjdbr0A0vzdacpirOQqHY20UaDKVB3I8Q0dTspv3AeRnA==
X-Received: by 2002:a05:600c:1c1e:b0:401:cf93:3103 with SMTP id
 j30-20020a05600c1c1e00b00401cf933103mr1830651wms.0.1694082601810; 
 Thu, 07 Sep 2023 03:30:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a7bcd99000000b0040210a27e29sm2091716wmj.32.2023.09.07.03.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 03:30:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67C7C1FFBB;
 Thu,  7 Sep 2023 11:30:00 +0100 (BST)
References: <20230907084604.253347-2-ajones@ventanamicro.com>
User-agent: mu4e 1.11.17; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, peter.maydell@linaro.org, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] docs/devel: Add cross-compiling doc
Date: Thu, 07 Sep 2023 11:20:55 +0100
In-reply-to: <20230907084604.253347-2-ajones@ventanamicro.com>
Message-ID: <87sf7q1djr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  docs/devel/cross-compiling.rst | 221 +++++++++++++++++++++++++++++++++
>  docs/devel/index-build.rst     |   1 +
>  2 files changed, 222 insertions(+)
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
> +recommendations.

"some architectures" - most of the cross compile stuff is hidden away by
the build system on systems with appropriate development libraries
installed. I think we would be remiss if we didn't just outline the
common case:

   ../configure --cross-prefix=3Driscv64-linux-gnu-

I think we could make it clearer that in most cases you don't need to
prepare and cross-compile a bunch of dependencies lest we send
developers down a rabbit hole.

Maybe build-system.rst be updated and this reference it for the common
case?

> This document collects architecture-specific procedures
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
> +  export PKG_CONFIG_LIBDIR=3D"\${SYSROOT}/usr/lib/pkgconfig:\${SYSROOT}/=
usr/lib64/pkgconfig:\${SYSROOT}/usr/share/pkgconfig"
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
> +  $ ../configure --target-list=3Driscv64-softmmu --cross-prefix=3Driscv6=
4-unknown-linux-gnu- --prefix=3D"$PWD/install_dir"
> +  $ make -j
> +  $ make install
> +
> +References
> +----------
> +
> +.. [riscv-toolchain] https://github.com/riscv/riscv-gnu-toolchain
> diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
> index 57e8d39d9856..d3c85927be24 100644
> --- a/docs/devel/index-build.rst
> +++ b/docs/devel/index-build.rst
> @@ -9,6 +9,7 @@ the basics if you are adding new files and targets to the=
 build.
>     :maxdepth: 3
>=20=20
>     build-system
> +   cross-compiling
>     kconfig
>     testing
>     acpi-bits


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

