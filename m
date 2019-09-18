Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbss-0007mL-7t
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsi-0007Vt-3p
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsg-00071C-Fx
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:35 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35528)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsg-00070o-9q
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so128445plp.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=D9npBpsUm7+Rm801Ap/KYbHj9DAYTiffDSrfZbUWHdg=;
 b=bjfJ3YQ43FocWFBVi1L3xIIKjLXq5jciVbpqQ2mdcJvzNEZFBu1XJV0wvSWLtXFCEs
 PTR+Zk3/bla3sy5OGL7s3G6P0eNpN1CdRJexmVxSUGBorRaJ2i10T+mdQIOQlxG3Gia5
 ZdITPlZgGfs9ydv9CYOC9LE+A3poaiaVasN/5WvQKpZukwVA1ylN/ePUEiH9QUqbO1ZO
 7Tzm3ftADxiBjlNp4wEFGjcZLrs89mgxWchbVIqh1VQcXEaySqtjByd5IpzKxD+reAnV
 uunqeaV04osz5Wu6VSVv7TWLTRsNwn9pXKpQfwN+V/jSgbM6xyGncf92W5giZ4NdSwoV
 Q1kA==
X-Gm-Message-State: APjAAAUm3bmASm35aSbo06bao4uMoeplWQGeois5Oeej6giiT91Hpg1/
 VVHqRRLIDolL2EjXMjFzsEnK36AXHtY=
X-Google-Smtp-Source: APXvYqwIfUQEUkht3MU59SaBctpDy3grrAP0U9Adq56baFslqV28pQJjs21XCgaLzBx5OIO+e6FaWw==
X-Received: by 2002:a17:902:aa93:: with SMTP id
 d19mr4662415plr.249.1568820512886; 
 Wed, 18 Sep 2019 08:28:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z19sm5605735pgv.35.2019.09.18.08.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:32 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:26 -0700
Message-Id: <20190918145640.17349-35-palmer@sifive.com>
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
X-Received-From: 209.85.214.195
Subject: [Qemu-riscv] [PULL 34/48] riscv: sifive_u: Generate hfclk and
 rtcclk nodes
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:41 -0000

From: Bin Meng <bmeng.cn@gmail.com>

To keep in sync with Linux kernel device tree, generate hfclk and
rtcclk nodes in the device tree, to be referenced by PRCI node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 23 +++++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d80b203cc1..7eefe9796a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -79,6 +79,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
     uint32_t plic_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
+    uint32_t hfclk_phandle, rtcclk_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -97,6 +98,28 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
 
+    hfclk_phandle = phandle++;
+    nodename = g_strdup_printf("/hfclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", hfclk_phandle);
+    qemu_fdt_setprop_string(fdt, nodename, "clock-output-names", "hfclk");
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_HFCLK_FREQ);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    g_free(nodename);
+
+    rtcclk_phandle = phandle++;
+    nodename = g_strdup_printf("/rtcclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", rtcclk_phandle);
+    qemu_fdt_setprop_string(fdt, nodename, "clock-output-names", "rtcclk");
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_RTCCLK_FREQ);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/memory@%lx",
         (long)memmap[SIFIVE_U_DRAM].base);
     qemu_fdt_add_subnode(fdt, nodename);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 6b2b5b68e2..24418145aa 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -69,6 +69,8 @@ enum {
 
 enum {
     SIFIVE_U_CLOCK_FREQ = 1000000000,
+    SIFIVE_U_HFCLK_FREQ = 33333333,
+    SIFIVE_U_RTCCLK_FREQ = 1000000,
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
-- 
2.21.0


