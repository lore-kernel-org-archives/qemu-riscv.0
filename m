Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUiw-0001nE-WB
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUiv-0001jj-A7; Mon, 18 Oct 2021 11:38:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUis-00077j-La; Mon, 18 Oct 2021 11:38:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id kk10so12522409pjb.1;
 Mon, 18 Oct 2021 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fOcPWRV3PRZa0OEMByLvfqr4EjTKYJQhTu4tEYjQoNc=;
 b=bH99UXiQuOunuMo6E5HYlm+i22oo1n0kQJBPQLXghlrMIa1WX2jtEd74MJArkVggP+
 iIGg5Y9ZZe1dRijZDpb/nFMml4dOiY6TxYNAdb3/62rPQnUhf9Rrk838l1em16X9mCSI
 rgHWtLHldDTixHDAVYUB2DyRaehgSWZgeP5pyFQl4Kr0OKPQ7TQBxAIkwQfsQBd9IzKy
 4hC2xMae7xEEqTkEbG59k+m9nnPN9geDxcJo9Lph/yWxRiT2I128QsrHvbSBzvp//tfB
 OY+E84yJCnmM+QbtregRPmOUCd7HEfwS8WsZDDKkB6p0bb3EX1DMIm4Yx1xZ1wgjumGp
 Yfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOcPWRV3PRZa0OEMByLvfqr4EjTKYJQhTu4tEYjQoNc=;
 b=H0N/6jkAAT+V671Vei1dAjX3Et4CC1/sU0QdjbZYVqeAnFVoH5iWG9kjs4mrMWiDQR
 3ZvSfA17cB1BkWSJMQUIvTgfgHKxvabNGeYNCjUUcQ6HvdgG5DnFyJNesxcWFfeSvEhE
 4yDwxYGa+ZNVYQjAnPS2qOEsFUbXOw4p/QxrQUap7k0RLqS1YiduXtEy8xQQQ0HxWxgc
 OneEuHM67BaPLqbJqSjfLZXmNrHLaOKpbRR9pPYpnGjidnXtLp3+W4Dv1gypl9zAIGk0
 +z3oOvok3wmgCnY41FC4XpOoXH0BGXpr1INd7We6yl6jmoHeZrE4WklmopTGkvKCWjWh
 OJ2g==
X-Gm-Message-State: AOAM532tqFuwD30HyTjhHCj7FPYcZZQXAAPpkjdaORqeu5/I86OGYnqY
 kHhBBJHzJtTE+1WxqLA0GU4=
X-Google-Smtp-Source: ABdhPJxCfueAE1N8IjVoK5E1unFdTPhOACOkJCxpz3+agTHEkGRt9FMzgduIJwaMG7trzaccbqTGJw==
X-Received: by 2002:a17:90a:62ca:: with SMTP id
 k10mr34121344pjs.38.1634571524865; 
 Mon, 18 Oct 2021 08:38:44 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a30sm13899649pfr.64.2021.10.18.08.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:38:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 5/6] hw/riscv: sifive_u: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Mon, 18 Oct 2021 23:38:28 +0800
Message-Id: <20211018153829.24382-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 15:38:49 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fc5790b8ce..0217006c27 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -528,7 +528,6 @@ static void sifive_u_machine_init(MachineState *machine)
     const MemMapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
@@ -549,10 +548,8 @@ static void sifive_u_machine_init(MachineState *machine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
     /* register RAM */
-    memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM].base,
-                                main_mem);
+                                machine->ram);
 
     /* register QSPI0 Flash */
     memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
@@ -748,6 +745,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpu_type = SIFIVE_U_CPU;
     mc->default_cpus = mc->min_cpus;
+    mc->default_ram_id = "riscv.sifive.u.ram";
 
     object_class_property_add_bool(oc, "start-in-flash",
                                    sifive_u_machine_get_start_in_flash,
-- 
2.25.1


