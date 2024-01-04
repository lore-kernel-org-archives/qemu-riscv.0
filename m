Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D55C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 00:59:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLC4E-0004RV-NG; Wed, 03 Jan 2024 19:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLC48-0004O3-Hs; Wed, 03 Jan 2024 19:58:32 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLC45-0007oL-Qf; Wed, 03 Jan 2024 19:58:32 -0500
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7cc7bae27b5so14216241.2; 
 Wed, 03 Jan 2024 16:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704329908; x=1704934708; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEnkAf9aavndpxH2FRGiV5FDDIfqhRDBdjUrlcUGgUg=;
 b=auChd2O+TNxTeR+FitPUkAsKaLqZcFTnc1bbN9LsEQJuXUxFCpWx9OtebHG8bdrsad
 80J5Tuzsfiz14DWWPoWEVp2rsvuglKCklMm9kHpN19bwqzSNFAkk9RNcPiM0CjfbQjzO
 1dqy6E1aDqsbeloRO7JjpElD59aLN7eoO/I830zUqnOEqDA96K+P7krGfqoqvrKNSvaT
 z2c9lPrWbBT/tbUjIFctogsT0unJiXX5XuVpi0S4uV08Ptuh6RPXB30vILwKsBUGWEqU
 RqRNvkYArNe61dlSN45WAKbANo4L3ZdFuuILeY12l7Ew9AiyifjpixXz/RKWibmssE0I
 LbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704329908; x=1704934708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEnkAf9aavndpxH2FRGiV5FDDIfqhRDBdjUrlcUGgUg=;
 b=ZKTVQyiZfq0W26X5QcOADW9KTwjlozjWZckV2iQ1NtEjyP2HuLaTCtPoupPvdsh+WZ
 7n2HNTLTqEuD/VGJ9OZ8ZpK/nujtXSwWfOJMvpN1KNYuQWZmg6K255a6/do8l8vfVlMo
 C0YaS2eDzp/Gu69slQ1QnmL4tovRGlrCMNX8FX2diFH2X9N+qXyr/yQJKltQIkJgjFKs
 1uYgV13DM9CEnxs5RZLIDr6Qt5CXcLlubsteltQj9F+MNapRta/QWTwkdtf5jYLkOU9N
 VaNJoXwvHQwB+FQI9d+gUBOZwg/PlbCVsmXzV15VHTgKTsP1w1oDQUv+WE//8knEwCPv
 EzZg==
X-Gm-Message-State: AOJu0YwOdPt8D9exjpSKBXV8uzVpUShu2bj+Em1cfhloDib6SSeYPgJz
 u6YcxaApCO5A5fGQOj2PoFsmdd4VN+D/v995bOM=
X-Google-Smtp-Source: AGHT+IE0EG8t4+gtjEcLODEGbm0bu8Wf20oLE60Sx4QA2WnE4hYAJO28Hkz5gW7bQgI/awq6IFEJXRkAus6S3n2wpwY=
X-Received: by 2002:a05:6102:374e:b0:467:8539:52b8 with SMTP id
 u14-20020a056102374e00b00467853952b8mr2670182vst.7.1704329908114; Wed, 03 Jan
 2024 16:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20231218090543.22353-1-yongxuan.wang@sifive.com>
In-Reply-To: <20231218090543.22353-1-yongxuan.wang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 10:58:01 +1000
Message-ID: <CAKmqyKNMhVyTOc5H+ndroygD9oxy+KENU0HO14XO_ZWnAmQEhg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/riscv/virt.c: fix the interrupts-extended property
 format of PLIC
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Mon, Dec 18, 2023 at 7:07=E2=80=AFPM Yong-Xuan Wang <yongxuan.wang@sifiv=
e.com> wrote:
>
> The interrupts-extended property of PLIC only has 2 * hart number
> fields when KVM enabled, copy 4 * hart number fields to fdt will
> expose some uninitialized value.
>
> In this patch, I also refactor the code about the setting of
> interrupts-extended property of PLIC for improved readability.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/virt.c | 47 +++++++++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d2eac2415619..e42baf82cab6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -460,24 +460,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
>          "sifive,plic-1.0.0", "riscv,plic0"
>      };
>
> -    if (kvm_enabled()) {
> -        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
> -    } else {
> -        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
> -    }
> -
> -    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> -        if (kvm_enabled()) {
> -            plic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
> -        } else {
> -            plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_EXT);
> -            plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
> -        }
> -    }
> -
>      plic_phandles[socket] =3D (*phandle)++;
>      plic_addr =3D memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * soc=
ket);
>      plic_name =3D g_strdup_printf("/soc/plic@%lx", plic_addr);
> @@ -490,8 +472,33 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
>                                    (char **)&plic_compat,
>                                    ARRAY_SIZE(plic_compat));
>      qemu_fdt_setprop(ms->fdt, plic_name, "interrupt-controller", NULL, 0=
);
> -    qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> -        plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> +
> +    if (kvm_enabled()) {
> +        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +
> +        for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> +            plic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> +            plic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
> +        }
> +
> +        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> +                         plic_cells,
> +                         s->soc[socket].num_harts * sizeof(uint32_t) * 2=
);
> +   } else {
> +        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
> +
> +        for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> +            plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> +            plic_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_EXT);
> +            plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
> +            plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
> +        }
> +
> +        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> +                         plic_cells,
> +                         s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
> +    }
> +
>      qemu_fdt_setprop_cells(ms->fdt, plic_name, "reg",
>          0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
>      qemu_fdt_setprop_cell(ms->fdt, plic_name, "riscv,ndev",
> --
> 2.17.1
>
>

