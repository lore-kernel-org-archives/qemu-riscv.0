Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83369C47074
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:24:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLZsy-00054D-Id; Thu, 04 Jan 2024 21:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLZsx-00053e-5L; Thu, 04 Jan 2024 21:24:35 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLZsv-00025Y-Ho; Thu, 04 Jan 2024 21:24:34 -0500
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7cc970f8156so390390241.2; 
 Thu, 04 Jan 2024 18:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704421472; x=1705026272; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtEY4DCww7WXkEjsIn7jh/VQK7DmUAMbEBa3/C1MbXg=;
 b=mOJyaC5h4iRQVIsYqJQnvJ5G2TECouUqXOinFIpFOS9QkQa2m5/jogIaUhw3nvrUSu
 IzWJFmilVTO9oWuOmXVGG8AdYlqfM8CKe5FWLSI1Gtot5MG+ssiu88vI6JXllebYClUv
 fpUJ6HIbWFUUiB43dHNN27ER1wZzEJMm01NuiVY7kXfcXDK82dQr9Leypl2I45+ovfyk
 tpo7Y7hSr9bcRlK+Ij/7viyJtN1Zm2Wt/q58cYpOnym2/SX65+3M0cc4dIpD1NKeLgoD
 CtL/3MSqwL3QjQzgwYQMcUgv15E3t1piD+lKqA+4JSeBeq6uQs++8C2D7LvLw7HEplLC
 Bs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704421472; x=1705026272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtEY4DCww7WXkEjsIn7jh/VQK7DmUAMbEBa3/C1MbXg=;
 b=BqS2ssuR7OXRyNZlwUpKnkX+LY2rNwBy5tgg6zET8dyfToHudbBe4OHV9lpw7sU0nN
 qQ1qNs00G58a6ItQPMIDXmTRshWepLF53c4PdiKxm76PqYCII+TXpmU7Bpn9/OICuNjI
 uI/NnMjtv7hPy/Vx1w6RP4jfacIAXIuGb8xBsm47GeHb0dCU4gnBwBHumzMVqHF7iJM9
 HNAhy0cJ01aiy1iVIZR6Jv+BkhRaYU4QXezNGhQAoEQswD6YL08A7k/VPWiTDUGTAUXP
 lAhvwxGTeUr8rIRpAedRXGAgeW5wMN+qG42vKmvrjQPPpjjKaIHz4fVRKgJT4QKny2VR
 UCXw==
X-Gm-Message-State: AOJu0YydyixxEg44faNgX8uzCETxKhMg6fq3tK4ZWPZpF1Cy4Wpmj5dJ
 yQpj1fe6B0B4PRUUKI0HlDNSCNPIqf0yJJ+YJko=
X-Google-Smtp-Source: AGHT+IGu/Wj0C2UXjFH8DEtFDAJnZIpaxd1NN6Cxt4Y6AeZ2LbzExi/f2vlKLoY5CW2hcjBkZUXgts62+fNSHuEbtpU=
X-Received: by 2002:a05:6122:1b0e:b0:4b7:4cfb:4217 with SMTP id
 er14-20020a0561221b0e00b004b74cfb4217mr1020484vkb.22.1704421471958; Thu, 04
 Jan 2024 18:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-26-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-26-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:24:05 +1000
Message-ID: <CAKmqyKMmbdPyC9tuyxEtf4cHorVtWkqm-hvhMS0bTH3cOT3fdw@mail.gmail.com>
Subject: Re: [PATCH v13 25/26] target/riscv: add RVA22S64 profile
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
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

On Mon, Dec 18, 2023 at 11:00=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The RVA22S64 profile consists of the following:
>
> - all mandatory extensions of RVA22U64;
> - priv spec v1.12.0;
> - satp mode sv39;
> - Ssccptr, a cache related named feature that we're assuming always
>   enable since we don't implement a cache;
> - Other named features already implemented: Sstvecd, Sstvala,
>   Sscounterenw;
> - the new Svade named feature that was recently added.
>
> Most of the work is already done, so this patch is enough to implement
> the profile.
>
> After this patch, the 'rva22s64' user flag alone can be used with the
> rva64i CPU to boot Linux:
>
> -cpu rv64i,rva22s64=3Dtrue
>
> This is the /proc/cpuinfo with this profile enabled:
>
>  # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_z=
ihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt
> mmu             : sv39
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index aa33e7a1cf..f57a9ee298 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1560,8 +1560,40 @@ static RISCVCPUProfile RVA22U64 =3D {
>      }
>  };
>
> +/*
> + * As with RVA22U64, RVA22S64 also defines 'named features'.
> + *
> + * Cache related features that we consider enabled since we don't
> + * implement cache: Ssccptr
> + *
> + * Other named features that we already implement: Sstvecd, Sstvala,
> + * Sscounterenw
> + *
> + * Named features that we need to enable: svade
> + *
> + * The remaining features/extensions comes from RVA22U64.
> + */
> +static RISCVCPUProfile RVA22S64 =3D {
> +    .parent =3D &RVA22U64,
> +    .name =3D "rva22s64",
> +    .misa_ext =3D RVS,
> +    .priv_spec =3D PRIV_VERSION_1_12_0,
> +    .satp_mode =3D VM_1_10_SV39,
> +    .ext_offsets =3D {
> +        /* rva22s64 exts */
> +        CPU_CFG_OFFSET(ext_zifencei), CPU_CFG_OFFSET(ext_svpbmt),
> +        CPU_CFG_OFFSET(ext_svinval),
> +
> +        /* rva22s64 named features */
> +        CPU_CFG_OFFSET(svade),
> +
> +        RISCV_PROFILE_EXT_LIST_END
> +    }
> +};
> +
>  RISCVCPUProfile *riscv_profiles[] =3D {
>      &RVA22U64,
> +    &RVA22S64,
>      NULL,
>  };
>
> --
> 2.43.0
>
>

