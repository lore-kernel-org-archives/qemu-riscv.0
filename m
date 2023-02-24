Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVXcB-0003Es-6h
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 07:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXc9-0003ES-EK
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 07:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXc7-0005Uo-OZ
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 07:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677243351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjBLYCel/vKH+uQ1oXBgu04cCfI9SmqPV/gnWWzsnwk=;
 b=dDeC3MTsmrMUxLiLTZ75Yn6T/3OJIBwiHfyW+oAvwVF3ZMKDC6Mr1B2wikcmxItBouT9dn
 3jN/cQXiFZOhaFm/6ngWplNUGL+XcnEWXcVAEXJZ9Xgr7NKU/sGgEmnRHmAoVNrSj1mLp8
 j3V5oLZFbgSfC5N+D/z3fM2RTiuVTFw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-FCIB4zKcP96AJ9FxBU-6AQ-1; Fri, 24 Feb 2023 07:55:49 -0500
X-MC-Unique: FCIB4zKcP96AJ9FxBU-6AQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so6500185wml.4
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 04:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjBLYCel/vKH+uQ1oXBgu04cCfI9SmqPV/gnWWzsnwk=;
 b=poxLu9I90vg3l9Snj93SNwk0xInD4Hr4WhYtNmvEp1BkUoTHxAypMI/S0njB+Pi+hG
 dife4uAeA1xWhnj8l+RyC1HwuvTaxIRjtVOUpSr0KxFS+Si9Dj3BhPQI3fropePCexbr
 jvkpua5fCE+h/Ibfv9JJKwtoJrp+DbMhEumaIHo5g+gfymp33VXw1jMJ8S+DRL2aKYr/
 8YH8xc74WSR111acVyTOrNWiYToF/7rswrWi6EJZIQ4ttYWO+QKjc/9trOJ+HnGnJHjv
 PdOesbEooqKnsQn5yMD/19SfV04Qir6zvOjXab2FQ4vSmvAbHFDtYi6ZXl1qfQ25PjuT
 fCiQ==
X-Gm-Message-State: AO0yUKX42ZiuK02Xj4GIhEeGuCdwwUvm30px2vaUFyWoLt+O5qaZOOvU
 Fz3bWaF5NBmGLak1Ggg4zJt8k1csHt8BXK5caRYe6AxOHKMurXqL39CV2812otH+XRBv4mQqQsQ
 WLpnnflIgF6JnPWg=
X-Received: by 2002:adf:fb06:0:b0:2c5:6247:b89d with SMTP id
 c6-20020adffb06000000b002c56247b89dmr12659234wrr.6.1677243346869; 
 Fri, 24 Feb 2023 04:55:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/miho3gFdzMCvxDsQ04OQ+AknzAskjUSPx1cZZEqtCpSikxU/U/j75aXNoN4hw4mKCtZzZpQ==
X-Received: by 2002:adf:fb06:0:b0:2c5:6247:b89d with SMTP id
 c6-20020adffb06000000b002c56247b89dmr12659218wrr.6.1677243346621; 
 Fri, 24 Feb 2023 04:55:46 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003c6bbe910fdsm2832581wms.9.2023.02.24.04.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 04:55:46 -0800 (PST)
Date: Fri, 24 Feb 2023 13:55:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 6/8] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Message-ID: <20230224135545.0df4222f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230224083701.2657063-7-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-7-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 12:55:53 -0000

On Fri, 24 Feb 2023 14:06:59 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> RISC-V ACPI platforms need to provide RISC-V Hart Capabilities
> Table (RHCT). Add this to the ACPI tables.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 76 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8b85b34c55..7037fe7634 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -33,6 +33,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/numa.h"
> +#include "hw/intc/riscv_aclint.h"
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> @@ -83,6 +84,78 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
>      aml_append(scope, dev);
>  }
>  
> +#define RHCT_NODE_ARRAY_OFFSET 56

same as previous patch, here should be proper comment
otherwise reviewer has no clue where to look for reference.

> +static void build_rhct(GArray *table_data,
> +                       BIOSLinker *linker,
> +                       RISCVVirtState *s)
> +{
> +    MachineState *ms = MACHINE(s);
> +    uint32_t acpi_proc_id = 0;
> +    int i, socket;
> +    RISCVCPU *cpu;
> +    char *isa;
> +    size_t len, aligned_len;
> +    uint32_t isa_offset, num_rhct_nodes;
> +
> +    AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> +                        .oem_table_id = s->oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    build_append_int_noprefix(table_data, 0x0, 4);   /* Reserved */
> +
> +    /* Time Base Frequency */
> +    build_append_int_noprefix(table_data,
> +                              RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
> +
> +    /* ISA + N hart info */
> +    num_rhct_nodes = 1 + ms->smp.cpus;
> +
> +    /* Number of RHCT nodes*/
> +    build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> +
> +    /* Offset to the RHCT node array */
> +    build_append_int_noprefix(table_data, RHCT_NODE_ARRAY_OFFSET, 4);
> +
> +    /* ISA string node */
> +    isa_offset = table_data->len - table.table_offset;
> +    build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
> +
> +    cpu = &s->soc[0].harts[0];
> +    isa = riscv_isa_string(cpu);
> +    len = 8 + strlen(isa) + 1;
> +    aligned_len = (len % 2) ? (len + 1) : len;
> +
> +    build_append_int_noprefix(table_data, aligned_len, 2);   /* Length */
> +    build_append_int_noprefix(table_data, 0x1, 2);           /* Revision */
> +
> +    /* ISA string length including NUL */
> +    build_append_int_noprefix(table_data, strlen(isa) + 1, 2);
> +    g_array_append_vals(table_data, isa, strlen(isa) + 1);   /* ISA string */
> +
> +    if (aligned_len != len) {
> +        build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
> +    }
> +
> +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> +        for (i = 0; i < s->soc[socket].num_harts; i++) {
> +            build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> +            build_append_int_noprefix(table_data, 16, 2);      /* Length */
> +            build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
> +            build_append_int_noprefix(table_data, 1, 2); /* Number of offsets */
> +
> +            /* ACPI Processor UID */
> +            build_append_int_noprefix(table_data, acpi_proc_id, 4);
> +
> +            /* Offsets[0] */
> +            build_append_int_noprefix(table_data, isa_offset, 4);
> +            acpi_proc_id++;
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  /* FADT */
>  static void build_fadt_rev6(GArray *table_data,
>                              BIOSLinker *linker,
> @@ -197,6 +270,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, s);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_rhct(tables_blob, tables->linker, s);
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,


