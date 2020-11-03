Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZyOu-0001uo-Bc
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 10:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyOl-0001sl-IV
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:39:06 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyOf-0003Fc-Kq
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:39:02 -0500
Received: by mail-wr1-x442.google.com with SMTP id g12so19009859wrp.10
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 07:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sTjXEtaEx0p532skGRQSUwC3l0znHy7TZ0GvrpsgL+4=;
 b=nEtLfmz9/AO7uuOkWBZKnWO4vMlBRVL5vgEF02ti9QoPdU2xVAgCTivfMRbJevHieX
 cLkfOoNFKrxhS1XTTXNyiZmjXk6rngfGQQAUNfjqu1rsKaiL1s01L1I8KMGL1Mp+xHlk
 O4h8a7NsczawvGNvPdeLDmJNXLc7+Sc375Fbbc0LHeuqsgSk0TMpl9EX1mo2PkvVRSYG
 tvTeaIiur4FY4e95wPFk0/jhGPoKVvb5EQE0+h3ir/rqZ9VwCtgwy1kpRyPadXBXITje
 TGZKM/eTPoKdvztR1DFyU9LpUwHfAXo2cU+yDuOwD1ju7t2iFr66KUpz7+dl6lDYX3sY
 MnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sTjXEtaEx0p532skGRQSUwC3l0znHy7TZ0GvrpsgL+4=;
 b=uOKBj4kzBO8oeNu4QNs6AUiUOGvfeZWpcJsZxL+7WhtdpQMp+UwhcU3q4GKqoYq4Au
 TVJfs05eR51w5QXzG1Ce+i6PajV6AGma1xEeZodYRRAwUzSSEGgdP62MkQUzjrImE96K
 2m5pnjQhf/eU6JWdJnnZP2tXqoh7fuCO9Y6goB9wLYcS/Fp37LpRIQaELkWXKTOpxgYb
 479oeJjyBpmFzU2G9kkqBvoLxE51zYVM8iEDhEiKWGvPMzqjgByKw5HKKY+8T8704FhS
 FAsJAcPHJR1L4r5zKDuYHZeEJuwrd0ihvQ+rKUck1jrs64PmS6YYb/FG6Rb9JszH2MfX
 zOug==
X-Gm-Message-State: AOAM530DMcDrntwmlqujRTmLqQdTLCAnYM/3Pev5qTPqfIORdTiM3ZCm
 tfmvpg+SqBVv2mCcD8aIwrExbFkF0xQTuBJ3
X-Google-Smtp-Source: ABdhPJzWUxNv46CFmeGkfKmzkxdldenKcL+SAJdAtcMMIAw/2+5xgI/GS4UxuWjOqah5MU6BE/Lqrw==
X-Received: by 2002:adf:e446:: with SMTP id t6mr25661587wrm.46.1604417934927; 
 Tue, 03 Nov 2020 07:38:54 -0800 (PST)
Received: from thurso.iroazh.eu (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id f8sm1293862wrt.88.2020.11.03.07.38.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:38:54 -0800 (PST)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH 1/1] hw/riscv: clint: timebase-freq is machine-specific
Date: Tue,  3 Nov 2020 16:38:44 +0100
Message-Id: <20201103153844.91458-2-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103153844.91458-1-emmanuel.blot@sifive.com>
References: <20201103153844.91458-1-emmanuel.blot@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 03 Nov 2020 15:39:11 -0000

* sifive_e (HiFive1 platform) uses a RTC clock running at 32.768 KHz
* sifive_u (HiFive Unleashed platform) uses a RTC clock running at 1 MHz

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
---
 hw/riscv/sifive_e.c            | 2 +-
 hw/riscv/sifive_u.c            | 4 ++--
 hw/riscv/spike.c               | 4 ++--
 hw/riscv/virt.c                | 4 ++--
 include/hw/intc/sifive_clint.h | 4 ----
 include/hw/riscv/sifive_e.h    | 2 ++
 include/hw/riscv/sifive_u.h    | 2 ++
 include/hw/riscv/spike.h       | 2 ++
 include/hw/riscv/virt.h        | 2 ++
 9 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 59bac4cc9a..89d0fe74b6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -216,7 +216,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
     sifive_clint_create(memmap[SIFIVE_E_DEV_CLINT].base,
         memmap[SIFIVE_E_DEV_CLINT].size, 0, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+        SIFIVE_E_CLINT_TIMEBASE_FREQ, false);
     create_unimplemented_device("riscv.sifive.e.aon",
         memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b2472c6627..403f614eca 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -155,7 +155,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        SIFIVE_U_CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
@@ -739,7 +739,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
         memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+        SIFIVE_U_CLINT_TIMEBASE_FREQ, false);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
         return;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index facac6e7d2..4beeeb4ef6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -98,7 +98,7 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        SPIKE_CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -244,7 +244,7 @@ static void spike_board_init(MachineState *machine)
             memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size,
             memmap[SPIKE_CLINT].size, base_hartid, hart_count,
             SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, false);
+            SPIKE_CLINT_TIMEBASE_FREQ, false);
     }
 
     /* register system main memory (actual RAM) */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6bfd10dfc7..837368696c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -213,7 +213,7 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-                          SIFIVE_CLINT_TIMEBASE_FREQ);
+                          VIRT_CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -543,7 +543,7 @@ static void virt_machine_init(MachineState *machine)
             memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
             memmap[VIRT_CLINT].size, base_hartid, hart_count,
             SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, true);
+            VIRT_CLINT_TIMEBASE_FREQ, true);
 
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config_len =
diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
index a30be0f3d6..04856fd04b 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -53,8 +53,4 @@ enum {
     SIFIVE_TIME_BASE    = 0xBFF8
 };
 
-enum {
-    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
-};
-
 #endif
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..dbaba7f205 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -80,6 +80,8 @@ enum {
     SIFIVE_E_GPIO0_IRQ0 = 8
 };
 
+#define SIFIVE_E_CLINT_TIMEBASE_FREQ 32768
+
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
 #define SIFIVE_E_PLIC_NUM_SOURCES 127
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a9f7b4a084..dcdc708799 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -137,6 +137,8 @@ enum {
 #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
 #define SIFIVE_U_COMPUTE_CPU_COUNT      4
 
+#define SIFIVE_U_CLINT_TIMEBASE_FREQ 1000000
+
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index cddeca2e77..d131bf4091 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -53,4 +53,6 @@ enum {
 #define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_BASE64
 #endif
 
+#define SPIKE_CLINT_TIMEBASE_FREQ 10000000
+
 #endif
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..d9e417852a 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -70,6 +70,8 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
+#define VIRT_CLINT_TIMEBASE_FREQ 10000000
+
 #define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
-- 
2.28.0


