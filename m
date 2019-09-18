Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsx-0007ud-1h
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49919)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsr-0007lc-IS
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsq-00078y-3r
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34676)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsp-00078Q-VK
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so63059pgc.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=zoTfnPNo+HKyoYh1Fp8HDEvDsUoKiwqregGDjCmxaIA=;
 b=AA7ScT8vF2Nr6GMS74D8FVCkLeJjoq0KeNs7ezmBLo3G8I+6WDa/mXMk16UkVtCf/n
 h1Vm16X9GivdPo+hbPzRH+0SaDvsIxBFHXteWfw+vuqoagE2pAslGzhCqPCy3kjIMXIJ
 e/Kk5Yso9VC9/H1xnb1EEl9TYO8ffZ5Pbz1RTmDNitVWvyMcojkmxxAQecjapd4zyIeS
 Z5PuMNbPUJy6JDkRcZ4HKbpeBeF+uiKOMJOUNx7mA7FU7fLeI/7jcJJES3Y0ot/g2+Qo
 gupEG/5V8VHK4rRAknGsIxfe2SfKhk5w+SJEfvXkXSTpzJ3uZkpBNIqnJHy9XMEdxfIW
 94vA==
X-Gm-Message-State: APjAAAV4Bpb4VHBymlHCEUK0Obc1Cx4uKTiRlpi4F+6KezaIaMdE5QWU
 V6lxkr5f+LhE3IrJK9gRrEm3k/piuQ8=
X-Google-Smtp-Source: APXvYqyMsaKhmUbCXAf9TQciQDi4MI6xYzyllKPq4Io0+dtQffhbMUhHWb2uDT8XEGCj2cYoly3v+g==
X-Received: by 2002:a17:90a:1b48:: with SMTP id
 q66mr4416574pjq.79.1568820522421; 
 Wed, 18 Sep 2019 08:28:42 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 16sm5728461pgp.23.2019.09.18.08.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:41 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:33 -0700
Message-Id: <20190918145640.17349-42-palmer@sifive.com>
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
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 41/48] riscv: sifive_u: Instantiate OTP memory
 with a serial number
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:49 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This adds an OTP memory with a given serial number to the sifive_u
machine. With such support, the upstream U-Boot for sifive_fu540
boots out of the box on the sifive_u machine.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 9 +++++++++
 include/hw/riscv/sifive_u.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 24f8c19eee..f5f0c3cbb2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,6 +10,7 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  * 3) PRCI (Power, Reset, Clock, Interrupt)
+ * 4) OTP (One-Time Programmable) memory with stored serial number
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -64,10 +65,12 @@ static const struct MemmapEntry {
     [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
+    [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
 
+#define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
@@ -422,6 +425,9 @@ static void riscv_sifive_u_soc_init(Object *obj)
 
     sysbus_init_child_obj(obj, "prci", &s->prci, sizeof(s->prci),
                           TYPE_SIFIVE_U_PRCI);
+    sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
+                          TYPE_SIFIVE_U_OTP);
+    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -498,6 +504,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
+    object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
+
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
         plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
     }
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 7dfd1cb22e..4d4733cb6a 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -23,6 +23,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_u_prci.h"
+#include "hw/riscv/sifive_u_otp.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -39,6 +40,7 @@ typedef struct SiFiveUSoCState {
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
     SiFiveUPRCIState prci;
+    SiFiveUOTPState otp;
     CadenceGEMState gem;
 } SiFiveUSoCState;
 
@@ -60,6 +62,7 @@ enum {
     SIFIVE_U_PRCI,
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
+    SIFIVE_U_OTP,
     SIFIVE_U_DRAM,
     SIFIVE_U_GEM
 };
-- 
2.21.0


