Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvz-0007oP-7E
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvv-0007i1-13
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvt-0006Vi-M7
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35181)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvt-0006VL-Fa
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id g7so23513059wrx.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/cV1FoRB37702xFEPYsTUxzoU6W8aqJQp7ZqOEw3/TY=;
 b=G5awfAqO2IQwaPj/ybAfeeMaJGAQIR8CyVSOHMqr31UYXGXrtaICc28uFUR2F0oJ6O
 AR2w0TNxpqxMaJ2CRVvGrf7tVnGZB/24UvizMss1ZJsqgi1BKNJTD9xEUmn8ZkLKxMk/
 4uDG1gJE9r/HQHsJGBl5kkIJBTZ27oBrhojV5c4SSMt5zYLQfqUXFJNKeoF+bnDd5eqo
 Q6/DQEXth0sa/EUl3fSfBWQvccS2Xabwf1KvrZOGis8IRepU6JATR//M4+o7aX0uu/G4
 yb2fWR/3eUQLfSApWFDYK7YOw1wka0XAXOvDCOsGFWmILXly+K1eQqCPrla+WKyOTJ0e
 X+DQ==
X-Gm-Message-State: APjAAAXW6eYg8TtD0YVLkBPiuRa4QW6BfW39JqoD3QAZt0bd8ggnQkPp
 AUFVY6uiV5+do+ucs7mIaD3QqbDRD4oLCg==
X-Google-Smtp-Source: APXvYqwhtsVJlpBAwml60Uvw0DXXDGjojGBBUDUOke2p320H3HKDWnAykgK0dI+PGv8n6I+MDSbsBA==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr1596934wrw.304.1568190296002; 
 Wed, 11 Sep 2019 01:24:56 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id q15sm2077241wmb.28.2019.09.11.01.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:55 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:41 -0700
Message-Id: <20190910190513.21160-16-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-riscv] [PULL 15/47] riscv: hw: Remove superfluous "linux,
 phandle" property
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:02 -0000

From: Bin Meng <bmeng.cn@gmail.com>

"linux,phandle" property is optional. Remove all instances in the
sifive_u, virt and spike machine device trees.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 4 ----
 hw/riscv/spike.c    | 1 -
 hw/riscv/virt.c     | 3 ---
 3 files changed, 8 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ae5a16e636..0d9ff76a4f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -126,7 +126,6 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
         qemu_fdt_add_subnode(fdt, intc);
         qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
-        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", cpu_phandle);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
@@ -185,7 +184,6 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
     qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "linux,phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
     g_free(nodename);
@@ -198,7 +196,6 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
         SIFIVE_U_GEM_CLOCK_FREQ);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", ethclk_phandle);
-    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", ethclk_phandle);
     ethclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
@@ -234,7 +231,6 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", 3686400);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", uartclk_phandle);
-    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", uartclk_phandle);
     uartclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 7c04bd554f..d60415d190 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -112,7 +112,6 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
         qemu_fdt_add_subnode(fdt, intc);
         qemu_fdt_setprop_cell(fdt, intc, "phandle", 1);
-        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", 1);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 9bced28486..78091707dc 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -170,11 +170,9 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
         qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
-        qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", cpu_phandle);
         intc_phandle = phandle++;
         qemu_fdt_add_subnode(fdt, intc);
         qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandle);
-        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", intc_phandle);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
@@ -250,7 +248,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
     qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "linux,phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
     g_free(nodename);
-- 
2.21.0


