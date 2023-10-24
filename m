Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968D3C00A8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv50p-0007o0-1Y; Mon, 23 Oct 2023 20:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv50n-0007Zr-B3; Mon, 23 Oct 2023 20:11:09 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv50l-0007ql-Fi; Mon, 23 Oct 2023 20:11:08 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-49ab6c1869dso3242706e0c.0; 
 Mon, 23 Oct 2023 17:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698106265; x=1698711065; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrGieTIhswTwItbAk/XiN0PMAaJra/Nr+olxbljH/qQ=;
 b=VE0gSIqwHUqmNWGFCwCwqpN+XqzN2AACQgbJQLCdS9elZ3ljlcQ662E6gqMrDaN8VH
 XkaYMaPRaAapypGpzH0c71pk1zJQpsf61NdRGw3r/iGTapNEDEEHihthsauUNVBKfrPw
 8L2CqaGGKI97NCqqf2IiV8y/VhLib8HqXDR1c+60bts/gr05pZm2E5Ss4hGSenWvaWX/
 5+pVMb9hS9AgpBHTervUU9bD+wrDS9B5Jw3l+Fhnn4DxFjO3VIb//6WvhGGVbGNoP5+7
 y8p0sOAoJJh+09gtC4CrxbxRJ2TFQxycS2TeCv9irRroQBs473kp7NRGmtqmMmXbv/tN
 wdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698106265; x=1698711065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrGieTIhswTwItbAk/XiN0PMAaJra/Nr+olxbljH/qQ=;
 b=FKGGUXi9zBOnGA9Z6bhLGEtKHnoUMuIsi374Jmj1HnwvOIfyLuIubqUjen+DFIM1qN
 mIXTFE1hkHVDgTVf/ELASHPxyc14U0qYKdEk+IzJ30867PZC5IyqQ6ZIONl5s/1eobeE
 HfJtQMw5BVO6FlLyympxf/pvXJSz71l9SmmDD4umKv4ZJ93u6wheVgkpPpto3ajZzxY/
 LWcFldPEaglEWOrMpJk8ccPdK9/87QeabXsxo49dWxrRxAOzQ7Mey7nL1TT3517otUJ1
 x1yk5CJDyLSPL4N+Z9zDegFnPhLY/BZyaErCyDG0x7QGgd1TxdpEKewCfZwAvOWBY0Wr
 hNXg==
X-Gm-Message-State: AOJu0YwlirDgIRDDpm5wLv7HJsHFaTRzmyWgnvdBFOVWETl3R587cmgp
 7P4P8ubiIdlzDSv4wWEKMKAxlKoZAt7VwW1rdEQ=
X-Google-Smtp-Source: AGHT+IF143VXRLeLXv6EY+KdTKtfF37z4VQeKctI1NkVyQuUTZuMh/z8qJn5iB9FQ9Ftc9FnuSK6++IRevnGa1EZv/8=
X-Received: by 2002:a05:6122:1d54:b0:495:f495:bab1 with SMTP id
 gd20-20020a0561221d5400b00495f495bab1mr9236989vkb.0.1698106265380; Mon, 23
 Oct 2023 17:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-7-sunilvl@ventanamicro.com>
In-Reply-To: <20231019132648.23703-7-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Oct 2023 10:10:38 +1000
Message-ID: <CAKmqyKMD-8L03KYGUhd33_P84B6Ft9VpqahM4d9k9LxHX+NjwQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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

On Thu, Oct 19, 2023 at 11:29=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> Add APLIC structures for each socket in the MADT when system is configure=
d
> with APLIC as the external wired interrupt controller.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7f1a370e54..8fa358d034 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -277,9 +277,9 @@ static void build_madt(GArray *table_data,
>      MachineClass *mc =3D MACHINE_GET_CLASS(s);
>      MachineState *ms =3D MACHINE(s);
>      const CPUArchIdList *arch_ids =3D mc->possible_cpu_arch_ids(ms);
> -    uint64_t imsic_socket_addr, imsic_addr;
> +    uint64_t imsic_socket_addr, imsic_addr, aplic_addr;
> +    uint32_t imsic_size, gsi_base;
>      uint8_t  guest_index_bits;
> -    uint32_t imsic_size;
>      uint32_t local_cpu_id, socket_id;
>      uint8_t  hart_index_bits, group_index_bits, group_index_shift;
>      uint16_t imsic_max_hart_per_socket =3D 0;
> @@ -341,6 +341,38 @@ static void build_madt(GArray *table_data,
>          build_append_int_noprefix(table_data, group_index_shift, 1);
>      }
>
> +    if (s->aia_type !=3D VIRT_AIA_TYPE_NONE) {
> +        /* APLICs */
> +        for (socket =3D 0; socket < riscv_socket_count(ms); socket++) {
> +            aplic_addr =3D s->memmap[VIRT_APLIC_S].base +
> +                             s->memmap[VIRT_APLIC_S].size * socket;
> +            gsi_base =3D VIRT_IRQCHIP_NUM_SOURCES * socket;
> +            build_append_int_noprefix(table_data, 0x1A, 1);    /* Type *=
/
> +            build_append_int_noprefix(table_data, 36, 1);      /* Length=
 */
> +            build_append_int_noprefix(table_data, 1, 1);       /* Versio=
n */
> +            build_append_int_noprefix(table_data, socket, 1);  /* APLIC =
ID */
> +            build_append_int_noprefix(table_data, 0, 4);       /* Flags =
*/
> +            build_append_int_noprefix(table_data, 0, 8);       /* Hardwa=
re ID */
> +            /* Number of IDCs */
> +            if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
> +                build_append_int_noprefix(table_data,
> +                                          s->soc[socket].num_harts,
> +                                          2);
> +            } else {
> +                build_append_int_noprefix(table_data, 0, 2);
> +            }
> +            /* Total External Interrupt Sources Supported */
> +            build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_SOURC=
ES, 2);
> +            /* Global System Interrupt Base */
> +            build_append_int_noprefix(table_data, gsi_base, 4);
> +            /* APLIC Address */
> +            build_append_int_noprefix(table_data, aplic_addr, 8);
> +            /* APLIC size */
> +            build_append_int_noprefix(table_data,
> +                                      s->memmap[VIRT_APLIC_S].size, 4);
> +        }
> +    }
> +
>      acpi_table_end(linker, &table);
>  }
>
> --
> 2.34.1
>
>

