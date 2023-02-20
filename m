Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUBAC-0004u0-Ii
	for mharc-qemu-riscv@gnu.org; Mon, 20 Feb 2023 13:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pUB9z-0004lr-H0
 for qemu-riscv@nongnu.org; Mon, 20 Feb 2023 13:45:17 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pUB9x-00054O-4b
 for qemu-riscv@nongnu.org; Mon, 20 Feb 2023 13:45:11 -0500
Received: by mail-pl1-x631.google.com with SMTP id z2so2662486plf.12
 for <qemu-riscv@nongnu.org>; Mon, 20 Feb 2023 10:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AbwySDNvdaEuNnPGdb1KzLC3ObzX0M7s1RFORPVaYjw=;
 b=TyHUhhe3BxopEozuc7Y/v8rL+23o9rSojbJvXkNUOol4iNTa3+ddTnvg55UiKPn7pY
 g2gdo9DS06Omrq6JdiZ2+LuXgtLkf0vVd/gaaJlrFQthujIaJTxBKyf5ogYxW9twGe88
 qtBvgDd7SH7ceqjYmGriHCTKXhsnHd9v7OuT98ixhvNxoJ4FcbLc9tEFdcmCwu/dWnv9
 SP79DnHjOMSPnK141f61Ga8fMWgMK6YdZ53ZQT86Amnsmh5OmAPgiPlL+9VgcSliWwuk
 FUU7Ia/uF8Ef5dQKEzg1TPthMsS9uavYiTn0o1ht3lnUzWBX0Q7j6/BE0PoE96oFLwlJ
 IMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AbwySDNvdaEuNnPGdb1KzLC3ObzX0M7s1RFORPVaYjw=;
 b=vzZ6sY7Mq2XyS7jIe0bSKUW2/pUIDlHg939kIzi7rW0ATJ6eRkZCkBgKec27prjPeE
 cIlqispFThCcsCrKMjwEnnz8aOSygZUCOOcQG6WPLmqu2C8ZSrL1gSGn91voE5UzH9BJ
 6P3vNeyMTYjVN2MSOB8V/DVEuY5B1uTdpxGDd82WS5cHF6zQOLs5r26p9iBKVvXcS9Hw
 d1z1j9/iP8BDIeIy5VH7MWmjJDSCXq4DPdTYLItwJ1qSAltZKSZ5u1ZiFhqeyOOQnUSo
 zCNtWxaQJ7kUXdJKvlFvOt85qMFP4L/RjsmDuFS/mArV4fvtlyM1/5vwbnwjBnfuk/6r
 ATCw==
X-Gm-Message-State: AO0yUKUz2Ux9uqNHOZ47lrD86OY35ajXWr8WtQq7tr1SoAGcsNfDBZiT
 kWiDeldWibz/pkINsJCh4LnkVQ==
X-Google-Smtp-Source: AK7set/Hcv+fVGM1O77wLrbLE1fk6gAOWwl1QB4603zCGGwvxwYmIpS6TsM0FAXuSW4OA6aCj6ZNgQ==
X-Received: by 2002:a17:902:e54e:b0:19a:ac93:64c with SMTP id
 n14-20020a170902e54e00b0019aac93064cmr3376255plf.29.1676918706526; 
 Mon, 20 Feb 2023 10:45:06 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2465108plk.7.2023.02.20.10.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:45:06 -0800 (PST)
Date: Tue, 21 Feb 2023 00:15:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V3 4/8] hw/riscv/virt: Enable basic ACPI infrastructure
Message-ID: <Y/O/rFl1RrSJP1WL@sunil-laptop>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
 <20230216164125.1945633-5-sunilvl@ventanamicro.com>
 <20230216173619.6j64cjxlyzw5vyjm@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216173619.6j64cjxlyzw5vyjm@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 20 Feb 2023 18:45:18 -0000

On Thu, Feb 16, 2023 at 06:36:19PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 10:11:21PM +0530, Sunil V L wrote:
> > Add basic ACPI infrastructure for RISC-V with below tables.
> >         1) DSDT with below basic objects
> >                 - CPUs
> >                 - fw_cfg
> >         2) FADT revision 6 with HW_REDUCED flag
> >         3) XSDT
> >         4) RSDP
> > 
> > Add this functionality in a new file virt-acpi-build.c and enable
> > building this infrastructure.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/riscv/Kconfig           |   1 +
> >  hw/riscv/meson.build       |   1 +
> >  hw/riscv/virt-acpi-build.c | 267 +++++++++++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h    |   1 +
> >  4 files changed, 270 insertions(+)
> >  create mode 100644 hw/riscv/virt-acpi-build.c
> > 
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 4550b3b938..6528ebfa3a 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -44,6 +44,7 @@ config RISCV_VIRT
> >      select VIRTIO_MMIO
> >      select FW_CFG_DMA
> >      select PLATFORM_BUS
> > +    select ACPI
> >  
> >  config SHAKTI_C
> >      bool
> > diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> > index ab6cae57ea..2f7ee81be3 100644
> > --- a/hw/riscv/meson.build
> > +++ b/hw/riscv/meson.build
> > @@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
> >  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
> >  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
> >  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
> > +riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
> >  
> >  hw_arch += {'riscv': riscv_ss}
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > new file mode 100644
> > index 0000000000..30af974db3
> > --- /dev/null
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -0,0 +1,267 @@
> > +/*
> > + * Support for generating ACPI tables and passing them to Guests
> > + *
> > + * RISC-V virt ACPI generation
> > + *
> > + * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
> > + * Copyright (C) 2006 Fabrice Bellard
> > + * Copyright (C) 2013 Red Hat Inc
> > + * Copyright (c) 2015 HUAWEI TECHNOLOGIES CO.,LTD.
> > + * Copyright (C) 2021-2023 Ventana Micro Systems Inc
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > +
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > +
> > + * You should have received a copy of the GNU General Public License along
> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/acpi/acpi-defs.h"
> > +#include "hw/acpi/acpi.h"
> > +#include "hw/acpi/aml-build.h"
> > +#include "hw/acpi/utils.h"
> > +#include "qapi/error.h"
> > +#include "sysemu/reset.h"
> > +#include "migration/vmstate.h"
> > +#include "hw/riscv/virt.h"
> > +
> > +#define ACPI_BUILD_TABLE_SIZE             0x20000
> > +
> > +typedef struct AcpiBuildState {
> > +    /* Copy of table in RAM (for patching) */
> > +    MemoryRegion *table_mr;
> > +    MemoryRegion *rsdp_mr;
> > +    MemoryRegion *linker_mr;
> > +    /* Is table patched? */
> > +    bool patched;
> > +} AcpiBuildState;
> > +
> > +static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> > +{
> > +    MachineState *ms = MACHINE(s);
> > +    uint16_t i;
> > +
> > +    for (i = 0; i < ms->smp.cpus; i++) {
> > +        Aml *dev = aml_device("C%.03X", i);
> > +        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
> > +        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> > +        aml_append(scope, dev);
> > +    }
> > +}
> > +
> > +static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> > +{
> > +    Aml *dev = aml_device("FWCF");
> > +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> > +
> > +    /* device present, functioning, decoding, not shown in UI */
> > +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> > +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> > +
> > +    Aml *crs = aml_resource_template();
> > +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> > +                                       fw_cfg_memmap->size, AML_READ_WRITE));
> > +    aml_append(dev, aml_name_decl("_CRS", crs));
> > +    aml_append(scope, dev);
> > +}
> > +
> > +/* FADT */
> > +static void build_fadt_rev6(GArray *table_data,
> > +                            BIOSLinker *linker,
> > +                            RISCVVirtState *s,
> > +                            unsigned dsdt_tbl_offset)
> > +{
> > +    AcpiFadtData fadt = {
> > +        .rev = 6,
> > +        .minor_ver = 0,
> > +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> > +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
> > +    };
> > +
> > +    build_fadt(table_data, linker, &fadt, s->oem_id, s->oem_table_id);
> > +}
> > +
> > +/* DSDT */
> > +static void build_dsdt(GArray *table_data,
> > +                       BIOSLinker *linker,
> > +                       RISCVVirtState *s)
> > +{
> > +    Aml *scope, *dsdt;
> > +    const MemMapEntry *memmap = s->memmap;
> > +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
> > +                        .oem_table_id = s->oem_table_id };
> > +
> > +
> > +    acpi_table_begin(&table, table_data);
> > +    dsdt = init_aml_allocator();
> > +
> > +    /*
> > +     * When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> > +     * While UEFI can use libfdt to disable the RTC device node in the DTB that
> > +     * it passes to the OS, it cannot modify AML. Therefore, we won't generate
> > +     * the RTC ACPI device at all when using UEFI.
> > +     */
> > +    scope = aml_scope("\\_SB");
> > +    acpi_dsdt_add_cpus(scope, s);
> > +
> > +    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> > +
> > +    aml_append(dsdt, scope);
> > +
> > +    /* copy AML table into ACPI tables blob and patch header there */
> > +    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> > +
> > +    acpi_table_end(linker, &table);
> > +    free_aml_allocator();
> > +}
> > +
> > +static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
> > +{
> > +    GArray *table_offsets;
> > +    unsigned dsdt, xsdt;
> > +    GArray *tables_blob = tables->table_data;
> > +
> > +    table_offsets = g_array_new(false, true,
> > +                                sizeof(uint32_t));
> > +
> > +    bios_linker_loader_alloc(tables->linker,
> > +                             ACPI_BUILD_TABLE_FILE, tables_blob,
> > +                             64, false);
> > +
> > +    /* DSDT is pointed to by FADT */
> > +    dsdt = tables_blob->len;
> > +    build_dsdt(tables_blob, tables->linker, s);
> > +
> > +    /* FADT and others pointed to by XSDT */
> > +    acpi_add_table(table_offsets, tables_blob);
> > +    build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
> > +
> > +    /* XSDT is pointed to by RSDP */
> > +    xsdt = tables_blob->len;
> > +    build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> > +                s->oem_table_id);
> > +
> > +    /* RSDP is in FSEG memory, so allocate it separately */
> > +    {
> > +        AcpiRsdpData rsdp_data = {
> > +            .revision = 2,
> > +            .oem_id = s->oem_id,
> > +            .xsdt_tbl_offset = &xsdt,
> > +            .rsdt_tbl_offset = NULL,
> > +        };
> > +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> > +    }
> > +
> > +    /*
> > +     * The align size is 128, warn if 64k is not enough therefore
> > +     * the align size could be resized.
> > +     */
> > +    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
> > +        warn_report("ACPI table size %u exceeds %d bytes,"
> > +                    " migration may not work",
> > +                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
> > +        error_printf("Try removing some objects.");
> > +    }
> > +    g_array_set_size(tables_blob, ROUND_UP(acpi_data_len(tables_blob),
> > +                     ACPI_BUILD_TABLE_SIZE));
> 
> I would have kept acpi_align_size(), as it'll be easier to find the
> duplication when refactoring later.
> 
Okay.. Let me add this back. Will wait till Friday to check if there are
any other comments and send updated series.

Thanks!
Sunil

