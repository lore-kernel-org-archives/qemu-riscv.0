Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F54DC7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 03:18:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4vIf-0004ZW-94; Thu, 01 Jun 2023 23:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vIe-0004Z4-3T; Thu, 01 Jun 2023 23:18:00 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vIc-0003YE-F5; Thu, 01 Jun 2023 23:17:59 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-783fb4f87e1so518199241.1; 
 Thu, 01 Jun 2023 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685675877; x=1688267877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWQlda7fULCb+kup1fKnCjcMOFoK8maZ/qpateNS7us=;
 b=BJkqar+TSeXr/lgm7WgC0IV3BJce0SpGyBZzxyC9/XlTcxA+HN3XOpgNMLT/CGNxZ4
 iF8W/UadUBAn1yDajCs4DjSsD/nc9Ex/X8VLSdIE8Y0BGK321hJjYFIa4nCbh3Y89GCU
 mOOwrqHNd65u971hLA8d8kQjl2m4jS3+h1C59lmV7seVX87B1tv1MQeeTKRrFQU5pe8q
 V4XQCBA6vF80XHiom2OgKXWrKYHKgI5BxdYEfJqkZZUyo7T4q8qG/McA9PbrcWx74Gak
 tqgKzKOLc6r4IdLP59z5FSpnwKnCjs6Il9JEZa4mTkKEKxDQj0fzo1fK+dfQx4ze0eHz
 FKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685675877; x=1688267877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWQlda7fULCb+kup1fKnCjcMOFoK8maZ/qpateNS7us=;
 b=VEKGts2nFh4ld9HGBDpeHyLX1JrRniIGGUKCaExU12V7XOyV9spu6vepFpzCn2/1Ye
 9ukan1ahbEy8J8nmGKSj/Zl2VjvPOuWCzlOdl7C7eX8Y2ZznKkbNbWTf5WWPs/QV+/JN
 jROFQLzemWK1jj5iiXlamZNZhL+ZQbgpSv7ClMqMbHvv1pj8NTkZOhjAR1Kz8CvdLNvT
 RbKEvHXFtg/Ek4G/Lz+00rDKsWWw1DWAUJcq6Ow8qh0WPOWfVYUwcXFvDtof4RANxPdH
 PCKq2f6rNR96HICNsfVfg1YA/qhP16qhU80M9N33DPVyEYoDYf7C+0tWdkj2BmgmOzcU
 Wv2Q==
X-Gm-Message-State: AC+VfDwiOcxZFXtCDvbh+oDWjI7FsNc/GYEsc7UO87CGRYQXFlqT+m+F
 ECpz66uHh77RneL/baZM0TPVsCqrIlXD6xYS768=
X-Google-Smtp-Source: ACHHUZ7B/WeR9s8Y7VLVeBT6hRwaTFk2mFBxPEDTNsx3wZqZQ7YIeXxPbFjHe/E/Ca5cHyYLzLZrYVq4p1ShZpEsXQE=
X-Received: by 2002:a1f:4805:0:b0:43c:2acc:4814 with SMTP id
 v5-20020a1f4805000000b0043c2acc4814mr2145281vka.2.1685675877171; Thu, 01 Jun
 2023 20:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
 <20230526162308.22892-4-rkanwal@rivosinc.com>
In-Reply-To: <20230526162308.22892-4-rkanwal@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 13:17:31 +1000
Message-ID: <CAKmqyKNjk0ibnc07poAESG7vsA24VPWWySnmkHX7aixgnwz-WQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/riscv: Set VS* bits to one in mideleg when
 H-Ext is enabled
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Sat, May 27, 2023 at 2:24=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> With H-Ext supported, VS bits are all hardwired to one in MIDELEG
> denoting always delegated interrupts. This is being done in rmw_mideleg
> but given mideleg is used in other places when routing interrupts
> this change initializes it in riscv_cpu_realize to be on the safe side.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..269a094f42 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1280,6 +1280,11 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>                                            riscv_pmu_timer_cb, cpu);
>          }
>       }
> +
> +    /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. *=
/
> +    if (riscv_has_ext(env, RVH)) {
> +        env->mideleg =3D MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;
> +    }
>  #endif
>
>      riscv_cpu_finalize_features(cpu, &local_err);
> --
> 2.25.1
>
>

