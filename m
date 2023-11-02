Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC841C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:01:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyM5F-0003LN-6E; Wed, 01 Nov 2023 21:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM5D-0003G1-O4; Wed, 01 Nov 2023 21:01:15 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM5C-0006Rt-0s; Wed, 01 Nov 2023 21:01:15 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7b9ff2b6f9bso168420241.3; 
 Wed, 01 Nov 2023 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886872; x=1699491672; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zj/znO6zbfF+ZqPM+8eZF6P1tBCinSxIb/fEHUqxH+4=;
 b=frHdknDl8AxAJ5VWABw+GswuQFQUIQZjqvt2bsYmKyFK0ujUay0WdKYehU82RgOnQW
 UR4eh5vUdyTAXxue1LDAFT32XcibsQ961A3Hns0EcV4ztUB9OWSBiKlDi50Emc5zmJm0
 0dr6N3Kr5XMHyySw5k+jznMshLrBiO44U/c7yNFvFAuKZqzVBuUN4J84pSL+gXUk4WLO
 Y8OL6fxtc/+OSoQbTRIYa+4zQsjLUqgUe6uGTfw+ZttZllLzn24BC+2p9HRp5i3j+997
 a0FA67WUVX0FlS/4ORlhBvCQ98LBWRmkpLMVXxA08qeiFVxSQusSjEaxYYcLv8SIDrmY
 Yp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886872; x=1699491672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zj/znO6zbfF+ZqPM+8eZF6P1tBCinSxIb/fEHUqxH+4=;
 b=o4MZkbfclDl8LHJiuipNPDF/j4kLpDpNtxTQV8vE0J7KmITEcr6PbKjK8ogCHZTNDR
 U1swCK+J+yoDgUcfx/8qxeD2EzsOiI9QoDfde7SzYo248cFW6zO49Ybki6ARCZCZUdNQ
 w22yUMF7b64lZiCOUivHm2sC8TlKmwNMFHBsJpbUg6cWV3DidzIoX2z8oOGZ+2i3D3TO
 Q1LDyElYI1u2+Vc8Q8v+M/qfk8Keot8d+kbA9A15fFSrQMby2rmaFfaLMfz8U7Y/jONC
 59RZmNY8u059NFGOdCVA9h8IaUTebtipLQY5WMWq78fQKDI+wPdWaycwNw2Ui0wbXsVm
 ajrw==
X-Gm-Message-State: AOJu0YxKmwxXxGUsl1rrMIg/W1lDrLwPUTmSGDg25k2k6FfPyodZQC17
 JWzfDkIWsGhoPZ6t/RSlZ4Ts18U82e/xTt3ktEY=
X-Google-Smtp-Source: AGHT+IHCpA2eszjXV2KczaiKeg3VwdI2wf2mU9TBFay930lrToYcOKwnK/nGT74zd+WraFJg5gFmkYAzmDlQHwNNozA=
X-Received: by 2002:a67:c092:0:b0:44e:d6c3:51d4 with SMTP id
 x18-20020a67c092000000b0044ed6c351d4mr17870579vsi.18.1698886872275; Wed, 01
 Nov 2023 18:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
 <20231030132058.763556-10-sunilvl@ventanamicro.com>
In-Reply-To: <20231030132058.763556-10-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 11:00:45 +1000
Message-ID: <CAKmqyKMkby9Sqrae5SYMbm1GmrhGDMrsBbTDqA4dPZbFrUZRiA@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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

On Mon, Oct 30, 2023 at 11:23=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> MMU type information is available via MMU node in RHCT. Add this node in
> RHCT.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 506d487ede..86c38f7c2b 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -152,6 +152,8 @@ static void build_rhct(GArray *table_data,
>      size_t len, aligned_len;
>      uint32_t isa_offset, num_rhct_nodes, cmo_offset =3D 0;
>      RISCVCPU *cpu =3D &s->soc[0].harts[0];
> +    uint32_t mmu_offset =3D 0;
> +    uint8_t satp_mode_max;
>      char *isa;
>
>      AcpiTable table =3D { .sig =3D "RHCT", .rev =3D 1, .oem_id =3D s->oe=
m_id,
> @@ -171,6 +173,10 @@ static void build_rhct(GArray *table_data,
>          num_rhct_nodes++;
>      }
>
> +    if (cpu->cfg.satp_mode.supported !=3D 0) {
> +        num_rhct_nodes++;
> +    }
> +
>      /* Number of RHCT nodes*/
>      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
>
> @@ -226,6 +232,26 @@ static void build_rhct(GArray *table_data,
>          }
>      }
>
> +    /* MMU node structure */
> +    if (cpu->cfg.satp_mode.supported !=3D 0) {
> +        satp_mode_max =3D satp_mode_max_from_map(cpu->cfg.satp_mode.map)=
;
> +        mmu_offset =3D table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 2, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 8, 2);    /* Length */
> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +        /* MMU Type */
> +        if (satp_mode_max =3D=3D VM_1_10_SV57) {
> +            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
> +        } else if (satp_mode_max =3D=3D VM_1_10_SV48) {
> +            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
> +        } else if (satp_mode_max =3D=3D VM_1_10_SV39) {
> +            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
> +        } else {
> +            assert(1);
> +        }
> +    }
> +
>      /* Hart Info Node */
>      for (int i =3D 0; i < arch_ids->len; i++) {
>          len =3D 16;
> @@ -238,17 +264,25 @@ static void build_rhct(GArray *table_data,
>              num_offsets++;
>          }
>
> +        if (mmu_offset) {
> +            len +=3D 4;
> +            num_offsets++;
> +        }
> +
>          build_append_int_noprefix(table_data, len, 2);
>          build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
>          /* Number of offsets */
>          build_append_int_noprefix(table_data, num_offsets, 2);
>          build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor=
 UID */
> -
>          /* Offsets */
>          build_append_int_noprefix(table_data, isa_offset, 4);
>          if (cmo_offset) {
>              build_append_int_noprefix(table_data, cmo_offset, 4);
>          }
> +
> +        if (mmu_offset) {
> +            build_append_int_noprefix(table_data, mmu_offset, 4);
> +        }
>      }
>
>      acpi_table_end(linker, &table);
> --
> 2.39.2
>
>

