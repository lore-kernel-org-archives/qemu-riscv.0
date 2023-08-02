Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B90C04A6A
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 13:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRC3I-0000zY-74; Wed, 02 Aug 2023 09:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRC3F-0000yt-Uj; Wed, 02 Aug 2023 09:38:09 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRC3E-0002sY-8u; Wed, 02 Aug 2023 09:38:09 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-791c27bb91dso625039241.0; 
 Wed, 02 Aug 2023 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690983487; x=1691588287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3hI1VnQnDy2K5U2vYX1ou38bNcyQdZfcEnP+rBh1XI=;
 b=UxRYCqbZ7C6iRa61GIbsZuEq3SOulDT9h6xRJVxE9jPGYBU7DOfrhWLim35ZqXx1tF
 LV2jSOqrhXUIciSIKvJdKRB9QpeLZKjPDYhm2GdhyF0uiLUvnpQ0jXe7udOwYw/5WFTB
 Tqze1n42DloEqdF2JpZQOgs4sxr3TAv+wvfzSEIzpz0aDX8LX/ceBkwhuLJu9D1CgpIs
 oDBIoN6VrS0J+pWVH3kDnvHge4NjhaVn624lB1hv1eOCTlBSW28RhLKgmD5UYRq4rPfc
 GGBewrVRWhMXLb8Ej+xRTG91Z0FNZtivHCDeSg3Em0jCJIGf9BtRm9EZcnC272xd4pZd
 Kpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690983487; x=1691588287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3hI1VnQnDy2K5U2vYX1ou38bNcyQdZfcEnP+rBh1XI=;
 b=ORAHm23+HbegfvfozRJFA1QDnH4bh0Mv7sxS3Nm63Q1lxkZ+OiB5qnlgldGpuZETkC
 8PbVqnXUIs2GRI3qIFkClUTiVfl0zJ/7L41mXV4yKjeYVwuVu66cnS2jZsU6F29vvOq1
 2SZTPRiuCw5BsAxGr7mqitU88C8C+zG8lwENwlFBtC5aV+ooJDYmqfzk152jZ/pKZbNY
 N38S/iQ1Nw9qg1RW1bI4tR5XtWQOH09j7D0D/uRhKii3T/QeHo9qgqUxoUECpoydy9rq
 iBWFQdRPLabYg3IjbBN7oI0fWJlEA/BacH6WnH7tEaJ9+2tGyi1cEOw9SUobMmvsXmQW
 wW1g==
X-Gm-Message-State: ABy/qLaXcA9qVMaIy/b0ym0jkcUxWocdu7m1YwCyZAuOStcsSLM12+gl
 NImdt6Bfai+AErpkRrCJY7Zm15Yr68HpD/Y8Qdw=
X-Google-Smtp-Source: APBJJlForqV/ixYKAwHVpANuhy2BiWyYoaVknuerwPAHSiihaQEtMl7dTaT39yQAdBCTgf2I5zgJVPtYds28ljiwuQM=
X-Received: by 2002:a67:d00b:0:b0:443:5ddf:4f5b with SMTP id
 r11-20020a67d00b000000b004435ddf4f5bmr2625661vsi.11.1690983486763; Wed, 02
 Aug 2023 06:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230731220959.4142636-1-fermium@anarchist.gay>
 <20230731220959.4142636-2-fermium@anarchist.gay>
In-Reply-To: <20230731220959.4142636-2-fermium@anarchist.gay>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 09:37:40 -0400
Message-ID: <CAKmqyKM2y0ogGUjFEe5OxhwxbjguFuvYHxSX=EdKcWtOc37o+A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Added support for the MMU node in the RHCT
To: Lilly Anderson <fermium@anarchist.gay>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jul 31, 2023 at 6:22=E2=80=AFPM Lilly Anderson <fermium@anarchist.g=
ay> wrote:
>

Hello,

Thanks for the patch.

Do you mind writing a commit message here. You will also need to
include a signed-off-by line, see
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails=
-must-include-a-signed-off-by-line

> ---
>  hw/riscv/virt-acpi-build.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..cb36e52169 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -119,7 +119,8 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const Me=
mMapEntry *fw_cfg_memmap)
>  /*
>   * ACPI spec, Revision 6.5+
>   * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
> - * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
> + * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/18
> + *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsa=
f/view
>   *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-ti=
a/view
>   */
>  static void build_rhct(GArray *table_data,
> @@ -133,6 +134,7 @@ static void build_rhct(GArray *table_data,
>      uint32_t isa_offset, num_rhct_nodes;
>      RISCVCPU *cpu;
>      char *isa;
> +    uint8_t mmu_type;
>
>      AcpiTable table =3D { .sig =3D "RHCT", .rev =3D 1, .oem_id =3D s->oe=
m_id,
>                          .oem_table_id =3D s->oem_table_id };
> @@ -145,8 +147,8 @@ static void build_rhct(GArray *table_data,
>      build_append_int_noprefix(table_data,
>                                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
>
> -    /* ISA + N hart info */
> -    num_rhct_nodes =3D 1 + ms->smp.cpus;
> +    /* ISA + MMU + N hart info */
> +    num_rhct_nodes =3D 2 + ms->smp.cpus;

I think it's worth adding a comment that we aren't including CMO, as
the spec says:

"and at least one CMO node for systems with harts implementing CMO extensio=
ns."

Alistair

>
>      /* Number of RHCT nodes*/
>      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> @@ -174,6 +176,15 @@ static void build_rhct(GArray *table_data,
>          build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Pad=
ding */
>      }
>
> +    /* MMU Node */
> +    build_append_int_noprefix(table_data, 2, 2); /* Type 2 */
> +    build_append_int_noprefix(table_data, 8, 2); /* Length */
> +    build_append_int_noprefix(table_data, 1, 2); /* Revision */
> +    build_append_int_noprefix(table_data, 0, 1); /* Reserved */
> +
> +    mmu_type =3D satp_mode_max_from_map(riscv_cpu_cfg(&cpu->env)->satp_m=
ode.map) - 8;
> +    build_append_int_noprefix(table_data, mmu_type, 1); /* MMU Type */
> +
>      /* Hart Info Node */
>      for (int i =3D 0; i < arch_ids->len; i++) {
>          build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> --
> 2.41.0
>
> Signed-off-by: Lilly Anderson <fermium@anarchist.gay>
>

