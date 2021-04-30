Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNKn-0008SO-EK
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKl-0008RQ-T0; Fri, 30 Apr 2021 03:13:07 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKk-0000Ia-72; Fri, 30 Apr 2021 03:13:07 -0400
Received: by mail-ej1-x62f.google.com with SMTP id t4so20419308ejo.0;
 Fri, 30 Apr 2021 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cN0ExC4hpilg3BSjgCzDHWu5wIAJzffjsHPo8GpLC24=;
 b=VdDntQq+L9iAWwe+03GCAtZ+nHJ1VQs5B9P3oe6GG6xzvNE+WWI/IMg1gtMt/NZJ4x
 iezF28cWIHNKO7AyA/WC5EIPoVJFdxRXzuW1ESXO0NCsiGuN4y1OLSyLzX1k7QmZ/3s0
 graT/Vgjmp/W9XJnmWMZ7kZZu13V83bPZmOqZZdxORu+Lq/iMSXlE2d/FQlN3lJjvSEp
 wb7k9QrZBnWb44oZMKdy5kBm9Ko08zx0hutZTgWWDfxikA9X+RAAFLuPu+hYGk1HMaBI
 o5zjDjv8+T8rjW0PTUTrmsCcm1X/Kqs4ygSMjF9Rv06Vz2g5g4Rsv/eOh83h+M+S47V5
 p33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cN0ExC4hpilg3BSjgCzDHWu5wIAJzffjsHPo8GpLC24=;
 b=UD/TOgt+1gfLzQpkHkzA4waVtuDJLG1Kn+2FPQ38RR0h/MkqbsfADrpd53xG4M4caz
 J7BeYBDOa9J4VxgwNTTFq/LBTsr2FhlxfYJGRjp9m6+QvSZ9Z4a0WUT3AylrxR/NYef5
 ZGS493VObER9UMkYQctB3XKlALL9DRXFzYKfPs1erIbE+xIsi67kF752xe++IOc3Phas
 tcK/VGSKG/DMOTWf1uQfP4JmkzNaCkf85UIC4zqQRCX3wOVRw+dB0Awve/28XppKA7KI
 uaqdXz+j2H6aQUZGxoFdJQ+kuWCwNT8fHtSiR1fBrYOlqAXhbHFx/xUaDTHzcduY4iTt
 SJxg==
X-Gm-Message-State: AOAM531Ue8mGA1IosSkjWtletjJ/K52ifzbKlcHQmVE9y/S2np8R0IzA
 nlKjJixfPu1h8wdO+fUb5xI=
X-Google-Smtp-Source: ABdhPJw21oCNnDMBFMnIfVlksyV0AuEhtXpc0OsHiGSWmAp52Rz2X3xCgWSq1sMQ7JwU2lil3RP3UA==
X-Received: by 2002:a17:906:a017:: with SMTP id
 p23mr2730821ejy.460.1619766783988; 
 Fri, 30 Apr 2021 00:13:03 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
Date: Fri, 30 Apr 2021 15:12:55 +0800
Message-Id: <20210430071302.1489082-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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
X-List-Received-Date: Fri, 30 Apr 2021 07:13:08 -0000

From: Bin Meng <bin.meng@windriver.com>

Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
we can use the new helper to set the clock name for the ethernet
controller node.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2:
- use "static const char * const" for ethclk_names

 hw/riscv/sifive_u.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7b59942369..1b8af0c07a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -96,9 +96,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
+    static const char * const ethclk_names[2] = { "pclk", "hclk" };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -413,8 +413,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
-    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
-        sizeof(ethclk_names));
+    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
+        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
     qemu_fdt_setprop(fdt, nodename, "local-mac-address",
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
-- 
2.25.1


