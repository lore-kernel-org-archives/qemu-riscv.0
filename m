Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWI1-0003b8-Mh
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33366)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHq-0003Nn-Hf
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHk-0000QL-Od
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHi-0007K0-J1
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:04 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so1397661pff.9
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=KdUinYphzGQDVuTLX+/ZSu8nDN42cj53AMC4AE9KtVs=;
 b=NZ0sjg9mxh8S/AV5NOeDNgNvY/CCHl+L4nElYc7ko/P7LAwP1FVGNpp/fBXHt+LmDZ
 kV+Kyhg3zJGLTYXKIBZb5MaFLY63AVFFBWbWszbf/4bB8aa+rhOCnaMjR7vVZpZqKDxb
 rRCy5HQCb6qZefaAL0Vtye8Kq9wCDkfgTa86GQDJQnF4y/XWIiYnlyfHZRdthu/sTFIA
 vfrYMvVQuVOEAKWtSCxCCmppDd+KkZWfirEZdKbZSEMnt7KdBohfV98mwW5sjHzGK3dZ
 XV3933iAirfPspwOj7j9xF8ry+dxqf1d8abuzhOIuJKuuzlxIY87AkzQZzhVAklH7Bdz
 nK2g==
X-Gm-Message-State: APjAAAWqAAeTr/pH0w9LHPrqmJx8FpUp8wUyLI8xoL4UW9hiWD98Cu93
 zttqhtL5ktSp80B8i+ykT9NrVEaP8yfy1g==
X-Google-Smtp-Source: APXvYqyGxX5moljggF5ozAHX52vpD4fFQ5y2J4e7tXcErYTzW55922HaNG1n3SoPDeWJ0a+jJ4eLeA==
X-Received: by 2002:a63:58c:: with SMTP id 134mr1395499pgf.106.1561649071910; 
 Thu, 27 Jun 2019 08:24:31 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id d9sm2374315pgj.34.2019.06.27.08.24.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:31 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:20:05 -0700
Message-Id: <20190627152011.18686-29-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: [Qemu-riscv] [PULL 28/34] riscv: sifive_u: Do not create hard-coded
 phandles in DT
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
X-List-Received-Date: Thu, 27 Jun 2019 15:26:14 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present the cpu, plic and ethclk nodes' phandles are hard-coded
to 1/2/3 in DT. If we configure more than 1 cpu for the machine,
all cpu nodes' phandles conflict with each other as they are all 1.
Fix it by removing the hardcode.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5ecc47cea35d..e2120ac7a5d3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -86,7 +86,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint32_t *cells;
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
-    uint32_t plic_phandle, ethclk_phandle;
+    uint32_t plic_phandle, ethclk_phandle, phandle = 1;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -121,6 +121,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
     for (cpu = s->soc.cpus.num_harts - 1; cpu >= 0; cpu--) {
+        int cpu_phandle = phandle++;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa = riscv_isa_string(&s->soc.cpus.harts[cpu]);
@@ -134,8 +135,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
         qemu_fdt_add_subnode(fdt, intc);
-        qemu_fdt_setprop_cell(fdt, intc, "phandle", 1);
-        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", 1);
+        qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
+        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", cpu_phandle);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
@@ -167,6 +168,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
+    plic_phandle = phandle++;
     cells =  g_new0(uint32_t, s->soc.cpus.num_harts * 4);
     for (cpu = 0; cpu < s->soc.cpus.num_harts; cpu++) {
         nodename =
@@ -192,20 +194,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
-    qemu_fdt_setprop_cells(fdt, nodename, "phandle", 2);
-    qemu_fdt_setprop_cells(fdt, nodename, "linux,phandle", 2);
+    qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "linux,phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
     g_free(nodename);
 
+    ethclk_phandle = phandle++;
     nodename = g_strdup_printf("/soc/ethclk");
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
     qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
         SIFIVE_U_GEM_CLOCK_FREQ);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", 3);
-    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", 3);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", ethclk_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", ethclk_phandle);
     ethclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
-- 
2.21.0


