Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrY-0004Vn-33
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrV-0004Ss-VU
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrT-0007wK-Az
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:53 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrQ-0007jh-3m
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:50 -0500
Received: by mail-qk1-x744.google.com with SMTP id y16so9621592qki.7
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=ZFe5OLfgkbGyNHW683WS7kU/EYaB5fvA+Mo6gZiihOw=;
	b=Vfgg9CZrTv0cwyLnFnWG7d5M0TjayKVr2eT51Y9c+Pgrt2sha/s8AcVKLtp1xbt5N+
	1F//W738G41VBkuvCJMK4eNTqutx73qZ10+wLEFXZX/jdkjGbYUrQS/ccXsVD+VL6RjR
	eGgxdc36rQDa0LpxHvXqU5gmWLRAUSQKzswZvZis0cI2M1KOXQIcXcVkyGeVTOiVdfLp
	QpSD2KwH8VDxRXkbKDdHOeIgpPiJlBGkTPbNhVJQtEN6R4+GjcatJMUdMMf1Japfz6fi
	9UnLTjso3PCYhQOxLizcItsc2771rB7THFzXXnfk7IjKoOHoPL1WV2EQYiuNWbjvZBWX
	VXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=ZFe5OLfgkbGyNHW683WS7kU/EYaB5fvA+Mo6gZiihOw=;
	b=Bsz2CYjGJXUOpCWOTmPRnXsg0TBHCVCC0BCuW9aPOe8SiPyLCg+y1SRjMDI50efbpA
	q5ks5Uo9BT0YHgYRT9umV7yJT85BdrScPK2bykBMLmqIsUULtRpXeouxZNrncIU2C/zM
	4xziema9zni1tfJ0JY97Ng8Gx4POtrZR/WcZaHYhsOcQQQRSyGHgk/1lR2BZrwNOaHSk
	8cV/SLR0w4LiFMjpp6yiKNU4BleRO7udzhdMYRNJ1mMQC8/PEkSYFZiUGuCjK33xgrDc
	64el/gzttsoUiJcfgsuKXSFQ1mtKFc4Fp2pBFKrMaDa4dZQ4biH+5pDKOwV1qsE2EsLc
	OyVA==
X-Gm-Message-State: AJcUukchh7g+4yBpxPaPigDYEnC/M030JIQgYss+J1ZPgmESDYtEPhCb
	axwKyntaQ/GWsQZs9Y0GkOjC3edYVto=
X-Google-Smtp-Source: ALg8bN7j4p0nsFZANa5APqW/P2jQkXnYBfjUCv+nNRuJZ8z4afSTGBC8byBdFnJ6cII5kzYDKfo+6g==
X-Received: by 2002:ae9:ec02:: with SMTP id h2mr18970936qkg.84.1545844822985; 
	Wed, 26 Dec 2018 09:20:22 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	q21sm15040646qtk.79.2018.12.26.09.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:22 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:56 -0800
Message-Id: <20181226172005.26990-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:55 -0000

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


