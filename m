Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F36ACA0FE2
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 02:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbtmM-0005b8-S4; Thu, 31 Aug 2023 22:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtmL-0005a9-32; Thu, 31 Aug 2023 22:20:57 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtmI-00017M-UW; Thu, 31 Aug 2023 22:20:56 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-44e8d9e6ca0so621219137.3; 
 Thu, 31 Aug 2023 19:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693534853; x=1694139653; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJPg4HuHDKQaPt5ElTirIj8PVpgwS63LdrTo6sKZfIg=;
 b=TcwbskJ0SuUsdyqBOP4rezGgSy8QH6XpWj4YXd54qD920XoERu9P1yfb9yat3CDZzL
 Q0wTpZJYwelOxGip7CBQvXykUckXQmL0uUeGLV6yZAFhkWgJs8Rq+L+LhDoknSVeHqjx
 edKdi4eMzTspjcRmvp2RejNuxE/IVY77oDM9Swcwr2MZPZKH+HTCUwFXzRJyTud1z3Y9
 PegwS0LbvunmOp8j0wqyTvSIJFHB2UjT3zozU8B9Xxnq38NwRRCResScCMtPxA0v9iCw
 /yKEhYgi4qRJ4M0R3uA7iwHqzs4F1W84kSBI5g8xQ/zte5im4GubkZvdKXhUuMvktDKr
 9zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693534853; x=1694139653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UJPg4HuHDKQaPt5ElTirIj8PVpgwS63LdrTo6sKZfIg=;
 b=U4JbzkrO5OwC+RitWL22wFUiKli0YKcFOS3UA2YYQaZhjBfwfjFFzRtHhl/LQ1byN5
 X6Q199S7icddqYOXNZaRl3YiPEA2r0yLePlyPjssnahYtWzqpk2IaBkjAXfyTCNyCl57
 xeyb0PwR6UadW8R/97U1AMmXfm19rGZ7i+kBhgwHilMQ+vmvC7kSah6Yw2qh3ipig8XR
 egOet8czBNZRcEs+Hx47xDcO9Kpge0pyO8NyqJ5KeLfqjuieFFAlyvc6tg70JDwvMAAA
 05gmEzQQjUzXRnTErJdOkbHsfLMRTY41MZuxF+j25iW8YJRnjZlaR0GdWRlOyUMAD0by
 yEeg==
X-Gm-Message-State: AOJu0YxjLmWRGS2vyGhf02QuuEtdQdt1tCNEan8cwDryOylMRcG2xH3W
 dDkjqOpNf/zuPNvJLOgATPyPuQUhGqwsyWLzuTc=
X-Google-Smtp-Source: AGHT+IGgpyxNegYz644fRNP7+R8+ra+MTpO8Zq27T4HzFNkSJG3Mh3NPkWloWiRO8muWDmrZdPJJ7t82QZ7u09gQU+E=
X-Received: by 2002:a67:fd0f:0:b0:44e:99c9:418 with SMTP id
 f15-20020a67fd0f000000b0044e99c90418mr1492453vsr.4.1693534853303; Thu, 31 Aug
 2023 19:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230808181715.436395-1-vineetg@rivosinc.com>
In-Reply-To: <20230808181715.436395-1-vineetg@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Sep 2023 12:20:26 +1000
Message-ID: <CAKmqyKPdLbfyZOEmev4Th6Aes_WuuKymxV6CsexPazYdZWfh1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: zicond: make non-experimental
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, kito.cheng@gmail.com, 
 Jeff Law <jeffreyalaw@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Wed, Aug 9, 2023 at 4:18=E2=80=AFAM Vineet Gupta <vineetg@rivosinc.com> =
wrote:
>
> zicond is now codegen supported in both llvm and gcc.
>
> This change allows seamless enabling/testing of zicond in downstream
> projects. e.g. currently riscv-gnu-toolchain parses elf attributes
> to create a cmdline for qemu but fails short of enabling it because of
> the "x-" prefix.
>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453c8..022bd9d01223 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1816,6 +1816,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
>      DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
>      DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> +    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, false),
>
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> @@ -1832,7 +1833,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
>      /* These are experimental so mark with 'x-' */
> -    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> --
> 2.34.1
>
>

