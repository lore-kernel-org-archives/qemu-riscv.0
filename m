Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FD7C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 13:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOdYg-0007rm-Sa; Wed, 26 Jul 2023 08:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qOdY0-0006Vk-4f
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 08:23:20 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qOdXR-0005u5-N4
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 08:22:48 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1bb98474b8cso1219818fac.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Jul 2023 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690374164; x=1690978964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lG0AfxcO4a3jsGJYkMQC/fmjD3DsZNe9MqN8Dz5zofA=;
 b=lLFYNyGQXS+wIzQoNpaq6BkqWvVeTVoaNqlAFIIBSQcGi+zeS10OPhhF/Pf1swlsTG
 TGJxFCe/uQ1MQsMdhymDH+I5k8GK4V8BReuXPB5UF9KJ8MP0tQ8SdEDuKc9+e0dKtPW9
 8OpLBXCy6EX/+pFzLiTwJYr7bQOKZReNamdGF5KnkxfF7DVRD/GGZG119FJY03EBggbF
 gqCjuYDjULvTkEXp9M1S7hVbs+Pbc/Px4NDNgaKcXbywB3jevdkFlgMPCneFN7+fkILv
 xjngZ/xb9IHgb822rExaD4Ty7RoZP3SyvRPYh6l8fkFkuG1mWclogSMk/aEvtByZ4Ein
 mNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690374164; x=1690978964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lG0AfxcO4a3jsGJYkMQC/fmjD3DsZNe9MqN8Dz5zofA=;
 b=fOFik0Gi3bPmIdj4vwP7+lWrVMZQ3jfZ3iq1XirkhGz5bnqcA9hOfYK12K9NOPFPFF
 R42vK+5rbNHoiY1JpchhGlPpNM2/OH4BnDcWYvUHsFN/j5clFtLjjA+yK/FwHnGmtndc
 kB67Ng5R/2wQUe1Cxa2WTP2qIFfJEJK01hlIBoI/Syd5KbOFrVwVRXCAsu3wavNg0YCL
 ov0ojCN3WXsaoxBe9qIXz1bExMeL11vRG5HWEwyLdG7oJYttqZJSFl5q91ziQS01RhV8
 YNW09SPBwKBTasfknwU9j1viWNhqteawhXAQ7QChW1Eq24QpndFcIx3yaMdpoCXorB40
 aX3w==
X-Gm-Message-State: ABy/qLZ5kivWrNW6Lt75wgIjzLmXk+BFKIvpRkJdAMPl4HNewTjzVDEQ
 pv4sZ8XuImg/57APBjFLnojWwQ==
X-Google-Smtp-Source: APBJJlFpEQTPgvEQYRKQQplns81o3CaflPR9kQw7/igu0K5YdVH4pByvMML4nKpwtPKVUeM9j0eN5g==
X-Received: by 2002:a05:6870:b625:b0:1b3:e04e:b5c7 with SMTP id
 cm37-20020a056870b62500b001b3e04eb5c7mr2257199oab.42.1690374164103; 
 Wed, 26 Jul 2023 05:22:44 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-36.dial-up.telesp.net.br.
 [201.69.66.36]) by smtp.gmail.com with ESMTPSA id
 u188-20020a4a57c5000000b00565ebacf9cfsm6456119ooa.33.2023.07.26.05.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 05:22:43 -0700 (PDT)
Message-ID: <443c181f-6386-640f-9a9a-85727364ef12@ventanamicro.com>
Date: Wed, 26 Jul 2023 09:22:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/devel: Add cross-compiling doc
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 peter.maydell@linaro.org
References: <20230726120706.335340-2-ajones@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230726120706.335340-2-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 7/26/23 09:07, Andrew Jones wrote:
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

I've also tested the steps and it works. Not having to compile QEMU inside an
emulated risc-v instance will be a dramatic increase in my lifespan. This is
the best doc entry of the year for sure.

Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   docs/devel/cross-compiling.rst | 221 +++++++++++++++++++++++++++++++++
>   1 file changed, 221 insertions(+)
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

