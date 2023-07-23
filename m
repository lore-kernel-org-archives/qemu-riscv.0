Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC637C001B0
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 22:37:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNhi2-00011G-Kz; Sun, 23 Jul 2023 18:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhi1-0000ye-Do; Sun, 23 Jul 2023 18:37:49 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhhz-0004tD-TI; Sun, 23 Jul 2023 18:37:49 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-635e6f8bf77so27031966d6.0; 
 Sun, 23 Jul 2023 15:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690151866; x=1690756666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USk48pwChPkS0weRkQRyDaK4GKfNpvS3fNDRoimti4s=;
 b=slbQvfOKFdZJR5BhLHPaqaebxMVOG9kt9uQcyRPA5f9zUkfh6XC7UOYeAxqsDnB//1
 xg2LrbIteVIZ6Gsee7eyej0ULja81/bjH9bACP1MG2sTHVg0Y3dqWLOgG2feR7Qjfg1j
 BQOP6DwVLmyZZbB4HvjmBhbKvHIEioAFkr6kbRuiTeljaljXAjGZCDSOKT5Bu9wam+PQ
 O4P17Y7wUEGeNj4lbVoo7AOJeKlpi2uF8N0IVrVtbu20ttgT410qOOfcpYRCysSdEw3t
 MRfF7+o8iGBtyFO7+/2n7xJTwXeKexFc2AjY44wAx1rdNaYCcoEaObIuiY40Kvtx+4Kz
 CFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690151866; x=1690756666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USk48pwChPkS0weRkQRyDaK4GKfNpvS3fNDRoimti4s=;
 b=P5MzNEvWIvn9lgr80Y/hogybKcjmP5vESzY0zLjNaoDvlhpC/fMFRmb4cCxrLtUJj0
 uffNdp6vCes9FsyRBFULyTe2P1wd5MbCVkJqDAFNo6BURDSXVhze8OTWsTX+8eXyXRQr
 nmCFo6DejD8r+gFpoy6HTXD0mv63SNz+Oxq+N6AetOU8ahFDKSr+TPgByqF6atLGbCHL
 HkJdJgmif2wGQM8W3cI4sEVpeVLKyjnn9pfxjURKgbbnVk89/951uMqaee6YBV+zsbMW
 7VHRip24QOKOZxsc/0ilu6S/b8ddPSi69qhxESJ6YtIjLvODRqat+j8OeQJK4TQWAnS0
 RO3A==
X-Gm-Message-State: ABy/qLZrFIeaZy3zcRiaw0406zFsbA4pA8YKfr9i1Qdlr+W+dokefAI4
 uGrfirBo065RTCt4h2OZq4adfUh1yCLgo4mSfQ8=
X-Google-Smtp-Source: APBJJlE4GTsHNCt10XcnoEgyPSegzxnC0vRWar4yM6DUIqYrSvmlx9fMnjuC48wGV640vS8iw3DQ3TPhqGNx+Nw1s68=
X-Received: by 2002:a05:620a:4016:b0:765:a57a:16fe with SMTP id
 h22-20020a05620a401600b00765a57a16femr9804523qko.76.1690151865856; Sun, 23
 Jul 2023 15:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230721094720.902454-1-thuth@redhat.com>
 <20230721094720.902454-3-thuth@redhat.com>
In-Reply-To: <20230721094720.902454-3-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 08:37:19 +1000
Message-ID: <CAKmqyKM3JMnPfp-RS5OuKk7Scj+zGaeUy+Eu7M+c+Ojrvp5tMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/char/riscv_htif: Fix the console syscall on big
 endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=alistair23@gmail.com; helo=mail-qv1-xf2b.google.com
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

On Fri, Jul 21, 2023 at 7:48=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> Values that have been read via cpu_physical_memory_read() from the
> guest's memory have to be swapped in case the host endianess differs
> from the guest.
>
> Fixes: a6e13e31d5 ("riscv_htif: Support console output via proxy syscall"=
)
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/riscv_htif.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index f96df40124..40de6b8b77 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -30,6 +30,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
> +#include "exec/tswap.h"
>  #include "sysemu/dma.h"
>
>  #define RISCV_DEBUG_HTIF 0
> @@ -209,11 +210,11 @@ static void htif_handle_tohost_write(HTIFState *s, =
uint64_t val_written)
>              } else {
>                  uint64_t syscall[8];
>                  cpu_physical_memory_read(payload, syscall, sizeof(syscal=
l));
> -                if (syscall[0] =3D=3D PK_SYS_WRITE &&
> -                    syscall[1] =3D=3D HTIF_DEV_CONSOLE &&
> -                    syscall[3] =3D=3D HTIF_CONSOLE_CMD_PUTC) {
> +                if (tswap64(syscall[0]) =3D=3D PK_SYS_WRITE &&
> +                    tswap64(syscall[1]) =3D=3D HTIF_DEV_CONSOLE &&
> +                    tswap64(syscall[3]) =3D=3D HTIF_CONSOLE_CMD_PUTC) {
>                      uint8_t ch;
> -                    cpu_physical_memory_read(syscall[2], &ch, 1);
> +                    cpu_physical_memory_read(tswap64(syscall[2]), &ch, 1=
);
>                      qemu_chr_fe_write(&s->chr, &ch, 1);
>                      resp =3D 0x100 | (uint8_t)payload;
>                  } else {
> --
> 2.39.3
>
>

