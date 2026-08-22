Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71213C5DF8C
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 19:44:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxrdb-00027z-M1; Sat, 22 Aug 2026 15:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdY-000270-ND
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:44:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdW-0007Cd-UT
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:44:16 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cace91f112so23850155ad.0
 for <qemu-riscv@nongnu.org>; Sat, 22 Aug 2026 12:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787427853; x=1788032653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AkJCpUVxbck+BDrRMh6MDIJQ3Xr7+eOGrUpy6ljXqrQ=;
 b=GnTaWqFEIHgpE0UsLLXz8lYjNSoSWKKnBOkuyEhOqfoycepvSuc3hNsgVNpnEB9dvX
 GEXHjZ+6DEpHGZqX/4lzCn05m/zL+rfSKE8klY8I0mZPIJ+O8R6l2LFcbM2nS+6nb400
 BdJc4vS5bkJrihuz5yRhd1Lm3QkyTOlYYknwisqF4a7N4s4HrL99KiWae3YYq7xhRJpk
 FgBR2E+8MgsR0B7lApZi4KWvBrM8SSOEu/PlcXkDg6uAjyhRemjGYwoXIoXcIE2PCKgQ
 JtWZN+xi95ehUYKRMq2ITPGeA4FtVYCAJcWdMysaFwvQVqEJXnkhvinWbKjkeJmQng6e
 aS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787427853; x=1788032653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AkJCpUVxbck+BDrRMh6MDIJQ3Xr7+eOGrUpy6ljXqrQ=;
 b=LPNBxurFsWseCYZCAaIGXdUCiCXBSujS2HktixW5Xm+xHjTY7/0Za0opvo5CN/Nf63
 hGsUZuLCHmqzG/+zMM4YB1/dDtgeBHiDO3y4VHqWmqZ//qd3iVx646bZNFT9AfpDa+Hg
 hteOPpOOwSOJ3SpgWvhn7V4OV/flYD9jDN5CZ5/q02mWz1oh30BO4Z7NOM9pmlUMd3G+
 lywd1jAobn8KmyCHWBYMDaPhVDo7pcAZzJ4S1QNjLaUDz4OjwL1cOOezf8hrNurG26US
 nmSIM/ZgjxMOSat5XMrB6pxPnJTzawoRlnBuA6lCBXH77Yn3F7jTMGA84HrBHMMxUnz1
 GPpg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqgqG22PsUu8CeDumZl71ypNVkbp8T3dLSEMjY/Z8DKZDpeuLS0Uqyyri6qf1RM9XDcj/os78C0cRXr@nongnu.org
X-Gm-Message-State: AFuF++n5nsIP7ij/Mdb52AmlZk9NcKJN4WmSvgdTfvhiZaW+Oho7eVH3
 GTVnmF/BPPm4D8W6u4dT/t8SRbHtO53InKJeJsWDRRjJVt9bo/1KYq6LwzviRAUr
X-Gm-Gg: AR+sD13AzWp7KOGkgUim1tYVhTlCRxiwTyk0FjUVLIN2J8Md5Q+LRrlQvNtWCWVuGwS
 5fjVvHEF0fXXDhAjA2sM5YLBcPzde3fSoaCdDuOZ/DM4mkzBH9kOLN/SD6/XFcO+PpBWhehC7Wl
 Rgb5DsNa2bTUGC9XgINhDjte6VqA6OKsn9O0XUQ1X8zCjzakTHMh5+cU8tOU4pnGGCyBuXHJBcC
 cT5txgFbH1v/i9eh6mbgc2vrv4jO0fDoSnMrEGs1jcMd554G8TkGKRXH1OWvtkLZ/ezdyvQzua3
 bkFYRp22SuesuflJ6nhLx7FXp1/nUp44nL0f8K0zTBsNm8d0paYRtBojDzO8+rmCIOGZU1/F6RS
 iS88OyvCV+OyJMuoDTFjbrgRfhMsl3TzFnJSiqv8t1aSvt5eOfS+CHYQNqvzv0mfVVYYV3t754B
 m+9Qm4a9OrYQEmhvmXEdZRYmJSQerDIH3b/0IY2PGlZKXNEfKeeHV1s48pymFCzdi+eIHo74TeW
 zqeno+WSyXJtyd0SNM+NxJofcDXhkG2cLLPVK6QgHlIhu12ENOUQbQ0++n+CaXjh0IbjiEQdfiE
X-Received: by 2002:a17:903:3904:b0:2c7:ebfb:618f with SMTP id
 d9443c01a7336-2d670d299bdmr132599335ad.14.1787427853457; 
 Sat, 22 Aug 2026 12:44:13 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d676895799sm5892715ad.38.2026.08.22.12.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 12:44:13 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, almer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 eleanor15x@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 7/7] docs/system/riscv: Add Milk-V Duo board documentation
Date: Sat, 22 Aug 2026 19:43:14 +0000
Message-ID: <20260822194315.2550260-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
In-Reply-To: <20260822194315.2550260-1-visitorckw@gmail.com>
References: <20260822194315.2550260-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=visitorckw@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add documentation for the Milk-V Duo board. This includes a brief
overview of the hardware, a list of supported devices, and practical
instructions on how to boot the machine using OpenSBI and a Linux
kernel with an emulated SD card.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                     |  1 +
 docs/system/riscv/milkv-duo.rst | 49 +++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst    |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 docs/system/riscv/milkv-duo.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f79334c59..9750a39ca3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1854,6 +1854,7 @@ F: tests/qtest/k230-wdt-test.c
 Milk-V Duo
 M: Kuan-Wei Chiu <visitorckw@gmail.com>
 S: Maintained
+F: docs/system/riscv/milkv-duo.rst
 F: hw/char/dw8250.c
 F: hw/misc/cv1800b_clk.c
 F: hw/riscv/cv1800b.c
diff --git a/docs/system/riscv/milkv-duo.rst b/docs/system/riscv/milkv-duo.rst
new file mode 100644
index 0000000000..1758db2c1e
--- /dev/null
+++ b/docs/system/riscv/milkv-duo.rst
@@ -0,0 +1,49 @@
+Milk-V Duo board (``milkv-duo``)
+================================
+
+The ``milkv-duo`` machine is compatible with the Milk-V Duo development board.
+
+The Milk-V Duo is an ultra-compact embedded development platform based on the
+Sophgo CV1800B SoC. The CV1800B features T-Head C906 RISC-V processing cores
+along with integrated peripherals.
+
+For more information, see <https://milkv.io/duo>
+
+Supported devices
+-----------------
+The ``milkv-duo`` machine supports the following devices:
+
+* T-Head C906 cores
+* Core Local Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* DesignWare APB UART (dw8250)
+* SDHCI controller
+* CV1800B clock controller
+
+Boot options
+------------
+The ``milkv-duo`` machine supports direct boot using a generic RISC-V OpenSBI
+firmware and a Linux kernel. The root filesystem can be provided via the
+emulated SD card.
+
+Running
+-------
+To boot the machine, you need a Linux kernel (built with CV1800B support), a
+device tree blob (DTB), and a root filesystem image (e.g., built via BusyBox
+or Buildroot).
+
+Use the following command to boot the system directly to the Linux shell:
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M milkv-duo -nographic \
+      -bios pc-bios/opensbi-riscv64-generic-fw_dynamic.bin \
+      -dtb /path/to/linux/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb \
+      -kernel /path/to/linux/arch/riscv/boot/Image \
+      -drive file=/path/to/rootfs.ext4,format=raw,id=sd-card \
+      -device sd-card,drive=sd-card \
+      -append "console=ttyS0,115200 root=/dev/mmcblk0 rootwait earlycon"
+
+This command boots the generic OpenSBI firmware, loads the Linux Image and the
+specified DTB, and mounts the ext4 root filesystem from the emulated SD card.
+The console output is routed to the ``ttyS0`` serial port.
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 2639866a3e..1e49055e29 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -69,6 +69,7 @@ undocumented; you can get a complete list by running
    riscv/k230
    riscv/microblaze-v-generic
    riscv/microchip-icicle-kit
+   riscv/milkv-duo
    riscv/mips
    riscv/shakti-c
    riscv/sifive_u
-- 
2.55.0.766.g2966f0265a-goog


