Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1DFC5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:04:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6E3s-00040J-0q; Thu, 23 Nov 2023 13:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6E3q-0003tO-GE
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:04:22 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6E3o-0005n8-CO
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:04:22 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so776908a12.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1700762658; x=1701367458; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Z9aktfy67+8W2U8TxrlPz+JWANett2DZD7FESEVlmI=;
 b=jbHy96nblFWfslGGF6TWqgjETFI61vUpD8IHI7bEwG/rikK5LG6725z0RMxjKMS0q1
 FC8nI7WPxT/Zf/tPf1PnZ9UnhViQcv9AJNneF3e8REao9hYeHuBUm4aPWI2z3BGYNs5E
 ZAb64kTg6KHdwu/7EzAMlzwbOz5y6mJ4AXkpJj43khYeT+TH408Jvyy6vVAYtrmbu3SG
 XKg4/R7Xai6og69mRmuYb4Ts3N3ASZMmeYBbFdfNLl/aWnucYAkvhzwHmAuqsNNhLT6f
 BqaufRbbXU7KTdJXG9YVjd8JZ5Umgl0KwgI3PshLK+12e0qhjJS6nlnZ19LOKj7DIvTh
 nneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700762658; x=1701367458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Z9aktfy67+8W2U8TxrlPz+JWANett2DZD7FESEVlmI=;
 b=URJXHf3mgGzVYmC8+b6L/XYeyoCk1aVUk/4Vsjiia8u8+8uQz1VjTwhzw7qVUCTnk/
 KOPQbZb+Nl9nGtipNFjizNXPTwgXqeh+T1r49cKyygVkET9CfizATTZAw6hl8XY+2c4C
 jWcNsurjDZpckqUFp8fmS5ZLHn0Axrab+rv8tRg/EpF5GZoMP2yaigpwG0Z4Rt+wqScG
 dnbGLvy0F4cke9JMS6dnan8w3tzTc+Vo6hHbQIlCTrrB3b27jhJIRIko3ITE1OU8ChEZ
 AAUJZZ0+U/vIEfxwzQuoFVTiOFCUFKKJ1S13BAJBs6ChedSeHATAlTN1qZDJ2KDZrhea
 ZGTQ==
X-Gm-Message-State: AOJu0Yy0v5zMMjwPf5N3EUBbSMSZihlhSirElLLlOcZnwIJgICd59szD
 gFgm9JXKh5mJP3K4CkrGebTf5ZcjnM0cRsF3bFD2udcR7+XABJoHJq8=
X-Google-Smtp-Source: AGHT+IE3umzIO5xxiSounlftPDdZmUjP+L1Q2CHyb40jy8gx1d6BDyKpiSNXhBtTL5dGi7EUwIu/AnCfelFpVqpiB1g=
X-Received: by 2002:a17:90b:1d8e:b0:27d:4b6e:b405 with SMTP id
 pf14-20020a17090b1d8e00b0027d4b6eb405mr210420pjb.33.1700762658291; Thu, 23
 Nov 2023 10:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20231123180135.2116194-1-christoph.muellner@vrull.eu>
In-Reply-To: <20231123180135.2116194-1-christoph.muellner@vrull.eu>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 23 Nov 2023 19:04:05 +0100
Message-ID: <CAEg0e7jTsSuZMVp9bVtTiTbe+UJUpe9oo+b2mxZQOe8eGxES+Q@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add Zicboz extensions to hwprobe
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Nov 23, 2023 at 7:01=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> This patch introduces this for QEMU's user space emulator.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 65ac3ac796..22e947d752 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long a=
rg2, abi_long count)
>  #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
>  #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
>  #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
>
>  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
>  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *=
env,
>                       RISCV_HWPROBE_EXT_ZBB : 0;
>              value |=3D cfg->ext_zbs ?
>                       RISCV_HWPROBE_EXT_ZBS : 0;
> +            value |=3D cfg->ext_zicboz ?
> +                     RISCV_HWPROBE_EXT_ZBS : 0;

I accidently sent out the wrong patch file.
A v2 will be sent to set the right bit.
Sorry for sending this!

>              __put_user(value, &pair->value);
>              break;
>          case RISCV_HWPROBE_KEY_CPUPERF_0:
> --
> 2.41.0
>

