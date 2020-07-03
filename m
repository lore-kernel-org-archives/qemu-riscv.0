Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrCDV-0007wk-HO
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 23:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDT-0007sb-T3; Thu, 02 Jul 2020 23:18:19 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDR-0005xU-D8; Thu, 02 Jul 2020 23:18:19 -0400
Received: by mail-pl1-x644.google.com with SMTP id d10so63794pll.3;
 Thu, 02 Jul 2020 20:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vQX2ENn7C5a82lIVn8bFx2VOYI6O7PIoTdabJDVC7ZM=;
 b=qj95F6brXM/tEK4Zqy0TNpv2MkTqMvPxvVMVrhokRtdnDUNHRlYMWjELDy60vHsX3X
 HqCS/ZJgc7KB4ze95C89x+PIxuqjTdH1KuzrCpAi5fIhgJgG0fRsgnml62h/zQ8S3FLl
 tQ3FWKKxwFkDR9i1d9td+aGtaM8iWZq12vhjQCyf+1GhRApKebtCfGxHb5WbSmnNJkoH
 +pFz3PSHDzodOfNDdL7MlY5oErIoI1C0UUUB9qTrbXVxAEB4t6LPuIzlc/0FtEtY3Bst
 FA62xSpJII2rS3xqkBhKW24kWcqnuQYF2mlKepc91pEvOe7APF1qCfLdB4E8uUh65C+3
 oSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vQX2ENn7C5a82lIVn8bFx2VOYI6O7PIoTdabJDVC7ZM=;
 b=jqffGk8wyH4SJzC8xsS25X87lpMtlShKVQBTCUyGDq0C18/dxLW4PzAOwwpniVzOik
 6VCBSQb3ETQEf5ZDzqYkgmCNW8o7O6DD8PPxWmDtv72gh7Pq2R9lZ1zgGwVOwBdEYxfw
 goMU/DqgKQlOxr5D6XOQc4XcaBOn9xugmZmw/vgDcbj7otY67BSd9eWxEZWccBFG2JaS
 obBTWfoIZErTwUUz+w8tMH8fztZRuaxGhfaSTVdVYUgFTU8FQWxi2MLtGLZ66QkFsB+D
 w3IGshb6qQA7N8YnWKdPASNO/b2aHivWb2uSclyQmTAmpwot1saokali2PXH04tUHknK
 E92Q==
X-Gm-Message-State: AOAM533YM5PDY9b/Oj8zkP6BevtGp5MAzcBhS0O2CCNoZjPhhHAVL08f
 TL1Fl6dXQlNNC8Cj5YiF/MY=
X-Google-Smtp-Source: ABdhPJxHxUTinRug4vFFtHkAcb9817zTZqJmdQtzA1F3dmFCSSsSJ/3By3ZTFKnDJsGSl6Vj3+tnLw==
X-Received: by 2002:a17:90a:e618:: with SMTP id
 j24mr5094467pjy.41.1593746295930; 
 Thu, 02 Jul 2020 20:18:15 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id c12sm10165745pfn.162.2020.07.02.20.18.15
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 02 Jul 2020 20:18:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 3/7] roms/Makefile: Build the generic platform for RISC-V
 OpenSBI firmware
Date: Thu,  2 Jul 2020 20:18:03 -0700
Message-Id: <1593746287-19251-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
References: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 03 Jul 2020 03:18:20 -0000

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

---

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


