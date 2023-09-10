Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B13FEE14D8
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 10:33:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfHkk-0005EF-Qf; Sun, 10 Sep 2023 06:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfHkj-0005Dh-GO
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 06:33:17 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfHkg-00006x-KC
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 06:33:17 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso2584671a34.2
 for <qemu-riscv@nongnu.org>; Sun, 10 Sep 2023 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694341993; x=1694946793; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tQrBnNjSyMhdotoFIdZvvPcH92x2DqL588nG4P9Sce4=;
 b=EVf8UJlvwHxWTsspfihK8uIUucj5iAowxx2dn4LSQ9+G+HI7Ilm8BCY31kNwCuFpHM
 9abzyoF+6UUqbRC1wTXBbaRLRbEWx574K4QCNC/XSWyuZYQuH/lga28Pu/Rh+F1EtFbw
 a+a9YhjI6h1JjqRYe9JzPHkm/gyN9KkwrwDVGfCiQlY7jsi5SxKwmNwfYu+LGJ2OHcqY
 GkBwi14pABbv8VABX9lMKEgWWj2SK8iWZGkxdDzQ27W5qzYZcg7LqEPzHdUb/KYCh7zi
 /uQ8OxbOi8dTq83R0eol9f3eeF8j7h/oPmKCZQmqaEdvvY1ZNe+H7iXe4IXH6/g7mM8y
 nf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694341993; x=1694946793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQrBnNjSyMhdotoFIdZvvPcH92x2DqL588nG4P9Sce4=;
 b=tAmYx5ITvpDUay50+yKmigS4j4vTZcS7SRJ+DG5s/UkE5N/lFYEiCOK3LHeauXAlO6
 jB1gDGwSyUerLUzA8TjkJl+4VaZ7JcLNib10lDaSNrWiF9hwAcLpp/agraHJYvBa0Xub
 jt1W4ZdFruS9QDXawMQgIK1/Mb2J4m2Pfsnb74lpz3tKY6ydvmc6+s6yO9FryGn3i1TG
 5ya7taEPIRQZFW09BD8y/DN2DUSj5f5HBC1hhAoe3+LMKJm6IptAARTwjDKd6qCAhW0d
 nZJIw1rzSro4tOUWgAN6FKQ3cudJlc04kH0y4F6AIoBPAcz+rXMW0LtEc1ZkVMevGVYA
 ERxw==
X-Gm-Message-State: AOJu0YyD48likvx5fHjOtFFy6BJgz2mrBoJttdBlZzpkySAXB6u4LuTj
 8K1/i8nJyGhijGea7WWIKroy/A==
X-Google-Smtp-Source: AGHT+IFMSTDznz54OHkJQ7DUXMobDgzWvLRVPoZY52V8HjtnVQKVXLtvNdb6FNG94w2v3O6QffjEGQ==
X-Received: by 2002:a05:6830:1b6d:b0:6b1:d368:557c with SMTP id
 d13-20020a0568301b6d00b006b1d368557cmr8079896ote.30.1694341993169; 
 Sun, 10 Sep 2023 03:33:13 -0700 (PDT)
Received: from [192.168.68.107] ([177.9.182.82])
 by smtp.gmail.com with ESMTPSA id
 r62-20020a4a4e41000000b005707f68f78bsm2350585ooa.18.2023.09.10.03.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 03:33:12 -0700 (PDT)
Message-ID: <7d13a04d-bdcb-7dac-aa6b-d0e2b7fca489@ventanamicro.com>
Date: Sun, 10 Sep 2023 07:33:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] docs/devel: Add cross-compiling doc
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 peter.maydell@linaro.org
References: <20230907084604.253347-2-ajones@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230907084604.253347-2-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/7/23 05:46, Andrew Jones wrote:
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

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   docs/devel/cross-compiling.rst | 221 +++++++++++++++++++++++++++++++++
>   docs/devel/index-build.rst     |   1 +
>   2 files changed, 222 insertions(+)
>   create mode 100644 docs/devel/cross-compiling.rst
> 
> diff --git a/docs/devel/cross-compiling.rst b/docs/devel/cross-compiling.rst
> new file mode 100644
> index 000000000000..1b988ba54e4c
> --- /dev/null
> +++ b/docs/devel/cross-compiling.rst
> @@ -0,0 +1,221 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +====================
> +Cross-compiling QEMU
> +====================
> +
> +Cross-compiling QEMU first requires the preparation of a cross-toolchain
> +and the cross-compiling of QEMU's dependencies. While the steps will be
> +similar across architectures, each architecture will have its own specific
> +recommendations. This document collects architecture-specific procedures
> +and hints that may be used to cross-compile QEMU, where typically the host
> +environment is x86.
> +
> +RISC-V
> +======
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
> +  $ export PREFIX="$HOME/opt/riscv"
> +
> +Create a work directory
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Tools and several components will need to be downloaded and built. Create
> +a directory for all the work, ::
> +
> +  $ export WORK_DIR="$HOME/work/xqemu"
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
> +  $ ./configure --prefix="$PREFIX"
> +  $ make -j$(nproc) linux
> +
> +Set the ``$CROSS_COMPILE`` environment variable to the prefix of the cross
> +tools and add the tools to ``$PATH``, ::
> +
> +$ export CROSS_COMPILE=riscv64-unknown-linux-gnu-
> +$ export PATH="$PREFIX/bin:$PATH"
> +
> +Also set ``$SYSROOT``, where all QEMU cross-compiled dependencies will be
> +installed. The toolchain installation likely created a 'sysroot' directory
> +at ``$PREFIX/sysroot``, which is the default location for most cross
> +tools, making it a good location, ::
> +
> +  $ mkdir -p "$PREFIX/sysroot"
> +  $ export SYSROOT="$PREFIX/sysroot"
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
> +  export PKG_CONFIG_PATH=
> +  export PKG_CONFIG_LIBDIR="\${SYSROOT}/usr/lib/pkgconfig:\${SYSROOT}/usr/lib64/pkgconfig:\${SYSROOT}/usr/share/pkgconfig"
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
> +  system = 'linux'
> +  cpu_family = 'riscv64'
> +  cpu = 'riscv64'
> +  endian = 'little'
> +
> +  [binaries]
> +  c = '${CROSS_COMPILE}gcc'
> +  cpp = '${CROSS_COMPILE}g++'
> +  ar = '${CROSS_COMPILE}ar'
> +  ld = '${CROSS_COMPILE}ld'
> +  objcopy = '${CROSS_COMPILE}objcopy'
> +  strip = '${CROSS_COMPILE}strip'
> +  pkgconfig = '${CROSS_COMPILE}pkg-config'
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
> +  $ git clone https://gitlab.freedesktop.org/gstreamer/meson-ports/libffi.git
> +  $ cd libffi
> +  $ meson setup --cross-file ../cross_file.txt --prefix="$SYSROOT/usr" _build
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
> +  $ meson setup --cross-file ../cross_file.txt --prefix="$SYSROOT/usr" _build
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
> +  $ meson setup --cross-file ../cross_file.txt --prefix="$SYSROOT/usr" _build
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
> +  $ ./configure --prefix="$SYSROOT/usr" --host=riscv64-unknown-linux-gnu
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
> +  $ ../configure --target-list=riscv64-softmmu --cross-prefix=$CROSS_COMPILE --prefix="$PWD/install_dir"
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
> +compiles. Simply ensure the toolchain is in ``$PATH``, ``$SYSROOT`` points
> +at the sysroot, and then follow the QEMU cross-compile steps in
> +"Cross-compile QEMU". For example, ::
> +
> +  $ export PATH="$HOME/opt/riscv/bin:$PATH"
> +  $ export SYSROOT="$HOME/opt/riscv/sysroot"
> +  $ cd /path/to/qemu
> +  $ mkdir -p build/install_dir
> +  $ cd build
> +  $ ../configure --target-list=riscv64-softmmu --cross-prefix=riscv64-unknown-linux-gnu- --prefix="$PWD/install_dir"
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
> @@ -9,6 +9,7 @@ the basics if you are adding new files and targets to the build.
>      :maxdepth: 3
>   
>      build-system
> +   cross-compiling
>      kconfig
>      testing
>      acpi-bits

