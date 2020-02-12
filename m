Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1vqO-0001uS-CW
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 12:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqK-0001s7-N5
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqJ-0000FJ-Fi
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:32 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39542)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1vqJ-0000Eu-A8
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:31 -0500
Received: by mail-pg1-x544.google.com with SMTP id j15so1565864pgm.6
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2020 09:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=fWYdInuXdi5U3CfWEMdan7mlXYenJwqmmaeSguil5eE=;
 b=XouklbCVUiMwh5Cfxnf1KBXmKIv0Occ4t9y3NFa5VxBktN4jg30t9Hu96jxmqVHSbi
 HMkiQ9TzLVtt09kPgHyTiDYD8OU1Ggt/zePY7kZH1SjCbD0DjMQsRvIcPUqywLjrT5rU
 xvvuLeyD+lORZ6LqHwoYvCAW4XF4cxppENOmNFY07L2iwvFgYDYpObhElD7q6Foeyomh
 kudM/glY3/5DSDDVoPgJksgwitLaxotm0Byy3uraAMi+U4i6UbimcRK+r/LCrWjECxhO
 vP4LKndh0b5DmspPz+836BlLoqwrA/7sCDPfh1bL3Yl2gkxa5i9MhbH267nnbOUjkPvI
 CtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=fWYdInuXdi5U3CfWEMdan7mlXYenJwqmmaeSguil5eE=;
 b=ah0X/NiF6zbChXXyEYTznVPXx7eXscjFFbdrIwP2W27idc8lxXKCRi2/v/A37cU60i
 UeSod4TxOY6G4g0hx1xBXa0CNCaeiN7sNgw1yu2AZ0vpbkj0EgTPJ0LCGKcNnbhLWZP6
 enoPjxynst5VSOGNa8dQL/YaygdvSQm/Yu3e/95dqeYtWd+eA+tv6PYLbO2vBPjtyIgM
 5CzamAa+AwsP1PcLQv9CuyTcWGcNQEwhyUfO6fBuTbhxQRd0bB/5y8CCo8sh2Q+zXLH4
 +U9WjWXpRqD4KbldVIcetDqUuoyG8wVwNasrePWPyic0u1P/smtNXNi9g0Ml/QY1sW2V
 1i+Q==
X-Gm-Message-State: APjAAAWPL+qrpgZt9nTU5sNt5I4S7QBzG9HxdWK27lNA/rGO4W6wAIDS
 ZAdBMcH0arqcR5wIf2tB7Slosg==
X-Google-Smtp-Source: APXvYqzUgaGMuF+xEgx9WJrN/JR4TMQgZY0DHRW8wmBugbu4MB3nUgcQAy6Y0mVzt9I3gwRgneWYmw==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr12673789pfm.106.1581528630055; 
 Wed, 12 Feb 2020 09:30:30 -0800 (PST)
Received: from localhost ([2620:0:1000:fd28:dc94:91b3:e554:4ae7])
 by smtp.gmail.com with ESMTPSA id t66sm1042302pgb.91.2020.02.12.09.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 09:30:29 -0800 (PST)
Subject: [PULL 1/5] riscv/virt: Add syscon reboot and poweroff DT nodes
Date: Wed, 12 Feb 2020 09:29:17 -0800
Message-Id: <20200212172921.36796-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200212172921.36796-1-palmerdabbelt@google.com>
References: <20200212172921.36796-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Wed, 12 Feb 2020 17:30:33 -0000

From: Anup Patel <Anup.Patel@wdc.com>

The SiFive test device found on virt machine can be used by
generic syscon reboot and poweroff drivers available in Linux
kernel.

This patch updates FDT generation in virt machine so that
Linux kernel can probe and use generic syscon drivers.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/virt.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c44b865959..6d682f8a78 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -182,11 +182,10 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
 {
     void *fdt;
-    int cpu;
+    int cpu, i;
     uint32_t *cells;
     char *nodename;
-    uint32_t plic_phandle, phandle = 1;
-    int i;
+    uint32_t plic_phandle, test_phandle, phandle = 1;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
@@ -356,16 +355,35 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     create_pcie_irq_map(fdt, nodename, plic_phandle);
     g_free(nodename);
 
+    test_phandle = phandle++;
     nodename = g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
     {
-        const char compat[] = "sifive,test1\0sifive,test0";
+        const char compat[] = "sifive,test1\0sifive,test0\0syscon";
         qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
     }
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", test_phandle);
+    test_phandle = qemu_fdt_get_phandle(fdt, nodename);
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/reboot");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_RESET);
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/poweroff");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_PASS);
     g_free(nodename);
 
     nodename = g_strdup_printf("/uart@%lx",
-- 
2.25.0.225.g125e21ebc7-goog


