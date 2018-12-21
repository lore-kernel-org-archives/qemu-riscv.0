Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHG-0001Wu-F1
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:03:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHC-0001Tk-Tl
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNH5-000468-BC
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:45 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:42228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNH4-00045e-PF
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:43 -0500
Received: by mail-qt1-x841.google.com with SMTP id d19so6162497qtq.9
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=ZFe5OLfgkbGyNHW683WS7kU/EYaB5fvA+Mo6gZiihOw=;
	b=WA1hu0ATw5P872RVR53pSPFfN0wT3/cEIm4Mc76YwTq0J3mHbSoOzHTYFXrA94NCbS
	ql0R97LQa06CnjHZhkLFnETPuj1uSsg0DCIFH7GWmCKdCc0QJc7kC+r5A9FYfuo/eRwq
	3+hqamQ0qbrbs8wilQQcz2Emh/GnZaO7KXlDjM6NCLpwAZ5lUjLbeNBQDrAXezYOQidP
	LZ5cGumCuO3PPw0UFYm/2fRuhnbYsPEWAlyK2jDsPPxs2nFcIBBt9wOvPb/ob0cTtIwW
	lIQzk1EzAtHbHk+3F7GJ6WxJv4GzrsJ9N4LwLZK/3Er0CABiWYBtaVXXykZATE2PbCM0
	KGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=ZFe5OLfgkbGyNHW683WS7kU/EYaB5fvA+Mo6gZiihOw=;
	b=h47Ui8Nd2NUlsViOf5MV255fxYd6fNpD18Bf+PLSU7qF0s0wJVgzs0UMtSGERnen+X
	V+QMI4uTAWoRD6dvNS5XG1TmcamSotNZjqrzOq4yQd8U6NzUYCvOwXI7KN9eULQ5qlhn
	LT0fl5fvshjsU2b3dg/Si8YSOs3LiE2ivADwoCtqvQVEGbWFdHc0Ox+VZP8P2M+XgoXq
	7KTzWyBbJJvlBMhdt+naBcSDKi79r6PyAvXT3teXn6N0EXMG2zQVUoLCBdMqyxXMfWs+
	4yhe2NftHCv6fpk63d1Dzpg+EiE0Z3+923TW3p5WB+7ozL9hfYuEWiqRtRXAhP9T9Hes
	qE4w==
X-Gm-Message-State: AJcUukdsfCPUShHIraVPx/2gqrPEvA4hrX1jmuPxin6J/cu0BlaJCmaP
	9SeH3OW8z2WyQpxlT34wj3J+zgjxDP4=
X-Google-Smtp-Source: ALg8bN6+XskU91DsmCTzLPLmxw5+yyCwMsHUWRS8+tbCbOMZjWlms19RdhAbjm/Tofar3qAVvmRPGg==
X-Received: by 2002:a0c:b407:: with SMTP id u7mr2842358qve.179.1545408222095; 
	Fri, 21 Dec 2018 08:03:42 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	u16sm7447467qkg.14.2018.12.21.08.03.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:41 -0800 (PST)
Date: Fri, 21 Dec 2018 08:02:58 -0800
Message-Id: <20181221160307.14819-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
	Anup Patel <anup.patel@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: [Qemu-riscv] [PULL 05/14] sifive_u: Add clock DT node for GEM
 ethernet
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2018 16:03:51 -0000

From: Anup Patel <anup@brainfault.org>

The GEM ethernet on SiFive unleashed has fixed input clock
of 125MHz as-per SiFive FU540 manual. This patch updates FDT
generation for QEMU sifive_u machine to provide fixed-rate
clock for GEM ethernet.

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 18 +++++++++++++++++-
 include/hw/riscv/sifive_u.h |  3 ++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ef07df244241..5c41ee5017e4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -85,7 +85,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    uint32_t plic_phandle;
+    char ethclk_names[] = "pclk\0hclk\0tx_clk";
+    uint32_t plic_phandle, ethclk_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -197,6 +198,17 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/ethclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_GEM_CLOCK_FREQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", 3);
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", 3);
+    ethclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -208,6 +220,10 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "phy-mode", "gmii");
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        ethclk_phandle, ethclk_phandle, ethclk_phandle);
+    qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
+        sizeof(ethclk_names));
     qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
     g_free(nodename);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e8b4d9ffa3fb..be13cc1304cc 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -63,7 +63,8 @@ enum {
 };
 
 enum {
-    SIFIVE_U_CLOCK_FREQ = 1000000000
+    SIFIVE_U_CLOCK_FREQ = 1000000000,
+    SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
-- 
2.18.1


