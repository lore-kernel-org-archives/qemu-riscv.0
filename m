Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC316EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:05:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvd8-0003JD-QU; Tue, 18 Jul 2023 21:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvd4-0003DU-7N; Tue, 18 Jul 2023 21:05:22 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvd2-00013w-OW; Tue, 18 Jul 2023 21:05:21 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-48133dc9820so1832560e0c.3; 
 Tue, 18 Jul 2023 18:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689728719; x=1692320719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gu5TJOyhwQNnbTjhQRtV5Iifku64oBuwT3UB6hkLNJs=;
 b=PZhECqjydW5RVqJy/oWNDiL4onjhGfLHd74eRzNpMSAGh5V1oxklqCBOmMWBc1Y67w
 VfxAe3qMZsDSPOmY3sRKwHUZGc7hzm5zC2N/SJ7cpPFJGbmfFydFNPQwovt6geStmJvf
 4t/vSexFf4C3Tne9ixrizklV2wdQK/gGFAQrbiBJdSHam7m37m4O6cLfvtJicsvnSgg5
 cA4SkJghTab1r8+xYon1RWgXK/dFusooGGzYjTZB+TQ7FV+umGvU+QFeJhkW2F4w9JS4
 wx9aDQCy0YNYVcjQ7iVSV9EgDDwQTU8Y8ZscBqhnxvjybg2iZ8qKXOInv3CjDMgKfqOj
 /1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728719; x=1692320719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gu5TJOyhwQNnbTjhQRtV5Iifku64oBuwT3UB6hkLNJs=;
 b=PimBTBPZczeW7HIcWfJOIVhDTuGoHxJOA+dw+Sw5fYVSZudbSMPUge4G/RZiwhoXZ8
 qMTKaoUZlKhpa6Gp3vVlgjdwVHIcS/OXY7wBsCAexiuF53hvVpziK25sAqGgxmgfsz1E
 uTq67FDgD5RbTYwUU+uYtgdqz6rm1xznoZjylGC91m9n7XSNQB9SQJkbzbLNEB+iUlnE
 C0qfZsUn2lHPAjCoAafdDmMStLXoO4HpvyQoavpdS3MUcwT60RPF/iO7k7JaaJfPKj9O
 dO9Q2Gba0L7Oejy5uVEux8zdkuYChYCY2Y0/T2x9URQqaqQyE6Xl0vDgQrr+fkSO9xJ7
 FwUA==
X-Gm-Message-State: ABy/qLb7Ve7bFVeG8NJ+DonExfg8Q82LV41BB/ZfBUpCh88c8ab7d73X
 0nA3BYQFrJb0+Zg+WdZaj7af9p4qx1bcmc3inx1UyuYYKAMSqg==
X-Google-Smtp-Source: APBJJlGkeMVQsiC5kOuZMRpHBcCVcvrMuEDrRnQMb3ZW94pqyzs3W1qLE2ZN63AvVV5yXsX1ISDzz4YatqAcBFT9U4s=
X-Received: by 2002:a1f:5ccb:0:b0:481:4cd1:d61e with SMTP id
 q194-20020a1f5ccb000000b004814cd1d61emr516562vkb.13.1689728719341; Tue, 18
 Jul 2023 18:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-13-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-13-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:04:53 +1000
Message-ID: <CAKmqyKOEWfSE9D5-K9-3FELjb6V3Dr762fOP=AhWgHtmXEJ-WA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] target/riscv: Expose riscv_cpu_pending_to_irq()
 from cpu_helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Tue, Jul 11, 2023 at 10:22=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> We want to extract TCG/sysemu-specific code from cpu_helper.c,
> but some functions call riscv_cpu_pending_to_irq(). Expose the
> prototype in "internals.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/internals.h  | 4 ++++
>  target/riscv/cpu_helper.c | 6 +++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b5f823c7ec..b6881b4815 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -72,6 +72,10 @@ target_ulong fclass_d(uint64_t frs1);
>
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_riscv_cpu;
> +
> +int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +                             int extirq, unsigned int extirq_def_prio,
> +                             uint64_t pending, uint8_t *iprio);
>  #endif
>
>  enum {
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 6c773000a5..e73cf56e5c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -256,9 +256,9 @@ uint8_t riscv_cpu_default_priority(int irq)
>      return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
>  };
>
> -static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> -                                    int extirq, unsigned int extirq_def_=
prio,
> -                                    uint64_t pending, uint8_t *iprio)
> +int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +                             int extirq, unsigned int extirq_def_prio,
> +                             uint64_t pending, uint8_t *iprio)
>  {
>      int irq, best_irq =3D RISCV_EXCP_NONE;
>      unsigned int prio, best_prio =3D UINT_MAX;
> --
> 2.38.1
>
>

