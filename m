Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXPo9-0002rC-4G
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 10:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXPo6-0002m1-Tl; Tue, 27 Oct 2020 10:18:38 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXPo4-0007iN-U9; Tue, 27 Oct 2020 10:18:38 -0400
Received: by mail-pf1-x441.google.com with SMTP id a200so983144pfa.10;
 Tue, 27 Oct 2020 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QPmyC2GPrREndFVaDnqrrStKAbAUa+Ljt8oIR0tH5Q=;
 b=W815xAK+SLsN8IZX+YzJgAumTpkStuVAcC//c7ooJkyzXr0MXgcwykQ9d4aiWJlLyo
 D6fmAfUROozIepAY0FstL7TWnHak+8Xu/jy7N6uUpBBDooAwxo7uUJsTD7G4UQ3lrPhH
 BXF2xKVC32NJFozpFoCpQIjLak1oeeuGAL9sFdHlrbzaqc+/MEFHSxlGSKmdfnL/uwtu
 SRJ8NQebXjP2353/sYU2v2Ln447TdUVCf0NN5u4/7rnjkbtmycb/aVLFfPwhCf/ztyI7
 BSLcWZIPuuqKlQb/VIoEvy7THDwfKYfdIaeoUw6RfGTcnmWwC47SD3umsZGhssQb6WN7
 +P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QPmyC2GPrREndFVaDnqrrStKAbAUa+Ljt8oIR0tH5Q=;
 b=MhE0kKZJh9ktRWcDwJCeGmz62lqUzhImrxXoXfMv56MAGt43ZgvdhfaZUKfQVjPM93
 wsaVGlpcs6Zu3MkNa6vcwkjaSbaqawExh4NDasleBBc8v/DEnJrsrcecAcTgzTkEpeZx
 0Ukcz3/CBAvGeq9Kw9Sv8V5aRigYBWo69GFQhg3BzEcuIXpO1RMOEgsEH7ZppTSqbzBx
 O4wLGst0uqc7eNpJObhdtpEibgPxdfFd3/dtNyvle062m5N4Kn0+jOhcACt4i9Xi1RGx
 Eh4GYOCCePLtuhVP7iMNKYRg9F7TbJQmgq14RW0l9JtvkOEIMYXiEx3Mkz5WxRvbaN6Z
 XGqA==
X-Gm-Message-State: AOAM5335OGMW4NTQMj0np91GdJZGztxUWIryOxtqczyCCA4N2ZRWMmB+
 AoQhb0gC4QGF2QrB0+lru1A=
X-Google-Smtp-Source: ABdhPJyRDTNWpxbu5zXmSVhXFJNPpfHWGIGeblurs15AnkDICtxfhBwQsFUKdq9DjJEA9mpgqYJzSw==
X-Received: by 2002:aa7:9f4c:0:b029:164:4278:cae7 with SMTP id
 h12-20020aa79f4c0000b02901644278cae7mr1550490pfr.11.1603808315097; 
 Tue, 27 Oct 2020 07:18:35 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id mn15sm1600297pjb.21.2020.10.27.07.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 07:18:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Ivan Griffin <ivan.griffin@emdalo.com>, Bin Meng <bin.meng@windriver.com>
Subject: [RESEND PATCH 7/9] hw/riscv: microchip_pfsoc: Map debug memory
Date: Tue, 27 Oct 2020 22:17:38 +0800
Message-Id: <20201027141740.18336-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027141740.18336-1-bmeng.cn@gmail.com>
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 27 Oct 2020 14:18:39 -0000

From: Bin Meng <bin.meng@windriver.com>

Somehow HSS needs to access address 0 [1] for the DDR calibration data
which is in the chipset's debug memory. Let's map the debug memory.

[1] See the config_copy() calls in various places in ddr_setup() in
    the HSS source codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/microchip_pfsoc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 69117c6000..b9c2f73e7c 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -158,6 +158,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
     const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
     MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *debug_mem = g_new(MemoryRegion, 1);
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *envm_data = g_new(MemoryRegion, 1);
@@ -177,6 +178,13 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
     qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
 
+    /* Debug */
+    memory_region_init_ram(debug_mem, NULL, "microchip.pfsoc.debug_mem",
+                           memmap[MICROCHIP_PFSOC_DEBUG].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_DEBUG].base,
+                                debug_mem);
+
     /* E51 DTIM */
     memory_region_init_ram(e51_dtim_mem, NULL, "microchip.pfsoc.e51_dtim_mem",
                            memmap[MICROCHIP_PFSOC_E51_DTIM].size, &error_fatal);
-- 
2.25.1


