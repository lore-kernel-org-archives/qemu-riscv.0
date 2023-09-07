Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBF1EE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 08:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeAeW-0007Mt-MB; Thu, 07 Sep 2023 04:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeAeQ-0007EQ-Rx
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 04:46:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeAeO-0008VK-2F
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 04:46:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so7146165e9.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694076366; x=1694681166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MGPAIUCP36uWkMPgV53mUgA4HKs3bkirBfQvci1d314=;
 b=I7fJBWfWJVBUIVCtaXNS7UpBMr2VyF2HA7bcmaZ4lFNOafelp19jO5ofNd3LzDIxqb
 w+22hmMeZAbUnRKTC02IDfwxdyA1G9L9PzI5yhlLuvVAuSQVrUDRl/Nz859qYzjtYifa
 PU0D0KpYl6sc8ev6KSbDEErI27t9765hnAPwcmIvQJN/U9Et9zL9IaRNZ4D5lcbhrWrS
 BjZPgmzHIhAqiS2uG6ZhhoDKZsvc+o8W6ovsqst7EEA9T9B97YP91BahZ1230FNGcvTh
 xEQYzaFlzcR3o+t/1RgZcnYjcDt8u1NRwLKaduUWwBbLz7WQhipN+HyC2yFxI4UOCZqf
 j4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694076366; x=1694681166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGPAIUCP36uWkMPgV53mUgA4HKs3bkirBfQvci1d314=;
 b=dK0eRCw4qp0bC9zqctiqoxS92g4KDGsOeO25kR2ismUzQtwBeinm1mnoYsbkf/Yfh2
 moPyb2n+ZSudTWr/r17Tq2euR+X4Z13ijIvGCf83S5NVl0MiSWWKL68ENPaAOqPUYvlX
 PbY4M7dlJLf7FRUtMhKuJMpMYziA05monQAnOXVkkqT6JghmZ9kvUrSdIEDCNUkgKi30
 jLTzFKsQG1lVdB/IFVA66m+X4Y854f1kge8pwOYdSqP2LGGZh17BCZgyJvUmH0vzAES8
 BcEqLwURdD95pozZdvdpwDnqAlcfPUiiqjiX+KEVKbEvA74wgyBIpKhzih88s5cy3pXO
 scVQ==
X-Gm-Message-State: AOJu0YwQNPGlkxi52Xoziqjnr8S8rrgKv4/4h2NaPodoy/iIEJxkJuJb
 GmaVNkBm8UXjsVAJx2mlmds7jA==
X-Google-Smtp-Source: AGHT+IFQk5NsNKhgpULukCg8lRqTLuNt1ViXa/73YQD74rywvpgXAahyooR//IitUPrdhLVmNvnEDw==
X-Received: by 2002:a05:6000:923:b0:317:f7b0:85f with SMTP id
 cx3-20020a056000092300b00317f7b0085fmr4086271wrb.33.1694076365969; 
 Thu, 07 Sep 2023 01:46:05 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4b10000000b0031981c500aasm22767208wrq.25.2023.09.07.01.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 01:46:05 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 peter.maydell@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2] docs/devel: Add cross-compiling doc
Date: Thu,  7 Sep 2023 10:46:05 +0200
Message-ID: <20230907084604.253347-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x336.google.com
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

Add instructions for how to cross-compile QEMU for RISC-V. The
file is named generically because there's no reason not to collect
other architectures steps into the same file, especially because
several subsections like those for cross-compiling QEMU dependencies
using meson and a cross-file could be shared. Additionally, other
approaches to creating sysroots, such as with debootstrap, may be
documented in this file in the future.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 docs/devel/cross-compiling.rst | 221 +++++++++++++++++++++++++++++++++
 docs/devel/index-build.rst     |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 docs/devel/cross-compiling.rst

diff --git a/docs/devel/cross-compiling.rst b/docs/devel/cross-compiling.rst
new file mode 100644
index 000000000000..1b988ba54e4c
--- /dev/null
+++ b/docs/devel/cross-compiling.rst
@@ -0,0 +1,221 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+====================
+Cross-compiling QEMU
+====================
+
+Cross-compiling QEMU first requires the preparation of a cross-toolchain
+and the cross-compiling of QEMU's dependencies. While the steps will be
+similar across architectures, each architecture will have its own specific
+recommendations. This document collects architecture-specific procedures
+and hints that may be used to cross-compile QEMU, where typically the host
+environment is x86.
+
+RISC-V
+======
+
+Toolchain
+---------
+
+Select a root directory for the cross environment
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Export an environment variable pointing to a root directory
+for the cross environment. For example, ::
+
+  $ export PREFIX="$HOME/opt/riscv"
+
+Create a work directory
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Tools and several components will need to be downloaded and built. Create
+a directory for all the work, ::
+
+  $ export WORK_DIR="$HOME/work/xqemu"
+  $ mkdir -p "$WORK_DIR"
+
+Select and prepare the toolchain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Select a toolchain such as [riscv-toolchain]_ and follow its instructions
+for building and installing it to ``$PREFIX``, e.g. ::
+
+  $ cd "$WORK_DIR"
+  $ git clone https://github.com/riscv/riscv-gnu-toolchain
+  $ cd riscv-gnu-toolchain
+  $ ./configure --prefix="$PREFIX"
+  $ make -j$(nproc) linux
+
+Set the ``$CROSS_COMPILE`` environment variable to the prefix of the cross
+tools and add the tools to ``$PATH``, ::
+
+$ export CROSS_COMPILE=riscv64-unknown-linux-gnu-
+$ export PATH="$PREFIX/bin:$PATH"
+
+Also set ``$SYSROOT``, where all QEMU cross-compiled dependencies will be
+installed. The toolchain installation likely created a 'sysroot' directory
+at ``$PREFIX/sysroot``, which is the default location for most cross
+tools, making it a good location, ::
+
+  $ mkdir -p "$PREFIX/sysroot"
+  $ export SYSROOT="$PREFIX/sysroot"
+
+Create a pkg-config wrapper
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The build processes of QEMU and some of its dependencies depend on
+pkg-config. Create a wrapper script for it which works for the cross
+environment: ::
+
+  $ cat <<EOF >"$PREFIX/bin/${CROSS_COMPILE}pkg-config"
+  #!/bin/sh
+
+  [ "\$SYSROOT" ] || exit 1
+
+  export PKG_CONFIG_PATH=
+  export PKG_CONFIG_LIBDIR="\${SYSROOT}/usr/lib/pkgconfig:\${SYSROOT}/usr/lib64/pkgconfig:\${SYSROOT}/usr/share/pkgconfig"
+
+  exec pkg-config "\$@"
+  EOF
+  $ chmod +x "$PREFIX/bin/${CROSS_COMPILE}pkg-config"
+
+Create a cross-file for meson builds
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+meson setup, used by some of QEMU's dependencies, needs a "cross-file" to
+configure the cross environment. Create one, ::
+
+  $ cd "$WORK_DIR"
+  $ cat <<EOF >cross_file.txt
+  [host_machine]
+  system = 'linux'
+  cpu_family = 'riscv64'
+  cpu = 'riscv64'
+  endian = 'little'
+
+  [binaries]
+  c = '${CROSS_COMPILE}gcc'
+  cpp = '${CROSS_COMPILE}g++'
+  ar = '${CROSS_COMPILE}ar'
+  ld = '${CROSS_COMPILE}ld'
+  objcopy = '${CROSS_COMPILE}objcopy'
+  strip = '${CROSS_COMPILE}strip'
+  pkgconfig = '${CROSS_COMPILE}pkg-config'
+  EOF
+
+Cross-compile dependencies
+--------------------------
+
+glibc
+^^^^^
+
+If [riscv-toolchain]_ was selected for the toolchain then this step is
+already complete and glibc has already been installed into ``$SYSROOT``.
+Otherwise, cross-compile glibc and install it to ``$SYSROOT``.
+
+libffi
+^^^^^^
+
+::
+
+  $ cd "$WORK_DIR"
+  $ git clone https://gitlab.freedesktop.org/gstreamer/meson-ports/libffi.git
+  $ cd libffi
+  $ meson setup --cross-file ../cross_file.txt --prefix="$SYSROOT/usr" _build
+  $ ninja -C _build
+  $ ninja -C _build install
+
+*Building libffi seperately avoids a compilation error generated when
+building it as a subproject of glib.*
+
+glib
+^^^^
+
+::
+
+  $ cd "$WORK_DIR"
+  $ git clone https://github.com/GNOME/glib.git
+  $ cd glib
+  $ meson setup --cross-file ../cross_file.txt --prefix="$SYSROOT/usr" _build
+  $ ninja -C _build
+  $ ninja -C _build install
+
+libslirp [optional]
+^^^^^^^^^^^^^^^^^^^
+
+::
+
+  $ cd "$WORK_DIR"
+  $ git clone https://gitlab.com/qemu-project/libslirp.git
+  $ cd libslirp
+  $ meson setup --cross-file ../cross_file.txt --prefix="$SYSROOT/usr" _build
+  $ ninja -C _build
+  $ ninja -C _build install
+
+pixman
+^^^^^^
+
+First ensure the 'libtool' package is installed, e.g.
+``sudo dnf install libtool`` or ``sudo apt install libtool``
+
+::
+
+  $ cd "$WORK_DIR"
+  $ git clone https://gitlab.freedesktop.org/pixman/pixman
+  $ cd pixman
+  $ ./autogen.sh
+  $ ./configure --prefix="$SYSROOT/usr" --host=riscv64-unknown-linux-gnu
+  $ make -j$(nproc)
+  $ make install
+
+Cross-compile QEMU
+------------------
+
+::
+
+  $ cd "$WORK_DIR"
+  $ git clone https://gitlab.com/qemu-project/qemu.git
+  $ cd qemu
+  $ mkdir -p build/install_dir
+  $ cd build
+  $ ../configure --target-list=riscv64-softmmu --cross-prefix=$CROSS_COMPILE --prefix="$PWD/install_dir"
+  $ make -j$(nproc)
+  $ make install
+
+*Cross-compiling QEMU with different configurations may require more
+dependencies to be built and installed in the sysroot.*
+
+Running QEMU
+------------
+
+``build/install_dir`` may now be copied to the target and its bin
+directory may be added to the target user's PATH. Prior to running
+QEMU, ensure all the libraries it depends on are present, ::
+
+  $ ldd /path/to/bin/qemu-system-riscv64
+
+For example, it may necessary to install zlib libraries, e.g.
+``sudo dnf install zlib-devel`` or ``sudo apt install zlib1g-dev``
+
+Subsequent QEMU Cross-compiling
+-------------------------------
+
+Unless it's necessary to update and recompile the toolchain or
+dependencies, then most steps do not need to be repeated for subsequent
+compiles. Simply ensure the toolchain is in ``$PATH``, ``$SYSROOT`` points
+at the sysroot, and then follow the QEMU cross-compile steps in
+"Cross-compile QEMU". For example, ::
+
+  $ export PATH="$HOME/opt/riscv/bin:$PATH"
+  $ export SYSROOT="$HOME/opt/riscv/sysroot"
+  $ cd /path/to/qemu
+  $ mkdir -p build/install_dir
+  $ cd build
+  $ ../configure --target-list=riscv64-softmmu --cross-prefix=riscv64-unknown-linux-gnu- --prefix="$PWD/install_dir"
+  $ make -j
+  $ make install
+
+References
+----------
+
+.. [riscv-toolchain] https://github.com/riscv/riscv-gnu-toolchain
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
index 57e8d39d9856..d3c85927be24 100644
--- a/docs/devel/index-build.rst
+++ b/docs/devel/index-build.rst
@@ -9,6 +9,7 @@ the basics if you are adding new files and targets to the build.
    :maxdepth: 3
 
    build-system
+   cross-compiling
    kconfig
    testing
    acpi-bits
-- 
2.41.0


