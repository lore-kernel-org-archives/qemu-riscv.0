Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376D7CD98E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:25:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNy0-00072x-U8; Tue, 10 Oct 2023 21:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNxy-00072T-VK; Tue, 10 Oct 2023 21:24:50 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNxx-0003F4-IX; Tue, 10 Oct 2023 21:24:50 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7a7e11a53c3so277829241.1; 
 Tue, 10 Oct 2023 18:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696987488; x=1697592288; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STXekbP/WNQo9EsQv0f5gmYiUzm2Ha5IfEyN1zr+kUg=;
 b=Ge/bc9dnFYrPDOQl7zvB+Q8FE+zo2R6PgZ7FPJ4hTqo9SRahXc1A1huGJ0wdSublyT
 0geZgZOH6DxNXj221jXxUitzApRVFqbVwZuX4n3Jn7Y/fm+h0IzghRetC0iWWoqYGlJk
 4eF0w6u8rLSOEGTzCg8Nr9p93pZkcZIKdcQIeGn7IEcq9PMSCt4fO9PxAesTguKfmJ5c
 +7sWM5t99XAuYeBgxN1tYk2D3t2ibULqQbeLJoGJvekOFj6Kn80fB1czaGJiWWkkiH0F
 /r2CTlH9k+GGk5fzcE5X2vmMylT3cpvcGTWmYf+1tqgAY5ws1ov2UJRoEJmf68KHoZ1u
 JYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696987488; x=1697592288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STXekbP/WNQo9EsQv0f5gmYiUzm2Ha5IfEyN1zr+kUg=;
 b=UVWi2eEPDS6fQx0/DOLmn0JyKAA8Y56zomr/HCaFTibGeCfQTymCFCJN4ZPCM0av5e
 FRbVSXqbUkQGimyh5fydz5ZjmdfjbFxYVD1Rnqxasf4930/PV7NVtscIzZlxR+h8ikp6
 f8Wev1RRqdpr8A7iV8SCQRrRYjQ/lH9jkle0JZNr+T6sLPx1KYCnkxxinalNRWDbrF4V
 qLQlqqgxL5jIoS8VaEsTOGzLof0nI3U7AKkg9sUhaHunjN1S04S8UhfYfXRjAWNvxuWR
 O94Dur37Zl5LKInbXSu2Etg+aZG2DSB3XTbTCd1p/WyNtDTQLDVOgr+/ZI36mG/5N0zI
 V7UA==
X-Gm-Message-State: AOJu0YyFiPRKksav3Pm2jvq1wpWGFcxXpnB1dv9vwGXISzv7sk3rcT9n
 6q/07LUwZDXBii92AY/ekIgIckVcxBr16hXs5u4=
X-Google-Smtp-Source: AGHT+IE0s0aylx/INe4sVEL/q6Dd7mPogpOKGdVtJJZswrrpRm5CuweNeJBFk5jc3g5h4H8SwBZg2RSDxAkwzXJ58fw=
X-Received: by 2002:a05:6102:6694:b0:44d:426f:ab3b with SMTP id
 gw20-20020a056102669400b0044d426fab3bmr6995254vsb.15.1696987488248; Tue, 10
 Oct 2023 18:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231005095734.567575-1-max.chou@sifive.com>
In-Reply-To: <20231005095734.567575-1-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:24:21 +1000
Message-ID: <CAKmqyKNKHAMPTaAXW6=p8Vg8SnS9yErqnKon78g6bkhBq00ejQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix vfwmaccbf16.vf
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Thu, Oct 5, 2023 at 8:29=E2=80=AFPM Max Chou <max.chou@sifive.com> wrote=
:
>
> The operator (fwmacc16) of vfwmaccbf16.vf helper function should be
> replaced by fwmaccbf16.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/vector_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 3fb05cc3d6e..c45d94c165c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3361,7 +3361,7 @@ static uint32_t fwmaccbf16(uint16_t a, uint16_t b, =
uint32_t d, float_status *s)
>
>  RVVCALL(OPFVV3, vfwmaccbf16_vv, WOP_UUU_H, H4, H2, H2, fwmaccbf16)
>  GEN_VEXT_VV_ENV(vfwmaccbf16_vv, 4)
> -RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmacc16)
> +RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmaccbf16)
>  GEN_VEXT_VF(vfwmaccbf16_vf, 4)
>
>  static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
> --
> 2.34.1
>
>

