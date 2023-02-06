Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOyZp-0000Mu-Go
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 05:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyZc-0000M0-GS; Mon, 06 Feb 2023 05:18:17 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyZZ-0000f1-BS; Mon, 06 Feb 2023 05:18:07 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hx15so32610573ejc.11;
 Mon, 06 Feb 2023 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h1vHMSfJ2prz574cUnYV7blK1fKWTRyynGIIMC/LgBU=;
 b=NcTFfsPX1XNZzBMffMWVaHH7bxAF0GQaq+V6fWSJVFKAfX6gyI5pQgLjfoIz0NeCmX
 rYOUBbXF+lm0SWMZ9+AT68f1igOQPMbyncHmkkDil6uEDTK/B37QA0ZV7QzitM07B1v+
 j31aV6GIl9ytL8l9vpkAmACS/KYbMhY8dbQ4DbweY9HYZGzpttCHeBK7KYuIoFkWFxbc
 7+V42z6/O4q179+Qu/iGK6YenXt/bgy3tQpikOWdNFuxvTZSsMiq4/YMWlJYK3Y2CuDX
 W7OEJPpGSfbiIT0ImUT8pGASWchos7oHmqMQZOXGwfXLXkgx2hbH5emq5h0yhfcmfDpQ
 8UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h1vHMSfJ2prz574cUnYV7blK1fKWTRyynGIIMC/LgBU=;
 b=xuOPFGMbZEpSpQM7F0/tL6wOcc6+mcGv8PevUIuOfvFLPdUCr5PQ4dJGdKPnvfJS4L
 X6x5RnMGZleiGEw8K6hfPFU5tw/wou+UHQKeQLoE9iZ2ftpApLyhENBD+3rqrhwip7xD
 21cvi4AIdrVMpwsq4orsOz6aVPXMkEnZa8of9q6Q96Fj6K2gFErxiLFSs+hfzzZSlHyJ
 6Z4rVlg8WnenpGhX4NG7i1sw5CivZ6SsavL0w/OGYyfZvG209xTsIqNwuIIMB649snGL
 2ZzTIh4Tn7GLgBILVgDRsEGuvpyXM29wbN15I6jOSY7EA6BibhRMBwl9Lk2REMjZPXTA
 Psbw==
X-Gm-Message-State: AO0yUKUsJ8kSdJgDdK7jOYLg33K9RDlMpgldTEw37X4arpPj9S6yQtVS
 rvx9vBr2rm5Dm9ggHMqJ2MCqxEOTmWlgPEJ2GQ8=
X-Google-Smtp-Source: AK7set89zP7uMHR1J+KMfgsfvb+081yFcTqnRUzD86HWPxednpJ6sFjs2/ELPJjn2K1DUrAamiN47Bidlkb5U5oz7oA=
X-Received: by 2002:a17:906:8395:b0:888:f761:87aa with SMTP id
 p21-20020a170906839500b00888f76187aamr6179275ejx.163.1675678682257; Mon, 06
 Feb 2023 02:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-5-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 18:17:50 +0800
Message-ID: <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Mon, 06 Feb 2023 10:18:18 -0000

On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> Add few basic ACPI tables and DSDT with few devices in a
> new file virt-acpi-build.c.
>
> These are mostly leveraged from arm64.

There are lots of same ACPI codes existing in x86/arm/riscv. I believe
some refactoring work is needed before ACPI support fully lands on
RISC-V.
For example, we can extract the common part among x86/arm/riscv into a
separate file, like hw/acpi/acpi-build.c?

>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 292 +++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h    |   1 +
>  2 files changed, 293 insertions(+)
>  create mode 100644 hw/riscv/virt-acpi-build.c
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> new file mode 100644
> index 0000000000..0410b955bd
> --- /dev/null
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -0,0 +1,292 @@
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
> +    /* Copy of table in RAM (for patching). */

nits: removing the ending .

> +    MemoryRegion *table_mr;
> +    MemoryRegion *rsdp_mr;
> +    MemoryRegion *linker_mr;
> +    /* Is table patched? */
> +    bool patched;
> +} AcpiBuildState;
> +
> +static void

nits: please put above in the same line

> +acpi_align_size(GArray *blob, unsigned align)
> +{
> +    /*
> +     * Align size to multiple of given size. This reduces the chance
> +     * we need to change size in the future (breaking cross version migration).
> +     */
> +    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
> +}
> +
> +static void
> +acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *vms)

QEMU convention is to use 's' for the model state, so:

s/vms/s/g

> +{
> +    MachineState *ms = MACHINE(vms);
> +    uint16_t i;
> +
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
> +                 RISCVVirtState *vms, unsigned dsdt_tbl_offset)
> +{
> +    /* ACPI v5.1 */
> +    AcpiFadtData fadt = {
> +        .rev = 6,
> +        .minor_ver = 0,
> +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
> +    };
> +
> +    build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
> +}
> +
> +/* DSDT */
> +static void
> +build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)
> +{
> +    Aml *scope, *dsdt;
> +    const MemMapEntry *memmap = vms->memmap;
> +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
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
> +    acpi_dsdt_add_cpus(scope, vms);
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
> +virt_acpi_build(RISCVVirtState *vms, AcpiBuildTables *tables)
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
> +    build_dsdt(tables_blob, tables->linker, vms);
> +
> +    /* FADT and others pointed to by RSDT */
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_fadt_rev6(tables_blob, tables->linker, vms, dsdt);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, vms);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_rhct(tables_blob, tables->linker, vms);
> +
> +    /* XSDT is pointed to by RSDP */
> +    xsdt = tables_blob->len;
> +    build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
> +                vms->oem_table_id);
> +
> +    /* RSDP is in FSEG memory, so allocate it separately */
> +    {
> +        AcpiRsdpData rsdp_data = {
> +            .revision = 2,
> +            .oem_id = vms->oem_id,
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
> +    /* Cleanup memory that's no longer used. */

Clean up

nits: removing the ending .

> +    g_array_free(table_offsets, true);
> +}
> +
> +static void
> +acpi_ram_update(MemoryRegion *mr, GArray *data)
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
> +static void
> +virt_acpi_build_update(void *build_opaque)
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
> +static void
> +virt_acpi_build_reset(void *build_opaque)
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
> +void
> +virt_acpi_setup(RISCVVirtState *vms)
> +{
> +    AcpiBuildTables tables;
> +    AcpiBuildState *build_state;
> +
> +    build_state = g_malloc0(sizeof *build_state);
> +
> +    acpi_build_tables_init(&tables);
> +    virt_acpi_build(vms, &tables);
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
> +     * Cleanup tables but don't free the memory: we track it

s/Cleanup/Clean up

> +     * in build_state.
> +     */
> +    acpi_build_tables_cleanup(&tables, false);
> +}
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 379501edcc..e5c474b26e 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -126,4 +126,5 @@ enum {
>                                   1 + FDT_APLIC_INT_CELLS)
>
>  bool virt_is_acpi_enabled(RISCVVirtState *s);
> +void virt_acpi_setup(RISCVVirtState *vms);
>  #endif
> --

Regards,
Bin

