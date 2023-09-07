Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C6EE14AA
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:26:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe4iw-0006Wc-5z; Wed, 06 Sep 2023 22:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe4iu-0006WJ-Rf; Wed, 06 Sep 2023 22:26:24 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe4is-0006Q4-11; Wed, 06 Sep 2023 22:26:24 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-48d0c7bfc49so264463e0c.0; 
 Wed, 06 Sep 2023 19:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694053580; x=1694658380; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juxRsCDNkFTEVk1uQaqw1S8oUpN8LdE7T5F+iUXxlx4=;
 b=B8rA56CN2traCKO0eW+oSzIDDQNasQMHfMJKrg4Bc3KrdEN41/KvP+pL6DqhtKx3KS
 rfD6yMeNgfs2UNbUh/u24lcR9i5zZz6NfEQMJ5VM6Mr77zDvpuwj1m3Rr1uKJeChqox/
 +11rfVfoDK51ss2DjlnVfiGCj5D85MHVfitPC5jE/1/ttXrp1ojc8fg8Tf4GjCU4cjam
 1ZP7YXZKA+ShomlSmam36R2NThJc2Ms8XWZ2u6M66kWPYca5vAGfiyJZzLsbOpOJVoLi
 n0RWOkonRztL/sGEZwVcaDa2pV2YWrc8wujg8q3o3r0aNb3DnB842CZAO21eNiEpPyEh
 0Jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694053580; x=1694658380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juxRsCDNkFTEVk1uQaqw1S8oUpN8LdE7T5F+iUXxlx4=;
 b=HHZQCcH4LdN5il67XljZJDDl/ud1u0At44rJ7SsTkRlSfkKUytrB87JZ0sf8WH8Tdz
 Uat78PaGn2KvjCAnhNLBpvt5QcpmGmwUo1OBN23nWENai1Bnwikbk4g+4uljFomJy+9o
 LWZ12DTRwTucUyobqFhAUxqZYb5ffnKFwKJjB/e/GgZpgG8O9ojkERc41gvvQxqEQpNB
 0+aedBAQx/ePuCS0bWVp5189I37lID1ZB+yiwr1sETjon6RNzpoaDqyEM2JvXyhuA7FL
 IZrRHI2tgzSN2aqNW8nHaRtc7RsFvduJAhpibxaz6r2h7e6EDLnREUC0X8a3huak2m6r
 yznA==
X-Gm-Message-State: AOJu0YzlDz54kz+2zH/1hVaEmfdgYbEsqGjjRAVdeWvwZOk2PdPvER6a
 pTgVRlQkDm82dwUOxv39Cuzups6Ba/qLdWWryfo=
X-Google-Smtp-Source: AGHT+IHfIpXHrha2VGr3FO1amMbQZxs/mcM2jDW1EPczkpGnWuP759UjeH1XPcKFjFmnjkQDpTm5Btwjty7gsPzPzLg=
X-Received: by 2002:a05:6122:250d:b0:48d:969:af8b with SMTP id
 cl13-20020a056122250d00b0048d0969af8bmr1187798vkb.1.1694053579751; Wed, 06
 Sep 2023 19:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230726120706.335340-2-ajones@ventanamicro.com>
In-Reply-To: <20230726120706.335340-2-ajones@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 12:25:52 +1000
Message-ID: <CAKmqyKNobj=Lqvrv8epQdqA1YX5DF_zgOhpZruc9FgdJHvoYTw@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: Add cross-compiling doc
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, peter.maydell@linaro.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

