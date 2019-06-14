Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hbl2S-0002ew-0F
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jun 2019 08:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51905)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hbl2N-0002aA-5q
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 08:10:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hbl2J-0003ua-Vc
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 08:10:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40686)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hbl2J-0003V5-GT
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 08:10:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so2073138wmj.5
 for <qemu-riscv@nongnu.org>; Fri, 14 Jun 2019 05:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=1/imMTLThbsIUg9X7x53ZVTveZQJ+RedU+3e0N9kmuw=;
 b=bptzGqeZ0hKi1v03Ehul/BRCINyq34/mW6dB7lGhMjjVIs9GBK1bMTPRHJ0WBREc2+
 6TwSJjz/eS9PIMMAOKc5x3NCgS2lHyCsUvhuaUwC0yXptr7xvFSkmOndnqDgpT7qmEVU
 r+sQ5eFKTE803pxmB10umlSxg/qD5gkR5RoLBXWQ5sfnAwLlfcIka/EnH/rMI+fjKfnR
 gSAWPUNfFkt/3P0VK4KPOtgQ/DpXfRAZzRz3duAgm/cRYsMQfQsHmMOm1BfAgbcVCEa4
 P0pjA+3xdkKNV6XJ+8Gxv0c9d9PihSfzhPBTZsrQCtYbVIiUHGQGXgOO6nkuXB6yBBsL
 4scA==
X-Gm-Message-State: APjAAAV9ydiBvY+jq+t/8u4nyi4cNgBtCBrK4/PhS3RHSeEKOohsRHwo
 2iO0gcN2u+KptN0Lc/AQ7AhZQg==
X-Google-Smtp-Source: APXvYqy56TBxLXwEG86ivExecUEC4oXKSbyP8sno4qVcYm/t+du44rBJWBmRtQWWlo+3rf70h91Z6Q==
X-Received: by 2002:a1c:4d6:: with SMTP id 205mr7166914wme.148.1560514194103; 
 Fri, 14 Jun 2019 05:09:54 -0700 (PDT)
Received: from localhost ([83.137.6.186])
 by smtp.gmail.com with ESMTPSA id f204sm3969987wme.18.2019.06.14.05.09.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 05:09:53 -0700 (PDT)
Date: Fri, 14 Jun 2019 05:08:30 -0700
Message-Id: <20190614120830.21850-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: [Qemu-riscv] [PATCH] RISC-V: Fix a memory leak when realizing a
 sifive_e
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
X-List-Received-Date: Fri, 14 Jun 2019 12:10:33 -0000

Coverity pointed out a memory leak in riscv_sifive_e_soc_realize(),
where a pair of recently added MemoryRegion instances would not be freed
if there were errors elsewhere in the function.  The fix here is to
simply not use dynamic allocation for these instances: there's always
one of each in SiFiveESoCState, so instead we just include them within
the struct.

Thanks to Peter for pointing out the bug and suggesting the fix!

Fixes: 30efbf330a45 ("SiFive RISC-V GPIO Device")
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_e.c         | 12 +++++-------
 include/hw/riscv/sifive_e.h |  2 ++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 80ac56fa7d5e..83375afcd1d6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -158,17 +158,15 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     SiFiveESoCState *s = RISCV_E_SOC(dev);
     MemoryRegion *sys_mem = get_system_memory();
-    MemoryRegion *xip_mem = g_new(MemoryRegion, 1);
-    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
 
     object_property_set_bool(OBJECT(&s->cpus), true, "realized",
                             &error_abort);
 
     /* Mask ROM */
-    memory_region_init_rom(mask_rom, NULL, "riscv.sifive.e.mrom",
+    memory_region_init_rom(&s->mask_rom, NULL, "riscv.sifive.e.mrom",
         memmap[SIFIVE_E_MROM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[SIFIVE_E_MROM].base, mask_rom);
+        memmap[SIFIVE_E_MROM].base, &s->mask_rom);
 
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
@@ -228,10 +226,10 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
 
     /* Flash memory */
-    memory_region_init_ram(xip_mem, NULL, "riscv.sifive.e.xip",
+    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
         memmap[SIFIVE_E_XIP].size, &error_fatal);
-    memory_region_set_readonly(xip_mem, true);
-    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base, xip_mem);
+    memory_region_set_readonly(&s->xip_mem, true);
+    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base, &s->xip_mem);
 }
 
 static void riscv_sifive_e_machine_init(MachineClass *mc)
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 3b14eb74621f..d175b24cb209 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -33,6 +33,8 @@ typedef struct SiFiveESoCState {
     RISCVHartArrayState cpus;
     DeviceState *plic;
     SIFIVEGPIOState gpio;
+    MemoryRegion xip_mem;
+    MemoryRegion mask_rom;
 } SiFiveESoCState;
 
 typedef struct SiFiveEState {
-- 
2.21.0


