Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVXaC-0007Zf-VL
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 07:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXaB-0007ZI-GT
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 07:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXa9-0003kV-Ki
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 07:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677243228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJcbME7ttucEmFY/ggwcocRddQ3yO+IDhjI8lavuKLk=;
 b=XrmhIK6HzpstvR4qwf3F4RLB0h7gL9mPOQQ6YoPezXTJfhqay3Xed4ROzNqTmVHghUbaMO
 e/fJESNjqksMjkHbZPndRLpk3kFRPz0+eLxGViHBIUg1pM5CpXFGaqxcrZxN3queVHF1B9
 WqoJ/7CEpZ9DqtcoK9NhjJFX9z3ZJEE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-So7GDBXOMq-b-pOHyIJAFA-1; Fri, 24 Feb 2023 07:53:46 -0500
X-MC-Unique: So7GDBXOMq-b-pOHyIJAFA-1
Received: by mail-wm1-f70.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso1187917wmc.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 04:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJcbME7ttucEmFY/ggwcocRddQ3yO+IDhjI8lavuKLk=;
 b=ptluOM/0ThvdcR23JFmc/nMuHIAfDhAnBr/CK4qOtj98qXetKa8Na09QadkgsbJ9fo
 kUEfoaZkuy/0NBPG0QJ52eSa7P0KoK3thTo95tbkzH1PVKu6wMKC+HQUvdiRDg0mHXxy
 dlJkovMfvRf09zjDx45d3Rey3p4FsD47UkAaa6GFXU9MZpuzsH2GM2LSo17/ih2uuR6x
 oGtcU0OUtS+rntqyq7zKhmzN8AN5NCljIA7QlHGkgoUK66fAtuNItH2cvxpZMWKBdtmJ
 Es4Rwiy0aI5/gEoW/zzhfmbbiiyjSRPsbXKFgRPVULdwAC41j3TboZQJZVP4B/OpR7JH
 CV6w==
X-Gm-Message-State: AO0yUKV7YgFQZmZh3t61VakUoow4xoG7JayUrksnWdmZ+GTFbUgcHGi2
 RKO1OJ0fuuMiFPXYwv2wsEhuh39g1tSbE8bW36mBs8y9ki6aFXq/mi/oyGOY275tjdZC44f0rXc
 Mub0FN+aZ2gXP5tI=
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr3387995wrp.13.1677243225681; 
 Fri, 24 Feb 2023 04:53:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+bFJkK1oQrAgntC+DSkgjz3TgGtgDlhLRKLcR153cIVHOiMVNg2o+yOPWiOeLYSEEP0r0iLQ==
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr3387980wrp.13.1677243225343; 
 Fri, 24 Feb 2023 04:53:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b002c53cc7504csm9811482wrv.78.2023.02.24.04.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 04:53:44 -0800 (PST)
Date: Fri, 24 Feb 2023 13:53:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230224083701.2657063-6-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
X-List-Received-Date: Fri, 24 Feb 2023 12:53:51 -0000

On Fri, 24 Feb 2023 14:06:58 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Add Multiple APIC Description Table (MADT) with the
> RINTC structure for each cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 3a5e2e6d53..8b85b34c55 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -32,6 +32,7 @@
>  #include "sysemu/reset.h"
>  #include "migration/vmstate.h"
>  #include "hw/riscv/virt.h"
> +#include "hw/riscv/numa.h"
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
>      free_aml_allocator();
>  }
>  
> +/* MADT */

see build_srat() how this comment must look like

> +static void build_madt(GArray *table_data,
> +                       BIOSLinker *linker,
> +                       RISCVVirtState *s)
> +{
> +    MachineState *ms = MACHINE(s);
> +    int socket;
> +    uint16_t base_hartid = 0;
> +    uint32_t cpu_id = 0;
> +
> +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> +                        .oem_table_id = s->oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +    /* Local Interrupt Controller Address */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> +
> +    /* RISC-V Local INTC structures per HART */
> +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> +        base_hartid = riscv_socket_first_hartid(ms, socket);
> +
> +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> +            build_append_int_noprefix(table_data,
> +                                      (base_hartid + i), 8);   /* Hart ID  */
> +
> +            /* ACPI Processor UID  */
> +            build_append_int_noprefix(table_data, cpu_id, 4);

cpu_id here seems to be unrelated to one in DSDT.
Could you explain how socket/hartid and cpu_id are related to each other?

> +            cpu_id++;
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>  {
>      GArray *table_offsets;
> @@ -153,6 +194,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, s);
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,


