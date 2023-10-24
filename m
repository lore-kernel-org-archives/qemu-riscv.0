Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3010C00A8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:13:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv52I-0000Rr-6H; Mon, 23 Oct 2023 20:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv52G-0000RH-Jn; Mon, 23 Oct 2023 20:12:40 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv52E-00080S-EA; Mon, 23 Oct 2023 20:12:40 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-49ab0641e77so1691340e0c.0; 
 Mon, 23 Oct 2023 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698106356; x=1698711156; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dq0WIJgUgw+AJJ0NDHFBFh3Oog2PprBc6pcuCZtSqFQ=;
 b=DYnh6IPtnIkWos7tdei1V2qCnJ9bZmDFaFl0wH4VlUi2HXt6swdpGNm7jmK6dh4VZg
 80xPDe/foMdpZdj8LSLZnIGEJu/vazDYPLhRfayChfgEfHmDayiORowvV1ULlH7RsNLh
 /Y7DZyjuwPyOD3J3cbZWDO2BD02ckiJ7EK1MHugTpRXoXXEtrTEpdFnxV/jM7nYn1MyP
 GqmvC6Z3isvsBFn1qGLJrf2iFmpZKwB3OP6P6U9BlpiUbqeIPt+81pk5hWZJs7KWkFvk
 FDiZ38OuytEpoQAGQKLeQXhmJWG9jx60x15jqSlOE7YFYLVVY1F+WMWpT4qLT7X84Eet
 txRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698106356; x=1698711156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dq0WIJgUgw+AJJ0NDHFBFh3Oog2PprBc6pcuCZtSqFQ=;
 b=IIFV9xtC62C2/Fba8LDFBYAs4dWskSg1ySVaFxlSabHuXKEn6nTBvkrewhQc64uVXo
 Bn3nTtU6ou3NPrECInpgJmjA/OntC5f/mB0Xkgw8msCwPArG7vJTNko6GbbV3EpFURQc
 TUU/nYsYH6QuQflo2afK4cfVVTbz2b7yRQW6z8okOMt+WlVo+O0uQy6c9NQMnc6HgjGz
 lTTHOU5LVPvFe9tj23POe/QrEImwk/wjXbZ/40w9UvUsDkWXLW0pa5Lo/UtEqh0T862O
 LAQUifLkVHqHQ+MY7jh1k9g7izoOsGvIjGja0/6mzrlqouYRwmdMVxcDzeVxt9hA4Skz
 w/ZA==
X-Gm-Message-State: AOJu0Yww/ZgRuyQYjUhwJmfPzhYo9CrTl/MfmJ7rkUf2XAh8W2XKNpV3
 EDO8pnh/O6/0uY3dirrdBIq+ufj9O/ekm2aHEAU=
X-Google-Smtp-Source: AGHT+IGDgndwi5U1YajEYxYcssHUmfKItQc9cRUrXLEm4daQGWRLw4/PmSJy5c3JsWRW6lmSSzTPTeogsT1OA4IMDtw=
X-Received: by 2002:a05:6122:5bb:b0:49d:c216:8736 with SMTP id
 w27-20020a05612205bb00b0049dc2168736mr8569285vko.3.1698106355705; Mon, 23 Oct
 2023 17:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-8-sunilvl@ventanamicro.com>
In-Reply-To: <20231019132648.23703-8-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Oct 2023 10:12:09 +1000
Message-ID: <CAKmqyKPwwKVebSNzVhQjkdNhdYAnW_bJYSERnJ8rkkX28pagng@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] hw/riscv/virt-acpi-build.c: Add CMO information
 in RHCT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Oct 20, 2023 at 12:59=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> When CMO related extensions like Zicboz, Zicbom and Zicbop are enabled, t=
he
> block size for those extensions need to be communicated via CMO node in
> RHCT. Add CMO node in RHCT if any of those CMO extensions are detected.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 8 deletions(-)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8fa358d034..bf47eef792 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -147,6 +147,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtS=
tate *s)
>   * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
>   * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
>   *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-ti=
a/view
> + *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsa=
f/view
>   */
>  static void build_rhct(GArray *table_data,
>                         BIOSLinker *linker,
> @@ -156,8 +157,8 @@ static void build_rhct(GArray *table_data,
>      MachineState *ms =3D MACHINE(s);
>      const CPUArchIdList *arch_ids =3D mc->possible_cpu_arch_ids(ms);
>      size_t len, aligned_len;
> -    uint32_t isa_offset, num_rhct_nodes;
> -    RISCVCPU *cpu;
> +    uint32_t isa_offset, num_rhct_nodes, cmo_offset =3D 0;
> +    RISCVCPU *cpu =3D &s->soc[0].harts[0];
>      char *isa;
>
>      AcpiTable table =3D { .sig =3D "RHCT", .rev =3D 1, .oem_id =3D s->oe=
m_id,
> @@ -173,6 +174,9 @@ static void build_rhct(GArray *table_data,
>
>      /* ISA + N hart info */
>      num_rhct_nodes =3D 1 + ms->smp.cpus;
> +    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
> +        num_rhct_nodes++;
> +    }
>
>      /* Number of RHCT nodes*/
>      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> @@ -184,7 +188,6 @@ static void build_rhct(GArray *table_data,
>      isa_offset =3D table_data->len - table.table_offset;
>      build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
>
> -    cpu =3D &s->soc[0].harts[0];
>      isa =3D riscv_isa_string(cpu);
>      len =3D 8 + strlen(isa) + 1;
>      aligned_len =3D (len % 2) ? (len + 1) : len;
> @@ -200,14 +203,59 @@ static void build_rhct(GArray *table_data,
>          build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Pad=
ding */
>      }
>
> +    /* CMO node */
> +    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
> +        cmo_offset =3D table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 1, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 10, 2);   /* Total Length =
*/
> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +
> +        /* CBOM block size */
> +        if (cpu->cfg.cbom_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cbom_blocks=
ize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +
> +        /* CBOP block size */
> +        build_append_int_noprefix(table_data, 0, 1);
> +
> +        /* CBOZ block size */
> +        if (cpu->cfg.cboz_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cboz_blocks=
ize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +    }
> +
>      /* Hart Info Node */
>      for (int i =3D 0; i < arch_ids->len; i++) {
> +        len =3D 16;
> +        int num_offsets =3D 1;
>          build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> -        build_append_int_noprefix(table_data, 16, 2);      /* Length */
> -        build_append_int_noprefix(table_data, 0x1, 2);     /* Revision *=
/
> -        build_append_int_noprefix(table_data, 1, 2);    /* Number of off=
sets */
> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processo=
r UID */
> -        build_append_int_noprefix(table_data, isa_offset, 4); /* Offsets=
[0] */
> +
> +        /* Length */
> +        if (cmo_offset) {
> +            len +=3D 4;
> +            num_offsets++;
> +        }
> +
> +        build_append_int_noprefix(table_data, len, 2);
> +        build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
> +        /* Number of offsets */
> +        build_append_int_noprefix(table_data, num_offsets, 2);
> +        build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor=
 UID */
> +
> +        /* Offsets */
> +        build_append_int_noprefix(table_data, isa_offset, 4);
> +        if (cmo_offset) {
> +            build_append_int_noprefix(table_data, cmo_offset, 4);
> +        }
>      }
>
>      acpi_table_end(linker, &table);
> --
> 2.34.1
>
>

