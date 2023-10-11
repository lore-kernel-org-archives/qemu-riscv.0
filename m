Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8BCCD98E6
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 02:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPKS-0005Rf-0x; Tue, 10 Oct 2023 22:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPKQ-0005RI-Kx; Tue, 10 Oct 2023 22:52:06 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPKP-0006st-07; Tue, 10 Oct 2023 22:52:06 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-49d8fbd307fso2383096e0c.3; 
 Tue, 10 Oct 2023 19:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696992723; x=1697597523; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzo/QDDf27BCqcvcKXNrQ2CetlcJvr5aHZ0rn/PqpRo=;
 b=hiATuG1H+pQ1bL7PDOTBG8XbrrU8Qhesg91S/odxptGzfYAJhHqsy9h0F+lmvAINOb
 9u0QQWuI6WdeAztmgtGDc8w9oFUNAvfjHpnrWnl8tJiVsfKqex4d/OTmYuxF+1GW8VL5
 J+QJ2/UP73knXdRnz0vN4TMjKQ0/V/nUNuMhqvi1mnFndt6ocleXXf3h4LZUuA3euJJq
 RHq8b3FfB4bUqehrZRV3XEARlg7XnoYG/nB0QGxJRxzC/MeUzlEp7Ahhg1QoK79OIuBD
 iOFC7wSov29GWq1/ukRNCg0sEb2KBKrIQlWNgg/weCH5lx+kLd0Z7j6gvGnhaEq93+Vd
 tdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696992723; x=1697597523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzo/QDDf27BCqcvcKXNrQ2CetlcJvr5aHZ0rn/PqpRo=;
 b=gHowBcbj+Dlq8yTVu8OSi3EpwaZJneGOFM6cDopFihKLAPe/ygIczQHwye6HTxAQNR
 A7sDto0wOmCFuL9XX9mvqZaPwtXOg3ULIMtWUkSrE/0Y63XpkXiL95o7PuXveMODQyQA
 0TdbEa2lw6ANaI+8xDaaDk7kNyuKIOFYLGE5H4GZ6imEIkBCeWPHt46coIYNS5awph0T
 QNoQuSyDEvuaMOzz2kw4SvVPkynQBBWKUE9zd0Ary9dCjMbnbBb+/ENQUCkSzf8be2dE
 aiu+ap5L2hX5J2Tg1947rnllwwURbLaO0xfealk1MfQv4iWVlFKF+zrgka/rEM5q+4l0
 cQfg==
X-Gm-Message-State: AOJu0YyU3OL6bdVf2RnPzpF7DH292sg0MDmoSrr+3g/4tE2xYDOmvMPq
 UPAHvOqJlotw0wKD3FZKYBU0nX2el0DjJZmZ+lA=
X-Google-Smtp-Source: AGHT+IExL8c+TITAoRumLnvuIqcdlzief9WcXcAqVQx0eEeCXlRcfshWBVk5rt6KbgYFPEkv9MUP7dErR8giDS1OWHA=
X-Received: by 2002:a1f:4b83:0:b0:49e:1be5:de9b with SMTP id
 y125-20020a1f4b83000000b0049e1be5de9bmr8970458vka.5.1696992723364; Tue, 10
 Oct 2023 19:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <20231006132134.1135297-2-dbarboza@ventanamicro.com>
In-Reply-To: <20231006132134.1135297-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 12:51:36 +1000
Message-ID: <CAKmqyKNsg11Cg73MRLcHN-y-w_ytvdMz7WN_4fFo9aqWYwj5yw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] target/riscv/cpu.c: add zicntr extension flag
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Fri, Oct 6, 2023 at 11:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zicntr is the Base Counters and Timers extension described in chapter 12
> of the unprivileged spec. It describes support for RDCYCLE, RDTIME and
> RDINSTRET.
>
> QEMU already implements it way before it was a discrete extension.
> zicntr is part of the RVA22 profile, so let's add it to QEMU to make the
> future profile implementation flag complete.
>
> Given than it represents an already existing feature, default it to
> 'true'. Change the realize() time validation to disable it in case its
> dependency (icsr) isn't present.

What happens if a user disables this though?

Alistair

>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 7 +++++++
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 521bb88538..8783a415b1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -79,6 +79,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> +    ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_icntr),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
> @@ -1265,6 +1266,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[=
] =3D {
>      MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
>      MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
>
> +    /*
> +     * Always default true - we'll disable it during
> +     * realize() if needed.
> +     */
> +    MULTI_EXT_CFG_BOOL("zicntr", ext_icntr, true),
> +
>      MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
>      MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
>      MULTI_EXT_CFG_BOOL("zbc", ext_zbc, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 0e6a0f245c..671b8c7cb8 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -62,6 +62,7 @@ struct RISCVCPUConfig {
>      bool ext_zksh;
>      bool ext_zkt;
>      bool ext_ifencei;
> +    bool ext_icntr;
>      bool ext_icsr;
>      bool ext_icbom;
>      bool ext_icboz;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08b806dc07..df187bc143 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -542,6 +542,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
>      }
>
> +    if (cpu->cfg.ext_icntr && !cpu->cfg.ext_icsr) {
> +        cpu->cfg.ext_icntr =3D false;
> +    }
> +
>      /*
>       * Disable isa extensions based on priv spec after we
>       * validated and set everything we need.
> --
> 2.41.0
>
>

