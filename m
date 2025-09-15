Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B69CAC58E
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 04:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0jc-0006Bq-K3; Mon, 15 Sep 2025 00:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0jY-0006BO-HU
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 00:22:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0jM-00056I-1G
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 00:22:32 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso555522866b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 21:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757910133; x=1758514933; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jumm2xu+sZ/TP65LQQULuz9ZRHV2Yiy5Lh9gUoMfBTk=;
 b=TakRBarG49tGbkystmUWBtwRFJKNGTam6xrEolssfdFN+K6G9S3lSyXt7UC0sZ+KyH
 +1Xx7jFx1TwkaVQeSTRRcD1u7KGIQNnQSn53bauxaYl45PzfAKD4knDokPrkdKa5XFJz
 4KIwskIb3v1WHFB8AlUhVwwzkZtnHPgxSaC4DfW95iyg1HeKF/OlnUbNzewlb/UcLB1x
 g9IY04h03YgvHANRTkKXeIXOivSxXSzNqq1t+f443G1P5Rk3/aGhMnji3gqItI53wwNf
 jb7Bp3iUvfQvAH882KKTSf3uC3OIDLSfdDSxhtDWGc6Qq09OWtVZG0gDLsepUtAGnu0P
 Uw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757910133; x=1758514933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jumm2xu+sZ/TP65LQQULuz9ZRHV2Yiy5Lh9gUoMfBTk=;
 b=KmNFiuwZu32F9ha0t9rzHw1dbFY+BdTJlLxOUPK7wUEwUvk6F++9mfxWNadpU0tkVh
 y2hP0Pebrcz+1OT8ed8POpj5dRYiR1NjDO0+OXZNd8bcYzlg8EMLLM4deT1aluBVZXAE
 99P95eF9lwSrRn56smLIXQVcGNlS8muOlfo/Ad5+GXZ0BKS0l/M7MAYj9niswztl+Wlq
 euN6wggDSnmYgYqDPrDRGlwJchRjqLHuUYS+K9pDCYoG93EdOv32D3x68IudBmclqfIr
 m1RniF5Qpmzv6XYC5ke7MZqnPjbpjj9sGvXofV/9LmtBXlR8e76TrX9vMxIgz7OBEsDh
 HNMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7FyvsCQQFx5YZ3HEZB6qYK08w5hAcqx04/UEaKUigjWLoB+TKaBaELKaxooYLtI1+wYG+eMLl6xVP@nongnu.org
X-Gm-Message-State: AOJu0YzisK8DaTKv0KuMdlQK0Wqv09f0Zjqa7U6gt336gKKbkPUJY5pq
 3X02XW2bcl+nu/GhVaTHLlBrufyES584MUnULaNJr2b1CLKVnvR3rg3OSK+7rmRHtjVXgJBVdRi
 bWafXXPcag9GjZ5pDhHlVtjwQqCAjFe0=
X-Gm-Gg: ASbGncvOY4VSJa+C5M4rURoO+605xPipBsVAoOb1hrvoRHk72QnFAdD3o/8ZvBJ9eXM
 U5IAi4FiLd0Y+Q4ZP9QhJxWwAGJIbTXFKyV429aBMl2gqdqIRd6AdN9FZB8ktDBfXZ2XAW1/oWB
 8usnRsVfoNE/0cYemEb9A4zHdA7VtnuUEemOvrnaoOU8FJH3UBnuqc7+g7tXIF5jvz0o9qVBlOf
 mFY2p7OTyDvTg+fNdhxXwpNmNx3mSKj3xwhSbIU8MmUt5ip
X-Google-Smtp-Source: AGHT+IGJxV+QMjYWeJ1s5c+xhEcvtb5oaXBWDirMyP55GJIDpA9FsgxxY1Xa3lPycnDOgaooHHlTHEH3swk2f/U0E2U=
X-Received: by 2002:a17:907:25c7:b0:af9:eace:8a52 with SMTP id
 a640c23a62f3a-b07c3833af7mr1119115066b.50.1757910132676; Sun, 14 Sep 2025
 21:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250911-timers-v3-0-60508f640050@linux.alibaba.com>
 <20250911-timers-v3-4-60508f640050@linux.alibaba.com>
In-Reply-To: <20250911-timers-v3-4-60508f640050@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 14:21:45 +1000
X-Gm-Features: Ac12FXwxVWkBg8Hizdafgdb9lCejHZ9lc71fnso-m1UPCpPDRKdXQuq7QzaMr6o
Message-ID: <CAKmqyKPFJMAy4YJNxsH=qaE9po65w=yeiT-ah6yNu77K3NCYcA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] target/riscv: Save stimer and vstimer in CPU
 vmstate
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 11, 2025 at 7:59=E2=80=AFPM TANG Tiancheng <lyndra@linux.alibab=
a.com> wrote:
>
> vmstate_riscv_cpu was missing env.stimer and env.vstimer.
> Without migrating these QEMUTimer fields, active S/VS-mode
> timer events are lost after snapshot or migration.
>
> Add VMSTATE_TIMER_PTR() entries to save and restore them.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/machine.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 1600ec44f0b755fdd49fc0df47c2288c9940afe0..51e0567ed30cbab5e791ea904=
165bc1854709192 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -400,6 +400,30 @@ static const VMStateDescription vmstate_ssp =3D {
>      }
>  };
>
> +static bool sstc_timer_needed(void *opaque)
> +{
> +    RISCVCPU *cpu =3D opaque;
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    if (!cpu->cfg.ext_sstc) {
> +        return false;
> +    }
> +
> +    return env->stimer !=3D NULL || env->vstimer !=3D NULL;
> +}
> +
> +static const VMStateDescription vmstate_sstc =3D {
> +    .name =3D "cpu/timer",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D sstc_timer_needed,
> +    .fields =3D (const VMStateField[]) {
> +        VMSTATE_TIMER_PTR(env.stimer, RISCVCPU),
> +        VMSTATE_TIMER_PTR(env.vstimer, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu =3D {
>      .name =3D "cpu",
>      .version_id =3D 10,
> @@ -476,6 +500,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          &vmstate_elp,
>          &vmstate_ssp,
>          &vmstate_ctr,
> +        &vmstate_sstc,
>          NULL
>      }
>  };
>
> --
> 2.43.0
>
>

