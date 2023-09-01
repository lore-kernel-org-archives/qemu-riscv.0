Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F549CA0FE2
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 02:28:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbtt3-0007n1-O6; Thu, 31 Aug 2023 22:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtt1-0007Uy-OQ; Thu, 31 Aug 2023 22:27:51 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtsz-0002Kd-Gb; Thu, 31 Aug 2023 22:27:51 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-79d8edd6d99so672969241.3; 
 Thu, 31 Aug 2023 19:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693535268; x=1694140068; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOo2zkmmt6KrgQcW9V7n2tzEjgpG4NduNd8ONC7HLbc=;
 b=iH0WKTLuErnZY1/CnQkRtK7ePPYJ6QVk6NQMUgG1P8HizANk99AyB9ne+Nll8ZuUHV
 /vEbtXDhEegRFX50gmwCzRFFvkHa8UE6b0bDaOlUzEPqmzzJATpnecAtHP/gJ5NUjD/4
 ZorDg39WLAThM4QVNLTh9RUbuTq0xCkfO9ocHyCwCZhSWtmGYJKvUMxz3EtLV8TnQl8k
 qoM5Gqqn13NZgUSkXKhp8StUgg6r+QEViuYIvFg2L1/0yUagC+XIou3YCczuvQwrmu9F
 3QJI+szgQROst8quQv5XrFkco2XHs4pWFCpbEKUZVgHQKZLevXUJtqZs3V96gx1+M6z3
 A4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693535268; x=1694140068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOo2zkmmt6KrgQcW9V7n2tzEjgpG4NduNd8ONC7HLbc=;
 b=mDbdlKPMx6jWkj05hPKRaA1bzEqNWcuXsp3Ika5Mei68e3DyroF2TGKrK9IXlF6Gsh
 3s8jAwfpK7ihOCFHYQctCx5KZ0TUTQqr2MksCCoOVp6q9QD/UxwPnabC5kLC+zYCWbN4
 di/dgns1VbjA0VcSyAooKMLPgdxM2qn/Yvq/hj3xf2cqm+Z9mwVnVT2NmfKOCjoQI8Q6
 7f16zyFoFwqWFXTDlY7tjRBdZVTUwzjB/g2gdglsPu2c4wD9j2BrlEtkpOz6vZ8r+aoT
 8y6rgoIIJE5LouRQpbLFVvXe6RX6YzKV6YD6E0EYOp/Ery9puu4VcLTp2vf+Yhmtm0+D
 XjGw==
X-Gm-Message-State: AOJu0YzdPwdVp/HlR3kLtviVzyEINb4qojKOu12d1kIqfIGwzE8AHErh
 cxXgjq18vhXDHKSVoIofdqlSuefw1feASm/+AQOJfnUooXlL+Q==
X-Google-Smtp-Source: AGHT+IEfYFSM2zX+hZl18SR8RiSmAlXKk1TBT+uNsyOCb6SS8r5Leqfv3EpoDM1FOODy1ML/zhbX0cQLaFzDcJjd9Jw=
X-Received: by 2002:a05:6102:4b5:b0:44e:a216:59a2 with SMTP id
 r21-20020a05610204b500b0044ea21659a2mr1462760vsa.7.1693535268134; Thu, 31 Aug
 2023 19:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <bc82203b72d7efb30f1b4a8f9eb3d94699799dc8.camel@rivosinc.com>
In-Reply-To: <bc82203b72d7efb30f1b4a8f9eb3d94699799dc8.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Sep 2023 12:27:21 +1000
Message-ID: <CAKmqyKPmhAUHe5nN=V05TwvWZkuQhRFrigB-FRkBgRb=zJPQWQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add new extensions to hwprobe
To: Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Tue, Aug 29, 2023 at 12:58=E2=80=AFAM Robbin Ehn <rehn@rivosinc.com> wro=
te:
>
> This patch adds the new extensions in
> linux 6.5 to the hwprobe syscall.
>
> And fixes RVC check to OR with correct value.
> The previous variable contains 0 therefore it
> did work.
>
> Signed-off-by: Robbin Ehn <rehn@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/syscall.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9353268cc1..c46a0b1493 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9049,6 +9049,10 @@ static int do_getdents64(abi_long dirfd, abi_long =
arg2, abi_long count)
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0     4
>  #define     RISCV_HWPROBE_IMA_FD       (1 << 0)
>  #define     RISCV_HWPROBE_IMA_C        (1 << 1)
> +#define     RISCV_HWPROBE_IMA_V        (1 << 2)
> +#define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
> +#define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
> +#define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
>
>  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
>  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> @@ -9096,7 +9100,15 @@ static void risc_hwprobe_fill_pairs(CPURISCVState =
*env,
>                      riscv_has_ext(env, RVD) ?
>                      RISCV_HWPROBE_IMA_FD : 0;
>              value |=3D riscv_has_ext(env, RVC) ?
> -                     RISCV_HWPROBE_IMA_C : pair->value;
> +                     RISCV_HWPROBE_IMA_C : 0;
> +            value |=3D riscv_has_ext(env, RVV) ?
> +                     RISCV_HWPROBE_IMA_V : 0;
> +            value |=3D cfg->ext_zba ?
> +                     RISCV_HWPROBE_EXT_ZBA : 0;
> +            value |=3D cfg->ext_zbb ?
> +                     RISCV_HWPROBE_EXT_ZBB : 0;
> +            value |=3D cfg->ext_zbs ?
> +                     RISCV_HWPROBE_EXT_ZBS : 0;
>              __put_user(value, &pair->value);
>              break;
>          case RISCV_HWPROBE_KEY_CPUPERF_0:
> --
> 2.39.2
>
>

