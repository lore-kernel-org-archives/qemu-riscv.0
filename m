Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D5EC001DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 02:01:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNksu-0002gV-AX; Sun, 23 Jul 2023 22:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNksq-0002fe-Lu; Sun, 23 Jul 2023 22:01:12 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNkso-0005wd-H8; Sun, 23 Jul 2023 22:01:12 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-794c5f60479so1094532241.3; 
 Sun, 23 Jul 2023 19:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690164069; x=1690768869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gtc1yy9ug3BJc5izjSCEZltDO6Zo7W7YcEuIXxI9fEw=;
 b=l2BDuPWcZX7DVqORqG+O6yWmiDNX16UEZ5nBwTMEKATZByF1MOf3Z7glLfLOeJAkjH
 Jn1HFc9bUItHS//+uMAESxxDJuZqbDPCMlFp5/bZVXciKKK6r24C8oxQ6r4u1XsZ/IJV
 H2OS++pqoAFcXf5kE0mIhuN+PMHDZS4RuBRsJr40zd0HI27vKFCkp++W4Xc5b1YPGQ3S
 fmUDDsro5yR2MLdxK8nYDrsSHPhGc9NPUwSDZLNGwRNRalbvwa9o3lqFUi1C2GmUBs4A
 NhCs8OjX6GcLpGjZBhWuAKUSGHZVZx4s/rhXodqy2VoX/CG2Ip7oj9XmrkmVQYlkFCLa
 Bflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690164069; x=1690768869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gtc1yy9ug3BJc5izjSCEZltDO6Zo7W7YcEuIXxI9fEw=;
 b=epLY/829az4wlrjezdQUTpP77YjdgAhBv2lOoaS463blOnDxdimPVv2OHhOUtf3f3z
 HYtGlO2S0gEgf8oliopmWXF+YvjubDNmoRo+THgtoB3BGVKY+5ilCVlUH5hjSAQ+ta62
 mWtnp9u4Ze6SEZorHaN+KRRua4D9+afmQxAaKQIVzyJIDZSYw3FshnnAeCpWN+h9QwOg
 e8X+3DS+Zjt3cGlJcPbGEqqERlRanNcVRi4ZI/yTjET4/wG6iF0+osUumcfhk+gRPgjw
 R41sXMfHbG44bqgaHzvz18aG+qQ4WfLw4FfELL3HN0ZhLIrQPn/19bjihw/6qNKvur/U
 p9cw==
X-Gm-Message-State: ABy/qLZxSO0920fF/lNXc00Nj4ceqYIxO1Fet/8fuXXwu/0KzNNcg7+i
 L7nBUC2gfo6Db+4bSZ1n71BrtJUmI6dD9EKaWQw=
X-Google-Smtp-Source: APBJJlH5HwVurv7wWN+eQtXUNJWg2TrrN5tmipgP/YeQr6s1w+ksCgnsGbY6z2/uOr03943AXy6IgX0aosEe1Cnznj0=
X-Received: by 2002:a67:f453:0:b0:443:81a7:63ee with SMTP id
 r19-20020a67f453000000b0044381a763eemr1531450vsn.21.1690164069015; Sun, 23
 Jul 2023 19:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230717215419.124258-1-dbarboza@ventanamicro.com>
 <20230717215419.124258-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230717215419.124258-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 12:00:43 +1000
Message-ID: <CAKmqyKN-sK1czTCwBmjb5BArBeWVBuAX+GS7z814+PB4KwKufA@mail.gmail.com>
Subject: Re: [PATCH for-8.2 2/2] target/riscv/cpu.c: add zihpm extension flag
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Tue, Jul 18, 2023 at 7:55=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zihpm is the Hardware Performance Counters extension described in
> chapter 12 of the unprivileged spec. It describes support for 29
> unprivileged performance counters, hpmcounter3-hpmcounter21.
>
> As with zicntr, QEMU already implements zihpm before it was even an
> extension. zihpm is also part of the RVA22 profile, so add it to QEMU
> to complement the future future profile implementation.
>
> Default it to 'true' since it was always present in the code. Change the
> realize() time validation to disable it in case 'icsr' isn't present and
> if there's no hardware counters (cpu->cfg.pmu_num is zero).
>
> There's a small tweak needed in riscv_cpu_realize_tcg() made:
> riscv_cpu_validate_set_extensions() must be executed after the block
> that executes riscv_pmu_init(). The reason is that riscv_pmu_init() will
> do "cpu->cfg.pmu_num =3D 0" if PMU support cannot be enabled. We want to
> get the latest, definite value of cfg.pmu_num during the validation() to
> ensure we do the right thing.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 20 +++++++++++++-------
>  target/riscv/cpu_cfg.h |  1 +
>  2 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7ec88659be..5836640d5c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -89,6 +89,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
> +    ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_ihpm),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
>      ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
> @@ -1296,6 +1297,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>          cpu->cfg.ext_icntr =3D false;
>      }
>
> +    if (cpu->cfg.ext_ihpm && (!cpu->cfg.ext_icsr || cpu->cfg.pmu_num =3D=
=3D 0)) {
> +        cpu->cfg.ext_ihpm =3D false;
> +    }
> +
>      /*
>       * Disable isa extensions based on priv spec after we
>       * validated and set everything we need.
> @@ -1426,12 +1431,6 @@ static void riscv_cpu_realize_tcg(DeviceState *dev=
, Error **errp)
>          return;
>      }
>
> -    riscv_cpu_validate_set_extensions(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
>  #ifndef CONFIG_USER_ONLY
>      CPU(dev)->tcg_cflags |=3D CF_PCREL;
>
> @@ -1446,6 +1445,12 @@ static void riscv_cpu_realize_tcg(DeviceState *dev=
, Error **errp)
>          }
>       }
>  #endif
> +
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>  }
>
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> @@ -1784,10 +1789,11 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
>      /*
> -     * Always default true - we'll disable it during
> +     * Always default true - we'll disable them during
>       * realize() if needed.
>       */
>      DEFINE_PROP_BOOL("zicntr", RISCVCPU, cfg.ext_icntr, true),
> +    DEFINE_PROP_BOOL("zihpm", RISCVCPU, cfg.ext_ihpm, true),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index d36dc12b92..85c7a71853 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -66,6 +66,7 @@ struct RISCVCPUConfig {
>      bool ext_icsr;
>      bool ext_icbom;
>      bool ext_icboz;
> +    bool ext_ihpm;
>      bool ext_zicond;
>      bool ext_zihintpause;
>      bool ext_smstateen;
> --
> 2.41.0
>
>

