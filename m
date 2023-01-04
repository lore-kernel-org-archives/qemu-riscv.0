Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBt8-0008Vj-FL
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsw-0008Me-7B
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:30 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsu-0004zW-7A
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:21 -0500
Received: by mail-ej1-x636.google.com with SMTP id tz12so85977518ejc.9
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1t0N0tRAGBLSXopdQ2aZCaW6j+7EYMB+a4S4Z0Ax+Y=;
 b=NXf3buTStLj5mF9iDdLM4ngVyygOioxIe/xuES/sr9NLX5/CtT3WQ5ZbROOxphqbuZ
 pu8TXJxrUJ6i6Ylgnnqp4IzgWAvmtIFWy81GrLzYuJbH6abGiz56jhJLh1CO1f/j5VZZ
 bTrtFJKTAeyzRRki2347nW2sesuA5LDORBnOIwRMwI5Hd/J2PM0WtrfZ57FfwOPnfD4B
 lo5HOXw9mamm0MGTn7YKM1CNtiI+ErsLP8A0ukev0HVHpQ9am4HEqj6X/ej/L+0D/XCY
 7RnrMieLoHrnvfTM/TNomDDJjF2tAY2W22haF7X+l+OPja8I7ASA6Bze7cIB5/Xw4Q43
 7lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1t0N0tRAGBLSXopdQ2aZCaW6j+7EYMB+a4S4Z0Ax+Y=;
 b=JrqOtNo69GMFhcosENIS5KU3HeX+sfgRfZB1scZZ5c//dpIx6b4ghlj7ku6YmABgzs
 pOfPqYOj8VRKN6alr7kbRUHBDYOZ47FVajpbKBLDqFSEgINb3qT+38CXAh0oLOYgFd8w
 Syxx02kAdcKdW/Q/aSIsjngwRhSjjaBTtu0zW0koc+SFKBWvw8ZEUexnR6Jlo1Amn8Rj
 DyQZiZLppdlwc30+smm425HbEQHfAbaXSGEiTGHdyT5HK/ugos8iK28CURe2rQsZLhP0
 6FHFtok04DrNxK21hWxEIH9+mkTfKo/+N5spzrIgqSnj7zLJK3ldUywJeY8gBEjlQiDd
 KEgg==
X-Gm-Message-State: AFqh2kplVc7ItO/edQcBMUubAGyFA6tmLX2DqYyCKnwLHLbm5xqYE31i
 WI76oDWXd3ctlOzranTnn4gtYA==
X-Google-Smtp-Source: AMrXdXssHSSa5LiZHMRjBPw73fsqOkTnCPxsejVZc1PpyeXODCALtBNGsF5vzhF+IBIy0pARlQEmxw==
X-Received: by 2002:a17:906:d217:b0:7c1:6fc:6048 with SMTP id
 w23-20020a170906d21700b007c106fc6048mr40619376ejz.24.1672869919140; 
 Wed, 04 Jan 2023 14:05:19 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906200100b007ae1e528390sm15617822ejo.163.2023.01.04.14.05.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 03/20] hw/block: Pass DeviceState to pflash_cfi01_get_memory()
Date: Wed,  4 Jan 2023 23:04:32 +0100
Message-Id: <20230104220449.41337-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 04 Jan 2023 22:05:30 -0000

The point of a getter() function is to not expose the structure
internal fields. Otherwise callers could simply access the
PFlashCFI01::mem field.

Have the callers pass a DeviceState* argument. The QOM
type check is done in the callee.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 4 +++-
 hw/i386/pc_sysfw.c       | 2 +-
 hw/mips/malta.c          | 3 ++-
 hw/ppc/e500.c            | 2 +-
 hw/xtensa/xtfpga.c       | 2 +-
 include/hw/block/flash.h | 2 +-
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 8beba24989..866ea596ea 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -991,8 +991,10 @@ BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
     return fl->blk;
 }
 
-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
+MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev)
 {
+    PFlashCFI01 *fl = PFLASH_CFI01(dev);
+
     return &fl->mem;
 }
 
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c08cba6628..60db0efb41 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -187,7 +187,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                         0x100000000ULL - total_size);
 
         if (i == 0) {
-            flash_mem = pflash_cfi01_get_memory(system_flash);
+            flash_mem = pflash_cfi01_get_memory(DEVICE(system_flash));
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..43fbb97799 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1291,7 +1291,8 @@ void mips_malta_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                65536,
                                4, 0x0000, 0x0000, 0x0000, 0x0000, be);
-    bios = pflash_cfi01_get_memory(fl);
+    dev = DEVICE(fl);
+    bios = pflash_cfi01_get_memory(dev);
     fl_idx++;
     if (kernel_filename) {
         ram_low_size = MIN(ram_size, 256 * MiB);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 9fa1f8e6cf..b127068431 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1144,7 +1144,7 @@ void ppce500_init(MachineState *machine)
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
         memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
-                                    pflash_cfi01_get_memory(PFLASH_CFI01(dev)));
+                                    pflash_cfi01_get_memory(dev));
     }
 
     /*
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 2a5556a35f..bce3a543b0 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -459,7 +459,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         }
     } else {
         if (flash) {
-            MemoryRegion *flash_mr = pflash_cfi01_get_memory(flash);
+            MemoryRegion *flash_mr = pflash_cfi01_get_memory(DEVICE(flash));
             MemoryRegion *flash_io = g_malloc(sizeof(*flash_io));
             uint32_t size = env->config->sysrom.location[0].size;
 
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 701a2c1701..25affdf7a5 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -22,7 +22,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    uint16_t id2, uint16_t id3,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
+MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
 void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 
 /* pflash_cfi02.c */
-- 
2.38.1


