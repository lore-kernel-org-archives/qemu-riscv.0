Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DE3CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFFZ-000359-BB; Mon, 16 Oct 2023 00:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFFM-0002tE-7y; Mon, 16 Oct 2023 00:30:30 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFFK-0003o1-PW; Mon, 16 Oct 2023 00:30:27 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-457bda4cf32so1260931137.3; 
 Sun, 15 Oct 2023 21:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430625; x=1698035425; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxWDtaoY4Siyh7gy1qHP+6r5pQw9GbC9+s33Ip146uU=;
 b=JyV9rH3pAC7hE0xyRBRIuM0gSmriW6Z5CuRV7HpAFCnYdaeGM4MG6hq5TveOrSVq29
 Uy2Mu1KWS9yN1NnFhOwCKLGyuWLopG5akqbeUjjCN4SucP94X0X6pqo46CkI2NPzUy8i
 IrjphtDo96QKxvv4t7x+11m9v154k8H+PopFwyiGGb9lYE5a0D8ecI7o33Eg/7+zf+iN
 c0+WcO8a+iI4vs8E5oDXu4oF8J2cS3SGQAJqI/juq+5hhU9P5sNy+9wWC8jRlFd8DeYo
 kxbkHMvDF2RntT/kX9lFBx7UWVCH2sgB5L24AvD1Eb3KX0GJQzw2jHWit4+yltk/27/L
 suOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430625; x=1698035425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxWDtaoY4Siyh7gy1qHP+6r5pQw9GbC9+s33Ip146uU=;
 b=Ne4vp0Q/nEUTVqrQdR4MDvKfqzu1a+q1NWxEyhpaieQiKw89uG5VShLKCvcjO7hkHo
 FtKH4m7DZpHRZsfZXeAlz7ocbbkFBBR+CsoVTY/of+ATPz/fzomz5lyIf1oq6RkdNqiz
 bDr9diiJAvqiIvDBeTwP1IXaoHaO0Dy1ORBGUerQqPTtwthFAV4MgFdXKwr1Qcmh0WkK
 sFAMA+4msqnu7IFGfMSShCJZTvpe0LRsS8nGi2S+95QFJlyrrg/uvXEEwOIXUBqY2gjs
 xJ13ea/9gXc13kXPR+SBlRvWYQT9F/J0iWChaOAGv+G7znfEdRMqKOr3GLxlbEtVryFV
 ySGA==
X-Gm-Message-State: AOJu0YzxdWsvx2FXKbAG451F8AfQOaQiYrqP69AP81QuviyQt/joYLhj
 qIoOQlG6pV+Aw/HWXTDgWTKHlOu3lsEbT+X9FOI=
X-Google-Smtp-Source: AGHT+IE4tXgTXAUHEGoS2+fGkD2YFF9Z7v8YdbPx7UIPPe/B0QdmDQ862HQWUhYKk787wDrzSLtqgFtJQ4nQ5lQBLwQ=
X-Received: by 2002:a67:e718:0:b0:457:b01c:4ab5 with SMTP id
 hw24-20020a67e718000000b00457b01c4ab5mr11409844vsb.27.1697430624890; Sun, 15
 Oct 2023 21:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231013110111.34619-1-rbradford@rivosinc.com>
 <20231013110111.34619-7-rbradford@rivosinc.com>
In-Reply-To: <20231013110111.34619-7-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:29:58 +1000
Message-ID: <CAKmqyKPEnkB_ZsRY8X2KiGR06PhqvJO-fdsgS3OAqVh=yCGf7Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] target/riscv: Use MAKE_64BIT_MASK instead of
 custom macro
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Fri, Oct 13, 2023 at 9:04=E2=80=AFPM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> A 32-bit mask can be trivially created using the 64-bit macro so make
> use of that instead.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 9253e5f17a..052d5b1164 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -25,8 +25,6 @@
>  #include "sysemu/device_tree.h"
>
>  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> -#define MAKE_32BIT_MASK(shift, length) \
> -        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
>
>  /*
>   * To keep it simple, any event can be mapped to any programmable counte=
rs in
> @@ -455,7 +453,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>      /* Check if user set it by comparing against default */
>      if (pmu_num !=3D 16) {
>          warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\=
"");
> -        cpu->cfg.pmu_mask =3D MAKE_32BIT_MASK(3, pmu_num);
> +        cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, pmu_num);
>      }
>
>      cpu->pmu_avail_ctrs =3D cpu->cfg.pmu_mask;
> --
> 2.41.0
>
>

