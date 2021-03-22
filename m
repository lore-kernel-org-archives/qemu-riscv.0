Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOFNS-0000IR-5V
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 03:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lOFNL-0000EW-D7; Mon, 22 Mar 2021 03:53:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lOFNH-0000Wg-Id; Mon, 22 Mar 2021 03:53:23 -0400
Received: by mail-ej1-x635.google.com with SMTP id a7so19614092ejs.3;
 Mon, 22 Mar 2021 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5+uBxMMgZuhxwrZ9af5WimJi0Ra9OZhZgAWE4VVDYk=;
 b=MXn5wUCa1n1yhv7M01mWz4yfbVOTIismdKEkVLf3yXwjVgcberecuxIgvEviiVx4Sd
 sKSeD1VlvHwVFz5zx5yldXCmNdp5m7Yn8MhGMp8kYf3DFSNrS1nBOx8Xsd0jFcZPkDGn
 VRU5NLmhnWwcOMauItygjF+lokw297zNqxprTaWK7Ywvt0QLAhNt9a9JTD6t5MTOOuZJ
 8S/BpSMxJxQcaq6uEkzWdylqH0fzsEXHMTm7NkV8Q0bVpMzR4/YPxvhFqxt3XIvjWrCC
 gIk7OA7X+tLYjisJhhItqYO8u8IoVwCnIAbI/AWnirLcwGYqr3cI6AdzQD+ZqDP5sKTn
 JtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5+uBxMMgZuhxwrZ9af5WimJi0Ra9OZhZgAWE4VVDYk=;
 b=R/KQ0C9GXcFEo3tH6tpf4FaZDjeXTHICeacTF2PLr5+wdp8eNcjjPaHHDQI7r0VDr2
 jKTJmL/urQ02fVoXan3ZpOao8XUlnMeY/SSYehS9Gww8uXVbdvkvQr1lhLbDhnDZYx51
 W07CWbTm0LzVB5V2CL4YF9/nVgy9XAo+Wns6/mlLrW42Snl94ii5wvYbGFEOUFt3is1d
 RiipDXCIDQWdTbsVTlG/TQv4UxRApMPnaN+NLNREPn4M6xOb8kFEnRwLr81N7ItSrUgY
 CPq1XgJ3RhtrJeN7qiAyZTGyrQD9jyEk5FeDBO0bJswVHkQuxUBzGgxJ7ipkdpiuNqca
 lW4Q==
X-Gm-Message-State: AOAM532uE0KQwWxI1L3bBIv2juTKPEhZ9zPgXOiB5nd2QMmtNAgkYGFd
 coNJfcZBPzMq0lDuQ+QiQAXgA3ibrTA=
X-Google-Smtp-Source: ABdhPJzGrpbIAf4oIeiAlSF1TxAU5TrEW/xyblAOLjpOu7af9i9z3LYZANKrmupgNLLQp/8zHI4OIA==
X-Received: by 2002:a17:906:14d0:: with SMTP id
 y16mr18090382ejc.242.1616399597366; 
 Mon, 22 Mar 2021 00:53:17 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id x17sm9193844ejd.68.2021.03.22.00.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 00:53:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/2] docs/system: riscv: Add documentation for
 'microchip-icicle-kit' machine
Date: Mon, 22 Mar 2021 15:52:48 +0800
Message-Id: <20210322075248.136255-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322075248.136255-1-bmeng.cn@gmail.com>
References: <20210322075248.136255-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 22 Mar 2021 07:53:28 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the documentation to describe what is supported for the
'microchip-icicle-kit' machine, and how to boot the machine in QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/system/riscv/microchip-icicle-kit.rst | 89 ++++++++++++++++++++++
 docs/system/target-riscv.rst               |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 docs/system/riscv/microchip-icicle-kit.rst

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
new file mode 100644
index 0000000000..4fe97bce3f
--- /dev/null
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -0,0 +1,89 @@
+Microchip PolarFire SoC Icicle Kit (``microchip-icicle-kit``)
+=============================================================
+
+Microchip PolarFire SoC Icicle Kit integrates a PolarFire SoC, with one
+SiFive's E51 plus four U54 cores and many on-chip peripherals and an FPGA.
+
+For more details about Microchip PolarFire SoC, please see:
+https://www.microsemi.com/product-directory/soc-fpgas/5498-polarfire-soc-fpga
+
+The Icicle Kit board information can be found here:
+https://www.microsemi.com/existing-parts/parts/152514
+
+Supported devices
+-----------------
+
+The ``microchip-icicle-kit`` machine supports the following devices:
+
+ * 1 E51 core
+ * 4 U54 cores
+ * Core Level Interruptor (CLINT)
+ * Platform-Level Interrupt Controller (PLIC)
+ * L2 Loosely Integrated Memory (L2-LIM)
+ * DDR memory controller
+ * 5 MMUARTs
+ * 1 DMA controller
+ * 2 GEM Ethernet controllers
+ * 1 SDHC storage controller
+
+Boot options
+------------
+
+The ``microchip-icicle-kit`` machine can start using the standard -bios
+functionality for loading its BIOS image, aka Hart Software Services (HSS_).
+HSS loads the second stage bootloader U-Boot from an SD card. It does not
+support direct kernel loading via the -kernel option. One has to load kernel
+from U-Boot.
+
+The memory is set to 1537 MiB by default which is the minimum required high
+memory size by HSS. A sanity check on ram size is performed in the machine
+init routine to prompt user to increase the RAM size to > 1537 MiB when less
+than 1537 MiB ram is detected.
+
+Boot the machine
+----------------
+
+HSS 2020.12 release is tested at the time of writing. To build an HSS image
+that can be booted by the ``microchip-icicle-kit`` machine, type the following
+in the HSS source tree:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ cp boards/mpfs-icicle-kit-es/def_config .config
+  $ make BOARD=mpfs-icicle-kit-es
+
+Download the official SD card image released by Microchip and prepare it for
+QEMU usage:
+
+.. code-block:: bash
+
+  $ wget ftp://ftpsoc.microsemi.com/outgoing/core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
+  $ gunzip core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
+  $ qemu-img resize core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic 4G
+
+Then we can boot the machine by:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
+      -bios path/to/hss.bin -sd path/to/sdcard.img \
+      -nic user,model=cadence_gem \
+      -nic tap,ifname=tap,model=cadence_gem,script=no \
+      -display none -serial stdio \
+      -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
+      -serial chardev:serial1
+
+With above command line, current terminal session will be used for the first
+serial port. Open another terminal window, and use `minicom` to connect the
+second serial port.
+
+.. code-block:: bash
+
+  $ minicom -D unix\#serial1.sock
+
+HSS output is on the first serial port (stdio) and U-Boot outputs on the
+second serial port. U-Boot will automatically load the Linux kernel from
+the SD card image.
+
+.. _HSS: https://github.com/polarfire-soc/hart-software-services
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 94d99c4c82..8d5946fbbb 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -66,6 +66,7 @@ undocumented; you can get a complete list by running
 .. toctree::
    :maxdepth: 1
 
+   riscv/microchip-icicle-kit
    riscv/sifive_u
 
 RISC-V CPU features
-- 
2.25.1


