Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CDDC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxIcq-0000NB-PF; Sun, 29 Oct 2023 23:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIco-0000K1-A0; Sun, 29 Oct 2023 23:07:34 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIcm-0004Qz-NK; Sun, 29 Oct 2023 23:07:34 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7b9dc244151so2440181241.1; 
 Sun, 29 Oct 2023 20:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698635251; x=1699240051; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKqDv679ySdJMxtQEiGBQ7m1OShMU4f+ekzS0O3i5bs=;
 b=IFmR/1LrT8rRTTIUT6GXUvTez0g7H5olJomW+EwMfM7ep9D2XsXgMugzJuAFFo2QHc
 dJ58+e5ab8+A41SG/zgLPsPZ9WmLzU8FEa4Jc4162eYfe0RbIc908R548HdJozVVveWj
 1f4XV8x15J/pWnsAU9W9ccsfyq2HOcQx+el9zhYikCDSaPgHIAOLLfdlwaNWlBLEicAo
 l+rZOMk8zeEktcodpqqCJeQRnL28s4iHe3VhqRfGCwghGL9JhmarHjIzvwdvyCWEi76/
 GPwcSVPFT4owfXne8bxSBHQHr42HGZ+lpycEext0PA8I53P2yMKjGPH+j/Um1Ix7fvR9
 9TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635251; x=1699240051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKqDv679ySdJMxtQEiGBQ7m1OShMU4f+ekzS0O3i5bs=;
 b=L6G4MQ7q59xTdo2xnIljX3DA2FT/yUlpe+IzPcjax9at+kzEKjqbWDEOZRg8FIBHAO
 gWSMqB9+byE61yg9ZVnh1l4f1nnozw+UHf++EJEAb9C3EwAX0nZjah9FScPvy0iodIPD
 FPyaAHIlV4aWUOJpmq+9xNr0Dejnk8h6dMbB2Br1FdAExGsu323xKqYpXj9qMWswHBtj
 9zvqrKSf69E7wjaTfNg2eb4K0wWTRNHiNZC8+NbXjtLUTI8nmVpqopfU39qE/7ujM8h6
 0jwPi6ZmJvX0LjiFV3e9f4N5M0aD4/hFKk2sx/+b66MZC00iufW7/0KHyF7I7/ooUWp9
 rrRg==
X-Gm-Message-State: AOJu0YxotZHx3V61QcGoP/AzAsn2tk1ErooIsbQK5FcivRZpJxg9u2vU
 EkBoNXJCOTiPGMHcjfSn+6+1LP81dH5bqqBg8KY=
X-Google-Smtp-Source: AGHT+IHe6ARRNKki7dKfzGjC26MAH2erPi0gNrDDD4V8ktvGKc3bjteeA3BVS4ca8amo7d3j21eCpWKDpL8FgTNPi4c=
X-Received: by 2002:a05:6102:e0c:b0:452:69f8:a00d with SMTP id
 o12-20020a0561020e0c00b0045269f8a00dmr5216824vst.2.1698635251041; Sun, 29 Oct
 2023 20:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-14-sunilvl@ventanamicro.com>
In-Reply-To: <20231025200713.580814-14-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:07:04 +1000
Message-ID: <CAKmqyKP62z0MShdJy3BYmSt+PRGG+2t95bxzThsyDr1=p6Ao7g@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Thu, Oct 26, 2023 at 6:15=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> Add PLIC structures for each socket in the MADT when system is
> configured with PLIC as the external interrupt controller.
>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index c410fe7d5c..cc934a5c4b 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -85,6 +85,12 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
>                                        arch_ids->cpus[uid].props.node_id,
>                                        local_cpu_id),
>                                    4);
> +    } else if (aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
> +        build_append_int_noprefix(entry,
> +                                  ACPI_BUILD_INTC_ID(
> +                                      arch_ids->cpus[uid].props.node_id,
> +                                      2 * local_cpu_id + 1),
> +                                  4);
>      } else {
>          build_append_int_noprefix(entry, 0, 4);
>      }
> @@ -515,6 +521,29 @@ static void build_madt(GArray *table_data,
>              build_append_int_noprefix(table_data,
>                                        s->memmap[VIRT_APLIC_S].size, 4);
>          }
> +    } else {
> +        /* PLICs */
> +        for (socket =3D 0; socket < riscv_socket_count(ms); socket++) {
> +            aplic_addr =3D s->memmap[VIRT_PLIC].base +
> +                         s->memmap[VIRT_PLIC].size * socket;
> +            gsi_base =3D VIRT_IRQCHIP_NUM_SOURCES * socket;
> +            build_append_int_noprefix(table_data, 0x1B, 1);   /* Type */
> +            build_append_int_noprefix(table_data, 36, 1);     /* Length =
*/
> +            build_append_int_noprefix(table_data, 1, 1);      /* Version=
 */
> +            build_append_int_noprefix(table_data, socket, 1); /* PLIC ID=
 */
> +            build_append_int_noprefix(table_data, 0, 8);      /* Hardwar=
e ID */
> +            /* Total External Interrupt Sources Supported */
> +            build_append_int_noprefix(table_data,
> +                                      VIRT_IRQCHIP_NUM_SOURCES - 1, 2);
> +            build_append_int_noprefix(table_data, 0, 2);     /* Max Prio=
rity */
> +            build_append_int_noprefix(table_data, 0, 4);     /* Flags */
> +            /* PLIC Size */
> +            build_append_int_noprefix(table_data, s->memmap[VIRT_PLIC].s=
ize, 4);
> +            /* PLIC Address */
> +            build_append_int_noprefix(table_data, aplic_addr, 8);
> +            /* Global System Interrupt Vector Base */
> +            build_append_int_noprefix(table_data, gsi_base, 4);
> +        }
>      }
>
>      acpi_table_end(linker, &table);
> --
> 2.39.2
>
>

