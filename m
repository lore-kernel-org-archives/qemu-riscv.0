Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxVm3-0006iG-3z
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 10:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxVly-0006ew-LU; Sun, 27 Jun 2021 10:28:34 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxVlv-0000gu-OY; Sun, 27 Jun 2021 10:28:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id v7so13013907pgl.2;
 Sun, 27 Jun 2021 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBBzE+jOvx77fkMjRtdFObWi0tKaA8ajXOXSeT42ij8=;
 b=AtHVvDwBImdxzOptwazKI9HwKLPcymo8uLPMJ1B4b/EoQ7Y65DSFUjyO1GyBFFjqVB
 tilI4uOy8fVQIqOes8tXLZIqVA4j7zMfvE+Z3Xxi95/Cat8veTW8fbra0EWe7hTaAHnU
 PPXjxGrg0ZLD56VoW9lZgU8oxxBrxBRHol2wbIKV5bMEdzMS7hdYbk9nQuzfIJZof5AW
 uMyGqAc080OkbYL1E+abNghMfvwSOhCqgMpAaEa3CA7l+8eWRTvGCk/6ZukB7LyIHPyG
 lbWCsC9dYNFGm6ra41MUSW4gC/jcnFyLA/3i7H/AP+1QQdVw31MppUqhkmNgh5lJQj1i
 3TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBBzE+jOvx77fkMjRtdFObWi0tKaA8ajXOXSeT42ij8=;
 b=Jmgr0/A8+V+yvjZcL46yp+K/u8beCdzMiTXffbfEaNpkbzn7mQ76CXFa/6d4oanKST
 I+JpurTNfevVxTN9tMEJKRJZAlj3b59ikbJMN0G6ZqrYo7k71qJxnkARYxGvf3P8faqR
 9jeJWNCKQ9PzGvyh+FHd74byuSPauPNLacFD6hI2KcRHgOb0bSdAVrhgaOI7glqOkykv
 SqMWkC6Ex7tRrL1r9pvH7ongM6/AK282Ze7/M5YTV1lpEZ4O5MLWdk+tzGeIM/H00/Bf
 WURDigmihEr+8vuLaeL5qpIYpMD4bgE+jxW6qODqQVYZp3oIE+6cm00AZB5pyE4av3xt
 r1vQ==
X-Gm-Message-State: AOAM530DGn3u8k832lNteLYPmYclHoVjYbAhXeXfvREg4GP0t5sOo2Rn
 vy0d99iswyBG0clkpnBWj5g=
X-Google-Smtp-Source: ABdhPJyQ7FdT5X+RXHkmp1L9MPiu9joa8mlGkVd8/UenZf40V8zpowhBRnLT3HBy8E0Ccz9M7OMM3w==
X-Received: by 2002:a05:6a00:2283:b029:307:5484:dd10 with SMTP id
 f3-20020a056a002283b02903075484dd10mr20583408pfe.43.1624804109746; 
 Sun, 27 Jun 2021 07:28:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 27sm7222223pgr.31.2021.06.27.07.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 07:28:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 2/2] docs/system: riscv: Add documentation for virt machine
Date: Sun, 27 Jun 2021 22:28:16 +0800
Message-Id: <20210627142816.19789-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210627142816.19789-1-bmeng.cn@gmail.com>
References: <20210627142816.19789-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Sun, 27 Jun 2021 14:28:37 -0000

This adds detailed documentation for RISC-V `virt` machine,
including the following information:

  - Supported devices
  - Hardware configuration information
  - Boot options
  - Running Linux kernel
  - Running U-Boot

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/system/riscv/virt.rst   | 138 +++++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 docs/system/riscv/virt.rst

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
new file mode 100644
index 0000000000..3709f05797
--- /dev/null
+++ b/docs/system/riscv/virt.rst
@@ -0,0 +1,138 @@
+'virt' Generic Virtual Platform (``virt``)
+==========================================
+
+The `virt` board is a platform which does not correspond to any real hardware;
+it is designed for use in virtual machines. It is the recommended board type
+if you simply want to run a guest such as Linux and do not care about
+reproducing the idiosyncrasies and limitations of a particular bit of
+real-world hardware.
+
+Supported devices
+-----------------
+
+The ``virt`` machine supports the following devices:
+
+* Up to 8 generic RV32GC/RV64GC cores, with optional extensions
+* Core Local Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* CFI parallel NOR flash memory
+* 1 NS16550 compatible UART
+* 1 Google Goldfish RTC
+* 1 SiFive Test device
+* 8 virtio-mmio transport devices
+* 1 generic PCIe host bridge
+* The fw_cfg device that allows a guest to obtain data from QEMU
+
+Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
+can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
+enables the hypervisor extension for RV64.
+
+Hardware configuration information
+----------------------------------
+
+The ``virt`` machine automatically generates a device tree blob ("dtb")
+which it passes to the guest, if there is no ``-dtb`` option. This provides
+information about the addresses, interrupt lines and other configuration of
+the various devices in the system. Guest software should discover the devices
+that are present in the generated DTB.
+
+If users want to provide their own DTB, they can use the ``-dtb`` option.
+These DTBs should have the following requirements:
+
+* The number of subnodes of the /cpus node should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+* Should contain a node for the CLINT device with a compatible string
+  "riscv,clint0" if using with OpenSBI BIOS images
+
+Boot options
+------------
+
+The ``virt`` machine can start using the standard -kernel functionality
+for loading a Linux kernel, a VxWorks kernel, an S-mode U-Boot bootloader
+with the default OpenSBI firmware image as the -bios. It also supports
+the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dynamic
+firmware and U-Boot proper (S-mode), using the standard -bios functionality.
+
+Running Linux kernel
+--------------------
+
+Linux mainline v5.12 release is tested at the time of writing. To build a
+Linux mainline kernel that can be booted by the ``virt`` machine in
+64-bit mode, simply configure the kernel using the defconfig configuration:
+
+.. code-block:: bash
+
+  $ export ARCH=riscv
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make defconfig
+  $ make
+
+To boot the newly built Linux kernel in QEMU with the ``virt`` machine:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel arch/riscv/boot/Image \
+      -initrd /path/to/rootfs.cpio \
+      -append "root=/dev/ram"
+
+To build a Linux mainline kernel that can be booted by the ``virt`` machine
+in 32-bit mode, use the rv32_defconfig configuration. A patch is required to
+fix the 32-bit boot issue for Linux kernel v5.12.
+
+.. code-block:: bash
+
+  $ export ARCH=riscv
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ curl https://patchwork.kernel.org/project/linux-riscv/patch/20210627135117.28641-1-bmeng.cn@gmail.com/mbox/ > riscv.patch
+  $ git am riscv.patch
+  $ make rv32_defconfig
+  $ make
+
+Replace ``qemu-system-riscv64`` with ``qemu-system-riscv32`` in the command
+line above to boot the 32-bit Linux kernel. A rootfs image containing 32-bit
+applications shall be used in order for kernel to boot to user space.
+
+Running U-Boot
+--------------
+
+U-Boot mainline v2021.04 release is tested at the time of writing. To build an
+S-mode U-Boot bootloader that can be booted by the ``virt`` machine, use
+the qemu-riscv64_smode_defconfig with similar commands as described above for Linux:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make qemu-riscv64_smode_defconfig
+
+Boot the 64-bit U-Boot S-mode image directly:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel /path/to/u-boot.bin
+
+To test booting U-Boot SPL which in M-mode, which in turn loads a FIT image
+that bundles OpenSBI fw_dynamic firmware and U-Boot proper (S-mode) together,
+build the U-Boot images using riscv64_spl_defconfig:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ export OPENSBI=/path/to/opensbi-riscv64-generic-fw_dynamic.bin
+  $ make qemu-riscv64_spl_defconfig
+
+The minimal QEMU commands to run U-Boot SPL are:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
+      -display none -serial stdio \
+      -bios /path/to/u-boot-spl \
+      -device loader,file=/path/to/u-boot.itb,addr=0x80200000
+
+To test 32-bit U-Boot images, switch to use qemu-riscv32_smode_defconfig and
+riscv32_spl_defconfig builds, and replace ``qemu-system-riscv64`` with
+``qemu-system-riscv32`` in the command lines above to boot the 32-bit U-Boot.
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index a5cc06b726..89a866e4f4 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -69,6 +69,7 @@ undocumented; you can get a complete list by running
    riscv/microchip-icicle-kit
    riscv/shakti-c
    riscv/sifive_u
+   riscv/virt
 
 RISC-V CPU firmware
 -------------------
-- 
2.25.1


