Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD77EE14A9
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:14:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe5T8-0006ro-6s; Wed, 06 Sep 2023 23:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5T5-0006qz-6I; Wed, 06 Sep 2023 23:14:07 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5T2-0000eG-9f; Wed, 06 Sep 2023 23:14:06 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so510958a12.0; 
 Wed, 06 Sep 2023 20:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694056442; x=1694661242; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=45PJVFPIacFs0KbcnFvHcmYK0jaqitootJvgxYJXKW0=;
 b=RzajEqLhFACYs1O3pkPVo++URewpAyqA/A733tfh41lymJTaXRyfgCXevnKFGy527X
 XbcZ4UU95e8Sfdtm1OKjDOYj7qDZEPMJLu5XslvwYyH1LqqeGE3/B6jbYgPDBsh7u6MC
 z072U24+CKqiGc2+us82XFN5OPp8wARHNKoiwppKSvll+TuVYFzRXgVO32TVaBx+N5gv
 3WDB+UckFhlHzuSBpHh3RPqT+cnTDRXNdslUNZ6rzWEoyNTW2gmdG+fbV9J8ZTXi1GNZ
 I0mOpl1psu6CfnaXWpw3bS4R3gv5EdNcfNkWSgGqcAoLx8uaXVyRCNn6E5SNmbBeuoZC
 mEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694056442; x=1694661242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=45PJVFPIacFs0KbcnFvHcmYK0jaqitootJvgxYJXKW0=;
 b=IVHzTjPHql97AfyGOCDJqaCnQV3zyVnQPGqsUO42iYgTi5cA5Yh6maLaE0t2OLw1VQ
 NVUsBdQhJyMnDVKA0xGqILOJ+lNbNXc03w3XZpRN2+VKdi+Q2lWxVMSShG+cU6919zPE
 iwFDOOLH6y8mNaaKlu0dRU581DCEY0xfymkXx+Tpuq1Zxq9rlBhfS5yCllm0G090A0AE
 evMP/HtuW4EGxM7y6HtPzJifpUHaIaXrQgqmY8iJiyvx96qjceJ9xRsQsfM/USc7OrKS
 20Xx79dWalfJ8OBtC4sCbIBo18MKnrmZseiWMrpcBfqxq6wVJBrzvpoLRPtAKnTzZgye
 ycQg==
X-Gm-Message-State: AOJu0YzALJ803cYQasFRvxqeG2sKZBvpkSZRan33BQTstmaiZvViCM9o
 DHw6P73y2DUfz2K3Zl9ADviN/DdfJxwh6XsxUEw=
X-Google-Smtp-Source: AGHT+IF5B4fh2zJ/B/muvMetE8up85f245DbsRuQhvrBwjNFT7ANPpgrHOoWrR3oG7O1jASATB/ttSKIeOHF7IPbZtQ=
X-Received: by 2002:aa7:dace:0:b0:523:40d0:34d1 with SMTP id
 x14-20020aa7dace000000b0052340d034d1mr3721361eds.4.1694056441479; Wed, 06 Sep
 2023 20:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230726120706.335340-2-ajones@ventanamicro.com>
In-Reply-To: <20230726120706.335340-2-ajones@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 13:13:33 +1000
Message-ID: <CAKmqyKMbyDn0rZ8tAXCNZvLcVh2dGpkQ9b+WR_6t358kFpUroQ@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: Add cross-compiling doc
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, peter.maydell@linaro.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jul 26, 2023 at 10:08=E2=80=AFPM Andrew Jones <ajones@ventanamicro.=
com> wrote:
>
> Add instructions for how to cross-compile QEMU for RISC-V. The
> file is named generically because there's no reason not to collect
> other architectures steps into the same file, especially because
> several subsections like those for cross-compiling QEMU dependencies
> using meson and a cross-file could be shared. Additionally, other
> approaches to creating sysroots, such as with debootstrap, may be
> documented in this file in the future.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

I get a warning when building this:

qemu/docs/devel/cross-compiling.rst: WARNING: document isn't included
in any toctree

Do you mind adding a toc reference to it and sending a v2?

Alistair

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
> +Tools and several components will need to be downloaded and built. Creat=
e
> +a directory for all the work, ::
> +
> +  $ export WORK_DIR=3D"$HOME/work/xqemu"
> +  $ mkdir -p "$WORK_DIR"
> +
> +Select and prepare the toolchain
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Select a toolchain such as [riscv-toolchain]_ and follow its instruction=
s
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
> +Also set ``$SYSROOT``, where all QEMU cross-compiled dependencies will b=
e
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
> +meson setup, used by some of QEMU's dependencies, needs a "cross-file" t=
o
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
> --
> 2.41.0
>
>

