Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nghki-00041n-1J
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 02:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkW-0003ug-8o
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:11 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:19307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkU-0004KV-3H
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351245; x=1681887245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/LhyZf2nYA3CHhEVP9i1qF21zpSIkG1ugCVQa7PPYo4=;
 b=l8SFCGmb40K/kImVKGfQ6fysKtVMUrdubhPEnBfoW3ziAAO/waLlM01k
 1t0I6dsAQ5tBbyJ71Vvdg+0k/+ygo/UgQfLIzIynRpQ3Szam/t71FVhkh
 GkSWjcghhr/eopi1ptBuWW3pUO9KI9nbJpq6LL3JSuwT4z/ULYQQJvHim
 u+DBtHSW4IPEKxYZFPf77dTZsGrtpSMgKV50DxxNrJjS66wSCkzZ2tslD
 3FCzqlwpGJgtROY/q9YV5YrxhlgEo4Df9ByB2zVWQVWyUUSIOtngVZweN
 4BGCnnNlUu6E9utSlbDWLimNWiSqpaDdWKBP8yE+yH4jzGe2LBttgi/pz A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="197095885"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:53:58 +0800
IronPort-SDR: MtoZlsAZwcivfqK2eUZ9C8Om1Ai4hEXeGHcwcFXFxzwQQQBSFiV68K5aX2416OvQqV74sXMPTj
 D6ImKgeT/Su/6H/7F8/HIWxZvov6kAcqFX5wLv/Z5QCo3OxodQd1zrrJBLifRcY1COrS5P250T
 s0DnA1FjpnZicXLCHQBQJItNCST4t/DuxYjAxaLPGOqArIQIosPmA/E8kEbxzeXf55DmfpWBzd
 0pZDKMAICYw25ooyP9Y11PyTJo354hTgkQqyVLl3jfcC4pkmKdB6eFUWG2e4sM9ROWf3QqeH+t
 FW5th45/ZimNpIPlev3MTgyn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:24:14 -0700
IronPort-SDR: iewWzIMvtTGZHdfm/93OlErtnap5RTo205mki/1Y+nJ3XqTgjix/axCn2L5UPcKnwJJ/RjXbcc
 gS7ncfK8sXpCrEbLl2k35rsID62r2l+kX5cfrlOmjqqucuwgHF/fl3fbrJy3jujJzFXsqEIlsC
 AqlY6eKlJpPp7C43oH/j9yyNAt/ai2g5L8OJ7AGWegX8ai2Kkp8cLJumukcKvuOQYPguAOyzua
 Uasyf+jugL5BCIC1GoNnJEW7/p3RQ395/qCaMpeHuQTP9slxW2xu1zpaOxjhVMK6fZ7EXww6Nj
 KCE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:53:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDzl19BTz1SVp2
 for <qemu-riscv@nongnu.org>; Mon, 18 Apr 2022 23:53:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650351233; x=1652943234; bh=/LhyZf2nYA3CHhEVP9
 i1qF21zpSIkG1ugCVQa7PPYo4=; b=plHND4LB2ipeZK/a9wKxzlqQCyTG0xxwFv
 CEmhVpIsCfL7z8kdX56gNuZYo4gB1Bs5WxlDKuoBS2vQsKtpqGxUpaaKJRRbXFW/
 pgyKnp9g47opnSjEB2Kk+WP3CUghq9v/uck1/kB2NoojNimBdqG5lIAjxgm++ZE+
 KmML5YMFdfi6lZ7n7gLUwFcQMxPOfOi4HorA+vaHHDH1IKFxOfU+CvF8XdVEoIAV
 Hgs1xyUFBgaqUteiuz1z+gwEyL5bCCRIllr9Bvlu+WpG4x5el3hjkXVJ/5I2iT7m
 IOJk1q4EJ9V/IfAQMSsdIWDOTpwkJKm+osHLCMssdlBsj7upKRPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ScNrvWkYQq10 for <qemu-riscv@nongnu.org>;
 Mon, 18 Apr 2022 23:53:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDzg0Flzz1Rwrw;
 Mon, 18 Apr 2022 23:53:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 1/6] hw/riscv: virt: Add a machine done notifier
Date: Tue, 19 Apr 2022 16:53:37 +1000
Message-Id: <20220419065342.878415-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
References: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=101f09098=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2022 06:54:11 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Move the binary and device tree loading code to the machine done
notifier. This allows us to prepare for editing the device tree as part
of the notifier.

This is based on similar code in the ARM virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/riscv/virt.h |   1 +
 hw/riscv/virt.c         | 180 +++++++++++++++++++++-------------------
 2 files changed, 97 insertions(+), 84 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 78b058ec86..8b8db3fb7c 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -45,6 +45,7 @@ struct RISCVVirtState {
     MachineState parent;
=20
     /*< public >*/
+    Notifier machine_done;
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..3d48469367 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1156,6 +1156,95 @@ static DeviceState *virt_create_aia(RISCVVirtAIATy=
pe aia_type, int aia_guests,
     return aplic_m;
 }
=20
+static
+void virt_machine_done(Notifier *notifier, void *data)
+{
+    RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,
+                                     machine_done);
+    const MemMapEntry *memmap =3D virt_memmap;
+    MachineState *machine =3D MACHINE(s);
+    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
+    target_ulong firmware_end_addr, kernel_start_addr;
+    uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * so the "-bios" parameter is ignored and treated like "-bios none"
+     * when KVM is enabled.
+     */
+    if (kvm_enabled()) {
+        g_free(machine->firmware);
+        machine->firmware =3D g_strdup("none");
+    }
+
+    if (riscv_is_32bit(&s->soc[0])) {
+        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
+    } else {
+        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
+    }
+
+    if (machine->kernel_filename) {
+        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
+                                                         firmware_end_ad=
dr);
+
+        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
+                                         kernel_start_addr, NULL);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_ent=
ry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
+                                  end);
+        }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next=
 mode
+        * if kernel argument is not set.
+        */
+        kernel_entry =3D 0;
+    }
+
+    if (drive_get(IF_PFLASH, 0, 0)) {
+        /*
+         * Pflash was supplied, let's overwrite the address we jump to a=
fter
+         * reset to the base of the flash.
+         */
+        start_addr =3D virt_memmap[VIRT_FLASH].base;
+    }
+
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg =3D create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
+    /* Compute the fdt load address in dram */
+    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
+                                   machine->ram_size, machine->fdt);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
+                              virt_memmap[VIRT_MROM].base,
+                              virt_memmap[VIRT_MROM].size, kernel_entry,
+                              fdt_load_addr, machine->fdt);
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * So here setup kernel start address and fdt address.
+     * TODO:Support firmware loading and integrate to TCG start
+     */
+    if (kvm_enabled()) {
+        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
+    }
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -1163,10 +1252,6 @@ static void virt_machine_init(MachineState *machin=
e)
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     char *soc_name;
-    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
-    target_ulong firmware_end_addr, kernel_start_addr;
-    uint32_t fdt_load_addr;
-    uint64_t kernel_entry;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
=20
@@ -1296,92 +1381,12 @@ static void virt_machine_init(MachineState *machi=
ne)
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
         machine->ram);
=20
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
                            memmap[VIRT_MROM].size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
=20
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * so the "-bios" parameter is ignored and treated like "-bios none"
-     * when KVM is enabled.
-     */
-    if (kvm_enabled()) {
-        g_free(machine->firmware);
-        machine->firmware =3D g_strdup("none");
-    }
-
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
-
-    if (machine->kernel_filename) {
-        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
-                                                         firmware_end_ad=
dr);
-
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_ent=
ry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
-                                  end);
-        }
-    } else {
-       /*
-        * If dynamic firmware is used, it doesn't know where is the next=
 mode
-        * if kernel argument is not set.
-        */
-        kernel_entry =3D 0;
-    }
-
-    if (drive_get(IF_PFLASH, 0, 0)) {
-        /*
-         * Pflash was supplied, let's overwrite the address we jump to a=
fter
-         * reset to the base of the flash.
-         */
-        start_addr =3D virt_memmap[VIRT_FLASH].base;
-    }
-
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg =3D create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
-    /* Compute the fdt load address in dram */
-    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
-    /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
-                              virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
-
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * So here setup kernel start address and fdt address.
-     * TODO:Support firmware loading and integrate to TCG start
-     */
-    if (kvm_enabled()) {
-        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
-    }
-
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
=20
@@ -1417,6 +1422,13 @@ static void virt_machine_init(MachineState *machin=
e)
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
+
+    /* create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    s->machine_done.notify =3D virt_machine_done;
+    qemu_add_machine_init_done_notifier(&s->machine_done);
 }
=20
 static void virt_machine_instance_init(Object *obj)
--=20
2.35.1


