Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHk-0003Kz-PB
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32927)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHT-00036S-9u
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHQ-0008Rk-24
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHP-0007LV-Ng
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:43 -0400
Received: by mail-pg1-f194.google.com with SMTP id k13so1169675pgq.9
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=fcm0+r8fxMNfE/F4H9Cg6/O9Ghx9bryN1yVdrSBGRYk=;
 b=kKABFahA71B+I+yltDwJekizoGhjRq0PyPXMumwFdneNXAcOYrt9UvYah8JZ3x03Zg
 LomDJR6UPO+cdHRi0QiNcNYU6GIRCS1nnXV4ELCGeepzcMZZZJM33MnDK3PABg7WDFCr
 i618qVT7tHSLYEmrjs2siKGfdjECQi4HdC8rIAXxYizk8tMYpNldOyJaxasVgfkqb5aK
 sG9krkzEys3pNho02wGgt74NZNwBNt14XTFPougEIyXCJq/LAQXVBwXd6Qd987f9uOoD
 8SEJbNhksWUJA9bqPVLggN8Ek4asw0V6fXvhdhWRqcQ65MNpZggsMPlws9aBfflVdiGp
 VnzQ==
X-Gm-Message-State: APjAAAUQNj7G19Ydp6R+WhNdbT+KywkDr8WxJZi6tFZeulqu+jPurNi8
 6iS1h8MZ/Otno80E9jzPsEqzA1xGfHtoNg==
X-Google-Smtp-Source: APXvYqzxQ+Uu+CcqODIS+7c07XpMzXjR41fSSWHLjHPmSnJvt2vMl0lO9TAR4HaqokalkD7M2IAG/Q==
X-Received: by 2002:a63:1365:: with SMTP id 37mr4252663pgt.266.1561649074204; 
 Thu, 27 Jun 2019 08:24:34 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id q144sm4013593pfc.103.2019.06.27.08.24.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:33 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:20:06 -0700
Message-Id: <20190627152011.18686-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:49 -0000

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


