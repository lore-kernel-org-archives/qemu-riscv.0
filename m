Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811CBC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz7aK-0004eB-OY; Tue, 16 May 2023 23:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz7aI-0004dw-Lr; Tue, 16 May 2023 23:12:14 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz7aG-0000lY-Pm; Tue, 16 May 2023 23:12:14 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-783f7e82f28so40693241.1; 
 Tue, 16 May 2023 20:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684293131; x=1686885131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/+cA0N3j+biczB4GD+AkRw/shxfKAFFALMlbU1C0FE=;
 b=b1PrJc3pV49eWSPQ/EMSssyRuuxEmnK8inlEXPmbbPjrM2l6O2pSIE4KnzOG3eR8Vg
 X7SgFd7PFP5sgkexjc01o8Kh9q8Loank/PIAWsOCss1tYVeMPB9AZucJyMAJ/p1FfSPW
 S4HL/SEigbCs1mYJECJDmc/mt07hzxwjDjcGOrk3vaiRmAwSA+D9LK9hcbjbodIisOZJ
 sgYHhvyvoEH2YCCoSor1oImVFEhFTk6vfTI8jzSjAFleDVeOzKmUXti0DRYANUc37A1h
 WekRuC6EDEsrV99esZTp6zXicNh/CvhtGh3tFxtJZY/bxdEavagWUSwrM/iI5mW4VAuW
 uDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684293131; x=1686885131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/+cA0N3j+biczB4GD+AkRw/shxfKAFFALMlbU1C0FE=;
 b=arSdyiUJk6sbctqCQo1EHL6OIcZGd5ZoTd0wS1EyRmJl7xdtdviI7nQo1bORm1imuj
 uTxkiazXGTfPib/9SBqAF3sVd4y0UqeLKL0l0qg0UhBUzr2WKZp6rxeUM9LF2nr3oZFp
 +XFT+rceFh3Hn4Qn3pTS6eXmoBRtpBinvElg3lOfetMTfXif30mbvsG2+F1Vxupp11pi
 tQvO6mc+9G7rTHJe0dVp1hXyhL/3036jDNBurCnZ31/lso574KjpbX0F2Nsx4uynUKOF
 W1HRy0LpD3VaVFjeit2PzSpu/qIvqcX8tPWfNxjR7hHcpxzjHA9Bnf0NXwTG762Wbjxw
 HUgg==
X-Gm-Message-State: AC+VfDwmJeaYxAVs0XLRmH+0Jc3eESwDROp70bIFSpOBRAkhXRNJ7SCE
 eV27j7+DJxl8emLZdd+t1qdDsakeeTwWU0KqFo8=
X-Google-Smtp-Source: ACHHUZ4o8Kot5pzYw3C0ftTdZt7EvTMwFoZ5XtcbsaKGCj+xlBTdcurXYEjNyjoNI2ehZ4e7ziCWdg/K9LICEbCpuAU=
X-Received: by 2002:a05:6102:3672:b0:434:8632:e8ec with SMTP id
 bg18-20020a056102367200b004348632e8ecmr14313977vsb.5.1684293131320; Tue, 16
 May 2023 20:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
 <20230501140020.3667219-2-mchitale@ventanamicro.com>
In-Reply-To: <20230501140020.3667219-2-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 13:11:45 +1000
Message-ID: <CAKmqyKN9vAAtXtRaUN3_im5k8kO+GoJ-V1mFbJPniSEdeswLnw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn, 
 Richard Henderson <richard.henderson@linaro.org>
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

On Tue, May 2, 2023 at 12:00=E2=80=AFAM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> If smstateen is implemented and smtateen0.fcsr is clear and misa.F
> is off then the floating point operations must return illegal
> instruction exception or virtual instruction trap, if relevant.

Do you mind re-wording this commit message? I can't get my head around
it. You talk about returning an illegal instruction exception, but
most of this patch is just adding SMSTATEEN0_FCSR to the write mask if
floating point is disabled.

It looks to me like you are returning an exception trying to access a
floating pointer register if FP is off and SMSTATEEN0_FCSR is not set
(which you describe) but also then only allow changing SMSTATEEN0_FCSR
if the RVF is not enabled, which is where I'm confused.

Your patch seems to be correct, I think the commit message and title
just needs a small tweak. Maybe something like this:

```
target/riscv: smstateen add support for fcsr bit

If smstateen is implemented and SMSTATEEN0.FCSR is zero floating point
CSR access should raise an illegal instruction exception or virtual
equivalent as required.

We also allow the guest to set/unset the FCSR bit, but only if misa.F
=3D=3D 0, as defined in the spec.
```

Alistair

>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>  target/riscv/csr.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..3f6b824bd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csrno=
)
>          !riscv_cpu_cfg(env)->ext_zfinx) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> +    }
>  #endif
>      return RISCV_EXCP_NONE;
>  }
> @@ -2100,6 +2104,9 @@ static RISCVException write_mstateen0(CPURISCVState=
 *env, int csrno,
>                                        target_ulong new_val)
>  {
>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |=3D SMSTATEEN0_FCSR;
> +    }
>
>      return write_mstateen(env, csrno, wr_mask, new_val);
>  }
> @@ -2173,6 +2180,10 @@ static RISCVException write_hstateen0(CPURISCVStat=
e *env, int csrno,
>  {
>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |=3D SMSTATEEN0_FCSR;
> +    }
> +
>      return write_hstateen(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2259,6 +2270,10 @@ static RISCVException write_sstateen0(CPURISCVStat=
e *env, int csrno,
>  {
>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |=3D SMSTATEEN0_FCSR;
> +    }
> +
>      return write_sstateen(env, csrno, wr_mask, new_val);
>  }
>
> --
> 2.34.1
>

