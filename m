Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSHTe-0006PV-7v
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHTc-0006P9-6b
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:05:36 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHTa-00053y-Fd
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:05:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so1533503wmo.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lBiNSsZ870GRbMqmbxJu2R2L5f5vLxkzcaPdYSoLYjY=;
 b=EuO4Fdvtber9kal7LTnn2Sy28y/9yLr7TuElcs+/04eVPVaCYGZoLPi4bVliirvp/I
 GF5lBHMQslarWChR6DnOSLOWEKNJ9yoEsjkBIApaBH/T7gUmJQs0pIX8fhhHAenNwHZH
 3UWhIBSsAU9ouEaqnFTNsSf4gEJYf1hP1joN7vVzbb9U7SPcAjdmf7Mjf5YO5UXIudCl
 qQ8zUTCspHPCjSrwbkOnjo+HZogz07jaPVApPZ/83F1iopypBrYAVv1uVG4o/GNshRmo
 x6LHOBCAl/luOs/sB1vB3dyjbTau/u6Mfgtyg7yXZqUrryCeE4pgMWeVkdd5QMP6qrO2
 JzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lBiNSsZ870GRbMqmbxJu2R2L5f5vLxkzcaPdYSoLYjY=;
 b=C4ukkA8MrFhhOb5cYnsS64MIftUMxfWZsOcOeQXdupOjIRJvojKvgAMcoUrBRQzaZ+
 9eymJkn50aEqrFPVzCY1KBM/DIVA3zF5G+TpTWRdqz0zL6fycSGXjqxTbBETqx5eF3rA
 cTl5vlna+DTTzoQWiNKn5VvheI6mlE7UQK9j8ZR0MFnrOd9eZXnqeG6cx8cjeN992ZU9
 s03KZne4qTHegAPKOo68tyInPnx0EZ2qG6ewxkkTsDPLwGZ3Ff71W6hxynQCNdM4E2PL
 3PScTRmmxAKv/WLoVibwG3iaF7msj9ukwjY3iWbQwbnTxoVkD1WQxdsm8jrssV7cYGSu
 EM5w==
X-Gm-Message-State: AO0yUKXaAKAbKJ/msn1bZtyLaEXR7sCM39FmzymJ85yd3QbRsD9/h+FO
 ea4NQRzsY1fJ1CCnmw5hmTNcTA==
X-Google-Smtp-Source: AK7set9biYfSuX09svwbF94mgeAwfc9MmkWDLygsHw+7P3NkIzc6GY71e0k+7PmTlL8UciJ7hOI1kg==
X-Received: by 2002:a05:600c:4918:b0:3db:2063:425d with SMTP id
 f24-20020a05600c491800b003db2063425dmr1860139wmp.2.1676466332855; 
 Wed, 15 Feb 2023 05:05:32 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c1c0200b003e204fdb160sm1727325wms.3.2023.02.15.05.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:05:32 -0800 (PST)
Date: Wed, 15 Feb 2023 14:05:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 05/10] hw/riscv/virt: virt-acpi-build.c: Add RINTC in
 MADT
Message-ID: <20230215130531.nrmxazkwlgskluak@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-6-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 13:05:36 -0000

On Mon, Feb 13, 2023 at 08:10:33PM +0530, Sunil V L wrote:
> Add Multiple APIC Description Table (MADT) with the
> INTC structure for each cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt-acpi-build.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 3c4da6c385..f54e3fb731 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -134,6 +134,43 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>      free_aml_allocator();
>  }
>  
> +/* MADT */
> +static void
> +build_madt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
> +{
> +    MachineState *mc = MACHINE(s);

Please use 'ms' for MachineState and 'mc' for MachineClass

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
> +    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
> +        base_hartid = riscv_socket_first_hartid(mc, socket);
> +
> +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> +            build_append_int_noprefix(table_data,
> +                                      (base_hartid + i), 8);   /* hartid   */

The spec calls this field "Hart ID of the hart" (which is redundant), but
we should at least use "Hart ID" for the comment here. We want the text
in the comments to be directly searchable in the specs.

> +            build_append_int_noprefix(table_data, cpu_id, 4);  /* ACPI ID  */

This one should be "ACPI Processor UID"

> +            cpu_id++;
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  static void
>  virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>  {
> -- 
> 2.34.1
>

Thanks,
drew

