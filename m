Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulK-0000cA-8K
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55111)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgulD-0000XS-7g
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgul9-0000uH-T8
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:07 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42087)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgul9-0000tD-NB
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so3588361plb.9
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=fcm0+r8fxMNfE/F4H9Cg6/O9Ghx9bryN1yVdrSBGRYk=;
 b=W20Ut1LdpjQuNqf5wsXAksmpTr7X1+m7fsli8Q65LitlS/+nAMtQPrYf9dtszdGfWp
 E6yg1yAORtcIaPWNKMlyi3M86tI5KYHnWfrPkJ7xjAJI6AP+iEycOpWcjP4a3GDj2Gje
 Cpm8LzEaQRJFoF4fWS5vDkjdenR7FJkdXC0uUhhM29G6qLR3SbC55fEeStpkv0SnPWL7
 TYiPldkIvbeE63kMPp+EEn2o4i6PeCU7vuOY1QPwnpgt/pWjjgxDU+tcb64TsjVZU7Is
 ffUidSj4EyGySEfI7UKUb0E9lnIaA7DIKvtyangF5Ih35pmzL+LQu84RmX8bTR4FCSHZ
 i4qw==
X-Gm-Message-State: APjAAAX8f+OB5wNiqqP/uXFxmhtFkr/R7p9YjWphj+zvL6an+KofhKcF
 +JnBGwJM1dyXluNK+ijw9L/sIA==
X-Google-Smtp-Source: APXvYqwF0T1DCLFNKBNSbVIt9vt7jB445D4gWrr1oID4/haS4tgClkI2jLrR43sPuq8avuwWYmPttg==
X-Received: by 2002:a17:902:9a82:: with SMTP id
 w2mr12808243plp.291.1561743242519; 
 Fri, 28 Jun 2019 10:34:02 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id k14sm6548223pfg.6.2019.06.28.10.34.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:34:01 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:22 -0700
Message-Id: <20190628173227.31925-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: [Qemu-riscv] [PULL 29/34] riscv: sifive_u: Update the plic hart
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
X-List-Received-Date: Fri, 28 Jun 2019 17:34:09 -0000

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


