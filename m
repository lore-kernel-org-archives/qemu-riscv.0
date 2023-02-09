Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPuhA-0002qZ-Ou
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 19:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPuh9-0002q8-4e; Wed, 08 Feb 2023 19:21:47 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPuh7-0004qT-8g; Wed, 08 Feb 2023 19:21:46 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id n13so125364vkl.8;
 Wed, 08 Feb 2023 16:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N2iVpHhFeE7trcpuPb4MC/oo6zMdINLLmqqfElixnZs=;
 b=kWcjXc5yUGLoMqs4Weu1N7rfX4l3Ea203ouvEUyQqaTo+OyNFJJUKIMNQCRWTibcIl
 KXTE/CBbsKU6YWmLBBvYscvsMu6iURw24ZBczZmzXHs1BZiIaNVwox6K/DmXU8iDh6qq
 dAtrrGsFgRp7TquBz0eCcWl72NV7MdSM6PiIV6aOleuSdMpOXgf4Cq4GtRjqKP5QT4Ot
 9PccS5Q+Kw2tNgDWGyBIfKTNfT09Kf7iB2KFIpyfOL7bNHNFlRT5VsmGpW+dPqQhv0QS
 FNDUhv8937nuCYn12hgNPWsE79HspzhK4wwpBgKeSm2B2+/4VKYseUDYUn5ysONuEhJt
 qdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2iVpHhFeE7trcpuPb4MC/oo6zMdINLLmqqfElixnZs=;
 b=wjECaGLTED3LxTcchwNTwm41hoOlwbH2QMvxcpcJsHQxqxSf7FJPxal4cpUCqgpTcc
 Q2xLOL6I1b51XgAYJjOnC64XKdVMO5evPYyi35QpiBUdb1+NQq/GSxZickuKNqT9B752
 mMFqxw01uqmLuBA5R1K5tKmZ3Vl1aUPRTC3QkNLa36Fw9ByYNcsEhd1cfRoI22kS8OlX
 0kAWuaIiTxRdsS4EW+DTbZsex/8zcl8Z9Oz6JyriNcXW41UfWOe90jn49r22RrPZrxJa
 0qKtutfpAAksMQt2uRadyDrKLdulXNjZaJMdXryxhiwI7NnkDo/H1xfBX3AAIy+MXHud
 fspw==
X-Gm-Message-State: AO0yUKVXozAPe/LWrViBa8pxxza1Mn5TyZI8ohVQ/8OgZsggErpOjxHg
 YAq57WybbPbnlVpWIyp5xHCsqU0B+cNqR/FGec0=
X-Google-Smtp-Source: AK7set9zXvWnc8o8i2YZCsEgTUY8/2hffLXd1I1LBTFeLPyNhG63hpbhCArqc/vaIHD8RbiKiS0VDIQZrm/WDLK41gk=
X-Received: by 2002:a1f:2414:0:b0:3ea:3dee:4545 with SMTP id
 k20-20020a1f2414000000b003ea3dee4545mr2012447vkk.26.1675902103580; Wed, 08
 Feb 2023 16:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-6-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-6-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:21:17 +1000
Message-ID: <CAKmqyKOtpS-ZcmuQcv-9fSm168g20TdHzSDDMegX1W7HY3zbWQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 00:21:47 -0000

On Thu, Feb 2, 2023 at 2:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> Add Multiple APIC Description Table (MADT) with the
> INTC structure for each cpu.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 0410b955bd..2f65f1e2e5 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -137,6 +137,43 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)
>      free_aml_allocator();
>  }
>
> +/* MADT */
> +static void
> +build_madt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)
> +{
> +    MachineState *mc = MACHINE(vms);
> +    int socket;
> +    uint16_t base_hartid = 0;
> +    uint32_t cpu_id = 0;
> +
> +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
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
> +        for (int i = 0; i < vms->soc[socket].num_harts; i++) {
> +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> +            build_append_int_noprefix(table_data,
> +                                      (base_hartid + i), 8);   /* hartid   */
> +            build_append_int_noprefix(table_data, cpu_id, 4);  /* ACPI ID  */
> +            cpu_id++;
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  static void
>  virt_acpi_build(RISCVVirtState *vms, AcpiBuildTables *tables)
>  {
> --
> 2.38.0
>
>

