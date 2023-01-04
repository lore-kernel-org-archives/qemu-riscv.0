Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBvd-0002PR-J5
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBut-00023r-D7
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:31 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuq-0000Gj-O6
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:22 -0500
Received: by mail-ed1-x535.google.com with SMTP id z11so34711988ede.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGtrWT3unMzGntIEiVbM1rKZ5m/rzhrczSjLQVOtSwU=;
 b=L8VYetCIidIpU/fp3MEWcHl7I1novORjIpl4CrXZ6tYviaBK4F95OwPJUnovX7s/cQ
 PM4jjnE9ZgBPJX0E0Hjhaunoldy74xxEVGsqlinc210RI/Q/TRS3rl43oe/c1L7b4uAF
 CNUpji0DFrN9eZewo1tHOzGlPfeDGnjjFQBo63HRb/9LZlcaSBQ/+6mjAEaW7LQDKhKO
 lmFDFvmb6sSYfed4mPCgvue5s0dcbDShs1RUbw7W1qxMWXvHIDqW6sY8h3pGdGe9ISGq
 2ll1WEDup5OxmQgbwOmDyY6Fab00CS1tgtosPIkNsTuotUv22SQJDKxsUG6A3zzqcMT5
 m0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGtrWT3unMzGntIEiVbM1rKZ5m/rzhrczSjLQVOtSwU=;
 b=Bmd+RHrjkBb73QWic2+ZNmn2i3SXdWCyJqyGejEGBjvPAzWbuzZd/DGibX/1cQVT83
 1PMPAPquTgP7YI1PG3Iv3KPmlSh9araStgVTR1o8vNz0V5QeeiAPyEhXbzb8ekE3ikiO
 3XmtoIIFEYzk8hNnNmo+Kjljv7nTr8QKuaD0wfWUwRJiE+6ZQ5vb/ef3t6oE1hYN21aj
 OT3/nOVwpUjvr6ElegI5+lOQ8WkmuQhsGZR2ssj1CUZLYQMsO2M2j+vP71Z0y4auNpVf
 gfWOLU51X8NxLok4R35YDvnSx+IgmjRZ6rUIPLHoO8JLIr6JOZhi/Pl44akNgRUVCw/K
 HNcQ==
X-Gm-Message-State: AFqh2kp/ocCE4wPtbEcuaFrX1YoB4GFDLBStMQRXF/aHfoX4jPjY6zFH
 /BE96xhYgJ/fZuuLgKGQTVq/7w==
X-Google-Smtp-Source: AMrXdXvFa31/5RG9b1OrjE3ODUivWLjwdIoMhA4EZhRaFx35WdWBe2cxRCU0pDK1KTxcxs3aWcIxPQ==
X-Received: by 2002:a05:6402:2488:b0:46b:34a:3945 with SMTP id
 q8-20020a056402248800b0046b034a3945mr50941348eda.31.1672870039232; 
 Wed, 04 Jan 2023 14:07:19 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fj12-20020a0564022b8c00b004722d7e8c7csm15042914edb.14.2023.01.04.14.07.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:18 -0800 (PST)
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
Subject: [PATCH 17/20] hw/arm: Open-code pflash_cfi02_register()
Date: Wed,  4 Jan 2023 23:04:46 +0100
Message-Id: <20230104220449.41337-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:33 -0000

pflash_cfi02_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove to remove pflash_cfi02_register() from the pflash API,
open-code it as a qdev creation call followed by an explicit
sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic_boards.c | 14 ++++++++------
 hw/arm/musicpal.c     | 13 +++++++------
 hw/arm/xilinx_zynq.c  | 10 +++++-----
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 4093af09cb..98b0002d16 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -115,13 +115,15 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
 {
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
 #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
+    DeviceState *dev;
 
-    pflash_cfi02_register(addr, "pflash", FLASH_K8P3215UQB_SIZE,
-                          NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
-                          DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
-                          4,
-                          0x00EC, 0x007E, 0x0003, 0x0001,
-                          0x0555, 0x2aa, 0);
+    dev = pflash_cfi02_create("pflash", FLASH_K8P3215UQB_SIZE,
+                              NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
+                              DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
+                              4,
+                              0x00EC, 0x007E, 0x0003, 0x0001,
+                              0x0555, 0x2aa, 0);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115..9f75d69b7f 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1275,12 +1275,13 @@ static void musicpal_init(MachineState *machine)
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
-        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
-                              "musicpal.flash", flash_size,
-                              blk, 0x10000,
-                              MP_FLASH_SIZE_MAX / flash_size,
-                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
-                              0x5555, 0x2AAA, 0);
+        dev = pflash_cfi02_create("musicpal.flash", flash_size,
+                                  blk, 0x10000,
+                                  MP_FLASH_SIZE_MAX / flash_size,
+                                  2, 0x00BF, 0x236D, 0x0000, 0x0000,
+                                  0x5555, 0x2AAA, 0);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                        0x100000000ULL - MP_FLASH_SIZE_MAX);
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..e55aff5532 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -218,11 +218,11 @@ static void zynq_init(MachineState *machine)
     DriveInfo *dinfo = drive_get(IF_PFLASH, 0, 0);
 
     /* AMD */
-    pflash_cfi02_register(0xe2000000, "zynq.pflash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 1,
-                          1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
-                          0);
+    dev = pflash_cfi02_create("zynq.pflash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              FLASH_SECTOR_SIZE, 1, 1,
+                              0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa, 0);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xe2000000);
 
     /* Create the main clock source, and feed slcr with it */
     zynq_machine->ps_clk = CLOCK(object_new(TYPE_CLOCK));
-- 
2.38.1


