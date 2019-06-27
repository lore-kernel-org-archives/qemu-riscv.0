Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHi-0003Jm-I4
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHW-0003A7-P6
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHU-00005E-Hk
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:50 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:40614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHT-0006pn-Eg
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:47 -0400
Received: by mail-pg1-f174.google.com with SMTP id w10so1175679pgj.7
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=4yIbg4wQD3g4mppuKoX6VmO7ZtWwJtsrHDtVUEb9gdk=;
 b=dQFoA1YuyQw3QevrxIc15z2zNVob0L4p6X2BNQ+XXGIFeLlPrqPvP+0kf7oFXm95LC
 FijCRnzbwComkPiE1YxVMgvm5KTf/lRfdyUBiKNcqvpbDlmFIBmmnFyN2BULLz+EDen1
 NzRHfnTyyuu5dMayInQ9qOyDA1xK/+9Gk0ImMczgDorz5aipDB3O4LOKoqhSeb3vixav
 rAFxYklmH1oOBV7ho10RYwqaNHPhZlqsEWesHySzOW86Q0mA0jZPGBe5MwFIPJbvnW31
 IMi6LJL/fu0fyu07pUegtp+lmQQuEFF/vU7m/MmnK3uyHJW8fLny1wZqJYTABx5QShGi
 /ZpQ==
X-Gm-Message-State: APjAAAW4rMrv69uQvgnf+nxsB1g2c/kiKYLNZgzf0E/2RgVw7ciQ2O/7
 u5joJrqIC16kzwVTOX+jgVhdV+zI+0+gnQ==
X-Google-Smtp-Source: APXvYqz6pcnvPX2KZOFHTXI7pFTur2BiU0yki97vVm4XDwHQNkUZkVKZDwP3Yvd6v8BIPoCiPUY8SQ==
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr6891888pjd.70.1561649032005; 
 Thu, 27 Jun 2019 08:23:52 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id h21sm2503665pgg.75.2019.06.27.08.23.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:51 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:49 -0700
Message-Id: <20190627152011.18686-13-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.174
Subject: [Qemu-riscv] [PULL 12/34] RISC-V: Fix a memory leak when realizing
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:58 -0000

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


