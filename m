Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUip-0001Uv-8t
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUim-0001Oj-Fn; Mon, 18 Oct 2021 11:38:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUik-0006ik-Qw; Mon, 18 Oct 2021 11:38:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so14770714pjb.1; 
 Mon, 18 Oct 2021 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdgU6R5z57CuzHRXOdezfTsYjzZveMmJhy0dWnL8+fU=;
 b=pd/fHVUCNRy5mnBz7nai8gWdHInmi6v8d6OgVt+DppLr2r/zHlYH35GUjwmDYD83XM
 GWkPyAWIW5aZ2+38/Xdn9/PBr1qWUSujqwEAzRvzJXNS04DcV4wYaPGepuzapgMf8J7/
 xmDIMknWBjZ/tUIRoyhNq3hxQcR7CMamli17jGbUbGgcP6j0z+QM/RAjcq0PohF0uCYh
 Uz/OI2Irubole/WejcjKGdkxU54fL0BIVnjan+0qgp5S9MLoi+++zKA4NaAjnzLS3VCL
 0JTqZyVZHLndZr8R+/zhwWfrPRDPedQedVN3a0C4gG6f1wFKu0IOwKAP+8pTKY74DwWz
 AIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdgU6R5z57CuzHRXOdezfTsYjzZveMmJhy0dWnL8+fU=;
 b=shgBcXAmnWGd2a2jxnL2EYJv2HvDUXVe8Pr2Na3dWMoIs0SBZcLbUCVOgu7NwGWIxq
 Ah0axSFkQBbw3ixfo7iN5f8ZV3uNEHkCq/ruYTfNLaHqtkJl1oLx+Adjc4HjMk0fovnI
 71NmZ/NS+vVBTlyMxxP+qYhiN2uRc9wamGn3TXUuyi5hRP+wQgULaLbuiCVNhiKkPG+q
 lyFwa2p8xIJgZRRtrPGclGwPKCuP0cI2fVpNXZT+CexjpKPgo5tZrGUvxRG4KFYkkoBj
 KAyfDV+qyz+TYR1U8zo0Owj4SJULppYl+/9pyzTeu0GTNEGlxLb0SV1cTXSma+/XLcM9
 jsuw==
X-Gm-Message-State: AOAM530qx16x+SroUvJJAduC18ujOq19/62jthm2fJuuz6yOkdiA/u1W
 QIEUV/rpw0l3lJv0WlEYUm0=
X-Google-Smtp-Source: ABdhPJyHDp152DIA0R/I1Mvzy1njp0joHt0kYbPsb96Hnk93/qupR+7ynuIzhD4AK7y4jvtL6nNZZA==
X-Received: by 2002:a17:90a:4509:: with SMTP id
 u9mr49273381pjg.79.1634571517054; 
 Mon, 18 Oct 2021 08:38:37 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a30sm13899649pfr.64.2021.10.18.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:38:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Mon, 18 Oct 2021 23:38:24 +0800
Message-Id: <20211018153829.24382-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 15:38:41 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/microchip_pfsoc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e475b6d511..f10f55b488 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -459,7 +459,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     const MemMapEntry *memmap = microchip_pfsoc_memmap;
     MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *mem_low = g_new(MemoryRegion, 1);
     MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
     MemoryRegion *mem_high = g_new(MemoryRegion, 1);
     MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
@@ -486,16 +485,13 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
     /* Register RAM */
-    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
-                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
-                           &error_fatal);
     memory_region_init_alias(mem_low_alias, NULL,
                              "microchip.icicle.kit.ram_low.alias",
-                             mem_low, 0,
+                             machine->ram, 0,
                              memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                mem_low);
+                                machine->ram);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
                                 mem_low_alias);
@@ -606,6 +602,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
                    MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
     mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpus = mc->min_cpus;
+    mc->default_ram_id = "microchip.icicle.kit.ram_low";
 
     /*
      * Map 513 MiB high memory, the mimimum required high memory size, because
-- 
2.25.1


