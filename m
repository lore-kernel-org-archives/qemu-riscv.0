Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSHje-0007NL-GD
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHjc-0007Mo-O5
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:22:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHja-00054M-NN
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:22:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l2so2501034wry.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U2yNbmHnzRXnwG5xOMUF+gH4FpuIR/jPtcW7kYTN014=;
 b=Wc4ADkGaKDfZvW+0uCvxTO76JdfqENPdS3UGSE0wvQ4tWOvEeHzq+wzFGk0PRDIlFJ
 GEach2Zg3YKWepkjsba05qxvpzvreycXT5thWdkPpSx3n9VlME0VL8xEUPbs1Yzd+TCh
 sEieesUNglyZG9c9zoakr5Nwy6/HeVARNm2Ki3Yg53LKaOevGhkb1Hpq1svH/92c7Q2J
 z4bofh+Ez+Gk4Yp4Rue/pn3jCYUywnf8SJworFWD7jlVsgGQ9bqsCI93FP/sqCI2bydx
 YCEp0ljLicJsvWLste+xblwOR8yxWCp7LW2kG7cSCNVN4Re1wZo0QbQUnaIlWV0Mxptk
 g8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2yNbmHnzRXnwG5xOMUF+gH4FpuIR/jPtcW7kYTN014=;
 b=wManPTA/GLCZMEz+RbUYUIu0PpnpHaWQyKl2ctQZcNAJ3S7mVZUqYzStXdp5oAHCfb
 JOdfK+Cd+qlSNqi4OwGdgdRsljiENfZNYsnc7H6G7j1r7219Z6YioEUCm3ayoUiQFWAi
 oDod7sEW6F1AIDdFOd7MSPki4EUN/TzFbexCr8t3BTvUNAEUzKW+H6JrHQkc3kBUQN3f
 nZvxH1gKg06kjmA7twDPBl3Nx+1emFqaWnjXMJX4BZnyh08Ck6ge+hnxB3qA4R6av4GY
 SisFEnqlyrn3DtDlF6QUI47YP9bFNRH+8hU9/dbTcRYCsoAB4Tk0ID/zw46T5hCN/7gH
 wv2A==
X-Gm-Message-State: AO0yUKXifp1mPsw5fNiacRd1VRt9J4/N7GQrBE7FySOcMXBVWyvDMAgH
 ZBQ8JL6seJzl6JDEbfXlBqHE1A==
X-Google-Smtp-Source: AK7set+E1IMUkHkzfaLOSQFCH7lqyqsr+PaNx7VayVvpBGg3ipes1zWaopgqRCjPKDsLjuu1ul6Umg==
X-Received: by 2002:adf:e94a:0:b0:2bf:963a:f266 with SMTP id
 m10-20020adfe94a000000b002bf963af266mr1792578wrn.27.1676467324956; 
 Wed, 15 Feb 2023 05:22:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adfe88d000000b002c54f4d0f71sm10518672wrm.38.2023.02.15.05.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:22:04 -0800 (PST)
Date: Wed, 15 Feb 2023 14:22:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 06/10] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Message-ID: <20230215132203.grt3y3ujfpm6smww@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-7-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-7-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 13:22:09 -0000

On Mon, Feb 13, 2023 at 08:10:34PM +0530, Sunil V L wrote:
> RISC-V ACPI platforms need to provide RISC-V Hart Capabilities
> Table (RHCT). Add this to the ACPI tables.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 62 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index f54e3fb731..a2054f79a8 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -35,6 +35,7 @@
>  #include "hw/pci-host/gpex.h"
>  #include "qapi/error.h"
>  #include "migration/vmstate.h"
> +#include "hw/intc/riscv_aclint.h"
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> @@ -85,6 +86,67 @@ acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
>      aml_append(scope, dev);
>  }
>  
> +#define RHCT_NODE_ARRAY_OFFSET 56
> +static void
> +build_rhct(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
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
> +    build_append_int_noprefix(table_data,
> +                              RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);

Need "Time Base Frequency" comment.

> +
> +    /* ISA + N hart info */
> +    num_rhct_nodes = 1 + ms->smp.cpus;
> +    build_append_int_noprefix(table_data, num_rhct_nodes, 4);

/* Number of RHCT nodes */

> +    build_append_int_noprefix(table_data, RHCT_NODE_ARRAY_OFFSET, 4);

/* Offset to the RHCT node array */

> +
> +    /* ISA string node */
> +    isa_offset = table_data->len - table.table_offset;
> +    build_append_int_noprefix(table_data, 0, 2);   /* Type 0*/
                                                               ^ need
							       space
> +
> +    cpu = &s->soc[0].harts[0];
> +    isa = riscv_isa_string(cpu);
> +    len = 8 + strlen(isa) + 1;
> +    aligned_len = (len % 2) ? (len + 1) : len;
> +
> +    build_append_int_noprefix(table_data, aligned_len, 2);   /* Total length */

s/Total length/Length/

> +    build_append_int_noprefix(table_data, 0x1, 2);           /* Revision */
> +
> +    /* ISA string length including NUL */

/* ISA Length including NUL */

> +    build_append_int_noprefix(table_data, strlen(isa) + 1, 2);
> +    g_array_append_vals(table_data, isa, strlen(isa) + 1);   /* ISA string */
> +
> +    if (aligned_len != len) {
> +        build_append_int_noprefix(table_data, 0x0, 1);   /* pad */

s/pad/Optional Padding/

> +    }
> +
> +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> +        for (i = 0; i < s->soc[socket].num_harts; i++) {
> +            build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> +            build_append_int_noprefix(table_data, 16, 2);      /* Length */
> +            build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
> +            build_append_int_noprefix(table_data, 1, 2); /* number of offsets */

s/number/Number/

> +            build_append_int_noprefix(table_data, acpi_proc_id, 4); /* UID */

ACPI Processor UID

> +            build_append_int_noprefix(table_data, isa_offset, 4);

/* Offsets */

> +            acpi_proc_id++;
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  /* FADT */
>  static void
>  build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
> -- 
> 2.34.1
>

Other than getting the comments to match the spec fields,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

