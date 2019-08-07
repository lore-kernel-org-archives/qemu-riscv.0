Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGdz-0001KF-5j
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdv-00019a-F8
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdu-0008CE-BL
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:55 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdo-00085D-Ux; Wed, 07 Aug 2019 03:45:50 -0400
Received: by mail-pl1-x643.google.com with SMTP id t14so39456656plr.11;
 Wed, 07 Aug 2019 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=hMvYW7mfGG88MHubLGvzFP/RPmVwEJ+0YkprwoOzkJI=;
 b=WW03TmlSydrcgWS3Ky1fiuOAaOMIeeWTxaNVA0TQ2fZJRLZnma2L8QHJfR49u8PIkB
 lUoOuZQltl+IKKZ41yP207R0A3uC3/jShhlQramQlGQE1J3RIuMOATJagOy/3acUBWah
 HQ5tmlrqNtQsW7OkjdEr8KmaFS1jjvL/141yGYscRi9AKUV/K502hdgf0N7fzWwYWVmu
 6i3efgNisEQKjTrVZ0DQZCg/vUdkVMUKAimrNouVADFP3EwflaU7asgOCbDqB8OpbyvH
 tu7EJ3mml0R3ZE6JeFAGsdOGs8vxeUfT2ugRJrL1ahUaD/vy9isUKUWvNSn4zuBZqZ5D
 Qbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=hMvYW7mfGG88MHubLGvzFP/RPmVwEJ+0YkprwoOzkJI=;
 b=FUVZhpQ64YwawnWihHsWrjXrpo8k9h5cRyNRPbp54AfQWUfRK9KIyxDbB7/p8kIQ9Y
 FN0HFTSiWgzgHc0xZy3epplF+yZKi6QdQ+ACoL2tT4fFg48iexFY4GDdlTfyzs4mpO13
 +jxxtWv9nEnNy4Hf82yXzeTsnkm65CSeE8Dcs7/yR1VTSzCEFOhfe3WGaO4vBQ4eDrm2
 9y5kN51AUWkRSqwTrLrlMPBn4xJzHD1OERSmrhIKfj0VSYGjHknxTcr9ZADGGbsGqPUF
 YT1wvQi/nTd56QIyWIrth/+NqL22BBhB4GX70t9S/jThQoUFzeRchCsrm19ZoLv1m4BB
 0o9g==
X-Gm-Message-State: APjAAAXu+KpI59uQ1+c7ZSYvleGJs+w6eNnHsZRkLp4XhfCOB9wqUzDp
 xBimPXvkchSYGYHSI9NVsbI=
X-Google-Smtp-Source: APXvYqzYomUgvEMuPbWqxuH/uS3i6EHr4hpolpz4C0ocA5jyX8GpLuUfrfmDZbeRI70PCcobEv2hvg==
X-Received: by 2002:aa7:957c:: with SMTP id x28mr8018677pfq.42.1565163947443; 
 Wed, 07 Aug 2019 00:45:47 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.46
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:11 -0700
Message-Id: <1565163924-18621-16-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v2 15/28] riscv: sifive_u: Generate hfclk and
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
X-List-Received-Date: Wed, 07 Aug 2019 07:45:57 -0000

To keep in sync with Linux kernel device tree, generate hfclk and
rtcclk nodes in the device tree, to be referenced by PRCI node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v2: None

 hw/riscv/sifive_u.c         | 23 +++++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7557026..9529154 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -77,6 +77,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
     uint32_t plic_phandle, ethclk_phandle, phandle = 1;
+    uint32_t hfclk_phandle, rtcclk_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -95,6 +96,28 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
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
index 4abc621..bacd60f 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -65,6 +65,8 @@ enum {
 
 enum {
     SIFIVE_U_CLOCK_FREQ = 1000000000,
+    SIFIVE_U_HFCLK_FREQ = 33333333,
+    SIFIVE_U_RTCCLK_FREQ = 1000000,
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
-- 
2.7.4


