Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E395CDDE60
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 10:45:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t3Yr6-00044O-EY; Wed, 23 Oct 2024 06:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t3Yr0-00043v-Kj
 for qemu-riscv@nongnu.org; Wed, 23 Oct 2024 06:44:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t3Yqz-0003sv-1H
 for qemu-riscv@nongnu.org; Wed, 23 Oct 2024 06:44:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so3704360a12.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Oct 2024 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1729680275; x=1730285075; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6voQqeBGqGRn2k0+8ETvq4vqsdlUli5wFPu2mtBUFgw=;
 b=RvcaIkl+cDfJnwB87k/CBRSovWOF4JNVoD4qvSrNDMgQOQzqK9fJBH4myyxCqSRDD7
 7swlLRzz1iFrNCcs54WyKi/gmurDexUszzz1eJZR0wWq0RFKetNygQISDMy35wrGrXgP
 BlsGPVo91AahDcl9nnwIbCeV+l/CEEQmktahxxgzgSb4JbYM4pT/zLvJttfv13fVTFpB
 zhyQ0kWpOySskEI9jm9t0fRVD0iRxZUJgSiwOEw2qYqFg0HfEF/c6E2zaKCRtBwVuej2
 1Jn0CgNtMIgn4cYET2xuSkEPM5gSq8KX1oG1V2FGr8ZJkHTSyq9O4vkJKKBRDMH4RSlB
 r6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729680275; x=1730285075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6voQqeBGqGRn2k0+8ETvq4vqsdlUli5wFPu2mtBUFgw=;
 b=jFXXrUpZX00TaEf1SAlMomOhDkwb2S3WreqSFKjMP93jQG68fXexHv5IvaYhCOaRx1
 guBBMejGfZ6oM/9X0qRTds+P7A9f1LfaIlTHpLgcpHeqK/24M8g9jJx0dRJ7ef3S7DyQ
 u9gzVJfuxv8RYEQsWbl/EhkdEl4f6eHg2Z2ionybotmETfGxitAqzDuX9CRV8XS2FJQU
 Lkm+Hc2SPapohNXY00VDHYM7/c7K5edjHvUjYnicKAPqnrhwNZdyVY/fc8SyTkInIg7E
 uAq/1WakeUsCLYOcaIryTd9rvwkDtJIGx1lZB9ZlZUAFaSheQIglDNIdSd+p+F1K+6KG
 uGiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUwx8OE6Q3LxmbFoI+J3m/lWZMTEx74XLP36EL2UimTZn0xRJE9XVn3eOFisg1UUUDC/a8o/cSW4+8@nongnu.org
X-Gm-Message-State: AOJu0YxEkmICuHl9oFlQXfFqJKOiwtfcMllvchMVpCOZGX9Hbe7v5Oq+
 lpR/J1dPhx9K3xOdZ7AGIlnKr8lXkm0oZCUQ+N5FQMgs+3KtKsGGPcQZplu8oCGdrdkNKIbKPxq
 0+arnhs2AwEIEelrM8TxDDBCBqofJYiBf36VAgA==
X-Google-Smtp-Source: AGHT+IEFtI3KZawPe1QOK/LIxXDNRizKsJRpBAcr2lza9v3Oc+5bXi3CRjbkjZJUNSf+u9MEWI+OcTHR9X4YKFJ3P5k=
X-Received: by 2002:a05:6402:e0f:b0:5cb:85f6:3d31 with SMTP id
 4fb4d7f45d1cf-5cb8ad04b23mr1719531a12.20.1729680274979; Wed, 23 Oct 2024
 03:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241021040942.400-1-jim.shu@sifive.com>
 <20241021040942.400-3-jim.shu@sifive.com>
 <25ae806f-38de-425f-8590-1c605d93197d@ventanamicro.com>
In-Reply-To: <25ae806f-38de-425f-8590-1c605d93197d@ventanamicro.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 23 Oct 2024 18:44:19 +0800
Message-ID: <CALw707phA0mqXiOFsWj-Ci8y5pZQa5EaeopssiVJ93i_QZKGHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: Support different address-cells for initrd
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Compare Linux code to handle "linux,initrd-start" [1] and
"linux,usable-memory-range" [2], I think the initrd code doesn't check
root #address-cells.
Using the origin code of "u64" is okay. I can remove this commit in
the next version.

[1] https://elixir.bootlin.com/linux/v6.11.4/source/drivers/of/fdt.c#L785
[2] https://elixir.bootlin.com/linux/v6.11.4/source/drivers/of/fdt.c#L857

Thanks,
Jim Shu

On Tue, Oct 22, 2024 at 3:30=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 10/21/24 1:09 AM, Jim Shu wrote:
> > The cells of 'initrd-start/end' should follow the '#address-cell'.
> > QEMU API could support 1 and 2 cells.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >   hw/riscv/boot.c | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index ad45bd7a6a..76b099c696 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -182,6 +182,7 @@ static void riscv_load_initrd(MachineState *machine=
, uint64_t kernel_entry)
> >       void *fdt =3D machine->fdt;
> >       hwaddr start, end;
> >       ssize_t size;
> > +    uint32_t acells;
> >
> >       g_assert(filename !=3D NULL);
> >
> > @@ -209,9 +210,18 @@ static void riscv_load_initrd(MachineState *machin=
e, uint64_t kernel_entry)
> >
> >       /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
> >       if (fdt) {
> > +        acells =3D qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
> > +                                       NULL, NULL);
> > +        if (acells =3D=3D 0) {
> > +            error_report("dtb file invalid (#address-cells 0)");
> > +            exit(1);
> > +        }
> > +
> >           end =3D start + size;
> > -        qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start", sta=
rt);
> > -        qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end", end);
> > +        qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-sta=
rt",
> > +                                     acells, start);
> > +        qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end=
",
> > +                                     acells, end);
> >       }
>
> Is this a legal format for linux,initrd-start and linux,initrd-end?
>
> This link:
>
> https://www.kernel.org/doc/Documentation/devicetree/bindings/chosen.txt
>
> Defines both attributes as:
>
> "These properties hold the physical start and end address of an initrd th=
at's
> loaded by the bootloader."
>
> So I'm not sure if this format you're using here is valid.
>
>
> Conor, care to weight in? Thanks,
>
> Daniel
>
> >   }
> >

