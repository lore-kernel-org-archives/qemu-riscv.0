Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9AC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:13:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxIiF-0002Vm-Uq; Sun, 29 Oct 2023 23:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIiC-0002UN-0q; Sun, 29 Oct 2023 23:13:08 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIiA-00059Z-Ck; Sun, 29 Oct 2023 23:13:07 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7b6e3dc54e0so2540249241.1; 
 Sun, 29 Oct 2023 20:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698635585; x=1699240385; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZcMBOfWcxgOzlT1ex64wIa8MT4uiEZQOCcrM0qNzNjk=;
 b=cLCe/FpuqMKstFg3t5hhwBZ9PbaNe1KCkYuEbQSv6FBonHY0p4CcOYcaNVo2bZJyCa
 RTm189tk1E9t2wZ9wC8BWYgp26dnm1KJMtYUbqHAKCuWpoUtVv+hPsdEtnrB0cYmWW+o
 PkX6P3T26H0IWxtXkqpYPSVxm7B0kSu41Uf5VFWQvUuQlgj6QBvZaf7+fImNrEOddU9Z
 bXJSUf+RWXoR6ODgj/eIhgxlGdURez33kuXuD8aYd9DyB7lRS6rJSfV6tmZlvJh93jzK
 KXA0M/fMuCyYx4Mwwg+DKUUS6vOnLX9VUlQSkAuRdxZcjy/JrnGI56B+rCHanqfwKIf+
 gO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635585; x=1699240385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZcMBOfWcxgOzlT1ex64wIa8MT4uiEZQOCcrM0qNzNjk=;
 b=dlrKiE74+9YKjJuZdqScBOTP3ZM23iifO5UskzpxlMvdPCK6joQNElveYNIFRuwvU+
 CuzGLeOzrhd+cdeegRp91jKNBzB7tdHDNrj0WtBaUEF0k2j8MyjjHizGIZw4P7z3YDBl
 T9X/85sYti8nR9nGGojOHbHIg5QKKrcBS5vTY865YEDMdYNaNu4L8B58NqysgkOHC79D
 VSDzDxskcy1hpQH19+E4WgrI9JqEX7iZnzce4bMCkzJvbvBY6Tv+1ajU7SpIUQl7sWT3
 GowbpVvivSuWje2tSB42HssFTQkfB08iwlJwYXH5DyIR8PuGKq53ix6PVHCcrLdf7GIR
 snmA==
X-Gm-Message-State: AOJu0YzIZKSazoOjvZBXyLPBWPaVxivzWkZnvYZBvcuxXa86jfJ8tQPd
 UhbY3l3p9HyvTnA1j/Bf/roctohXWNDwABCw8WU=
X-Google-Smtp-Source: AGHT+IE5oWZ3nwo87Np7TyIY/XJubflEKiKel78eieb635l8GxbFkT8Arho6JVnPWAeyTN1SZA++uFeT6ePaUW6cGNQ=
X-Received: by 2002:a1f:6e0d:0:b0:496:187e:b33f with SMTP id
 j13-20020a1f6e0d000000b00496187eb33fmr4813488vkc.3.1698635584917; Sun, 29 Oct
 2023 20:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
 <20231023153927.435083-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231023153927.435083-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:12:38 +1000
Message-ID: <CAKmqyKN939A4eRXL1a1rK5bFVhMr-bYpBf7R01B4MHUfwexq6A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] target/riscv: add zihpm extension flag for TCG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Tue, Oct 24, 2023 at 1:40=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zihpm is the Hardware Performance Counters extension described in
> chapter 12 of the unprivileged spec. It describes support for 29
> unprivileged performance counters, hpmcounter3-hpmcounter31.
>
> As with zicntr, QEMU already implements zihpm before it was even an
> extension. zihpm is also part of the RVA22 profile, so add it to QEMU
> to complement the future profile implementation. Default it to 'true'
> for all existing CPUs since it was always present in the code.
>
> As for disabling it, there is already code in place in
> target/riscv/csr.c in all predicates for these counters (ctr() and
> mctr()) that disables them if cpu->cfg.pmu_num is zero. Thus, setting
> cpu->cfg.pmu_num to zero if 'zihpm=3Dfalse' is enough to disable the
> extension.
>
> Set cpu->pmu_avail_ctrs mask to zero as well since this is also checked
> to verify if the counters exist.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  3 +++
>  target/riscv/cpu_cfg.h     |  1 +
>  target/riscv/tcg/tcg-cpu.c | 13 +++++++++++++
>  3 files changed, 17 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 69d64ec4ca..f40da4c661 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -85,6 +85,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
>      ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
> +    ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
>      ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
> @@ -1218,6 +1219,7 @@ static void riscv_cpu_init(Object *obj)
>       * users disable them.
>       */
>      RISCV_CPU(obj)->cfg.ext_zicntr =3D true;
> +    RISCV_CPU(obj)->cfg.ext_zihpm =3D true;
>  }
>
>  typedef struct misa_ext_info {
> @@ -1308,6 +1310,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
>
>      MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
> +    MULTI_EXT_CFG_BOOL("zihpm", ext_zihpm, true),
>
>      MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
>      MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 73fd4b3231..6eef4a51ea 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -69,6 +69,7 @@ struct RISCVCPUConfig {
>      bool ext_zicond;
>      bool ext_zihintntl;
>      bool ext_zihintpause;
> +    bool ext_zihpm;
>      bool ext_smstateen;
>      bool ext_sstc;
>      bool ext_svadu;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a1e4ed2e24..093bda2e75 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -549,6 +549,19 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          cpu->cfg.ext_zicntr =3D false;
>      }
>
> +    if (cpu->cfg.ext_zihpm && !cpu->cfg.ext_zicsr) {
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zihpm))) {
> +            error_setg(errp, "zihpm requires zicsr");
> +            return;
> +        }
> +        cpu->cfg.ext_zihpm =3D false;
> +    }
> +
> +    if (!cpu->cfg.ext_zihpm) {
> +        cpu->cfg.pmu_num =3D 0;
> +        cpu->pmu_avail_ctrs =3D 0;
> +    }
> +
>      /*
>       * Disable isa extensions based on priv spec after we
>       * validated and set everything we need.
> --
> 2.41.0
>
>

