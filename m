Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiNEv-0002Bd-Cz
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 17:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oiNEo-00024m-C3; Tue, 11 Oct 2022 17:56:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oiNEm-0003bb-Fe; Tue, 11 Oct 2022 17:56:34 -0400
Received: by mail-ej1-x62e.google.com with SMTP id q9so29747274ejd.0;
 Tue, 11 Oct 2022 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1Gttt4K07qcwnWu7M9fBv6JPNwer6JUhRv8LRyer3E=;
 b=m7PJxSB2LT2M81erwu4YAJ48IztxiNeYjrUxTaXk4lL/Nb2Fsy6uZ6HrbOG7dIXeUc
 ejNNMhe3zbPj8KGk4ye9+7bYuiC+lVO/FK2fKWqV3k4U3SLyjMSHADCAZA7ojHfrHz1j
 Zn0wEz3z08oFL5GPcp5xoPmDjwQMWD21rC8Nns9RfXM/JXWk1UjmjuFX0CZFPOjMd3d7
 iFameEuaHOU8vI2NaZFJFWK+TDvO5C0JZRn0bcW+p0PxRPZAoETkR8qGD2WvzMrathcr
 ILQI6QDaRLYJoHTzb6N39qqBwbfvxRMeU5aOppkboNZEYjRDop9cRCLM9Rg0fdfaNB/w
 8S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1Gttt4K07qcwnWu7M9fBv6JPNwer6JUhRv8LRyer3E=;
 b=6EywvJDDOp76i8sgj1veXFutKJP+QEQPnWRU2gjs+C4iN5b91VFz2Tcye8VOx1b1ni
 rPh8BUWCkCryrclL2rFnVCZRfi0ilpk64bLmpvZnomsXCF1+tr6qlp3KhEPuC/Pxi5TH
 dQbpubALEAuVpwi5ZPkw58ApLSG3jz+o6k3zfdRCqhD+CaoNa4PFWleiZMlE9tdyB3pd
 iq2iSQSShvDQgh2y0e2EhHNtlrCKG21aBkbCiyAwjLaQo6i5P+VBoV0HHX0iv6mtmBk+
 xcUuYo7pmgdBzhDzCtJ2ZwFURZNy9CQqfZRofMaOjArksmc6hn2HbhLApTelnrv8A+++
 pNuQ==
X-Gm-Message-State: ACrzQf186yTN1eyUhbeIufPSZ2HnKJzb/HhSlO9L6zLZKoeLBHFWReFe
 kbouRxkx42uyRdka93TZh+xE6AlBzSA=
X-Google-Smtp-Source: AMsMyM4I4VpsgXyRC/Dv9WwpxkAYpZTt6NgxRuQcshwPGHnlaDLtz+jvNznsRA8SbYUMt2hbck5oTQ==
X-Received: by 2002:a17:907:72c2:b0:78d:9aeb:e4f5 with SMTP id
 du2-20020a17090772c200b0078d9aebe4f5mr14360266ejc.210.1665525386191; 
 Tue, 11 Oct 2022 14:56:26 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-055-159-121.78.55.pool.telefonica.de.
 [78.55.159.121]) by smtp.gmail.com with ESMTPSA id
 v17-20020aa7d811000000b00457f86b7e32sm9806801edq.26.2022.10.11.14.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 14:56:25 -0700 (PDT)
Date: Tue, 11 Oct 2022 21:56:15 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
CC: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_V5_3/3=5D_hw/riscv=3A_virt=3A_Ena?=
 =?US-ASCII?Q?ble_booting_S-mode_firmware_from_pflash?=
In-Reply-To: <20221004092351.18209-4-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
 <20221004092351.18209-4-sunilvl@ventanamicro.com>
Message-ID: <DE665975-00A5-44A7-BEBD-77A79E066E2D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Oct 2022 21:56:40 -0000

Am 4=2E Oktober 2022 09:23:51 UTC schrieb Sunil V L <sunilvl@ventanamicro=
=2Ecom>:
>To boot S-mode firmware payload like EDK2 from persistent
>flash storage, qemu needs to pass the flash address as the
>next_addr in fw_dynamic_info to the opensbi=2E
>
>When both -kernel and -pflash options are provided in command line,
>the kernel (and initrd if -initrd) will be copied to fw_cfg table=2E
>The S-mode FW will load the kernel/initrd from fw_cfg table=2E
>
>If only pflash is given but not -kernel, then it is the job of
>of the S-mode firmware to locate and load the kernel=2E
>
>In either case, update the kernel_entry with the flash address
>so that the opensbi can jump to the entry point of the S-mode
>firmware=2E
>
>Signed-off-by: Sunil V L <sunilvl@ventanamicro=2Ecom>
>Reviewed-by: Andrew Jones <ajones@ventanamicro=2Ecom>
>---
> hw/riscv/boot=2Ec         | 29 +++++++++++++++++++++++++++++
> hw/riscv/virt=2Ec         | 18 +++++++++++++++++-
> include/hw/riscv/boot=2Eh |  1 +
> 3 files changed, 47 insertions(+), 1 deletion(-)
>
>diff --git a/hw/riscv/boot=2Ec b/hw/riscv/boot=2Ec
>index 1ae7596873=2E=2Efa8ad27da2 100644
>--- a/hw/riscv/boot=2Ec
>+++ b/hw/riscv/boot=2Ec
>@@ -338,3 +338,32 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, h=
waddr fdt_addr)
>         riscv_cpu->env=2Efdt_addr =3D fdt_addr;
>     }
> }
>+
>+void riscv_setup_firmware_boot(MachineState *machine)
>+{
>+    if (machine->kernel_filename) {
>+        FWCfgState *fw_cfg;
>+        fw_cfg =3D fw_cfg_find();
>+
>+        assert(fw_cfg);
>+        /*
>+         * Expose the kernel, the command line, and the initrd in fw_cfg=
=2E
>+         * We don't process them here at all, it's all left to the
>+         * firmware=2E
>+         */
>+        load_image_to_fw_cfg(fw_cfg,
>+                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
>+                             machine->kernel_filename,
>+                             true);
>+        load_image_to_fw_cfg(fw_cfg,
>+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
>+                             machine->initrd_filename, false);
>+
>+        if (machine->kernel_cmdline) {
>+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
>+                           strlen(machine->kernel_cmdline) + 1);
>+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
>+                              machine->kernel_cmdline);
>+        }
>+    }
>+}
>diff --git a/hw/riscv/virt=2Ec b/hw/riscv/virt=2Ec
>index de2efccebf=2E=2Ea5bc7353b4 100644
>--- a/hw/riscv/virt=2Ec
>+++ b/hw/riscv/virt=2Ec
>@@ -1274,7 +1274,23 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>     s->fw_cfg =3D create_fw_cfg(machine);
>     rom_set_fw(s->fw_cfg);
>=20
>-    if (machine->kernel_filename) {
>+    if (drive_get(IF_PFLASH, 0, 1)) {
>+        /*
>+         * S-mode FW like EDK2 will be kept in second plash (unit 1)=2E

Nitpicking: s/plash/pflash/ ?

Best regards,
Bernhard

>+         * When both kernel, initrd and pflash options are provided in t=
he
>+         * command line, the kernel and initrd will be copied to the fw_=
cfg
>+         * table and opensbi will jump to the flash address which is the
>+         * entry point of S-mode FW=2E It is the job of the S-mode FW to=
 load
>+         * the kernel and initrd using fw_cfg table=2E
>+         *
>+         * If only pflash is given but not -kernel, then it is the job o=
f
>+         * of the S-mode firmware to locate and load the kernel=2E
>+         * In either case, the next_addr for opensbi will be the flash a=
ddress=2E
>+         */
>+        riscv_setup_firmware_boot(machine);
>+        kernel_entry =3D virt_memmap[VIRT_FLASH]=2Ebase +
>+                       virt_memmap[VIRT_FLASH]=2Esize / 2;
>+    } else if (machine->kernel_filename) {
>         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                          firmware_end_ad=
dr);
>=20
>diff --git a/include/hw/riscv/boot=2Eh b/include/hw/riscv/boot=2Eh
>index a36f7618f5=2E=2E93e5f8760d 100644
>--- a/include/hw/riscv/boot=2Eh
>+++ b/include/hw/riscv/boot=2Eh
>@@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine=
, hwaddr rom_base,
>                                   uint32_t reset_vec_size,
>                                   uint64_t kernel_entry);
> void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
>+void riscv_setup_firmware_boot(MachineState *machine);
>=20
> #endif /* RISCV_BOOT_H */


