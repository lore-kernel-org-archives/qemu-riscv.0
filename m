Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A9EE49A6
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 19:01:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYA8g-0000IB-MT; Mon, 21 Aug 2023 15:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYA8e-0000C3-Bm; Mon, 21 Aug 2023 15:00:32 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYA8c-0006Kp-7o; Mon, 21 Aug 2023 15:00:32 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-48d0d54f9e4so543075e0c.1; 
 Mon, 21 Aug 2023 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692644429; x=1693249229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKFk0AMDZF54gIIhvHD8Bydw8PDGVi9ACfkEb8VAQ3A=;
 b=UmSZD4wEOxaMwUoYhFNUZQEnuW4IPl56GQSVbcQvoXyFMKUy2FT9WjSx40L+8akbu2
 29eN54XKxjpCy4BmHCSx5kESXWdufaDve8bUOuSDqIDYlpjgT/aV4XRcPmMOGpWDIiTU
 Su4QESrzkfBWUUL+RE/z2yFnP5TvHx2IFOrcDoIwG4CR4evBtp70aJT+E69dXQpTVJ+M
 7i7YPEJF83VbrAvlHrcVZCGnT1cw/5Q0PJ73dSIfsUpvRZcNFmeFNh4/EDi87T+8z2Zo
 GwkMSXYHxvERxEiH4JjXxvvihPHXrSLSk2vTY3PhQtEeaKWA8jQNRy9NsWDm+oVUnIC+
 +G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692644429; x=1693249229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jKFk0AMDZF54gIIhvHD8Bydw8PDGVi9ACfkEb8VAQ3A=;
 b=GHXHjd+ap7pt/E+jF+R9F0e7rIqOhyxCbbegZzP1j7Yr0G4XA3K0gyumt3ZlXijcXi
 My9QQfaQ2mET+JLnTEUwfnE0XsmN+d0ddV3qALmyaMAll3kONsh2BoQIYWY7p8EZGQ5Z
 nQ88IGtWMJNoZcZWKW6KCU/XHpf586CsziunAfcGu6d3HpkB0o2LUrOHzJ3mtWf4eTGq
 QZi1ltKJUmjSwbILftrQadWeUmu6l9U45ZiTXXFuTJkmPfzkKuChjYuQY/kwOAoxwy+v
 u5FnvKnR+Isnk1cfUuEPB+XkbIhIRzuwlTNCvnAdOuLNPBIrOUxFDiUCzFe9lEJX57OC
 dzyA==
X-Gm-Message-State: AOJu0YzWMsJsUY8f4kIxZCv8/uDYOvxNwPQXy41AAxZp+DCB5dFTEGJI
 X4zMOB2hRuNI9qGQkHg0I1BAdEJnQuNkcsRF1R8=
X-Google-Smtp-Source: AGHT+IE8G0n8cB9Nq8zbEWs4RM6SNVntsL7vQFwpDBYE2Kqoh7zQhrf2M579QuwYsbS/56A+ZujjhCK6NNpL/IMQT00=
X-Received: by 2002:a05:6122:2495:b0:48d:e15:c010 with SMTP id
 by21-20020a056122249500b0048d0e15c010mr3178647vkb.12.1692644428701; Mon, 21
 Aug 2023 12:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230818090224.409192-1-chigot@adacore.com>
 <20230818090224.409192-2-chigot@adacore.com>
In-Reply-To: <20230818090224.409192-2-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Aug 2023 15:00:02 -0400
Message-ID: <CAKmqyKM+ovWO1VO+e++0FxGckjHhB=C2hj+e0qb4gNpjTfvy2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc/sifive_test.c: replace exit(0) with proper
 shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

On Fri, Aug 18, 2023 at 5:03=E2=80=AFAM Cl=C3=A9ment Chigot <chigot@adacore=
.com> wrote:
>
> This replaces the exit(0) call by a shutdown request, ensuring a proper
> cleanup of Qemu. Otherwise, some connections like gdb could be broken
> without being correctly flushed.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/sifive_test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/sifive_test.c b/hw/misc/sifive_test.c
> index 56df45bfe5..ab0674f8fe 100644
> --- a/hw/misc/sifive_test.c
> +++ b/hw/misc/sifive_test.c
> @@ -25,6 +25,7 @@
>  #include "qemu/module.h"
>  #include "sysemu/runstate.h"
>  #include "hw/misc/sifive_test.h"
> +#include "sysemu/sysemu.h"
>
>  static uint64_t sifive_test_read(void *opaque, hwaddr addr, unsigned int=
 size)
>  {
> @@ -41,7 +42,8 @@ static void sifive_test_write(void *opaque, hwaddr addr=
,
>          case FINISHER_FAIL:
>              exit(code);
>          case FINISHER_PASS:
> -            exit(0);
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            return;
>          case FINISHER_RESET:
>              qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>              return;
> --
> 2.25.1
>
>

