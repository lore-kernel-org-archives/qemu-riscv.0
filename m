Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsp-0007j6-NX
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsk-0007Yq-E9
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsj-000734-03
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsi-00072N-Ra
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:36 -0400
Received: by mail-pg1-f194.google.com with SMTP id a24so59507pgj.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=9AhKgQ71T7GwVFUeTQBXD6ty+rrwEGd8wRaMKnXTCJw=;
 b=drtFmf42gqhw3Ql84qNW/EmncOKN4gVLXj9iiZOrzO/aGjVc4D3fnmFrOv2yh24lh/
 0x1cKaL999ogF1TrRJIYiZ59nGKA3bCSiSIpB6Q31d47s2wV48MSZ1gRFm90mvTV4Xzr
 1OZDM6fX5d4456/AaBR6yxtZTCy7YIPu82T/L40sXRvXMJoeBoavrmLbPUxQtdOv8RYW
 /D2/7zvebU541Lq6O6T4yGs0tCWtHAGH0K0DnowN3HtQpMqLyGpz/JEucpPd+Rr/OA0B
 Pm1+PFHf7Yfwj5bsbCLVWDZUmP0X+PGFzG9wW4b4gtkM5YKfoRL831CIAdL0/y4yVlLd
 v2ng==
X-Gm-Message-State: APjAAAV29uvxL5uLfOrBWVXM7dzXZyH91nFiTWhngP76CY0UBxWpzh3+
 Qpa0WbbAMZeruQR97SvfcxqNuT1pizo=
X-Google-Smtp-Source: APXvYqz/Hp8V9otCALUOKWnWMeRGe+bOFY96F7rC8kLVugmH0GGH+jxDNqD2OtNnwqOZs2+egEFBkA==
X-Received: by 2002:a63:3805:: with SMTP id f5mr4496258pga.272.1568820515333; 
 Wed, 18 Sep 2019 08:28:35 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a8sm9235230pfa.182.2019.09.18.08.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:34 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:28 -0700
Message-Id: <20190918145640.17349-37-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 36/48] riscv: sifive_u: Reference PRCI clocks in
 UART and ethernet nodes
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:42 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have added a PRCI node, update existing UART and ethernet
nodes to reference PRCI as their clock sources, to keep in sync with
the Linux kernel device tree.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c              |  7 ++++---
 include/hw/riscv/sifive_u_prci.h | 10 ++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f6b868f49b..9e698a11c4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -78,7 +78,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    char ethclk_names[] = "pclk\0hclk\0tx_clk";
+    char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
     uint32_t hfclk_phandle, rtcclk_phandle;
@@ -263,7 +263,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
-        ethclk_phandle, ethclk_phandle, ethclk_phandle);
+        prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
     qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
@@ -293,7 +293,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "clocks", uartclk_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
 
diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
index 60a2eab0e9..0a531fdadc 100644
--- a/include/hw/riscv/sifive_u_prci.h
+++ b/include/hw/riscv/sifive_u_prci.h
@@ -78,4 +78,14 @@ typedef struct SiFiveUPRCIState {
     uint32_t clkmuxstatus;
 } SiFiveUPRCIState;
 
+/*
+ * Clock indexes for use by Device Tree data and the PRCI driver.
+ *
+ * These values are from sifive-fu540-prci.h in the Linux kernel.
+ */
+#define PRCI_CLK_COREPLL        0
+#define PRCI_CLK_DDRPLL         1
+#define PRCI_CLK_GEMGXLPLL      2
+#define PRCI_CLK_TLCLK          3
+
 #endif /* HW_SIFIVE_U_PRCI_H */
-- 
2.21.0


