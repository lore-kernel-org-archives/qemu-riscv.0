Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNL6-0000Qz-LM
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNL3-0000OP-E6; Fri, 30 Apr 2021 03:13:26 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNL1-0000US-3C; Fri, 30 Apr 2021 03:13:25 -0400
Received: by mail-ed1-x532.google.com with SMTP id i3so55716034edt.1;
 Fri, 30 Apr 2021 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fElpJp1+gGfKDOYhMNPiyFsjOP8fGNaHPojf2JKI0UE=;
 b=DOMkwaACvvdCEonFPiTR9zV9sOvi7lFjXk4VoXskT9NloL0D6OHjBNacWUyL0WzeOP
 ppnYapT6gxnSepPsTe5NjE/pPlsByhz2BJYKJTIrZnl56R23zxhICyFbU4tXpCEcLq/Q
 soWHagK+T6Iqp3oHL1Po+zcdOCP5DaJHWnk3pOebJVrOo826x/Xm8AteSI/erIoSf8pB
 Y2GhmGsYOkL4qPd2xvGV3lU5U2ZaN1LVhFqO4nx1xLZaNPVHotUvZEd+n5RMmHwvoE1C
 t/WSc7ysd7gxFO0GPZznHCBNZoWz91KPL+G9eGwNBCQ3JvQLvsYi01m+5i3Q++rvgPyE
 Ojqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fElpJp1+gGfKDOYhMNPiyFsjOP8fGNaHPojf2JKI0UE=;
 b=TZiZWONc0ZQTLLdHnYM8L528AGOmVH9LWNKqc8oN7kCpo0lkU0RuovgTkP+Ye2mlgM
 cg6ja1N63ZAqK/dJgzJNnESYO5K+a09+tks2LT8H5IQjxbIWOw+Od7ffYUIfGGmpjwFk
 JOSALxTmULR2axWysAcG4k8pNdVsGYMX1t+VdcYURNW5o5N/XkZJFejp/kEkEtn2nUiH
 uWUh3a6+3wY5dOiVTsGnAz1oA3diYsC+rHbsLr7YTdzvjQBMJ/LJITyJHCAMTgCNFpi7
 Xpx1WoKyb/LBnayxHE6LuZkqZxk3TwwpTQxZM99skSGM0OYtnoK3JFQsdXJDwUVwmn2v
 AXqA==
X-Gm-Message-State: AOAM530JGIjs19/FhwPnqwKMnMyaZEgVsttnLd6szOuTR1oy54VNAJtc
 tf21qPZlOz0VanoONcB/VNQ=
X-Google-Smtp-Source: ABdhPJwbXian9OO0L8A3SXry/8SAFm7PXBD57dM3z/c66RCxy55l+isScQ+xSWwsYV9iOhbgch7Tvg==
X-Received: by 2002:a05:6402:5211:: with SMTP id
 s17mr4006441edd.327.1619766801450; 
 Fri, 30 Apr 2021 00:13:21 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 6/8] docs/system/riscv: sifive_u: Document '-dtb' usage
Date: Fri, 30 Apr 2021 15:13:00 +0800
Message-Id: <20210430071302.1489082-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 30 Apr 2021 07:13:27 -0000

From: Bin Meng <bin.meng@windriver.com>

Update the 'sifive_u' machine documentation to mention the '-dtb'
option that can be used to pass a custom DTB to QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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


