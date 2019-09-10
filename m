Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwS-0008Vg-4Q
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwK-0008Kf-Iv
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwJ-0006pS-AM
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwJ-0006p0-5B
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id t17so2328426wmi.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Vf8orQoCr70Vddp/7MqIPffmdMREbqhw90IvJdtFKJA=;
 b=gnkUYV+cpZ1692uOpm7YqPiXzO+hlbUQdWC30yWCl3DAtVcCUB+KYuExHZnfHWqUai
 lzSoYdltd4mtXWeGnektnbu/8HtkqBWBCwtYmrJcRCmRbmoublgGFvYEFDIxCNgR8/FK
 6eSzVuPzHJTeFuPpbPvYOSd15GgVVE0JuGXgcIoLLpdnZ4HVGLLdicXpqKKCq+s0A4Jt
 P9Fddq3BSyQ6oXNI6mI7Kl49aT6Q+zJ+UGPpwr5vozwoQg2CgwsRxmqpzNiyf4Rp6EfH
 jPmn9Bv4gJy/SdnSeWDR0vTGav7+CyrGN2AF9mVrNWmQf5MKjweACYrbXDOb3pDxggHU
 lriw==
X-Gm-Message-State: APjAAAVc/066ikYxr4E/CZD/0TLmv69EnJnUJSetjhSL4UKlpkZ9pOeP
 hAPMV/2fHgEMmrf8a7HiwKxao0UmfB+N0A==
X-Google-Smtp-Source: APXvYqywT0F9dtlj/JhI/gKN0VtHoGocKhojWd3EU2k2mtIzRhS4Iyq1eWGZ6hUG6AiGQ+GMb3TziQ==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr2684119wml.158.1568190321785; 
 Wed, 11 Sep 2019 01:25:21 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id v6sm3683422wma.24.2019.09.11.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:21 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:00 -0700
Message-Id: <20190910190513.21160-35-palmer@sifive.com>
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
X-Received-From: 209.85.128.67
Subject: [Qemu-riscv] [PULL 34/47] riscv: sifive_u: Generate hfclk and
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:27 -0000

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
index 713c451e85..3ee6fcbd12 100644
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


