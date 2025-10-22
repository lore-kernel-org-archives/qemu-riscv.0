Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDF8CCD1BE
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:38:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBiPi-0002bF-Lf; Wed, 22 Oct 2025 19:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBiPg-0002ao-0G
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 19:38:40 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBiPd-0001nZ-1U
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 19:38:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-63e18829aa7so189833a12.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761176315; x=1761781115; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wcd3GKf4iO/YvwvpEcTaeZS7OOZnj+rYcVkGI6Xlh/Q=;
 b=IBzuBZ4+yGGzFu62WLPmylddvHJt4IrOrOJ26hIxIFWkZkJiWWHfLZRZBpXrGCapZv
 uvU9Gqv0JiGElKTSLcu+rAggXYjOfou2Dq3qnM1HZzfWi3T5pPfoCj8bJvuYtDR5/O9U
 8NPOIp4ajS17UPRNo9g+IIwsUByWIQQf/5uHd05fUXAfkof5V7+V/uIqGcUoafqppTxF
 mByMvg/2YU27yDZkjOySA/rgf4EtzRjUU5pdLqCG8Ot42RJItZLOAPa9KLfUwPFhxJ+5
 7YF2q199bj1aUVcwtn23hEIBKsF18hQCufw9PkBrDO5Re/mCVqnFF6GBkIM0nvMO24JC
 WPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761176315; x=1761781115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wcd3GKf4iO/YvwvpEcTaeZS7OOZnj+rYcVkGI6Xlh/Q=;
 b=gf7A+U0b49MINyk4PbbJF/Bv861/DjMjAdWKRii3oGJ5AAddanwM7BHSIwxnOEkKkB
 oxmaNyQndX9k16qCSK8SrQbKm/FBRozDBhv8qAZ9Ue+7BFFdrK6NIYquBkcBgXHm5T/u
 V4Y6MhDDSioId5eL4ShQqqwYcJjuWCWabM3aPZPMtyZRn5OGgJy4u0aorDLFknk3YImB
 vo2IPvRu2tvUJ0DV7DkOz8kJOtFvjk3KRgj72XF9zm8xT+ym//9GjqkpxE3kqpPy07VX
 YOjiO35obyfDL9z8x1PmVfOACpB8Ld459pxkcveJQYRIoShIUbf/DCtPa1i8jiGL8VUX
 QLmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXul48yOPIHg5WaXWbRdt6uwx/RhICdN2uIKWOJ8md8oyoseWnwa0GFjyHAdw1pfc4MEdfMJG2+IyQD@nongnu.org
X-Gm-Message-State: AOJu0YzueNE4LEiuW9SBQhaz5meZQZymkiF6bTFF+78Z5ZhO5mUpiusC
 vkkQs+2ii+bn+qK2Q3AkAX/HBqfg+LwCeAHTQGwwqv9yQl6kwm8kM1CyVgjGdFV5UKlSiuiKut1
 w/fycVHRtrQhDI7UWsXKlTYOxby5PNwM=
X-Gm-Gg: ASbGnctJ90ndVlkG8foYqgaHE0Y+rxrEDjTCJ5KUOakVTk5Sr114N7naFFFzC1xsf7U
 aMSsE+x9IqTqkZQViyhsfLZ5CskEOSye2asTO0cxvQWGYxGEL2z7BOG801xlA680kc893CuVNpn
 1oCKNDUGb9MS9ltwqGBHX2lbaSSwtd6BES1tGU0v3L5Wi25LhhR7vGGm+DK/eJrFBDm73mZp/pB
 zZ/nqHYrwI6Q0VMdF6rQdyf6L+lULIfYp0CwcMmRFalMlLweDsHn+YXyRijSTtcIwnyJAm8S6jV
 svuyy89JDM5o0Ktto4WVlmcb0g==
X-Google-Smtp-Source: AGHT+IHPoQbc1gW9VLLebbxrz4HlyBqcHbdgkYwcmYCJsfxilU9p5kNTheUvO2dSUUISWaNKyB+L1mRyerydV29wd70=
X-Received: by 2002:a05:6402:13ca:b0:637:f07d:e80f with SMTP id
 4fb4d7f45d1cf-63c1f58c0d3mr22311254a12.0.1761176314655; Wed, 22 Oct 2025
 16:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251022124340.493358-1-dbarboza@ventanamicro.com>
In-Reply-To: <20251022124340.493358-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 09:38:08 +1000
X-Gm-Features: AS18NWD2rxiXMvn89dmoiGVB_TcRbiBjhcCiPJqYF0XNmoupxZRsi_96k4qLrdw
Message-ID: <CAKmqyKN+8mh8cv4GVMzmS+kcu+C4z7FAHsx-6aQS3U9=sWAAjw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix riscv_cpu_sirq_pending() mask
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
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

On Wed, Oct 22, 2025 at 10:45=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're filtering out (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP) from S-mode
> pending interrupts without apparent reason. There's no special treatment
> for these ints as far as the spec goes, and this filtering is causing
> read_stopi() to miss those VS interrupts [1].
>
> We shouldn't return delegated VS interrupts in S-mode though, so change
> the current mask with "~env->hideleg". Note that this is the same
> handling we're doing in riscv_cpu_mirq_pending() and env->mideleg.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/2820
>
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/2820
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3479a62cc7..360db133e2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -443,8 +443,7 @@ int riscv_cpu_mirq_pending(CPURISCVState *env)
>
>  int riscv_cpu_sirq_pending(CPURISCVState *env)
>  {
> -    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> -                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & ~env->=
hideleg;
>      uint64_t irqs_f =3D env->mvip & env->mvien & ~env->mideleg & env->si=
e;
>
>      return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> --
> 2.51.0
>
>

