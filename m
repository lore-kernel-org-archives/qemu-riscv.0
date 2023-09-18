Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C937CD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 02:07:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3fS-0004pn-HE; Sun, 17 Sep 2023 22:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3fP-0004pD-2q; Sun, 17 Sep 2023 22:07:15 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3fN-0005eV-Nv; Sun, 17 Sep 2023 22:07:14 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7a52a27fe03so1416270241.0; 
 Sun, 17 Sep 2023 19:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695002832; x=1695607632; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z9yo4bA/EbFylbVy0xG2YTrZb4NhJZA9uPC8e22vutI=;
 b=A3kfA51mYvnw6V7rf8XBd7CypiKWcymM3YiK21pqoW+hLjQ/+NsG4Dugc6GHARtr9h
 evycxhhmJEzwTx8O0j0qFKwjkm57sIOOVQOpRJm0NsH8uQ3yR7vyxqeDyJ1Bk8SXHRgW
 8HJruWVG3EpCFOIcK1cWJ0P+qMjm4Ow9GKEsRea7izOkekI0NdpwXPW0uE0ZmD2lYhKz
 T8Xzj68uQC5Tcu/sf/XF0H24kTvbIo5j7qzzfJWF4Ga7MfNaE2RHIZU0+/BAOAA33r0q
 PTEg481/stbGcgvzC2CcAWqjqfRY4H+l/CVLcr9rMbWHTEansm/BrZKW+h2gf6OQBHmB
 frCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695002832; x=1695607632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z9yo4bA/EbFylbVy0xG2YTrZb4NhJZA9uPC8e22vutI=;
 b=SlZG64ElsXuUQOVAKSn4N+mxlaDIidl889+DqehC2on+OnotlvZohi/IubyZj+sF/h
 bYcVB0U9umA1l2noD4dn6+TkFc/lMKlEiIrsAJD0QFahTgpaFEsr230OjxQrEGA9JbI+
 XVRPwlIbVKeVjGbz6DLOXDJ1tAsxEOOCIBECtOf3EDhsxxwC3QuICvRubb2omhiVbf4B
 LRhZuJTHOsyfJeRispKM2pt+rFl8N/lzxgwV4KKpZn/e5pROkHOC/qYNi+1c3AACbn1N
 tL0m5EJDPPXe++nYt2jnAQH40RO0kelOsOQzrDod1CM0Bqz/owMo1uVUNHfwGhxe4LGv
 dEYw==
X-Gm-Message-State: AOJu0YzhTiSguIfvpDMIi7byHXI5kF0f0xkKRNgpFEmnQHN3u94nu+cl
 NJS+crRK4hiKGVUK75qC3gN0fjhNi70nBg6qOnQ=
X-Google-Smtp-Source: AGHT+IF3Et2sCw/fr7uiFH2dXglGO69CFJ4SjP8minskuqACI5aJ6/XESY4srh4rS2ZvifRiJu0YkRb+t5Bu0hRKyrA=
X-Received: by 2002:a05:6102:2418:b0:452:5b16:c290 with SMTP id
 j24-20020a056102241800b004525b16c290mr1878706vsi.7.1695002832370; Sun, 17 Sep
 2023 19:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-4-chigot@adacore.com>
In-Reply-To: <20230907112640.292104-4-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 12:06:45 +1000
Message-ID: <CAKmqyKMi5=xGjEH7Jhe_X-+5ScE4QN5XNOdAz_nS0rPZ4dnLLA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/misc/sifive_test.c: replace exit calls with
 proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Thu, Sep 7, 2023 at 9:26=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adacore.=
com> wrote:
>
> This replaces the exit calls by shutdown requests, ensuring a proper
> cleanup of Qemu. Otherwise, some connections like gdb could be broken
> before its final packet ("Wxx") is being sent. This part, being done
> inside qemu_cleanup function, can be reached only when the main loop
> exits after a shutdown request.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/sifive_test.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/sifive_test.c b/hw/misc/sifive_test.c
> index 56df45bfe5..ad688079c4 100644
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
> @@ -39,9 +40,13 @@ static void sifive_test_write(void *opaque, hwaddr add=
r,
>          int code =3D (val64 >> 16) & 0xffff;
>          switch (status) {
>          case FINISHER_FAIL:
> -            exit(code);
> +            qemu_system_shutdown_request_with_code(
> +                SHUTDOWN_CAUSE_GUEST_PANIC, code);
> +            return;
>          case FINISHER_PASS:
> -            exit(0);
> +            qemu_system_shutdown_request_with_code(
> +                SHUTDOWN_CAUSE_GUEST_SHUTDOWN, code);
> +            return;
>          case FINISHER_RESET:
>              qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>              return;
> --
> 2.25.1
>

