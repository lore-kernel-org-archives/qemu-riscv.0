Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k2Uvw-0001ZZ-QY
	for mharc-qemu-riscv@gnu.org; Mon, 03 Aug 2020 03:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k2Uvr-0001WF-Hc; Mon, 03 Aug 2020 03:30:51 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k2Uvp-00066Q-NE; Mon, 03 Aug 2020 03:30:51 -0400
Received: by mail-wm1-x342.google.com with SMTP id p14so13390385wmg.1;
 Mon, 03 Aug 2020 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rwBr69aKqgDUi0/A7pROTSLiqSwaDFaBxL8GlGAjDF0=;
 b=PTC/FycT8CzHBVoqL0iflTDofKuQhEgQzUPd9sXXlu/eMQ7mGDhFreRJsWmLLUxGQu
 zAdhkdWdxQDfIemGLjYsPkWViLt+QsK7Iol50ML4VN+1Jhw/26XzqYspac4K5xBNrwU+
 ClB1NsLd6YJd/uF3QmQiYBW4cPC9JygZ2etjYr/E58lXoAvhD12B4bENKdvTMOrEzj0f
 zs4wPlrRTPaxG0/14XdQ3QCkHjGja1QkJp7oKZIGJrCcnn2d/jPBootNunOBANuFBifL
 NxUhi7fng2VvsE6GU9wCBk4Zzg+FVbwJdjkSPRm76lIIahoDnOPTIQXprP6DNDU5KX+R
 jt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rwBr69aKqgDUi0/A7pROTSLiqSwaDFaBxL8GlGAjDF0=;
 b=LVdXxWc5eJacyL6pfeDE1mr1VEQocI9F+Rc0h4rq60kbGQM0OkxI2l4sWotYlmf82v
 iSyJXe7dL8c11S7B4p+uATyPshV/4A1OJxsdQaZw/rst7QUaFuHnFVZRsZotmDNRx3uS
 JO/HSmr1NblDdXpZIkL/grjwKfyo2HhjtUQxQKdHcu8eX3ERmKe1FKjuTjjNyfVnODQT
 uvpizgm3cDC1ok2ZI+G3dwR6b0T90WVuv3ucf4K/wJG7qAxtSv+/bdc8AjNE0XMcqe2v
 EyynFBiNpVmuAtbAITvdF14BSbD9ijXK6iC12DGCo5zr6e34b7yBKETTrHjWjRb2tB7/
 lNvA==
X-Gm-Message-State: AOAM533Gc9TKDQ36c1RGQjuTTUIGx/gL8OhMCaFdjN5vRUGHVI1gveuP
 NB1gHEEUmhT8rbIbBn2/byE=
X-Google-Smtp-Source: ABdhPJzrEySOHGYuHse4FS4X8/T5eecKDM7dbikf34to/iMfW1EPi/6LMZ+8cwAgWq48LCgyvTXfzQ==
X-Received: by 2002:a1c:4e0d:: with SMTP id g13mr14585678wmh.177.1596439847059; 
 Mon, 03 Aug 2020 00:30:47 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 130sm23969438wme.26.2020.08.03.00.30.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 03 Aug 2020 00:30:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 3/6] roms/Makefile: Build the generic platform for RISC-V
 OpenSBI firmware
Date: Mon,  3 Aug 2020 00:30:29 -0700
Message-Id: <1596439832-29238-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1596439832-29238-1-git-send-email-bmeng.cn@gmail.com>
References: <1596439832-29238-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 03 Aug 2020 07:30:52 -0000

From: Bin Meng <bin.meng@windriver.com>

The RISC-V generic platform is a flattened device tree (FDT) based
platform where all platform specific functionality is provided based
on FDT passed by previous booting stage. The support was added in
the upstream OpenSBI v0.8 release recently.

Update our Makefile to build the generic platform instead of building
virt and sifive_u separately for RISC-V OpenSBI firmware, and change
to use fw_dynamic type images as well.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v3)

Changes in v3:
- Change fw_jump to fw_dynamic in the make rules

Changes in v2:
- Copy the ELF images too in the make rules

 roms/Makefile | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/roms/Makefile b/roms/Makefile
index f9acf39..5d9f15b 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -64,10 +64,8 @@ default help:
 	@echo "  u-boot.e500        -- update u-boot.e500"
 	@echo "  u-boot.sam460      -- update u-boot.sam460"
 	@echo "  efi                -- update UEFI (edk2) platform firmware"
-	@echo "  opensbi32-virt     -- update OpenSBI for 32-bit virt machine"
-	@echo "  opensbi64-virt     -- update OpenSBI for 64-bit virt machine"
-	@echo "  opensbi32-sifive_u -- update OpenSBI for 32-bit sifive_u machine"
-	@echo "  opensbi64-sifive_u -- update OpenSBI for 64-bit sifive_u machine"
+	@echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
+	@echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
 	@echo "  bios-microvm       -- update bios-microvm.bin (qboot)"
 	@echo "  clean              -- delete the files generated by the previous" \
 	                              "build targets"
@@ -170,29 +168,19 @@ skiboot:
 efi: edk2-basetools
 	$(MAKE) -f Makefile.edk2
 
-opensbi32-virt:
+opensbi32-generic:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=$(riscv32_cross_prefix) \
-		PLATFORM="qemu/virt"
-	cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-virt-fw_jump.bin
+		PLATFORM="generic"
+	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
+	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 
-opensbi64-virt:
+opensbi64-generic:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=$(riscv64_cross_prefix) \
-		PLATFORM="qemu/virt"
-	cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-virt-fw_jump.bin
-
-opensbi32-sifive_u:
-	$(MAKE) -C opensbi \
-		CROSS_COMPILE=$(riscv32_cross_prefix) \
-		PLATFORM="sifive/fu540"
-	cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
-
-opensbi64-sifive_u:
-	$(MAKE) -C opensbi \
-		CROSS_COMPILE=$(riscv64_cross_prefix) \
-		PLATFORM="sifive/fu540"
-	cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
+		PLATFORM="generic"
+	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
+	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
 
 bios-microvm:
 	$(MAKE) -C qboot
-- 
2.7.4


