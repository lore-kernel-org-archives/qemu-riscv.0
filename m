Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02A8C79F88
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 14:48:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2VD2-00039D-5U; Fri, 04 Sep 2026 10:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1x2VD0-00035R-1f
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 10:48:02 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1x2VCy-0004Wo-0s
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 10:48:01 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8726acc5eadso5015407b3.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1788533279; x=1789138079; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=biRWN0Vn6reTvQrPILLrlJnEjUgjTnAxX3bLorKSI6Y=;
 b=PyO8d/Q51yVrmK/nIH7y90Gg42biRCXqplE9DFsEbnyLmhNmdRx4YqvCalA7QgFZ9P
 AhpCilJ6U47pBAWn3+i2jzSY5+1lDbF71YTn0jhzkTNXUSoD6FEomFC5WOerHnWdCbcQ
 ncrztELj5EOAJPu0VKELHHC1fX+VkA5hW7yqyUUnu2ogf7cLYfoO/rjFwVlgsfrMlh5Z
 Mi3x/6BrH0uus9aTyHL74yv/yeUpP8wZ59M6jMiWFjxs2FCff7JOfh7JNUqQt9o27rZL
 M/tmcFB9XN/UwokjKhUVgLQsoWsiuSmui3DtUjTv88wl49b2RzlVa24YvcYeakBnbMAj
 zr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788533279; x=1789138079;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=biRWN0Vn6reTvQrPILLrlJnEjUgjTnAxX3bLorKSI6Y=;
 b=ibIwF69zMZC8iILarieICWDZUEz7DIzjeYFlJLXc0e7Zz4ftt3Jvk7zs7Tr19UOXow
 y8cyb+AtPJ7xBfCaEAN75hH2acZnVzImWEuLDc0M5PdDQeDl7c8zLY1RzfHZwrKFWXwz
 jvrrL+bd5O/oPcHjCAdFVoVkccVDe57l8F5Jhz1MRv2nCTPTtwLy1U9qXlgcnJdG4nrt
 CJRIP3jIZhemTQTw+tQ6fA+/CN8yRNl8qRaYdHHOoR98ya3K3fOEXArQeli3jWGWsUVc
 V5ytKZkl+IiGT4C0uMPY/JuazNQiiP9x4jOYxprIkQ+9bOGFFpH+TAqd4uD2dDPBECWn
 UnbA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtL0YajmuBGxdwLBW71pkylbIn2BJLISZdzKO2lJMg4bR9OVgQtQO6dpR5F35tv/DXg8BdMJUureYp@nongnu.org
X-Gm-Message-State: AFuF++nJnuLU/6tcnFhPjzOyxhcQk7Ir1ycpgTsWR5S1R/lG9HzoBQpI
 pKW0Jd/V/y3hhB2JcelMHurgxsw7scY4Lw89fHn6Gl3P5kDJQmswE8LvH8LSvW3xdMk=
X-Gm-Gg: AYBFou2f2i4oPXFvZl+DVmdcSNTUdeHafqVF8c+cQnJLE0tMQ9ucWjIi/KdrYd7ZoQQ
 RmUu+L/NC5gccxE/OIOj46wBj+63LF2dPfWpxXF1So4oE1HiFapVRxwUTCQNUpUnIA0s8hHTs1F
 dL94uHhFJvZhTa43RP0nK30ArfN9NhbZPzoIaFOB7+3h6YX3c5YjkYsuViJtFog8uJAd1POsTnG
 VNbF3u+CuHsbnmeKJAW8RxJA1MOUMM4tG/LP+dkuniQDdl6ZT3Nj+koI9KuDEaFCvQx8I7yobjG
 W03yOEOl0/AY9SOOMLsUOz7GmUcTUfr5jvNOQxpeFfKVtKhyNuQlvh6meJIpJdclY2dRbUQ+VGh
 NHRFgTP7C6Fcovov4cTsCoWF675f6+hLqTdo3Q9VO3D1jxxZjL9RO94N9MW2OK8z8eSnWjDKT7L
 kGn/nrVyLNeHULsTpBOFH4kFcqpnM2EXu8mI9Kgp3UM89K4WKlbUmHKFHuF4VTklDic137M8hq2
 KdZoGYYk1rbFkQPgVypFgQrzILPzA8Kq6L3hx581Y9Z
X-Received: by 2002:a05:690c:c4fa:b0:866:e57f:58db with SMTP id
 00721157ae682-8711ec239e9mr32273627b3.0.1788533278633; 
 Fri, 04 Sep 2026 07:47:58 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:6f99:bae4:e245:b362])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8714ab73f23sm19274597b3.33.2026.09.04.07.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 07:47:58 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 04 Sep 2026 09:47:30 -0500
Subject: [PATCH v3 3/3] hw/riscv/tt-atlantis: Update UART and I2C to use
 clk from PRCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-atlantis_prcm-v3-3-8bf20795a381@oss.tenstorrent.com>
References: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
In-Reply-To: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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

Now that we have the PRCM modelled, update the DT nodes for UART1 and
the 5 I2C controllers to use the rcpu_prcm as a clock provider. This
also allows us to eliminate the periph_clk that was added to the DT
previously.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 hw/riscv/tt_atlantis.c         | 25 ++++++++++++++-----------
 include/hw/riscv/tt_atlantis.h |  6 ++++++
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 15b4192f4d..8455329861 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -265,7 +265,8 @@ static void create_fdt_cpu(void *fdt, TTAtlantisSoCState *s,
 }
 
 static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
-                            int irqchip_phandle)
+                            int irqchip_phandle, uint32_t clk_parent_phandle,
+                            uint32_t clk_phandle)
 {
     g_autofree char *name = g_strdup_printf("/soc/serial@%"HWADDR_PRIX,
                                             mem->base);
@@ -275,7 +276,8 @@ static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
     qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
     qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
     qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
-    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_parent_phandle,
+                           clk_phandle);
     qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
     qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
 
@@ -305,7 +307,9 @@ static void create_fdt_clk(void *fdt, const char *clock_name,
 }
 
 static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
-                           uint32_t irqchip_phandle, uint32_t clk_phandle)
+                           uint32_t irqchip_phandle,
+                           uint32_t clk_parent_phandle,
+                           uint32_t clk_phandle)
 {
     g_autofree char *name = g_strdup_printf("/soc/i2c@%"HWADDR_PRIX, mem->base);
 
@@ -314,8 +318,8 @@ static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
     qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
     qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
     qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
-    qemu_fdt_setprop_cell(fdt, name, "clocks", clk_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 100000);
+    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_parent_phandle,
+                           clk_phandle);
     qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
     qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
 }
@@ -358,7 +362,6 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
 {
     uint32_t aplic_s_phandle = next_phandle();
     uint32_t imsic_s_phandle = next_phandle();
-    uint32_t periph_clk_phandle = next_phandle();
     uint32_t osc_24m_phandle = next_phandle();
     uint32_t prcm_rcpu_phandle;
     g_autofree char *rcpu_name, *hsio_name, *pcie_name, *mm_name;
@@ -374,10 +377,6 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
      *                       aplic_s_phandle);
      */
 
-    create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
-                    aplic_s_phandle);
-
-    create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
     create_fdt_clk(fdt, "osc_24m", 24000000, osc_24m_phandle);
 
     rcpu_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_RCPU], "rcpu");
@@ -403,11 +402,15 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
                            prcm_rcpu_phandle, TT_ATL_CLK_MM_PLL0,
                            prcm_rcpu_phandle, TT_ATL_CLK_MM_PLL1);
 
+    create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
+                    aplic_s_phandle, prcm_rcpu_phandle, TT_ATL_CLK_UART1_PCLK);
+
     for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
         create_fdt_i2c(fdt,
                        &s->memmap[TT_ATL_I2C0 + i],
                        TT_ATL_I2C0_IRQ + i,
-                       aplic_s_phandle, periph_clk_phandle);
+                       aplic_s_phandle, prcm_rcpu_phandle,
+                       TT_ATL_CLK_I2C0_PCLK + i);
     }
 
     /* I2C peripherals: qemu specific */
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index db1dfed157..577c867d71 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -99,6 +99,12 @@ enum {
     TT_ATL_CLK_RCPU_ROOT = 1,
     TT_ATL_CLK_NOC_PLL = 25,
     TT_ATL_CLK_NOCC_CLK = 26,
+    TT_ATL_CLK_I2C0_PCLK = 33,
+    TT_ATL_CLK_I2C1_PCLK = 34,
+    TT_ATL_CLK_I2C2_PCLK = 35,
+    TT_ATL_CLK_I2C3_PCLK = 36,
+    TT_ATL_CLK_I2C4_PCLK = 37,
+    TT_ATL_CLK_UART1_PCLK = 39,
     TT_ATL_CLK_HSIO_PLL = 54,
     TT_ATL_CLK_PCIE_PLL = 55,
     TT_ATL_CLK_MM_PLL0 = 56,

-- 
2.43.0


