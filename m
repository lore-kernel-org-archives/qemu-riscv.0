Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqV-0006qM-Fh
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq9-0006TZ-PF
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq6-0008HX-M3
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq6-00081D-9A
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so1169135lfb.4
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=fcm0+r8fxMNfE/F4H9Cg6/O9Ghx9bryN1yVdrSBGRYk=;
 b=on/LxMLYdYt728t0hmRptFM/QXMfeOOklHcpcYrqOvOSJwUbLC2AKXg+UjGGoWF8Gx
 2zHP0Ytv3PLU0kVyhxreI8dcVA39v5LVvJSl41h1aMfS0L4pDoScMLVUpL07YuDes1ok
 wu+iktyBcuNkRdBMDToQBJgbb0bId88IblpqvFAnf2QB42gu2Y7+Sttp13Hq/Yd6PbWP
 QnBoTndPebxf9031DrY/JvpMNBcBL8JrgrmWDFv1377k1ig+yRtwO7Mwev8VzvC5lMPG
 ihg/N572o//4UoF3K0dvSGbvc994yl5hHk9sXdxvqD0A/egPg4Ez4rLf8xhxMY6iSvcC
 3nyg==
X-Gm-Message-State: APjAAAXVkBAZysuAreoXVvWpT7Db/K/uji8exdx7qHBdHPJlJtWlR4ri
 fbJwxpRcIIhhipiLsvHr2LldRg==
X-Google-Smtp-Source: APXvYqykY4Uqid8OF1QFBuN0VY1kVUF2+SmKyo/Fzt9IeDNnvrNr2fvexi5s6o6JCiohGxWzQq4hFw==
X-Received: by 2002:a19:5e4e:: with SMTP id z14mr14667529lfi.11.1562143321205; 
 Wed, 03 Jul 2019 01:42:01 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id w28sm343979ljd.12.2019.07.03.01.42.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:42:00 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:45 -0700
Message-Id: <20190703084048.6980-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.68
Subject: [Qemu-riscv] [PULL 29/32] riscv: sifive_u: Update the plic hart
 config to support multicore
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
X-List-Received-Date: Wed, 03 Jul 2019 08:42:13 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present the PLIC is instantiated to support only one hart, while
the machine allows at most 4 harts to be created. When more than 1
hart is configured, PLIC needs to instantiated to support multicore,
otherwise an SMP OS does not work.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e2120ac7a5d3..a416d5d08b4d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -344,6 +344,8 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
+    char *plic_hart_config;
+    size_t plic_hart_config_len;
     int i;
     Error *err = NULL;
     NICInfo *nd = &nd_table[0];
@@ -357,9 +359,21 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].base,
                                 mask_rom);
 
+    /* create PLIC hart topology configuration string */
+    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) * smp_cpus;
+    plic_hart_config = g_malloc0(plic_hart_config_len);
+    for (i = 0; i < smp_cpus; i++) {
+        if (i != 0) {
+            strncat(plic_hart_config, ",", plic_hart_config_len);
+        }
+        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
+                plic_hart_config_len);
+        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
+    }
+
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_U_PLIC].base,
-        (char *)SIFIVE_U_PLIC_HART_CONFIG,
+        plic_hart_config,
         SIFIVE_U_PLIC_NUM_SOURCES,
         SIFIVE_U_PLIC_NUM_PRIORITIES,
         SIFIVE_U_PLIC_PRIORITY_BASE,
-- 
2.21.0


