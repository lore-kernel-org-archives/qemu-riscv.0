Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapd-000669-2d
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51367)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapa-000618-93
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapZ-0006uZ-2l
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:34 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:44014)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapY-0006ry-Rc
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:33 -0400
Received: by mail-lf1-f45.google.com with SMTP id j29so1141220lfk.10
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=4yIbg4wQD3g4mppuKoX6VmO7ZtWwJtsrHDtVUEb9gdk=;
 b=YzHVurwkPKdI+xSUQVyDVHlUTlC+uF2ENuiNO+31TiHunSQ1xZ7gUjnXfQGZ/r3E2A
 UfMJn1UI5XhwcdpU6Cn6gGxFq5Q8cqOav/E00qN1ruihlIjBTEY1AWzaMoBCFel7XNCu
 OK9wkQuSCIan4BoGpDiJMZLpR00VBWhd0Rfyxm7lM7lxUxm/FzGl7yBGZOWx0bJzYUEk
 EgV7PZBZMwYNClTUUk8CDYrERacKKdjO7ZHQ4FQpp7sUlLOVdqXSW4/DxeSFYFw6pTez
 EjW5xaS+ptlstC34hKxcYTdsof8spy13pdDng7szAIq4Ua/Kf73WmhQ3XzjlBwb7baVQ
 Yahw==
X-Gm-Message-State: APjAAAVr7GN7LeWWTvDN+3Vfv27Xt2XqyGJIM0bCF3NHWSz//YTsenpa
 pFw0YWBcdE3x0XlOu0ybBss0+w==
X-Google-Smtp-Source: APXvYqzUL7DCZEzl/s+Kdth5aRdGBT/V7Hmgise26dm3QFGlUj3Q8nbrEh/Gytj/tVhVEJDPpf2UMg==
X-Received: by 2002:a19:ec15:: with SMTP id b21mr18835270lfa.32.1562143291306; 
 Wed, 03 Jul 2019 01:41:31 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id a17sm286737lfg.73.2019.07.03.01.41.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:30 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:28 -0700
Message-Id: <20190703084048.6980-13-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.45
Subject: [Qemu-riscv] [PULL 12/32] RISC-V: Fix a memory leak when realizing
 a sifive_e
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:35 -0000

Coverity pointed out a memory leak in riscv_sifive_e_soc_realize(),
where a pair of recently added MemoryRegion instances would not be freed
if there were errors elsewhere in the function.  The fix here is to
simply not use dynamic allocation for these instances: there's always
one of each in SiFiveESoCState, so instead we just include them within
the struct.

Fixes: 30efbf330a45 ("SiFive RISC-V GPIO Device")
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c         | 13 ++++++-------
 include/hw/riscv/sifive_e.h |  2 ++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 80ac56fa7d5e..a5b4086da36d 100644
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
@@ -228,10 +226,11 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
 
     /* Flash memory */
-    memory_region_init_ram(xip_mem, NULL, "riscv.sifive.e.xip",
+    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
         memmap[SIFIVE_E_XIP].size, &error_fatal);
-    memory_region_set_readonly(xip_mem, true);
-    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base, xip_mem);
+    memory_region_set_readonly(&s->xip_mem, true);
+    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
+        &s->xip_mem);
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


