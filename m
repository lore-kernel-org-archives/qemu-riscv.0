Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0by-0008Ap-99
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bq-00083o-Af; Tue, 19 Oct 2021 21:41:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bn-0005kl-6Y; Tue, 19 Oct 2021 21:41:38 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so1267595pjb.5; 
 Tue, 19 Oct 2021 18:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5tiY91vAhH7clfd/MPIVkOxQx+ZhrtcyHO9Rlx9BJkQ=;
 b=YxsurfVP3+nIk8LUZle/uypkXZTI20wmqlVrCCqpOPKBu8tVMGpY012+Oh2Dlch0c8
 Md3Y4EqBUQIcZfUEz6WEAV6BgZ944TeW2TrqOxeGMtAQvyXXHsqPWLWAKVteADl1fX71
 kUQmCYtWDHL7kL5Abm64Fn06LOgiBTqpNAuTCXFW7fgqE0bXGsk2FaCqeHxUVbl1Oom/
 XFenPBeN4wE7DycpZhv+NiVddn0hmnmzrLovrd3AeWmAx0J+PAzoGN+iaEvY+ffYhO2k
 X0hUXhKCDcNmfj5F1DFC3w/vRSO8hiNG9jkLFwrM8WqXa3qVMGFznQn35CN6+iQ9rZES
 8BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tiY91vAhH7clfd/MPIVkOxQx+ZhrtcyHO9Rlx9BJkQ=;
 b=b3ltXwfUcK3EB3905TgiEtNGArXs6HO5nAN05l1pUlsipWPUK3drTjMiuskO/c6EW8
 hIcW2DGma0DP9YjYXYiAuMNisAdqUJfnLf+3B0fL1Jocj+9zg0NVk4JJeM/sjN97YR9H
 +kXJ2JKPNsShnybZjiUVmNlNZ8bZoi97R6oGbW1a/WW8JiifDgVe5UF/h6xTF1YzrbwY
 gKj00QjHcO4uRb2+NSWXa88dmddBVrRjIJ8Hqj7EFk77WAL9Tifw8bzHKay+T1SUqNjb
 EhLVTwwkZg+Qfagy3JUTMBbSEp91axgrWPTYiFyrQpcGBhd+13b0A7InE1/I1T/FGrVC
 05Qg==
X-Gm-Message-State: AOAM533aZLDmnTswgBjoz94FnbR+fydnxXmg4fByOhavazI11nB0XBwY
 WrMTsF6JF3XSa9zHwIplZUM=
X-Google-Smtp-Source: ABdhPJwBfE0sW4Wj0LYDUlqf5+tHqla5CNyuaTlMS+S5OHv0kwwDOGQDu0Dr+tHKk9w3bJyy4An6Nw==
X-Received: by 2002:a17:902:c94f:b0:13f:4b5:cddd with SMTP id
 i15-20020a170902c94f00b0013f04b5cdddmr35943323pla.58.1634694093602; 
 Tue, 19 Oct 2021 18:41:33 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 6/6] hw/riscv: spike: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Wed, 20 Oct 2021 09:41:12 +0800
Message-Id: <20211020014112.7336-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 01:41:41 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

(no changes since v1)

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


