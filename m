Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0bg-0007ma-IS
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0be-0007jZ-4H; Tue, 19 Oct 2021 21:41:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bc-0005O0-G3; Tue, 19 Oct 2021 21:41:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so1278473pjb.4; 
 Tue, 19 Oct 2021 18:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X1R4BqhBiPVCxbc/iYymZJETBIExuKeB9Ht4t4SvqE0=;
 b=GJXr8GAz2tC964L5H4m+1AIEwM0bElYivG00+UKNx3ecjs4wLS57nVn+WDatHQt5Oh
 R+/ShJ3yCPgNHZaHT48iMfAhmpZ7H4+5N2gcsERT+sYzOBrKrpsxKWdseviaAC+5pOj9
 qjS90O0uTSgYosp5/exSWm0qy+7pl2wc17Q73WBUwexNjXSj9dOEsTg+pOZ35dCvgZ0i
 9DxpjXL9bBgokvk3nPQRWciL0XNv1EQMrWKTZXJSNYDiDu0ldaesPd4B7PWeiICL40go
 NXcBwVyCcAJs0un1NydUvpEECNtMxsYbpHfcoPR85uDeM+Qqzrikd9RMigdijh6p6iWe
 04QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1R4BqhBiPVCxbc/iYymZJETBIExuKeB9Ht4t4SvqE0=;
 b=KNQncL6IniAZvPwHzGWt4meiTnUTs8YwLQTu6lBFPRvRwDQvCxGHuGJvC8yD7nF9/i
 31++kDU0peej/WhdTEkuCcg0n1sBqI0KNi9Fqlbc3B2hc7WYNYymEmuS2SA32gG07Kfl
 15E/swpKruNJFUZ+j2lsURtZtpii+pSUFq8tdr41STtIM0LEODdJYDBjluyxZBuE9Z33
 JxdxkYVmw7Qbys0bOKYg18/93kzg/rQjvhUk4fU4knPlRX6GTtZCxFUQVnCjETNZaDhl
 saqbb6MpEd5t0GwlXHeLm8c56pgnV1TV70OarEekDre7g9TP2W4r72jc73xi/0weYMX3
 GhWg==
X-Gm-Message-State: AOAM530FYo8/gqjb0WFZm4HkhXJkqquz+6H+5DNYohQelB4ZiUY8MClH
 Y/qUXRHSVrUOOckJmmhqYp3DzTdo4cc=
X-Google-Smtp-Source: ABdhPJwnrQV/yuolMcGp3AVv+MRdJjYFybAqkBT+HhMiVovGVD1asoYJhm1RHO3opex7JJOor916VQ==
X-Received: by 2002:a17:902:e88a:b0:13e:ed55:296f with SMTP id
 w10-20020a170902e88a00b0013eed55296fmr36501230plg.11.1634694082672; 
 Tue, 19 Oct 2021 18:41:22 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Wed, 20 Oct 2021 09:41:07 +0800
Message-Id: <20211020014112.7336-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 01:41:26 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- split RAM into low and high regions using aliases to machine->ram
- rename mc->default_ram_id to "microchip.icicle.kit.ram"

 hw/riscv/microchip_pfsoc.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e475b6d511..3fc8545562 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -463,7 +463,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
     MemoryRegion *mem_high = g_new(MemoryRegion, 1);
     MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
-    uint64_t mem_high_size;
+    uint64_t mem_low_size, mem_high_size;
     hwaddr firmware_load_addr;
     const char *firmware_name;
     bool kernel_as_payload = false;
@@ -485,31 +485,34 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                             TYPE_MICROCHIP_PFSOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
+    /* Split RAM into low and high regions using aliases to machine->ram */
+    mem_low_size = memmap[MICROCHIP_PFSOC_DRAM_LO].size;
+    mem_high_size = machine->ram_size - mem_low_size;
+    memory_region_init_alias(mem_low, NULL,
+                             "microchip.icicle.kit.ram_low", machine->ram,
+                             0, mem_low_size);
+    memory_region_init_alias(mem_high, NULL,
+                             "microchip.icicle.kit.ram_high", machine->ram,
+                             mem_low_size, mem_high_size);
+
     /* Register RAM */
-    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
-                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
-                           &error_fatal);
-    memory_region_init_alias(mem_low_alias, NULL,
-                             "microchip.icicle.kit.ram_low.alias",
-                             mem_low, 0,
-                             memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_LO].base,
                                 mem_low);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
+                                mem_high);
+
+    /* Create aliases for the low and high RAM regions */
+    memory_region_init_alias(mem_low_alias, NULL,
+                             "microchip.icicle.kit.ram_low.alias",
+                             mem_low, 0, mem_low_size);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
                                 mem_low_alias);
-
-    mem_high_size = machine->ram_size - 1 * GiB;
-
-    memory_region_init_ram(mem_high, NULL, "microchip.icicle.kit.ram_high",
-                           mem_high_size, &error_fatal);
     memory_region_init_alias(mem_high_alias, NULL,
                              "microchip.icicle.kit.ram_high.alias",
                              mem_high, 0, mem_high_size);
-    memory_region_add_subregion(system_memory,
-                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
-                                mem_high);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].base,
                                 mem_high_alias);
@@ -606,6 +609,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
                    MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
     mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpus = mc->min_cpus;
+    mc->default_ram_id = "microchip.icicle.kit.ram";
 
     /*
      * Map 513 MiB high memory, the mimimum required high memory size, because
-- 
2.25.1


