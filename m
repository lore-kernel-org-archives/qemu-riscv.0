Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53131CDE008
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:04:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcuzQ-0003EH-SK; Thu, 25 Jun 2026 21:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuzP-0003E2-GE
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:04:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuzN-0001vT-3F
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:04:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-697df404e32so816197a12.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782435851; cv=none;
 d=google.com; s=arc-20260327;
 b=bwMCtvndrcph07uorSzVtr8FAojmj45vzvLLtS16m6WAJIm7vFT65IQVqoHY8/TIsR
 StzyC5AP7GXpnYeNjtNMdDl14lI9LGqSoslVLc5BzIJicvMQz7iCSHjBRJhNUC2IvyHG
 i0281z2ZmxC80lKbrivkI6gwHG0voO6mWxMZ169AgpZrgxJ/jI9Wue5qOc3nOzAUGQX3
 m2uLnAWug0RM7LWSmD5rCk+bVb2y9KfLKX06qkHLCjAQaQfYvwlM+7UVzKoWrpUwpAN2
 Jtu6LK3iK3AawqI2Tc4vC4+An6I+XzbrhqGO97FR4GuG1qlZVQ8cZk6GXnWAthnHFeWt
 RmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yAMoRtDE/BkCEBx6H4lK4tql4CtyQNNeu3b7pztznJc=;
 fh=nRJ2R/SjnCm2GibUZhhfOADAy3GI2j1qEc7T33A+lYc=;
 b=i27eLFtuWfC9/3n0xKyG8Rr4UgpjKsrnYV9Ix69aDTxe5yx70WMF7sPm6PGQbnpgJl
 yDGjraCDeFQImCVKSD7072t3hJaSb5N7EH4g3xiUdhc1Vy4F9u6zSOZ1AYZYk21Q3AWD
 tLqHKPz1VoABhYwkKFiPYAwHGfJAqOebwXQIErsBgTuACE78xNniGt4m5jBL76tua6Mj
 X24Je7eKC4ULLp4IndoMiD45HyM6PA5NLUpGiBcJon3blypBBbQiqjBZJk/82ajRzcC/
 mb4izYqNXI4fclk731tB6iUhNnVA3SI/JzUlau8aEYllLEVqe/rxVG2jlFvWcOJKgr4L
 KnWg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782435851; x=1783040651; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAMoRtDE/BkCEBx6H4lK4tql4CtyQNNeu3b7pztznJc=;
 b=WY3VQBQl9ZU6Rub2JTBMr7ds4Xrg4juG6+5LUxbbJynNAYSUjMzVpZeSxKPPe98Cdn
 r3A7vsKCkLJf5t9CRBNHL2a1FtsmDteLdiwjT97JtJrjkro1Xh+D+o731eGY3DatOFiR
 z4tGQ90U+H2uYZgrAXxDNzOduyATRpSRTaVGzhki2C7ZJXnQmeBRe3NLW2faDlnBOPfh
 aakIDKk+KmTJzaziHh4jSwzkxUM0Sipb1E3axTEp09cPLHv/gex1Jbf3nCuWP65vcCKl
 iNb4+KCfrdYqQ7pH1jm89K7dUBtE4Yxdo7ytKyqgS+xbbdo4HJ1uQygh1gKtyoR1KIwO
 qFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782435851; x=1783040651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yAMoRtDE/BkCEBx6H4lK4tql4CtyQNNeu3b7pztznJc=;
 b=hY5XeM6EkLVEuK0YQtU9YXqE2Y5MNuqmieyRNuhcv2aSDyd8WXm2yl4L96U7U1BLMp
 PKC+b2xs0RasPxyp6e0drXoVgsbUNQyBFh9HKMdqZ3Ds9O3MMSpbZf/YYmzsM5z3uZu4
 EJcFSbD/E9DJsHAE902BaQWovDl24K89dKUdoMphlQtTpP0ejhGRKtN87yoex6T/7SqL
 aJwDtUnxgYrlH0v64tumjlzY6tVi4vkPywRn+a+gxDX3pqW+7hQWL2dcsOZXmf+6fp75
 T3tkJfSDWa59jX9yi5ndYDroTV38021aG6M1v9h1rs154Mv4x722qEidvAdYBWNT+YH3
 wc+g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpc9zoLWb+lQfWIR/1OGLWJDGR10UXwrXDB6OW2jO8oetMkzQMCZeH/3l8Aph9ckl3otCw4MRzUi1hm@nongnu.org
X-Gm-Message-State: AOJu0YxLo2o7RhIkr0xAvrxifRtNngJw2iwOP1oKeqDnETwZmhRv9X1Z
 KpZeeDL3g5E0evoHoP5BS9/YSpFTDnuxK0h0umi4VMLne8ubNDWVtLDbqMtfr7w8RO/UoRT0dQ3
 CO95F3X7ZKiE+s8nobq46teh5/j//wJo=
X-Gm-Gg: AfdE7cnoYDim+tFvtSAcaReolFT5En1fm6+/w0YPJqmHIdcjwzsZXu496N3K+/y10ps
 lfNlmaJkjwXbh+LPcpOY9YDh64E/HXM8NWtxU/enT2mTd0M7bEPwNPr/rmHtCR+ooARmqeWUpJq
 xcJi8a+fWCxwvaWc4/lIk+Pe9j0W+d6EHk9kwUS3ORs+h4xCW3dsXryBJxOHUCMSJOPnuorPk1R
 DCzaXeb7FtmZaIJlGwY4eKNLMU09WgmdbyUc3ubqwNmPI3tblIyZ4Ofvu8lxZorfptHdr9LyQ6V
 KHP+HH7m9m2qiLNvlVuNYYEp73c=
X-Received: by 2002:a05:6402:a50f:10b0:698:18e7:9c48 with SMTP id
 4fb4d7f45d1cf-69818e79e7dmr526436a12.15.1782435851477; Thu, 25 Jun 2026
 18:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-14-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-14-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:03:45 +1000
X-Gm-Features: AVVi8CfhKn9nUbZv2n5HhddC3Kik_zsaefQ8qwYja86y8NR64rOKQv2NfBNvqXM
Message-ID: <CAKmqyKOgX3qMBwzqn9Y0QH3YQ-_PVVOGtc9ELdNKemSCkHVgaw@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] target/riscv: move some irq helpers to cpu.c
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
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

On Wed, Jun 24, 2026 at 10:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_cpu_has_work() uses a handful of irq pending functions from
> cpu_helper.c.  There is a very high possibility that KVM doesn't need
> the current implermentation of has_work(), but the common accel code
> needs an implementation of this callback (see cpu_exec_class_post_init)
> otherwise the KVM driver won't initialize.
>
> Move the relevant irq helpers to cpu.c to allow KVM to keep using the
> current has_work implementation, allowing --disable-tcg to work.  We'll
> circle it back to evaluate a proper KVM implementation for it in a later
> date.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c            | 187 ++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h            |   5 +
>  target/riscv/tcg/cpu_helper.c | 187 ----------------------------------
>  3 files changed, 192 insertions(+), 187 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 29af0f2be8..483ac2e0d0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -738,6 +738,193 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> +/*
> + * Default priorities of local interrupts are defined in the
> + * RISC-V Advanced Interrupt Architecture specification.
> + *
> + * ----------------------------------------------------------------
> + *  Default  |
> + *  Priority | Major Interrupt Numbers
> + * ----------------------------------------------------------------
> + *  Highest  | 47, 23, 46, 45, 22, 44,
> + *           | 43, 21, 42, 41, 20, 40
> + *           |
> + *           | 11 (0b),  3 (03),  7 (07)
> + *           |  9 (09),  1 (01),  5 (05)
> + *           | 12 (0c)
> + *           | 10 (0a),  2 (02),  6 (06)
> + *           |
> + *           | 39, 19, 38, 37, 18, 36,
> + *  Lowest   | 35, 17, 34, 33, 16, 32
> + * ----------------------------------------------------------------
> + */
> +static const uint8_t default_iprio[64] =3D {
> +    /* Custom interrupts 48 to 63 */
> +    [63] =3D IPRIO_MMAXIPRIO,
> +    [62] =3D IPRIO_MMAXIPRIO,
> +    [61] =3D IPRIO_MMAXIPRIO,
> +    [60] =3D IPRIO_MMAXIPRIO,
> +    [59] =3D IPRIO_MMAXIPRIO,
> +    [58] =3D IPRIO_MMAXIPRIO,
> +    [57] =3D IPRIO_MMAXIPRIO,
> +    [56] =3D IPRIO_MMAXIPRIO,
> +    [55] =3D IPRIO_MMAXIPRIO,
> +    [54] =3D IPRIO_MMAXIPRIO,
> +    [53] =3D IPRIO_MMAXIPRIO,
> +    [52] =3D IPRIO_MMAXIPRIO,
> +    [51] =3D IPRIO_MMAXIPRIO,
> +    [50] =3D IPRIO_MMAXIPRIO,
> +    [49] =3D IPRIO_MMAXIPRIO,
> +    [48] =3D IPRIO_MMAXIPRIO,
> +
> +    /* Custom interrupts 24 to 31 */
> +    [31] =3D IPRIO_MMAXIPRIO,
> +    [30] =3D IPRIO_MMAXIPRIO,
> +    [29] =3D IPRIO_MMAXIPRIO,
> +    [28] =3D IPRIO_MMAXIPRIO,
> +    [27] =3D IPRIO_MMAXIPRIO,
> +    [26] =3D IPRIO_MMAXIPRIO,
> +    [25] =3D IPRIO_MMAXIPRIO,
> +    [24] =3D IPRIO_MMAXIPRIO,
> +
> +    [47] =3D IPRIO_DEFAULT_UPPER,
> +    [23] =3D IPRIO_DEFAULT_UPPER + 1,
> +    [46] =3D IPRIO_DEFAULT_UPPER + 2,
> +    [45] =3D IPRIO_DEFAULT_UPPER + 3,
> +    [22] =3D IPRIO_DEFAULT_UPPER + 4,
> +    [44] =3D IPRIO_DEFAULT_UPPER + 5,
> +
> +    [43] =3D IPRIO_DEFAULT_UPPER + 6,
> +    [21] =3D IPRIO_DEFAULT_UPPER + 7,
> +    [42] =3D IPRIO_DEFAULT_UPPER + 8,
> +    [41] =3D IPRIO_DEFAULT_UPPER + 9,
> +    [20] =3D IPRIO_DEFAULT_UPPER + 10,
> +    [40] =3D IPRIO_DEFAULT_UPPER + 11,
> +
> +    [11] =3D IPRIO_DEFAULT_M,
> +    [3]  =3D IPRIO_DEFAULT_M + 1,
> +    [7]  =3D IPRIO_DEFAULT_M + 2,
> +
> +    [9]  =3D IPRIO_DEFAULT_S,
> +    [1]  =3D IPRIO_DEFAULT_S + 1,
> +    [5]  =3D IPRIO_DEFAULT_S + 2,
> +
> +    [12] =3D IPRIO_DEFAULT_SGEXT,
> +
> +    [10] =3D IPRIO_DEFAULT_VS,
> +    [2]  =3D IPRIO_DEFAULT_VS + 1,
> +    [6]  =3D IPRIO_DEFAULT_VS + 2,
> +
> +    [39] =3D IPRIO_DEFAULT_LOWER,
> +    [19] =3D IPRIO_DEFAULT_LOWER + 1,
> +    [38] =3D IPRIO_DEFAULT_LOWER + 2,
> +    [37] =3D IPRIO_DEFAULT_LOWER + 3,
> +    [18] =3D IPRIO_DEFAULT_LOWER + 4,
> +    [36] =3D IPRIO_DEFAULT_LOWER + 5,
> +
> +    [35] =3D IPRIO_DEFAULT_LOWER + 6,
> +    [17] =3D IPRIO_DEFAULT_LOWER + 7,
> +    [34] =3D IPRIO_DEFAULT_LOWER + 8,
> +    [33] =3D IPRIO_DEFAULT_LOWER + 9,
> +    [16] =3D IPRIO_DEFAULT_LOWER + 10,
> +    [32] =3D IPRIO_DEFAULT_LOWER + 11,
> +};
> +
> +uint8_t riscv_cpu_default_priority(int irq)
> +{
> +    if (irq < 0 || irq > 63) {
> +        return IPRIO_MMAXIPRIO;
> +    }
> +
> +    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
> +};
> +
> +int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +                             int extirq, unsigned int extirq_def_prio,
> +                             uint64_t pending, uint8_t *iprio)
> +{
> +    int irq, best_irq =3D RISCV_EXCP_NONE;
> +    unsigned int prio, best_prio =3D UINT_MAX;
> +
> +    if (!pending) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    irq =3D ctz64(pending);
> +    if (!((extirq =3D=3D IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
> +                                  riscv_cpu_cfg(env)->ext_ssaia)) {
> +        return irq;
> +    }
> +
> +    pending =3D pending >> irq;
> +    while (pending) {
> +        prio =3D iprio[irq];
> +        if (!prio) {
> +            if (irq =3D=3D extirq) {
> +                prio =3D extirq_def_prio;
> +            } else {
> +                prio =3D (riscv_cpu_default_priority(irq) < extirq_def_p=
rio) ?
> +                       1 : IPRIO_MMAXIPRIO;
> +            }
> +        }
> +        if ((pending & 0x1) && (prio <=3D best_prio)) {
> +            best_irq =3D irq;
> +            best_prio =3D prio;
> +        }
> +        irq++;
> +        pending =3D pending >> 1;
> +    }
> +
> +    return best_irq;
> +}
> +
> +/*
> + * Doesn't report interrupts inserted using mvip from M-mode firmware or
> + * using hvip bits 13:63 from HS-mode. Those are returned in
> + * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
> + */
> +uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> +{
> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    uint64_t vstip =3D (env->vstime_irq) ? MIP_VSTIP : 0;
> +
> +    return (env->mip | vsgein | vstip) & env->mie;
> +}
> +
> +int riscv_cpu_mirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +                                    irqs, env->miprio);
> +}
> +
> +int riscv_cpu_sirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & ~env->=
hideleg;
> +    uint64_t irqs_f =3D env->mvip & env->mvien & ~env->mideleg & env->si=
e;
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                    irqs | irqs_f, env->siprio);
> +}
> +
> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & env->h=
ideleg;
> +    uint64_t irqs_f_vs =3D env->hvip & env->hvien & ~env->hideleg & env-=
>vsie;
> +    uint64_t vsbits;
> +
> +    /* Bring VS-level bits to correct position */
> +    vsbits =3D irqs & VS_MODE_INTERRUPTS;
> +    irqs &=3D ~VS_MODE_INTERRUPTS;
> +    irqs |=3D vsbits >> 1;
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                    (irqs | irqs_f_vs), env->hviprio);
> +}
> +
>  bool riscv_cpu_has_work(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 82430ecec6..396d9253e6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -640,6 +640,11 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env);
>  int riscv_cpu_mirq_pending(CPURISCVState *env);
>  int riscv_cpu_sirq_pending(CPURISCVState *env);
>  int riscv_cpu_vsirq_pending(CPURISCVState *env);
> +int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +                             int extirq, unsigned int extirq_def_prio,
> +                             uint64_t pending, uint8_t *iprio);
> +
> +
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  uint8_t riscv_cpu_get_geilen(CPURISCVState *env);
>  void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.=
c
> index 8c347aa1c0..b38f639dae 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -330,193 +330,6 @@ int riscv_cpu_hviprio_index2irq(int index, int *out=
_irq, int *out_rdzero)
>      return 0;
>  }
>
> -/*
> - * Default priorities of local interrupts are defined in the
> - * RISC-V Advanced Interrupt Architecture specification.
> - *
> - * ----------------------------------------------------------------
> - *  Default  |
> - *  Priority | Major Interrupt Numbers
> - * ----------------------------------------------------------------
> - *  Highest  | 47, 23, 46, 45, 22, 44,
> - *           | 43, 21, 42, 41, 20, 40
> - *           |
> - *           | 11 (0b),  3 (03),  7 (07)
> - *           |  9 (09),  1 (01),  5 (05)
> - *           | 12 (0c)
> - *           | 10 (0a),  2 (02),  6 (06)
> - *           |
> - *           | 39, 19, 38, 37, 18, 36,
> - *  Lowest   | 35, 17, 34, 33, 16, 32
> - * ----------------------------------------------------------------
> - */
> -static const uint8_t default_iprio[64] =3D {
> -    /* Custom interrupts 48 to 63 */
> -    [63] =3D IPRIO_MMAXIPRIO,
> -    [62] =3D IPRIO_MMAXIPRIO,
> -    [61] =3D IPRIO_MMAXIPRIO,
> -    [60] =3D IPRIO_MMAXIPRIO,
> -    [59] =3D IPRIO_MMAXIPRIO,
> -    [58] =3D IPRIO_MMAXIPRIO,
> -    [57] =3D IPRIO_MMAXIPRIO,
> -    [56] =3D IPRIO_MMAXIPRIO,
> -    [55] =3D IPRIO_MMAXIPRIO,
> -    [54] =3D IPRIO_MMAXIPRIO,
> -    [53] =3D IPRIO_MMAXIPRIO,
> -    [52] =3D IPRIO_MMAXIPRIO,
> -    [51] =3D IPRIO_MMAXIPRIO,
> -    [50] =3D IPRIO_MMAXIPRIO,
> -    [49] =3D IPRIO_MMAXIPRIO,
> -    [48] =3D IPRIO_MMAXIPRIO,
> -
> -    /* Custom interrupts 24 to 31 */
> -    [31] =3D IPRIO_MMAXIPRIO,
> -    [30] =3D IPRIO_MMAXIPRIO,
> -    [29] =3D IPRIO_MMAXIPRIO,
> -    [28] =3D IPRIO_MMAXIPRIO,
> -    [27] =3D IPRIO_MMAXIPRIO,
> -    [26] =3D IPRIO_MMAXIPRIO,
> -    [25] =3D IPRIO_MMAXIPRIO,
> -    [24] =3D IPRIO_MMAXIPRIO,
> -
> -    [47] =3D IPRIO_DEFAULT_UPPER,
> -    [23] =3D IPRIO_DEFAULT_UPPER + 1,
> -    [46] =3D IPRIO_DEFAULT_UPPER + 2,
> -    [45] =3D IPRIO_DEFAULT_UPPER + 3,
> -    [22] =3D IPRIO_DEFAULT_UPPER + 4,
> -    [44] =3D IPRIO_DEFAULT_UPPER + 5,
> -
> -    [43] =3D IPRIO_DEFAULT_UPPER + 6,
> -    [21] =3D IPRIO_DEFAULT_UPPER + 7,
> -    [42] =3D IPRIO_DEFAULT_UPPER + 8,
> -    [41] =3D IPRIO_DEFAULT_UPPER + 9,
> -    [20] =3D IPRIO_DEFAULT_UPPER + 10,
> -    [40] =3D IPRIO_DEFAULT_UPPER + 11,
> -
> -    [11] =3D IPRIO_DEFAULT_M,
> -    [3]  =3D IPRIO_DEFAULT_M + 1,
> -    [7]  =3D IPRIO_DEFAULT_M + 2,
> -
> -    [9]  =3D IPRIO_DEFAULT_S,
> -    [1]  =3D IPRIO_DEFAULT_S + 1,
> -    [5]  =3D IPRIO_DEFAULT_S + 2,
> -
> -    [12] =3D IPRIO_DEFAULT_SGEXT,
> -
> -    [10] =3D IPRIO_DEFAULT_VS,
> -    [2]  =3D IPRIO_DEFAULT_VS + 1,
> -    [6]  =3D IPRIO_DEFAULT_VS + 2,
> -
> -    [39] =3D IPRIO_DEFAULT_LOWER,
> -    [19] =3D IPRIO_DEFAULT_LOWER + 1,
> -    [38] =3D IPRIO_DEFAULT_LOWER + 2,
> -    [37] =3D IPRIO_DEFAULT_LOWER + 3,
> -    [18] =3D IPRIO_DEFAULT_LOWER + 4,
> -    [36] =3D IPRIO_DEFAULT_LOWER + 5,
> -
> -    [35] =3D IPRIO_DEFAULT_LOWER + 6,
> -    [17] =3D IPRIO_DEFAULT_LOWER + 7,
> -    [34] =3D IPRIO_DEFAULT_LOWER + 8,
> -    [33] =3D IPRIO_DEFAULT_LOWER + 9,
> -    [16] =3D IPRIO_DEFAULT_LOWER + 10,
> -    [32] =3D IPRIO_DEFAULT_LOWER + 11,
> -};
> -
> -uint8_t riscv_cpu_default_priority(int irq)
> -{
> -    if (irq < 0 || irq > 63) {
> -        return IPRIO_MMAXIPRIO;
> -    }
> -
> -    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
> -};
> -
> -static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> -                                    int extirq, unsigned int extirq_def_=
prio,
> -                                    uint64_t pending, uint8_t *iprio)
> -{
> -    int irq, best_irq =3D RISCV_EXCP_NONE;
> -    unsigned int prio, best_prio =3D UINT_MAX;
> -
> -    if (!pending) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    irq =3D ctz64(pending);
> -    if (!((extirq =3D=3D IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
> -                                  riscv_cpu_cfg(env)->ext_ssaia)) {
> -        return irq;
> -    }
> -
> -    pending =3D pending >> irq;
> -    while (pending) {
> -        prio =3D iprio[irq];
> -        if (!prio) {
> -            if (irq =3D=3D extirq) {
> -                prio =3D extirq_def_prio;
> -            } else {
> -                prio =3D (riscv_cpu_default_priority(irq) < extirq_def_p=
rio) ?
> -                       1 : IPRIO_MMAXIPRIO;
> -            }
> -        }
> -        if ((pending & 0x1) && (prio <=3D best_prio)) {
> -            best_irq =3D irq;
> -            best_prio =3D prio;
> -        }
> -        irq++;
> -        pending =3D pending >> 1;
> -    }
> -
> -    return best_irq;
> -}
> -
> -/*
> - * Doesn't report interrupts inserted using mvip from M-mode firmware or
> - * using hvip bits 13:63 from HS-mode. Those are returned in
> - * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
> - */
> -uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> -{
> -    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> -    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> -    uint64_t vstip =3D (env->vstime_irq) ? MIP_VSTIP : 0;
> -
> -    return (env->mip | vsgein | vstip) & env->mie;
> -}
> -
> -int riscv_cpu_mirq_pending(CPURISCVState *env)
> -{
> -    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
> -                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> -
> -    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> -                                    irqs, env->miprio);
> -}
> -
> -int riscv_cpu_sirq_pending(CPURISCVState *env)
> -{
> -    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & ~env->=
hideleg;
> -    uint64_t irqs_f =3D env->mvip & env->mvien & ~env->mideleg & env->si=
e;
> -
> -    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> -                                    irqs | irqs_f, env->siprio);
> -}
> -
> -int riscv_cpu_vsirq_pending(CPURISCVState *env)
> -{
> -    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & env->h=
ideleg;
> -    uint64_t irqs_f_vs =3D env->hvip & env->hvien & ~env->hideleg & env-=
>vsie;
> -    uint64_t vsbits;
> -
> -    /* Bring VS-level bits to correct position */
> -    vsbits =3D irqs & VS_MODE_INTERRUPTS;
> -    irqs &=3D ~VS_MODE_INTERRUPTS;
> -    irqs |=3D vsbits >> 1;
> -
> -    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> -                                    (irqs | irqs_f_vs), env->hviprio);
> -}
> -
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
>      uint64_t irqs, pending, mie, hsie, vsie, irqs_f, irqs_f_vs;
> --
> 2.43.0
>
>

