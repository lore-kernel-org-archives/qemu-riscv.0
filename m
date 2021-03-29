Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNh-000675-Gq
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNe-00060e-2Q; Mon, 29 Mar 2021 13:08:46 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNY-0004UR-1Z; Mon, 29 Mar 2021 13:08:45 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id q12so6795712qvc.8;
 Mon, 29 Mar 2021 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8tDeEgE0TFDEFmdJ0QWpvMrPLbpioisPTvCEKpdA6VU=;
 b=gc/7frZoSrXQkJNdaWmCQD+vebxniWAk2rUz/uGDDQ32gzVVmA4PsUP0lpcnkOG1o9
 IY8aTueolnvgISVz0lAcPYR95JJHPZ+1+aGm6+GO5Kc346sm+5O20L3q3OTwLyYeflpr
 nnIr6ubAxqwwrXkpu3ADT1B/xDEu+psTx2SIPTDmjkNAZhIph2rKebozGAMBYM31sb19
 kMyqIFCgrWUFMuri08a0xVBkf/x8UT4ENMJUOAO2JUvalHgVkZ+mldauP79vpgGujmyS
 km2imcgoRO8AMlO1m8Q1/53hdj51B5Ca7C/WrZIWv6DZrgHwH1xRBINHT1mn5ymxFJEF
 UoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8tDeEgE0TFDEFmdJ0QWpvMrPLbpioisPTvCEKpdA6VU=;
 b=hswlU/FM/M4CvNaiiwe5Zq5NUCOcWdOVpc5B6ca80+cfMhKTO6u6WREX8YzezZyXGg
 aYE5qtBtAtYcSL8X9KjV9ub8wMvCQZ4HSPIyvEWJ0eZqIdlWqO4hmEk7XWdmmqdHksDn
 SZMgdFmXhyFyIGR7v6mbI6HhW3ohuynLDJVtcS+17pW9guCypgnYCikGNOH6aNezMqf3
 SJSHzhETjKQvLmvrkjWts1dMdo5WlpNqB+pBVBb7zIiduyHvGJq0ciOqMKlhkLjSpyMj
 bkNnq9Q4VIiDxdDfV7PN6EtxKByxGifZyGIuuPFIBWRI92/4DIBbe/jsyv+jUhY/LspR
 bFIA==
X-Gm-Message-State: AOAM530zJHIt0QZYUka5W/39VirlTVwr9849bHDEI8aK5bqHm+HKVMKb
 vSexTRHbQjgR3nzSxZJvbKMdgVNSbMs=
X-Google-Smtp-Source: ABdhPJzmpn7epVwjVFV9siHIuCFFwg+XHjR6KzJYihudEeihRch1692NWS+Sl4IxNiKDys0jom0hag==
X-Received: by 2002:a0c:eb87:: with SMTP id x7mr26765156qvo.14.1617037718898; 
 Mon, 29 Mar 2021 10:08:38 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 6/8] docs/system/riscv: sifive_u: Document '-dtb' usage
Date: Tue, 30 Mar 2021 01:08:16 +0800
Message-Id: <20210329170818.23139-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:46 -0000

From: Bin Meng <bin.meng@windriver.com>

Update the 'sifive_u' machine documentation to mention the '-dtb'
option that can be used to pass a custom DTB to QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/system/riscv/sifive_u.rst | 47 +++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index dcdfbda931..32d0a1b85d 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -36,12 +36,21 @@ Hardware configuration information
 ----------------------------------
 
 The ``sifive_u`` machine automatically generates a device tree blob ("dtb")
-which it passes to the guest. This provides information about the addresses,
-interrupt lines and other configuration of the various devices in the system.
-Guest software should discover the devices that are present in the generated
-DTB instead of using a DTB for the real hardware, as some of the devices are
-not modeled by QEMU and trying to access these devices may cause unexpected
-behavior.
+which it passes to the guest, if there is no ``-dtb`` option. This provides
+information about the addresses, interrupt lines and other configuration of
+the various devices in the system. Guest software should discover the devices
+that are present in the generated DTB instead of using a DTB for the real
+hardware, as some of the devices are not modeled by QEMU and trying to access
+these devices may cause unexpected behavior.
+
+If users want to provide their own DTB, they can use the ``-dtb`` option.
+These DTBs should have the following requirements:
+
+* The /cpus node should contain at least one subnode for E51 and the number
+  of subnodes should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+* Should contain a node for the CLINT device with a compatible string
+  "riscv,clint0" if using with OpenSBI BIOS images
 
 Boot options
 ------------
@@ -122,6 +131,32 @@ To boot the newly built Linux kernel in QEMU with the ``sifive_u`` machine:
       -initrd /path/to/rootfs.ext4 \
       -append "root=/dev/ram"
 
+Alternatively, we can use a custom DTB to boot the machine by inserting a CLINT
+node in fu540-c000.dtsi in the Linux kernel,
+
+.. code-block:: none
+
+    clint: clint@2000000 {
+        compatible = "riscv,clint0";
+        interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
+                               &cpu1_intc 3 &cpu1_intc 7
+                               &cpu2_intc 3 &cpu2_intc 7
+                               &cpu3_intc 3 &cpu3_intc 7
+                               &cpu4_intc 3 &cpu4_intc 7>;
+        reg = <0x00 0x2000000 0x00 0x10000>;
+    };
+
+with the following command line options:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M sifive_u -smp 5 -m 8G \
+      -display none -serial stdio \
+      -kernel arch/riscv/boot/Image \
+      -dtb arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb \
+      -initrd /path/to/rootfs.ext4 \
+      -append "root=/dev/ram"
+
 To build a Linux mainline kernel that can be booted by the ``sifive_u`` machine
 in 32-bit mode, use the rv32_defconfig configuration. A patch is required to
 fix the 32-bit boot issue for Linux kernel v5.10.
-- 
2.25.1


