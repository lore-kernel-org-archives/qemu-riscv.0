Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1vqS-00022C-2M
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 12:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqP-0001wd-Bu
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqO-0000Hj-79
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1vqO-0000HY-1B
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:36 -0500
Received: by mail-pf1-x433.google.com with SMTP id y73so1578683pfg.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2020 09:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Nt+v+2a2R8OCW2A8v7JDC7oUY4W0g3AaQIDKQopbjks=;
 b=sKd52Z6Odm/TNz5cB/oMDPd+Bb91Z9ItEJf0LY18v3AfUpnjDN+D1Jhw6NCKu31y2L
 MhiTFtLSz4oiV9vYDik9Pj9TXjnUQ69rk9EUrQXW4EakqrSog+Vt/fE2B+CfZcbRA3aI
 IkLDob3LB1EvZ+MP4MF+4/psYXhplUCDVUFK7V2dQ1V+6EvMg6H9/Kkn1MBFnPy1ESHF
 sM3zaSeBbuOzg31AZf9X/IfMMPp8Ey56PUswwwN25CbydJVj1d+/9acRJ496Tnlu+vco
 ngwKn/JiNCzB7CSgoqw4EqP6re4ODF1P/8KTyBTcj1kdvCLMfrxtyLekKmsp6I27SuBq
 UqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Nt+v+2a2R8OCW2A8v7JDC7oUY4W0g3AaQIDKQopbjks=;
 b=jRjj5KgLiqSkfGlYw1sG5+1JT31eLXj8+tpcgEdsOxfRTfsEIjrebHGx6Ge/lKuN2G
 0sLc4KqhVA1s4VVzueM+BoOzNjpreyEsFPMlGZ9k4ZOmoDbi2BqrwqxNOTWTxRuat1Op
 dbtYXZmiB3DEkXFR2p96i5loliWWicn836zQyhSKcPhCS/9I8DMHHXVUWVgfVVyFhFo0
 HvBRRTQEFiR6kW5xQ62M/I2/uqO2FzwoqsLwsIXtI822P40QbrSAQriPaPikdlw4yjt3
 hnyeL/ki41Odfpia+mQ0+BQvUBIiVnyPY9v6BzmHJGugqD4HLCozIef+Ld9CXJ675s44
 JKhg==
X-Gm-Message-State: APjAAAVkTz11v21o+50tmQG7kiFnMDdKD2WClWqXDa6UD68sAq4Y+v8/
 hq2HqO2Loq1OG93f6m7p7+l78Q==
X-Google-Smtp-Source: APXvYqw9FseUqlYuywbmmkycabwrScfXLlguaoay0bTtwJ+CwJIqK1csvNwNwtG1ye6uF1CzFbnH9A==
X-Received: by 2002:aa7:991e:: with SMTP id z30mr12464445pff.259.1581528634938; 
 Wed, 12 Feb 2020 09:30:34 -0800 (PST)
Received: from localhost ([2620:0:1000:fd28:dc94:91b3:e554:4ae7])
 by smtp.gmail.com with ESMTPSA id 199sm1555910pfv.81.2020.02.12.09.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 09:30:34 -0800 (PST)
Subject: [PULL 4/5] riscv: virt: Use Goldfish RTC device
Date: Wed, 12 Feb 2020 09:29:20 -0800
Message-Id: <20200212172921.36796-5-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200212172921.36796-1-palmerdabbelt@google.com>
References: <20200212172921.36796-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
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
X-List-Received-Date: Wed, 12 Feb 2020 17:30:38 -0000

From: Anup Patel <Anup.Patel@wdc.com>

We extend QEMU RISC-V virt machine by adding Goldfish RTC device
to it. This will allow Guest Linux to sync it's local date/time
with Host date/time via RTC device.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Acked-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 16 ++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b12660b9f8..ff9fbe958a 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV_VIRT
     select PCI
     select HART
     select SERIAL
+    select GOLDFISH_RTC
     select VIRTIO_MMIO
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6d682f8a78..7f9e1e5176 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -58,6 +58,7 @@ static const struct MemmapEntry {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,       0x11000 },
     [VIRT_TEST] =        {   0x100000,        0x1000 },
+    [VIRT_RTC] =         {   0x101000,        0x1000 },
     [VIRT_CLINT] =       {  0x2000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
@@ -404,6 +405,18 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     }
     g_free(nodename);
 
+    nodename = g_strdup_printf("/rtc@%lx",
+        (long)memmap[VIRT_RTC].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+        "google,goldfish-rtc");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[VIRT_RTC].base,
+        0x0, memmap[VIRT_RTC].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", RTC_IRQ);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(s->fdt, nodename);
     qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "cfi-flash");
@@ -601,6 +614,9 @@ static void riscv_virt_board_init(MachineState *machine)
         0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
+    sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
+        qdev_get_gpio_in(DEVICE(s->plic), RTC_IRQ));
+
     virt_flash_create(s);
 
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b17048a93a..e69355efaf 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -44,6 +44,7 @@ enum {
     VIRT_DEBUG,
     VIRT_MROM,
     VIRT_TEST,
+    VIRT_RTC,
     VIRT_CLINT,
     VIRT_PLIC,
     VIRT_UART0,
@@ -57,6 +58,7 @@ enum {
 
 enum {
     UART0_IRQ = 10,
+    RTC_IRQ = 11,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-- 
2.25.0.225.g125e21ebc7-goog


