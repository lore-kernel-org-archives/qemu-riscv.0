Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiIbY-000187-LK
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 10:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbV-00014c-TX; Mon, 08 Jun 2020 10:18:22 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbU-0004Tt-Lw; Mon, 08 Jun 2020 10:18:21 -0400
Received: by mail-pf1-x444.google.com with SMTP id b16so8587980pfi.13;
 Mon, 08 Jun 2020 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N08UH+3bz4nQGqfOR/+WzLtOXj+REDNN+IuSEwOiKLo=;
 b=dRWnjgG92GPKA6t+6Dg70qDkgyW88pZYKOIUfw6wdWuBkFazO6UU6bQ4M5IzkcQXy8
 lX13QZklac/gg7kK9eGIJHoZyyhagPjIy/BD3AFHf95TbMb0KxeOlkZYSXvSBnXON4Xh
 DXygIpcvF5cX0/c100tbIkuEs362q0I8xJZpVcpjrOdYHmaYw1fbWNYLDrLEC754jr5a
 zmRD+/9neZqNQa3Ir545rz+m4nePv41bRVWcRUXYUL533SxNDD0gLAkZGAGCaqZWFNic
 B6pbENuGv0ahXch4fNnJda0l0dAoeZ7u+hT8tYx+BfjCGtx1M+I1zqsBttOl9GXa836w
 zYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N08UH+3bz4nQGqfOR/+WzLtOXj+REDNN+IuSEwOiKLo=;
 b=eVA1X+iZGaNDq5YIRpcf7ZXOliStPFjxTYKP2Z3Wk1BLuNxmO4RzfqmOo4twhzjoUn
 d1suhviaQ/RfAC9+9M1O8gQYCogURJGKS0RViu3v5VRxqfYKjeZy5ZVP7dxdMU3yjc7u
 MQad3MDjmtcMvDUlozsV8+LfAIW9NbiK6vATHcWJ21jqsJn5bUpP4FBT+FYTKCYQv1dG
 SYBCEMX8PGeA8Dfgm6UiPtqQ0TRXOuBEW4NEXzrVCrfdy6IWKbooya/YIzdGOhSzJFIK
 3xM02slQSfo0OMqD/Kx8Hz7XdnpbrNydTx/enUOKK6vxRJtscjkNL+yl56rTRr3rJc5Q
 cwzw==
X-Gm-Message-State: AOAM533qR6+2o2GE+xEo0MVj2oOgQR6Z+jzVco+GV3HXENQAWusvLPxc
 FaA/I/qU/7gboltv2eKgL8s=
X-Google-Smtp-Source: ABdhPJxanUPHmmXJjc1U2LWTfOA/rZlmQ9RosvrHV3aKJPlb8XJdR/cQPXQdsK7BF3L2s+Yj18ACJQ==
X-Received: by 2002:a65:5349:: with SMTP id w9mr20716470pgr.281.1591625898759; 
 Mon, 08 Jun 2020 07:18:18 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id b19sm7292575pft.74.2020.06.08.07.18.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 08 Jun 2020 07:18:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 02/15] hw/riscv: opentitan: Remove the riscv_ prefix of the
 machine* and soc* functions
Date: Mon,  8 Jun 2020 07:17:31 -0700
Message-Id: <1591625864-31494-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
References: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 14:18:23 -0000

From: Bin Meng <bin.meng@windriver.com>

This was done in the virt & sifive_u codes, but opentitan codes were
missed. Remove the riscv_ prefix of the machine* and soc* functions.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/opentitan.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index b4fb836..0907a42 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -51,7 +51,7 @@ static const struct MemmapEntry {
     [IBEX_PADCTRL] =        {  0x40160000,  0x10000 }
 };
 
-static void riscv_opentitan_init(MachineState *machine)
+static void opentitan_board_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = ibex_memmap;
     OpenTitanState *s = g_new0(OpenTitanState, 1);
@@ -70,7 +70,6 @@ static void riscv_opentitan_init(MachineState *machine)
     memory_region_add_subregion(sys_mem,
         memmap[IBEX_RAM].base, main_mem);
 
-
     if (machine->firmware) {
         riscv_load_firmware(machine->firmware, memmap[IBEX_RAM].base, NULL);
     }
@@ -80,17 +79,17 @@ static void riscv_opentitan_init(MachineState *machine)
     }
 }
 
-static void riscv_opentitan_machine_init(MachineClass *mc)
+static void opentitan_machine_init(MachineClass *mc)
 {
     mc->desc = "RISC-V Board compatible with OpenTitan";
-    mc->init = riscv_opentitan_init;
+    mc->init = opentitan_board_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
 }
 
-DEFINE_MACHINE("opentitan", riscv_opentitan_machine_init)
+DEFINE_MACHINE("opentitan", opentitan_machine_init)
 
-static void riscv_lowrisc_ibex_soc_init(Object *obj)
+static void lowrisc_ibex_soc_init(Object *obj)
 {
     LowRISCIbexSoCState *s = RISCV_IBEX_SOC(obj);
 
@@ -99,7 +98,7 @@ static void riscv_lowrisc_ibex_soc_init(Object *obj)
                             &error_abort, NULL);
 }
 
-static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
+static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     const struct MemmapEntry *memmap = ibex_memmap;
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -159,26 +158,26 @@ static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_PADCTRL].base, memmap[IBEX_PADCTRL].size);
 }
 
-static void riscv_lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
+static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    dc->realize = riscv_lowrisc_ibex_soc_realize;
+    dc->realize = lowrisc_ibex_soc_realize;
     /* Reason: Uses serial_hds in realize function, thus can't be used twice */
     dc->user_creatable = false;
 }
 
-static const TypeInfo riscv_lowrisc_ibex_soc_type_info = {
+static const TypeInfo lowrisc_ibex_soc_type_info = {
     .name = TYPE_RISCV_IBEX_SOC,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(LowRISCIbexSoCState),
-    .instance_init = riscv_lowrisc_ibex_soc_init,
-    .class_init = riscv_lowrisc_ibex_soc_class_init,
+    .instance_init = lowrisc_ibex_soc_init,
+    .class_init = lowrisc_ibex_soc_class_init,
 };
 
-static void riscv_lowrisc_ibex_soc_register_types(void)
+static void lowrisc_ibex_soc_register_types(void)
 {
-    type_register_static(&riscv_lowrisc_ibex_soc_type_info);
+    type_register_static(&lowrisc_ibex_soc_type_info);
 }
 
-type_init(riscv_lowrisc_ibex_soc_register_types)
+type_init(lowrisc_ibex_soc_register_types)
-- 
2.7.4


