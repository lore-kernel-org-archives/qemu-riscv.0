Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCCFCA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 13:53:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCHDH-0001z4-6M; Thu, 01 Oct 2026 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xCHD6-0001y7-DV
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:52:32 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xCHD3-0000QW-Sw
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:52:32 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 00721157ae682-8a87fe69060so55730427b3.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790862748; x=1791467548; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=reN3bpltahWooNjA6qSggiCPW/mvOP7fkCIsk37+3FU=;
 b=Y82kPHDH6yQTVISrr7vlajGoZWetTDYlEncOBs7XRQglM0W5zJLPuiFXfo6HRiuWv/
 KzYYtfeenhMrQRWaDbtSA7WS49VpJIXRXsFGIoM5gTGsegQTALHamZe2Z5aElUcpLp13
 MZ/C5uhT87BMOSLUfd79GMJbhuLZCakcMvJFGKE6lyOxb34TBa6now4ysgWg1wouOHKa
 IW5NCCp7LsGwmE/PYPAw0ADG/+wxBI3pDns26qmRL/EhCqu/HT1Q9t+gDw/E1Mon9rOx
 bVApECjm3jbGrv8vkM9XiTcCPAXMKm9JYrK1F+mcFdChCNaV5qNkSRPHwEgiwvuMp0/i
 PGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790862748; x=1791467548;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=reN3bpltahWooNjA6qSggiCPW/mvOP7fkCIsk37+3FU=;
 b=dd9UvMs9HrrtEgowRE9ckNRDoK2FzslEMY1TaOmyepdwd6Qe1th0jm/soUFWAf0wEK
 IV49n/mYYgI6G/HE94TiOzyRko6KZuXXP51/0LOc7t4yCjPFnqLuMZNgfBBRuaZEVViw
 41HbQgUYLaeBA/rvFJvyI0wkQmtT6ucHwpJNN718/F+YSyf6piyK0WjY10QYumOypfqo
 rQIfoJ202Ifx2P/9moTaCItZbyE8hcAJY0Wzixa6vj2iAALNdxElEw+UohwqAvtM6Cw7
 2a1uq7AeeNFrlch/axx6BBxTR86lN9WCt6vNrZxToCWI7Iy5+cMNOJfPxYPt+VnIZVcm
 jGDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwd5Qq4KnVr+8BE0WY6hicNSANEHgs6eHeN6a1AAOVlwbdZfUz0lvTaX6GTWdhglKcOqo2ljCv0QAKm@nongnu.org
X-Gm-Message-State: AFq9FYJWRrHv2rKFi3BAt/AQrpGaGpG1/UOJGvq5+UIShyuzjtuKRLMP
 3kJcI7zAwCxO3ChkzPw1fR/OYHeE++eNrGWpF8+uT058znsbLM9MHhjappMiki9Wup0=
X-Gm-Gg: AYBFou3csBIjOq9e1pkKyXqtgnnTXXUQLbrJ1CqokPbOBchEMH7Gg+sO6czcJ4bUq5Q
 P9DGXMEM1BqEXB96YH43cSqoMQj5bSR5RYZi3a46cQXsNuIZnET32Z9bPy2Cs4t1BIqsGT781JC
 /lHopO0KwuBMHlsQGOxK4one24fT4+q+kxjGQkeKTr6fvGC6XVNbgToto3QzcFs8m1pZbZF5E9T
 a3k7/jmIMR3Vkat/wmVJvr1+nhmH96emQadQFu7ba/85zg7SZzpsxvbMgusH+ESwqTxXyrnoqfE
 CW4hAwbH64zJw5izN5fe8fLY9zlhXsM6tmOVk56KIRiA4MzqzDW70ZkuhkE66dpfvpueQGQRmHl
 NQ5slNT4ftDpU5XGfr18I7at4YlHYMgl0LuBFU7vCxfQF/ulY6kRmxeZH+Blk6kOybiS3P6psIR
 n4nN6Z6ChxUNUOMMniVqPdwmpBkJNeaTBRvmUgSFJChW1MuL+brcLbjVMOaaFcNhJk5xZbUDrYW
 T+RUsEKYz4ZgvZ6Hx2i9EPo4KvK5Z+5FRtvZF364I7rb1kWQamGJozvmDk=
X-Received: by 2002:a05:690c:ec9:b0:8a8:6fac:1525 with SMTP id
 00721157ae682-8ac93fe7fa4mr25151217b3.46.1790862748351; 
 Thu, 01 Oct 2026 06:52:28 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8acdac9e4d6sm10587707b3.11.2026.10.01.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 06:52:27 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 01 Oct 2026 08:52:10 -0500
Subject: [PATCH v4 3/3] hw/riscv/tt-atlantis: Update UART and I2C to use
 clk from PRCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-atlantis_prcm-v4-3-95d33c470eeb@oss.tenstorrent.com>
References: <20261001-atlantis_prcm-v4-0-95d33c470eeb@oss.tenstorrent.com>
In-Reply-To: <20261001-atlantis_prcm-v4-0-95d33c470eeb@oss.tenstorrent.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/riscv/tt_atlantis.c         | 23 ++++++++++++++---------
 include/hw/riscv/tt_atlantis.h |  6 ++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 10ae3c2850..4e6c39982c 100644
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
@@ -275,6 +276,8 @@ static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
     qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
     qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
     qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
+    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_parent_phandle,
+                           clk_phandle);
     qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
     qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
     qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
@@ -305,7 +308,9 @@ static void create_fdt_clk(void *fdt, const char *clock_name,
 }
 
 static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
-                           uint32_t irqchip_phandle, uint32_t clk_phandle)
+                           uint32_t irqchip_phandle,
+                           uint32_t clk_parent_phandle,
+                           uint32_t clk_phandle)
 {
     g_autofree char *name = g_strdup_printf("/soc/i2c@%"HWADDR_PRIX, mem->base);
 
@@ -314,7 +319,8 @@ static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
     qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
     qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
     qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
-    qemu_fdt_setprop_cell(fdt, name, "clocks", clk_phandle);
+    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_parent_phandle,
+                           clk_phandle);
     qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 100000);
     qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
     qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
@@ -356,7 +362,6 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
 {
     uint32_t aplic_s_phandle = next_phandle();
     uint32_t imsic_s_phandle = next_phandle();
-    uint32_t periph_clk_phandle = next_phandle();
     uint32_t osc_24m_phandle = next_phandle();
     uint32_t prcm_rcpu_phandle;
     g_autofree char *rcpu_name, *hsio_name, *pcie_name, *mm_name;
@@ -372,10 +377,6 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
      *                       aplic_s_phandle);
      */
 
-    create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
-                    aplic_s_phandle);
-
-    create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
     create_fdt_clk(fdt, "osc-24m", 24000000, osc_24m_phandle);
 
     rcpu_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_RCPU], "rcpu");
@@ -401,11 +402,15 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
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


