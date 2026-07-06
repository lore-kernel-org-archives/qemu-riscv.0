Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C8AC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgXW4-00081A-Pj; Sun, 05 Jul 2026 20:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXVu-00080O-HB
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:48:46 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXVp-0005cq-SN
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:48:46 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba320so4290067a12.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 17:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783298920; cv=none;
 d=google.com; s=arc-20260327;
 b=Pld3fsi6IUyKAn1qBXcaWmWUJJg8mBS9Fkuf2OJeOjebIcdeFUSUp4nH3t9MtK0ro1
 o5oq0LuusbSG2RwwjFaxtKLgcZO9yMi90w+1KOEAbwuXJlza9FIjl8F1w+0fRblM1FqL
 UftFcVUpWkUJDPOGOxzpUOLnlDM86KktXttZoJsn0agPSsaY87mzOBsFdzpGn7x6lF0a
 0sWAGLQLTdQ1qcvt5QmChk3QGD72Tg8/sbpRjAfsQea8Bt9ptwvUp/bKCMhUuh4aG4gh
 WLqubrITGsaPpjyqzzF2Fb6ShnwJ7ZxUuq4QaFm8gpcq+X83XS6c0tHje467bDPt2vMi
 iZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xmzNKL8aW9bGzuTcbOfJ4nLHl46p7jRPYxSxJ2NLVe0=;
 fh=vDKmPIRWQpmcQNcqqr6PVFq1tN9g5+5SyqfJfXMNW18=;
 b=k9B87hax58xzQTNDARrRhBqZEjMiPSDZL4ck5AY4ex6COmcV1Wuyak4r9pi+hj1FJe
 6OxHOVjcTJgnoHXcYXV2Q0/fdemJcC7DH8eRXReZKAR5NV/S1D2trA3FUnWD26YKIPUq
 WtlEoX+UUviz8AYbhT8wNNwS/on6pACfALOod6dehOpgWWwnjM7hC/j76Q4gcb82sKAf
 oKse4p+svJjs4tpxCy5QyG/iP/wXfjmViMiVGgDDljyj/3m3qDE/RAgGAge45kZbLTIi
 +awGxfXG/lnvPZSXIOWw6yx2HJHjZnaHZYisIfaIZfS5RjZBX8IRzyJJMoB27gp+Cn1p
 75mw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783298920; x=1783903720; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmzNKL8aW9bGzuTcbOfJ4nLHl46p7jRPYxSxJ2NLVe0=;
 b=FBY3GTe9fWyxbBgzTY5vSXtocz3+IRQKfW3kmuuFN47f1AzlQOFRgfoEc1/+6htCl6
 ReVJZ+u/KXBxWqY/ODiT1KOl0upfY/zWj32YfEL2FR8FapStorFwEyzyyx1vL3jVqyEu
 LfFiCqM+yzqatnKi4jyNtVeXW8FBu8VacmTu1j9a0yV9AvYhdNyJBwthY9YQLJdgQZcw
 xpBXadlSEQezzEEm7Y9OIMefnOs1n3YyzTQTx2J3RNX095LLOsJsIjbcF+BIT8nhV5Ls
 24Kw9ytvsvXxTG1JS27OWtNGbuclJGwHhcuSIbqB9h3WSnXZW1cSGpvhTEbSlngy5xmw
 K8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783298920; x=1783903720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xmzNKL8aW9bGzuTcbOfJ4nLHl46p7jRPYxSxJ2NLVe0=;
 b=UncxS1ngJaeJBXH3wG8ykee2f0rFehL9lNlFjZvJns646XsqEr5GB/8lOQnmSc9pDN
 8F3I921ys/jImjVocQ+3Vx+V3ZLOijXTvapW9rMAH8KzWDSzJmz8ZDPi637K0YiHme4G
 Nr1iiuN7ucpfbxxWHuaaHZszrvfbXtefkXGrH118Gh2DvAL8Dv78pieL9Pn3ZpL+n+4u
 VEKbKQaBCYdEbRYB3JVadI1Dyr5qmDRTjRRdeISBufUzGOnkEdHXrV+puR2VKZw1Ltgw
 Y9LMi+yuiGTD02bAKtWuP/KfqERXWxCZSLhVKg0NDL+2997lq5b1a1Nutbn0VVyb/mR/
 B5aQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rop2K9q08f+EyNAe2EN4bcSzRhtLBDoPAv/3cx1eG0KcXFelpJAQlWjbbtUZTp4hVhGD/GcG4TdM2Nj@nongnu.org
X-Gm-Message-State: AOJu0Yz7FVa1LBHqAfGNsum5kvp5tNn5gQgLZbslln9Stb3iHFFB/hHV
 /EocV78SVpZRDdKm8nqlS6cUFLSYPoslA+OxS2Y0cRFT5J5+5gW8b0WOdT5sqgTPlXtFkAwYj3a
 EIZl9A50HcTYKQ9C25IUB2j7yt5qw640=
X-Gm-Gg: AfdE7ckGF9RWjT1iN9Z+s28/bYpnlW8e2LQcdRfAzPOjGSqE1znWFtlRmYPwAsl6J7P
 2TQXcVWcV2eV5mk4hemv062zHbvv8Pv8sFtEQi0dvBwGdIPMsnQu1Kh2Yg1LHVY/Z4ZHAyuKyR5
 M75y5PQvOJUvk6e+MMPQGbQKy6cqit7Mw6uFZBRFZxoVIkN4cTY46i6M5/42IbX6PZbA+EEJ//k
 hHQod/tqsaR2NDTwMAX3ZYFqLIkcZh4YFI3CbmmWeB7mAuNKCffb0CD/EU991fXWfVkTl0kkIMn
 xvkeiuFUeCe8EWMzt3QGt06EysI=
X-Received: by 2002:a05:6402:3592:b0:698:b92b:c785 with SMTP id
 4fb4d7f45d1cf-69a1aac3710mr3303812a12.3.1783298920288; Sun, 05 Jul 2026
 17:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
 <20260703180538.3346781-18-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260703180538.3346781-18-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 10:48:12 +1000
X-Gm-Features: AVVi8CdjMy5JQioA9y5lQ4yMZmezPxxS41P8ZLwSlT2Y6ztGXlW-2teSbqPQaqI
Message-ID: <CAKmqyKNjFmfe--jy7LwjhGOtXREtSk=w41OgUDmN95Zs5Ymmjw@mail.gmail.com>
Subject: Re: [PATCH v4 17/24] target/riscv/cpu.c: filter TCG only bits in
 riscv_cpu_reset_hold()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
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

On Sat, Jul 4, 2026 at 4:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We have a lot of TCG only initialization in the common cpu_reset_hold
> callback that prevents --disable-tcg to work.
>
> Put a CONFIG_TCG ifdef around those bits to make the build work.
> Eventually we'll create a TCG specific reset function in tcg-cpu.c but
> for now this suffices.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b79dcc5ee..5a82e6563b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -965,10 +965,6 @@ bool riscv_cpu_has_work(CPUState *cs)
>
>  static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>  {
> -#ifndef CONFIG_USER_ONLY
> -    uint8_t iprio;
> -    int i, irq, rdzero;
> -#endif
>      CPUState *cs =3D CPU(obj);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(obj);
> @@ -1020,6 +1016,10 @@ static void riscv_cpu_reset_hold(Object *obj, Rese=
tType type)
>                      MENVCFG_ADUE : 0);
>      env->henvcfg =3D 0;
>
> +#ifdef CONFIG_TCG
> +    uint8_t iprio;
> +    int i, irq, rdzero;
> +
>      /* Initialized default priorities of local interrupts. */
>      for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
>          iprio =3D riscv_cpu_default_priority(i);
> @@ -1057,11 +1057,12 @@ static void riscv_cpu_reset_hold(Object *obj, Res=
etType type)
>      }
>
>      pmp_unlock_entries(env);
> +#endif /* ifdef CONFIG_TCG */
>  #else
>      env->priv =3D PRV_U;
>      env->senvcfg =3D 0;
>      env->menvcfg =3D 0;
> -#endif
> +#endif /* !CONFIG_USER_ONLY */
>
>      /* on reset elp is clear */
>      env->elp =3D false;
> --
> 2.43.0
>
>

