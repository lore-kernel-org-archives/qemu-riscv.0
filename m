Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F18C9832F
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 20:15:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAvGV-0000Iz-BN; Sun, 27 Sep 2026 16:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvGT-0000Hk-GO
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:25 -0400
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvGR-0003aG-O9
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:25 -0400
Received: by mail-pj2-x0c.google.com with SMTP id
 98e67ed59e1d1-3a0d2c37b0bso643368a91.0
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790540062; x=1791144862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=96SiFbVYD8apnRQj28w96i7aN7o9LA5MwEa3NqgqTVA=;
 b=kevtGqM10yk2zu2pFBDS88B/d11d0Mg6lRDc74SP4RRB5WXFk0sZof85PmgkDLdrsv
 FZ44+UiLfCgvT+ywcqskZ4eUO/UlTz7EobP7NZpgJd37QoH5mjFC0EFl+KHExCI6mO5S
 nUCoe9TFDTmL7Fxn/x45kcjzY0AJpUzGFnZdnBkf+oeMrnJ2RToQgSRPrY5ijN0yPeJ0
 A5B04cy9artN7j5HHZAXXiS/04JTC1JPGphNDzrhRLyXP+1VLSYT0KvtjQ8ZoY8ylx/x
 niAUSM29Hvvx6HZThnzL/vpNzBrJGgTs9tpDsnFFgDQTVcG8FCpWN7zZa1Nl4pDmePnk
 nEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790540062; x=1791144862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=96SiFbVYD8apnRQj28w96i7aN7o9LA5MwEa3NqgqTVA=;
 b=Kv2mW4c3TcDBLUnjFT+5s7+ogo9ZRnqeK3lTNoaX5QQapbSqmHdekCubEJTiy7HBdx
 hw2QmbE7XR2B9+NoEjtU4JooPu2YrRZ2XF1n7mymqfJ7WhtoV8XBRJSpsUtgJx4WNTLr
 xNy4V5zB0wIFmw4AXAxnx+jGFVS4gwAzCvu1vuoybL27cMwyKtkVOcvqCwfz7YJeH5Mj
 UvIoaOg4CP5MdWktbxJlLQC03Oq20OpW3ENLULKwApuWqUNE63Ziqvn+RElU339kU+pC
 frjxlNpsDJoR5OZ3Ghe9W3YGdrGVGe3qpuDRrLYGcg4nUZzhQgdylXdFzKOw4qvXmAjz
 uaHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLS5ThWFh/jOfjVOxMTQ0TXxvP3W2L+8x2VeGmExmZa/WfGHeHh9b0jc+TI42pKueWQ3+XXNPFux3Q@nongnu.org
X-Gm-Message-State: AFq9FYIem+h5HULk/rfD2/URqBWArQAmMiFVrIklYyUm6hJrmElDSfXR
 /nOUqC9a8kQhPGllKvH6LzrOP6mRd/DXy0ptleDdpwQVvu/yUzHDTRPegk/9BawY
X-Gm-Gg: AYBFou2nJG2Awf4uruyVeO+nuSKSBB2/SEavnGROcTTAw9jLRJmYHAYnYqoCsXI1qdU
 0Z/Tl836vLEo1lEEJ80Qy5aZCv367ZzE/j8LoHDSdreUvhB52OkFuWOqJLTn6H5SULstTrEgSE5
 NGj/Dg2eEAEk4LEYC6BLdsWrV52KaHKZCB5OOLHKNbSut2+UMSkgN/LKkgniCEnjuOb5uTBZ55A
 6/Gf9wSDDT13hfvH7TbrEhFEi4wWmyydvVwARv6qLy/bcEGLIKHwWaln6xzwweZdpDE8Zlmb1EU
 sRRNcE9xZIHc3QRGTW+PiwtwAohKwzOZS23NvNLM7PjEOnsrKM2V40V+cMBt+ZYvVXUH3q8tGtK
 +hZAW7nEYC+4tIA6HzlwmEmBhEW0mJCHTwf+Wv4NtFYurNWabP+Q7uFieiYo2t49+O09ZAtviEb
 bPtGJTMZ/bMJU71owb7ioc7z+mYu9b76UqFFJKFfECcNJramSlc7YdbGoHZ63HF2nQt/ggFRE+W
 ABPEXp1hM9rPwb3N9CQdT5TtVmjk1vfeocbLz7E7LxT5ncVfW7Pnop1tM63Mf6jpeZZmw8dRBu8
 9oVahL23
X-Received: by 2002:a17:90a:e7cf:b0:3a4:6e84:e7ee with SMTP id
 98e67ed59e1d1-3a46e84e9f0mr404430a91.16.1790540062457; 
 Sun, 27 Sep 2026 13:14:22 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (33.223.194.35.bc.googleusercontent.com. [35.194.223.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0c719f86fsm13932737a91.7.2026.09.27.13.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 13:14:22 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 portias@oss.tenstorrent.com, wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw,
 marscheng@google.com, eleanor15x@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v5 7/7] docs/system/riscv: Add Milk-V Duo board documentation
Date: Sun, 27 Sep 2026 20:13:26 +0000
Message-ID: <20260927201326.650943-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260927201326.650943-1-visitorckw@gmail.com>
References: <20260927201326.650943-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::c;
 envelope-from=visitorckw@gmail.com; helo=mail-pj2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS                     |  1 +
 docs/system/riscv/milkv-duo.rst | 49 +++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst    |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 docs/system/riscv/milkv-duo.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 689424fd1c..027139bde2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1875,6 +1875,7 @@ F: tests/qtest/k230-decomp-gzip-test.c
 Milk-V Duo
 M: Kuan-Wei Chiu <visitorckw@gmail.com>
 S: Maintained
+F: docs/system/riscv/milkv-duo.rst
 F: hw/misc/cv1800b_clk.c
 F: hw/riscv/cv1800b.c
 F: hw/riscv/milkv_duo.c
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
2.56.0.rc1.315.gc6ed9934b7-goog


