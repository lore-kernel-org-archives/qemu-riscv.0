Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSiBH-00060b-Np
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 12:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSiBG-0005zW-1i
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 12:36:26 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSiBC-0002UA-P2
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 12:36:24 -0500
Received: by mail-ed1-x52f.google.com with SMTP id eq11so5712447edb.6
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FNQPQdmTx/rstviT2kpRNxdTZiR5031rQ5hAexk+P64=;
 b=Ky/54UyqhHG6RrmskmhQ8H2TzKJGliwGxXwLvUr3AzifkHXVWWASoROXgJB2Fs5np9
 voG+wdbr3dT01anN5qysdGyQBe5jqNsWtduWrjd7cdH64qmCyJFNbQC+MAQe2zpWobXp
 twvJejq9E5BMfUOM+i30l5ALG57pigfgs0YnUMb5mZil0xRgCgpoO7z/KEVzD2xsBh3S
 wfQs644PCmnYKAPHlBCoavitywxBktZE9tKDa/moxcsXhh0lvj7RftTlbYTUNOytRMw9
 fbtVtC6Qs0A6Go1/whvr8xTaWK67WBAFsyLj5su00wdrpIc2EjDTwqzn7Ln4SMkfbaXe
 z6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNQPQdmTx/rstviT2kpRNxdTZiR5031rQ5hAexk+P64=;
 b=tNq9b/leS9cn2fyIQLkrjSrw36MZgqEIBI5puEHHv0AUEqqxfXLEAEtPzZK+E5aZTG
 8j3+WZ0bYAgGS/3tnCTBepG7qT1zD+SvXTdKFDz94l+EDgzsO3+ydp4Uj+N/M0cIA7MV
 kqNOnPgUUuaB7ugc6MbtAKUBaJwcBufkrKS3SCBMxpL6Wt6G54xiT2GIPApYQNFUNLHr
 DWllE3tkQCphQE/sx6s9rD684orieYg800/5Cg59Zd3Vfz/JqiHl+Xo3i/QNUNq2yDGE
 l+W+73sl5MRmCuzJzK5VLfYe2P++IxMqnPYSlqos5Nz4gWXSs/CMAwDMI0zXGbKoIWGK
 wcKQ==
X-Gm-Message-State: AO0yUKW/4ETsR1l0ETjDsAyiWCbx5f/nryWxQXP+xqebtIK/mGya3vWB
 KYS8//Rku8U8rGfBhjtOW9d41Q==
X-Google-Smtp-Source: AK7set9yKAgKvl8MJzUHbhu9Pfnpee6dHAqWH+UTkXILVrCm3jLN2YPSORpP44ANvAuBuz10SJL3Sw==
X-Received: by 2002:aa7:d683:0:b0:4ac:c6ca:b1f8 with SMTP id
 d3-20020aa7d683000000b004acc6cab1f8mr6685227edr.12.1676568981019; 
 Thu, 16 Feb 2023 09:36:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5099cb000000b00497d8613532sm1190750edb.5.2023.02.16.09.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:36:20 -0800 (PST)
Date: Thu, 16 Feb 2023 18:36:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V3 4/8] hw/riscv/virt: Enable basic ACPI infrastructure
Message-ID: <20230216173619.6j64cjxlyzw5vyjm@orel>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
 <20230216164125.1945633-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216164125.1945633-5-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 16 Feb 2023 17:36:27 -0000

On Thu, Feb 16, 2023 at 10:11:21PM +0530, Sunil V L wrote:
> Add basic ACPI infrastructure for RISC-V with below tables.
>         1) DSDT with below basic objects
>                 - CPUs
>                 - fw_cfg
>         2) FADT revision 6 with HW_REDUCED flag
>         3) XSDT
>         4) RSDP
> 
> Add this functionality in a new file virt-acpi-build.c and enable
> building this infrastructure.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/Kconfig           |   1 +
>  hw/riscv/meson.build       |   1 +
>  hw/riscv/virt-acpi-build.c | 267 +++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h    |   1 +
>  4 files changed, 270 insertions(+)
>  create mode 100644 hw/riscv/virt-acpi-build.c
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 4550b3b938..6528ebfa3a 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -44,6 +44,7 @@ config RISCV_VIRT
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
>      select PLATFORM_BUS
> +    select ACPI
>  
>  config SHAKTI_C
>      bool
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index ab6cae57ea..2f7ee81be3 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
> +riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
>  
>  hw_arch += {'riscv': riscv_ss}
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> new file mode 100644
> index 0000000000..30af974db3
> --- /dev/null
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -0,0 +1,267 @@
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
> +#include "hw/acpi/utils.h"
> +#include "qapi/error.h"
> +#include "sysemu/reset.h"
> +#include "migration/vmstate.h"
> +#include "hw/riscv/virt.h"
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
> +static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev = aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +
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
> +static void build_fadt_rev6(GArray *table_data,
> +                            BIOSLinker *linker,
> +                            RISCVVirtState *s,
> +                            unsigned dsdt_tbl_offset)
> +{
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
> +static void build_dsdt(GArray *table_data,
> +                       BIOSLinker *linker,
> +                       RISCVVirtState *s)
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
> +static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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
> +    /* FADT and others pointed to by XSDT */
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
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
> +        error_printf("Try removing some objects.");
> +    }
> +    g_array_set_size(tables_blob, ROUND_UP(acpi_data_len(tables_blob),
> +                     ACPI_BUILD_TABLE_SIZE));

I would have kept acpi_align_size(), as it'll be easier to find the
duplication when refactoring later.

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
>                                   1 + FDT_APLIC_INT_CELLS)
>  
>  bool virt_is_acpi_enabled(RISCVVirtState *s);
> +void virt_acpi_setup(RISCVVirtState *vms);
>  #endif
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

