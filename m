Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4935CDE008
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:05:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcv0N-0003ux-OO; Thu, 25 Jun 2026 21:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcv0M-0003ug-TM
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:05:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcv0J-0002Jg-Px
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:05:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-697bd41a4ecso459068a12.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782435910; cv=none;
 d=google.com; s=arc-20260327;
 b=hEUKGZQ8eAHkq9MA0hxK0QQ9ziZAQeOAcQtD2OZHNvtkeX0Hlckv6XOtwnV8X7yXoT
 31s/vbPNsiH3yPicFaqOcK4HxXaDK1rB0OHTxayuYtZAdACToLNUbdJyg7FVGvjcdRbS
 pVfGxyZnl+QqRQGVTCOvMrDfuxYx5DZaoqRs2o/S0ZFYeV3q24Idslde345Ocl+YmqUY
 bLqiQYiGEN7nhWVSdbFYCLGRqcjtT+k4A/IFavD5dCPXEfWSbqJ9lGBezxDr5qvG20up
 SYfUolZVgIIqtklatuceIJCA540vCRtKTHX1cn2o1nz+yNwi+3twgOoUd/Xp9Dr/mtrb
 44BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vXrGs4zWxmGP3iIBXlLeu0ELJc4kvryidUP/YjP+LbU=;
 fh=ZvcpH3S5qxMBuXeF7x3fObvms6GqF8wJYfaLmKQL1D0=;
 b=A/OrWLE//AZFSCJZO8eyEpWvmocXqBucPirv6qwbXRqiIfC21Yv/E7D+HWG1I9H9tJ
 reU82/Y6yGX7GNg72RzdilpitTm6qyFf1DwZ/ZoS4Ol6Cg+2s+kqq/6Zw5hjDgovpw8c
 RG1FLAx8+q5X59hCONsmZTPyD3WpBcowgroLku+Q8oWuJloeUx6ELQIw4mmpFqGunAKt
 3JJBv6OUHYtpIxEg4e++U9BdcD+kSV8TF0G5FTq1WizKVgKTneSD/nJgH0zp41eTirz7
 PQM/T08Tt5VvI0in4VurwaPgHTwHGNuQP4giU6KAzjEQFBCPyrSVJtDCJsa+7+i+jOfe
 E9iQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782435910; x=1783040710; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXrGs4zWxmGP3iIBXlLeu0ELJc4kvryidUP/YjP+LbU=;
 b=Ch+VW3O8ETRkx0HrxpsGT0xMBO1YreS6yTQhIrZ+Zffg/Wh/TWjV7U5vo92m2oc8d/
 ZDXZrLKnxa1P3OJLjWJ5yVTjNORi2VKCXmPu5K4zppyvGEcfSYUxtrKjKTJBoUDwzy0I
 TEId6LgMIG9+jOJKUg1ZLKs+HrG+o0tbC+MCG2qrirAQ9JvxusB1GB+QnP0rMf4M4sqB
 w/Sd7vNQEVwqX3I/s0yzu0dEVw9ATLeXlJAU6l6NadJhdXmOb7rxeHPgM/ppeKuD8Mpq
 3rDYRjXQ4Vjw3AhmAas8KoRmtHUZ2nxp2Nz1/Zr0W69JDTmHs4aUE+IwybawAv+yqWBC
 mdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782435910; x=1783040710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vXrGs4zWxmGP3iIBXlLeu0ELJc4kvryidUP/YjP+LbU=;
 b=nwSXTL+5J7M6dCyQIbsdvx6EZGKJO8mw1dbkKI+Bi760lJzp4M2KXRCKNJ4A96tbJA
 m/VFH/m09kZ/XDA58tSCd76vENfXiGvsU8ehTHllOa5qWkIfsLZKxR1QuUiJe4fn8qsB
 vYC6LXkWzMtCMTo9I/siLPA6uYSYoOA277D9fJ58SkH4VQt4FTmFxbtZd3C1cZHUIva7
 VIrPNJ5XWzW5Pd6ZD6UEoNQnz1COGzs40C1ER96Q2DZ1UoLwygdmFuWaInb9JtYdZqH4
 pxAofeagwbYITcJEEqASh9A5umnaQGr/fQGKZ3VQiMawFbotEkEu8J9x2i2Pv1rVqZ67
 MdPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqwZJi/9iTNC9UyQisVZr3uGzy4e27Utl9jcKvGyYr19hM3x4n/oU4kr8w+aPCttJtl6GLSibiBv4a@nongnu.org
X-Gm-Message-State: AOJu0Ywt3qVbcDKOyp13JQQZHYcfWpm96wfbBRFgsukIved77ZrsJzrn
 V3XYMnMsNR14U1lTZFuy83XfaRTO23WFiw2KXlU7pOc4nyg+bJS9kojlLGea8XxAQxEs2NADlNg
 nBTh7YC1TSOaDN6oSFGSW/sAF7pfvEyI=
X-Gm-Gg: AfdE7clgofOE2T93/Z6RBSat2HDu0SyRghqlrKGhz04MuEE8CGCx8cjVeO8UymSSnZF
 4h1tdsd8IM0X4VTInboj/SkfYqW/5j6bMBV8OSmbrW0UCCScTQlRELo5cZYy5SJHZd2OPxknY6E
 gWIEN7vK6DDLAAVY9AgJZFW6nnZBEiOcfyOHr2fyiEwJ4KYB1JlxDGY4Zf5oWhNTgYxi5N8tOUL
 e38sNNiok/56tmPArJvO7Gj591EF+F4nZ/pIEW+mGV/+6A2o0LBzYAY2cwqda7NtT8ILIk85H0R
 8mxJOt88FC9G9YIN7JadKzzcfNA=
X-Received: by 2002:a05:6402:a29b:10b0:698:1504:e3db with SMTP id
 4fb4d7f45d1cf-6981504e48fmr544336a12.29.1782435910251; Thu, 25 Jun 2026
 18:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-15-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-15-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:04:41 +1000
X-Gm-Features: AVVi8CflFzKOdpfz0-uJ9mdqyR9-xQ925vMRsOUAjCCs9EDcYcxjkfjIen9EBVI
Message-ID: <CAKmqyKMKTZu4oufGM+KLJ8ZktvwPrRPW=ztZJsfm=kd+irDGEA@mail.gmail.com>
Subject: Re: [PATCH v2 14/24] target/riscv: move riscv_cpu_claim_interrupts to
 cpu.c
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 24, 2026 at 10:10=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The function is used by hw/intc/ files that KVM cares about like
> riscv_aplic.c.  Move it to cpu.c to be accessible for --disable-tcg
> builds.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c            | 14 ++++++++++++++
>  target/riscv/tcg/cpu_helper.c | 11 -----------
>  2 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 483ac2e0d0..4fc0ee2823 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -566,6 +566,20 @@ target_ulong riscv_new_csr_seed(target_ulong new_val=
ue,
>      return rval;
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +/* Used by lots of folks in hw/intc */
> +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    if (env->miclaim & interrupts) {
> +        return -1;
> +    } else {
> +        env->miclaim |=3D interrupts;
> +        return 0;
> +    }
> +}
> +#endif
> +
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.=
c
> index b38f639dae..9237d2129b 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -572,17 +572,6 @@ void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq,=
 bool level)
>      }
>  }
>
> -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> -{
> -    CPURISCVState *env =3D &cpu->env;
> -    if (env->miclaim & interrupts) {
> -        return -1;
> -    } else {
> -        env->miclaim |=3D interrupts;
> -        return 0;
> -    }
> -}
> -
>  void riscv_cpu_interrupt(CPURISCVState *env)
>  {
>      uint64_t gein, vsgein =3D 0, vstip =3D 0, irqf =3D 0;
> --
> 2.43.0
>
>

