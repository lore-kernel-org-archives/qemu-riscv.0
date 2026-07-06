Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7DCC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:49:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgXWm-0008Jt-Fj; Sun, 05 Jul 2026 20:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXWd-0008Dk-QM
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:49:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXWa-0005ji-9m
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:49:30 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c125ba77577so223844366b.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 17:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783298967; cv=none;
 d=google.com; s=arc-20260327;
 b=AYQ/YMv+aTK/yoUjPCVGlUtjwwIf+kpDAf22FOFR3JpubFEYbPgn/mdoYZmBvaBeSK
 yUoCnp26sRC662OIK9LkH81skujrMSdBoMbjQ1QWjg397zfdMdqUQGla+daN4mUBoQQG
 GSxmLt0d9ckH8fKx9x6L/ceArnEsu3wTwONt9IlPJ0/VUUs2jC/UmIyZnxdSwi2ZeX5V
 uEPQLhSm0ELcV3yXpTshi64UNsRJXwmIJ0JByOl6LOzGags0hPxSUYShdfnf+Ft80o25
 Ay9S5ttuFYmcVD2aZwRr6RyNX2nfIDIzNOd6lo35IpWTI2qvTkRXpFLDokVgaS+dVxEj
 l3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IpEQD+QbHkBTdotZo1bmOKvlBnTLOFB0i/2915gcx0M=;
 fh=m75ne5xeCfg0jXCbFWw3NMEsNS1vr44rF3JaZFAC/84=;
 b=ifkrHgfgBdt6LThmesV3Ds9MbhMApmKj4ZZPbrqp4iOCRVv/9C2weuWQAqYZGNcYCk
 Iuk/BycZOUxD4gSDyjS3NGntnP21laAqceFW/NyuEc9X9XR1yphcnusepvpp2qmVHzkK
 chT4q2xlzJM7o3rDjXV6kt8YE0oObrJV8BUyyYlz102E+TEPs6cU0hbw0exJEZD7xBtp
 SdglwAFtqm7jjSLPnpJEM6flz5E+iF5UqdfDul9gnGqXc1INjMyZIS73fg7dDTsd7+2P
 ecz1FRFiZvJ0yzKdsRFLTEmEhw8qIb6qwXcieTWN61DFX/GnIicJoR6VOnfYp29CCIPA
 mFNw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783298967; x=1783903767; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IpEQD+QbHkBTdotZo1bmOKvlBnTLOFB0i/2915gcx0M=;
 b=gmOCy/GLM7scVfeaiAYiMjvchcAMGDvgDdadFVGdaEWxQhtXONiKgFLK3Uy5plotWK
 n4aCOjMrt20l6KCktZfFKbndcWvN+2szoYSCD0xuZouWYl7X0LNY1Y/JhWEMgktf/jgh
 GX3m883mAOfHs92G4+VJHqkYQsEhR3ApVZLRZQ1GBnN9UhRJp52v3mBEqLr2u7tiUFxC
 LqENULqyGfSoUNYM4P5jVYZ2i77oQJPN5dKK7Hg0dkd+IdT/sxN2rs9lZmkiOO5NoxMj
 c0iRletr6iXLbfgNQnxcPtxHsBB7mEZ4WQxfRHMdRTdy9VZo0YQIh8xOMoo/vTxKURwH
 I6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783298967; x=1783903767;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IpEQD+QbHkBTdotZo1bmOKvlBnTLOFB0i/2915gcx0M=;
 b=Y/GYAsIVLld7lBE6C+sU1lLoIhILBQalvPUZW5AEd9bFaZSbS9z39qEZLbSSsanIDH
 HEOrrrny9nV5gJzSjpykhG/hChfe/skLHnT9HysPYOEs7s9PYev14vncP5GKfpm/A8ti
 vqZJn8Fj7BK6pCG11dBt0rrv7uItK8sxSVz0pN8TzMaJ747SMOYwKzlVKr6Zx5M5MFoe
 uKftSwT6LLWkSD/dAAS3Hxu0h3EDtTgkpTit9VRcHYcWqxw7zCzc3EK2GM7Ntz+Khm2S
 j0ZP0hX/22swBhYwSWAV0HX9T1YcihVsoEG9rHrp3/ka7GcYuziYy0sZU/q4xNlcZJ1n
 qB7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RogdcUGJyykCabuU0witEKfvd/Q/R0YHGL4bav9T0Qmr7j8qn4t2WNboo7Aq94WrVZ+9nWUlaGNVUDP@nongnu.org
X-Gm-Message-State: AOJu0YxJWFq7IRbYWQB3mUz/nkDodajbz8wnbfkzS62kFJYAolZT+hAv
 XFKRNBGjFyPoV7nnzL8fGjkuylMOMlcdj9+REfcvpbErDuQl7nWuII3GMBKooQI7Ps7KaE3wYkT
 Qqsfr8EVMgViZZmNZzMgAukM9G00pIks=
X-Gm-Gg: AfdE7ckL2SWrpDHWc1lBzg3kcUnhEFeUcX7lC+3olqO0ED6yn5DhiK0edS2w9PaYK5P
 WhouAvARBzDoeP1vyeeSNSdV/jd01a9L53+Z2S0PgafoufneCi3wIlJlyZzVtbL1RAE2lSzGERF
 qAdVoCn/kPbJ1s0j4nzEvsTQcaRXJ37Ae91q/dvQ4dTqZc7rAZnJF54xwB+sjMiWICbubyAZJaJ
 qXfHQ/3x+Hv0nlV7ItjwV/xlwtKzNv4/Xd9+HEhTEGfha9Sb5HcLnUxcuj+L14dyn83qU+K9PXE
 ZmY4ougmB7SJz8NdH+E/9XmY36I=
X-Received: by 2002:a17:906:fe0d:b0:c12:79aa:8282 with SMTP id
 a640c23a62f3a-c12e6902f3emr283922166b.12.1783298966918; Sun, 05 Jul 2026
 17:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
 <20260703180538.3346781-23-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260703180538.3346781-23-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 10:48:59 +1000
X-Gm-Features: AVVi8CfQANyT_HfBUEHooi3p47iyQiG40gKErwkMMTEFzzDvyIpTVvBVw6k516Q
Message-ID: <CAKmqyKMjXMqW=kxjWXdoAH_PsufPv=+KJ1uh=_SRz7ZU-0kPaA@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] target/riscv: move riscv_cpu_set_geilen() to
 riscv-imsic
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

On Sat, Jul 4, 2026 at 4:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_imsic.c is the only caller.  Having it sitting in the TCG only
> cpu_helper.c gets in the way of --disable-tcg for no good reason.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_imsic.c         | 13 +++++++++++++
>  target/riscv/cpu.h            |  1 -
>  target/riscv/tcg/cpu_helper.c | 13 -------------
>  3 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 7e5b5349ba..ebb55191c7 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -46,6 +46,19 @@
>  #define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
>                                          IMSIC_EISTATE_PENDING)
>
> +static void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    if (geilen > (TARGET_LONG_BITS - 1)) {
> +        return;
> +    }
> +
> +    env->geilen =3D geilen;
> +}
> +
>  static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
>  {
>      uint32_t i, max_irq, base;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7618110412..7a4d8abe07 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -646,7 +646,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
>
>
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> -void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
>  bool riscv_cpu_vector_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.=
c
> index 6b39152ee2..71a96a20ef 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -526,19 +526,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *e=
nv)
>      }
>  }
>
> -void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
> -{
> -    if (!riscv_has_ext(env, RVH)) {
> -        return;
> -    }
> -
> -    if (geilen > (TARGET_LONG_BITS - 1)) {
> -        return;
> -    }
> -
> -    env->geilen =3D geilen;
> -}
> -
>  void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
>  {
>      CPURISCVState *env =3D &cpu->env;
> --
> 2.43.0
>
>

