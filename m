Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdsD-0002PZ-3s
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRds6-0002DE-Ls
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 13:48:14 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRds3-00011T-8R
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 13:48:13 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so4034342otj.4
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 10:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oHppDp322nwlF/c3UQe4cnNgbZrjp4qW7Kn/FZcyf2k=;
 b=m4KL0gppgPpyG1WToXV761g2G+cEpd80fnj/G4ysBjhene2xxI5Xp5ixu76JN85zBX
 jz2wH4Cy0NmcvPLBRH7M7pcvpRgKykrk8Vr1lIHWhwqMakLWQHULotU5ZNs8mNb2iJO7
 7ebrGz1tYJj2B8zGYVRB8nKPl9zQFhIMfKEZEeJlcEFy7hbG+TD72hqgA5TanOOVy9uu
 zgdyNSsCblenGd4cb5RgTP3sfJAGniZyCYRby46JWGvpZfG0p2b/ZYAopeh+z5brnRhn
 wHWW21/n9ehG4toE/kjprkJeDCig7Hm04Bo4jikpPXcw7Bm/2dyfSNlcz8Vut/zulfSO
 8z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oHppDp322nwlF/c3UQe4cnNgbZrjp4qW7Kn/FZcyf2k=;
 b=OMGPTJKj8Vcz0l95M4rDlmpefnY4+ka2fTNMTlF+jHQ+HvfR4BPVINLxWG5Eht//L3
 qJIm59ZaNelSIvNIQ+GjOUzNZFRu6NFvm5FGuxLgxcTjUcBqHsoy7hMV1a2V3oO1na0N
 UV4Z/fv3JPRB7jbHwJMSpPITQdc20c/K1nZBnHtBu5qa7xz2YQ768Gwq4sfc8h0FTl+B
 PUleshSV7ixg0Xaq8TOq5HN8yrTMMFwuz6ZacfzKuyk1SxOOGXXWebKDNmZSraMbOqVB
 NOYn+GBtzeQnJzMfZpkCyBFcbNhMSB24J0NyPg7UmYx46ObUzNVGtRQI3YBIwjC1hGGW
 qsdg==
X-Gm-Message-State: AO0yUKVus/vL5wHVbatS0PDyy7jweW3awy8snB1H3cnvdlbk/weW9+ZG
 jG5uCvywuzesse4rgRjMuFdvjw==
X-Google-Smtp-Source: AK7set/XdpznbI1ZB+tzttSwEXHTfGlnL3YhdsKC4+jBrucV27EkV2zpIJ/zQTWxhEHTZZ3nHL3MzQ==
X-Received: by 2002:a05:6830:573:b0:68d:4dd8:fcd1 with SMTP id
 f19-20020a056830057300b0068d4dd8fcd1mr14573305otc.9.1676314089071; 
 Mon, 13 Feb 2023 10:48:09 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 dj6-20020a0568303a8600b0068d542f630fsm5475710otb.76.2023.02.13.10.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 10:48:08 -0800 (PST)
Message-ID: <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
Date: Mon, 13 Feb 2023 15:48:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
To: Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230213144038.2547584-5-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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
X-List-Received-Date: Mon, 13 Feb 2023 18:48:15 -0000

Sunil,

This patch is a bit confusing to me. You're using functions that doesn't exist
in the code base yet (build_madt and build_rhct) because they are introduced
in later patches. This also means that this patch is not being compiled tested,
because otherwise it would throw a compile error. And the build of the file only
happens after patch 8.

Now, there is no hard rule in QEMU that dictates that every patch must be compile
tested, but nevertheless this is a good rule to follow that makes our lives easier
when bisecting and cherry-pick individual patches.

My suggestion for this patch is:

- squash both patches 7 and 8 into this patch to allow the file to be built;

- remove the code that is referring to stuff that you haven't add yet:

$ git diff
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 3c4da6c385..eb17029b64 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -156,12 +156,6 @@ virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
      acpi_add_table(table_offsets, tables_blob);
      build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
  
-    acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, s);
-
-    acpi_add_table(table_offsets, tables_blob);
-    build_rhct(tables_blob, tables->linker, s);
-
      /* XSDT is pointed to by RSDP */
      xsdt = tables_blob->len;
      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,


- in patch 5, add back the lines in virt_acpi_build() that uses build_madt();

- in patch 6, add back the lines in virt_acpi_build() that uses build_rhct();


This will make this patch to be compiled and built right away without interfering with
the end result of the series.


One more suggestion:


On 2/13/23 11:40, Sunil V L wrote:
> Add few basic ACPI tables and DSDT with few devices in a
> new file virt-acpi-build.c.
> 
> These are mostly leveraged from arm64.

Quick rant that you've already heard: I don't really understand why there is so
much ACPI code duplication everywhere. I really don't. E.g. acpi_align_size() is
copied verbatim in hw/arm/virt-acpi-build.c, hw/i386/acpi-build.c and
hw/loongarch/acpi-build.c. I don't see why we can't have a common file in hw/acpi
with helpers and so on that every ACPI architecture can use, and then the
individual drivers for each arch can have its own magic sauce.

All this said, instead of mentioning "this is mostly leveraged from arm64", you
can make a brief summary of the changes you've done from the arm64 version. This
will help guide the review into focusing on the novel code you're adding and
ignore the copied bits.


Thanks,


Daniel


> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>   hw/riscv/virt-acpi-build.c | 285 +++++++++++++++++++++++++++++++++++++
>   include/hw/riscv/virt.h    |   1 +
>   2 files changed, 286 insertions(+)
>   create mode 100644 hw/riscv/virt-acpi-build.c
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> new file mode 100644
> index 0000000000..3c4da6c385
> --- /dev/null
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -0,0 +1,285 @@
> +/*
> + * Support for generating ACPI tables and passing them to Guests
> + *
> + * RISC-V virt ACPI generation
> + *
> + * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
> + * Copyright (C) 2006 Fabrice Bellard
> + * Copyright (C) 2013 Red Hat Inc
> + * Copyright (c) 2015 HUAWEI TECHNOLOGIES CO.,LTD.
> + * Copyright (C) 2021-2023 Ventana Micro Systems Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/riscv/virt.h"
> +#include "hw/riscv/numa.h"
> +#include "hw/acpi/pci.h"
> +#include "hw/acpi/utils.h"
> +#include "sysemu/reset.h"
> +#include "hw/pci-host/gpex.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +
> +#define ACPI_BUILD_TABLE_SIZE             0x20000
> +
> +typedef struct AcpiBuildState {
> +    /* Copy of table in RAM (for patching) */
> +    MemoryRegion *table_mr;
> +    MemoryRegion *rsdp_mr;
> +    MemoryRegion *linker_mr;
> +    /* Is table patched? */
> +    bool patched;
> +} AcpiBuildState;
> +
> +static void acpi_align_size(GArray *blob, unsigned align)
> +{
> +    /*
> +     * Align size to multiple of given size. This reduces the chance
> +     * we need to change size in the future (breaking cross version migration).
> +     */
> +    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
> +}
> +
> +static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> +{
> +    MachineState *ms = MACHINE(s);
> +    uint16_t i;
> +
> +    for (i = 0; i < ms->smp.cpus; i++) {
> +        Aml *dev = aml_device("C%.03X", i);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        aml_append(scope, dev);
> +    }
> +}
> +
> +static void
> +acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev = aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
> +/* FADT */
> +static void
> +build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
> +                RISCVVirtState *s, unsigned dsdt_tbl_offset)
> +{
> +    /* ACPI v5.1 */
> +    AcpiFadtData fadt = {
> +        .rev = 6,
> +        .minor_ver = 0,
> +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
> +    };
> +
> +    build_fadt(table_data, linker, &fadt, s->oem_id, s->oem_table_id);
> +}
> +
> +/* DSDT */
> +static void
> +build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
> +{
> +    Aml *scope, *dsdt;
> +    const MemMapEntry *memmap = s->memmap;
> +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
> +                        .oem_table_id = s->oem_table_id };
> +
> +
> +    acpi_table_begin(&table, table_data);
> +    dsdt = init_aml_allocator();
> +
> +    /*
> +     * When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> +     * While UEFI can use libfdt to disable the RTC device node in the DTB that
> +     * it passes to the OS, it cannot modify AML. Therefore, we won't generate
> +     * the RTC ACPI device at all when using UEFI.
> +     */
> +    scope = aml_scope("\\_SB");
> +    acpi_dsdt_add_cpus(scope, s);
> +
> +    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> +
> +    aml_append(dsdt, scope);
> +
> +    /* copy AML table into ACPI tables blob and patch header there */
> +    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> +
> +    acpi_table_end(linker, &table);
> +    free_aml_allocator();
> +}
> +
> +static void
> +virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
> +{
> +    GArray *table_offsets;
> +    unsigned dsdt, xsdt;
> +    GArray *tables_blob = tables->table_data;
> +
> +    table_offsets = g_array_new(false, true,
> +                                sizeof(uint32_t));
> +
> +    bios_linker_loader_alloc(tables->linker,
> +                             ACPI_BUILD_TABLE_FILE, tables_blob,
> +                             64, false);
> +
> +    /* DSDT is pointed to by FADT */
> +    dsdt = tables_blob->len;
> +    build_dsdt(tables_blob, tables->linker, s);
> +
> +    /* FADT and others pointed to by RSDT */
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, s);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_rhct(tables_blob, tables->linker, s);
> +
> +    /* XSDT is pointed to by RSDP */
> +    xsdt = tables_blob->len;
> +    build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> +                s->oem_table_id);
> +
> +    /* RSDP is in FSEG memory, so allocate it separately */
> +    {
> +        AcpiRsdpData rsdp_data = {
> +            .revision = 2,
> +            .oem_id = s->oem_id,
> +            .xsdt_tbl_offset = &xsdt,
> +            .rsdt_tbl_offset = NULL,
> +        };
> +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> +    }
> +
> +    /*
> +     * The align size is 128, warn if 64k is not enough therefore
> +     * the align size could be resized.
> +     */
> +    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
> +        warn_report("ACPI table size %u exceeds %d bytes,"
> +                    " migration may not work",
> +                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
> +        error_printf("Try removing CPUs, NUMA nodes, memory slots"
> +                     " or PCI bridges.");
> +    }
> +    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
> +
> +
> +    /* Clean up memory that's no longer used */
> +    g_array_free(table_offsets, true);
> +}
> +
> +static void acpi_ram_update(MemoryRegion *mr, GArray *data)
> +{
> +    uint32_t size = acpi_data_len(data);
> +
> +    /*
> +     * Make sure RAM size is correct - in case it got changed
> +     * e.g. by migration
> +     */
> +    memory_region_ram_resize(mr, size, &error_abort);
> +
> +    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
> +    memory_region_set_dirty(mr, 0, size);
> +}
> +
> +static void virt_acpi_build_update(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    AcpiBuildTables tables;
> +
> +    /* No state to update or already patched? Nothing to do. */
> +    if (!build_state || build_state->patched) {
> +        return;
> +    }
> +    build_state->patched = true;
> +
> +    acpi_build_tables_init(&tables);
> +
> +    virt_acpi_build(RISCV_VIRT_MACHINE(qdev_get_machine()), &tables);
> +
> +    acpi_ram_update(build_state->table_mr, tables.table_data);
> +    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> +    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
> +
> +    acpi_build_tables_cleanup(&tables, true);
> +}
> +
> +static void virt_acpi_build_reset(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    build_state->patched = false;
> +}
> +
> +static const VMStateDescription vmstate_virt_acpi_build = {
> +    .name = "virt_acpi_build",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(patched, AcpiBuildState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +void virt_acpi_setup(RISCVVirtState *s)
> +{
> +    AcpiBuildTables tables;
> +    AcpiBuildState *build_state;
> +
> +    build_state = g_malloc0(sizeof *build_state);
> +
> +    acpi_build_tables_init(&tables);
> +    virt_acpi_build(s, &tables);
> +
> +    /* Now expose it all to Guest */
> +    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                              build_state, tables.table_data,
> +                                              ACPI_BUILD_TABLE_FILE);
> +    assert(build_state->table_mr != NULL);
> +
> +    build_state->linker_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                               build_state,
> +                                               tables.linker->cmd_blob,
> +                                               ACPI_BUILD_LOADER_FILE);
> +
> +    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                             build_state, tables.rsdp,
> +                                             ACPI_BUILD_RSDP_FILE);
> +
> +    qemu_register_reset(virt_acpi_build_reset, build_state);
> +    virt_acpi_build_reset(build_state);
> +    vmstate_register(NULL, 0, &vmstate_virt_acpi_build, build_state);
> +
> +    /*
> +     * Clean up tables but don't free the memory: we track it
> +     * in build_state.
> +     */
> +    acpi_build_tables_cleanup(&tables, false);
> +}
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 379501edcc..e5c474b26e 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -126,4 +126,5 @@ enum {
>                                    1 + FDT_APLIC_INT_CELLS)
>   
>   bool virt_is_acpi_enabled(RISCVVirtState *s);
> +void virt_acpi_setup(RISCVVirtState *vms);
>   #endif

