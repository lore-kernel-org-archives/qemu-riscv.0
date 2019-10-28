Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pf-0005OD-AF
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7PY-0005BX-QE
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7PU-0003o4-Qk
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:26 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46712)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7PU-0003mk-IZ
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:24 -0400
Received: by mail-pl1-x643.google.com with SMTP id q21so5766395plr.13
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=KVgeN0kV4rTOGuMaTvCma73OJgV+QlUJdKVdYosiemI=;
 b=Dxmdq4nJbMj1u9pgGfALUNhV5z+bWW0CVWMMiFggrhjk3Eh2ig8pYD5fY80MQivOAj
 3AQl0RTkGUSbb3/rAEVD//PBeOBmJhsRvziXZDLitUxDrY1Nz/pPc85RAHAXFFPb5NCr
 39dYjhkN7XdGRTNtXtTr9bIJLIpH4GU5+Pwgl0YcZKusvm5OKg2WAl5Ba3StyhTR3nv/
 aue/c/BD7jCmTpya6bu8cwvn95SaLBQmh/6Hoe+d7I/a5PQWHJw3P2dgVaTbZx4gEF1n
 sz9kNKK9954sejNjRHLdawUsFLUH+2mdOBXEsaLL3RucOczQiUMNYlXBQXSTakj4LEU4
 v9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=KVgeN0kV4rTOGuMaTvCma73OJgV+QlUJdKVdYosiemI=;
 b=YENuXkshE7RA/YuxmWwUY0CLcl+P82CpIWZsshA/rSeVPhkdzweJl6rfz+y2NT8QpV
 BU0QNS0/CQO5SKP/DkCgmLsL1xFOe/spFd4+feaQjNFmjpHOTAsO9HGoVn/W4F+jtK6+
 3sCAfKUFFBC0nO4SHEc1o/Tl/7pKOqHG6S+qM8Q8RgDD0knpXilglAXmw128+YnGXpWw
 ArUHpTZnersJ47duhyyISirCLgqJzYd6xDefPTGhFQsRlDqYf7W8Op2DykiwhSirUHdx
 DS3na3RaYrQUc0BOTSMQM6cNlt1ygaZzS3+DzaXCL6Z8xI8O1h5ZvvqMIHA4gTSx+JfZ
 vP+w==
X-Gm-Message-State: APjAAAUWeB9GOiSyNSgfaBRKSJN1I5NnLyGPDPPMs5H6hEjtkq094+ly
 vZcYz7cHAZs9t6puhxAjGniZkA==
X-Google-Smtp-Source: APXvYqycMFTOUlc633473BiPzYqZqNZdApPOPWCL/q9JLmQErJ0ETr1pqXWwWgt8DXSbsfAi7WRYfw==
X-Received: by 2002:a17:902:44c:: with SMTP id 70mr182075ple.176.1572278303088; 
 Mon, 28 Oct 2019 08:58:23 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i63sm5234094pgc.31.2019.10.28.08.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:22 -0700 (PDT)
Subject: [PULL 04/18] riscv: hw: Drop "clock-frequency" property of cpu nodes
Date: Mon, 28 Oct 2019 08:48:48 -0700
Message-Id: <20191028154902.32491-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:31 -0000

From: Bin Meng <bmeng.cn@gmail.com>

The "clock-frequency" property of cpu nodes isn't required. Drop it.

This is to keep in sync with Linux kernel commit below:
https://patchwork.kernel.org/patch/11133031/

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 2 --
 hw/riscv/spike.c            | 2 --
 hw/riscv/virt.c             | 2 --
 include/hw/riscv/sifive_u.h | 1 -
 include/hw/riscv/spike.h    | 4 ----
 include/hw/riscv/virt.h     | 4 ----
 6 files changed, 15 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9f8e84bf2e..02dd76176e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -151,8 +151,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa;
         qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
-                              SIFIVE_U_CLOCK_FREQ);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
             qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d60415d190..8bbffbcd0f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -102,8 +102,6 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa = riscv_isa_string(&s->soc.harts[cpu]);
         qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
-                              SPIKE_CLOCK_FREQ);
         qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d36f5625ec..13030619d4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -161,8 +161,6 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa = riscv_isa_string(&s->soc.harts[cpu]);
         qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
-                              VIRT_CLOCK_FREQ);
         qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e4df298c23..4850805ee7 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -75,7 +75,6 @@ enum {
 };
 
 enum {
-    SIFIVE_U_CLOCK_FREQ = 1000000000,
     SIFIVE_U_HFCLK_FREQ = 33333333,
     SIFIVE_U_RTCCLK_FREQ = 1000000
 };
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index 03d870363c..dc770421bc 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -38,10 +38,6 @@ enum {
     SPIKE_DRAM
 };
 
-enum {
-    SPIKE_CLOCK_FREQ = 1000000000
-};
-
 #if defined(TARGET_RISCV32)
 #define SPIKE_V1_09_1_CPU TYPE_RISCV_CPU_RV32GCSU_V1_09_1
 #define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_RV32GCSU_V1_10_0
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6e5fbe5d3b..68978a13e8 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -55,10 +55,6 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-enum {
-    VIRT_CLOCK_FREQ = 1000000000
-};
-
 #define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
-- 
2.21.0


