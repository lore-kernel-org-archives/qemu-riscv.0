Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUj2-00027G-EC
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUj0-0001ze-Eb; Mon, 18 Oct 2021 11:38:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUiv-0007BE-MM; Mon, 18 Oct 2021 11:38:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso268621pjb.1; 
 Mon, 18 Oct 2021 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qDWxU5X18UexLcxgTJj2qUaxj382cCI3tPFP3fZWboY=;
 b=bo76mUsxKmQzM6FKmdAlB0+/dJD17R666si2mqhTqWxcddzaD3eC9NyRAbk59yZajE
 2Sn25lWpBcOXMR0Ej15tpxZRYpWhLH40jBBqkD05jmQBZcIstkgOqA3wnSQUdW6o3Ick
 41JoiPUPrwwLWXODGKkfO0Jxd86zlqFlr5MrEmqusQn6a9LBPlgCTMRCflLl0wFVT3Tk
 94yQD3BkNKt7TWFXNlaHX3Q7exK697FpBAPtes5MpASwyQWC0T4sN8rpEnnJ+6rxWC4O
 2oKbgjfRtFp4DOS7hZjMy/Lwy5lmIkzRZYcYGZZ1CxNN+dm5QqUrtETRxuyl6I5hQP6m
 QcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDWxU5X18UexLcxgTJj2qUaxj382cCI3tPFP3fZWboY=;
 b=z9cb9JYiyr0HEqGkWUjg/LHoqwHrSjz4sI4/dOKBooUEbiBNWrhjlbxkn9gM634fSd
 pNcq8K10130Kug0HpJPQqt+oi47T2ZFlMfEl4mkfFgOD1OlXlHMtZNRHJ2ryj3oyUfkQ
 /htzfrTJjVHkIfX6dzBWx4ljh+wUvmnBrSyZndrVpbbV0cc2dqDTGFDVYXkCjhQK5Gt5
 rVylG80aLGWd9aMbQGDKnC5hZVhzsBKn5MM+KisyyXoUYL7WH7banrEOZw9n2zunwPFm
 a7mqTwGuiwWM1vCIiOsXuOEUgIlAqrGeuoPS7ZXyaVn9DKeTa0hXjn3vCf8WYHEztOKE
 fyFg==
X-Gm-Message-State: AOAM531Q8RzI56M5GGNNtOn3313XGhEQ/Vpxi0hL2MdXn1+yAn8twewt
 IyJKGADShZ/iiQJ7lG4cA2Q=
X-Google-Smtp-Source: ABdhPJwbe/S81w8FF7cfV6XE3iBOkT6FWGMXmaT/qrhzXYxZ6ALy6Oxk2FiSvPZywyLafYY/OGsuYw==
X-Received: by 2002:a17:90a:2:: with SMTP id 2mr49039345pja.77.1634571526823; 
 Mon, 18 Oct 2021 08:38:46 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a30sm13899649pfr.64.2021.10.18.08.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:38:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 6/6] hw/riscv: spike: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Mon, 18 Oct 2021 23:38:29 +0800
Message-Id: <20211018153829.24382-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Oct 2021 15:38:55 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/spike.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 79ae355ae2..288d69cd9f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -180,7 +180,6 @@ static void spike_board_init(MachineState *machine)
     const MemMapEntry *memmap = spike_memmap;
     SpikeState *s = SPIKE_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
@@ -239,10 +238,8 @@ static void spike_board_init(MachineState *machine)
     }
 
     /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
-        main_mem);
+        machine->ram);
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
@@ -326,6 +323,7 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    mc->default_ram_id = "riscv.spike.ram";
 }
 
 static const TypeInfo spike_machine_typeinfo = {
-- 
2.25.1


