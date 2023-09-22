Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4824E7D0C9
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:21:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjYau-0001up-FC; Fri, 22 Sep 2023 01:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjYar-0001u3-22; Fri, 22 Sep 2023 01:20:45 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjYap-0002fK-99; Fri, 22 Sep 2023 01:20:44 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7a8b839fc0aso598998241.3; 
 Thu, 21 Sep 2023 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695360042; x=1695964842; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOYu7IxJQJgwiUkdz8BBq8fNYpzJ3Ic9U/Cwu8R82Xo=;
 b=WWCpiPPK5ouJ1rorZKOsKEPnFj3/FKnisAamsBGJRBFUuNXANLzBWmccrFU2odwUod
 i7qmmO2jcJlxGEZAxGH5hbLF35fxAW5m9fLtgcaHrCc/eSgqUybiH23PbhbxGSAEpAQr
 3Okn6Cbl3AYhbQRyojT/d/3RqLGNOhbm6+7MTCIyOpJ/kR/ffIX4mgMoUueflAC7uS/s
 J2fYA3hY989f+cgdUbXyaMxqEYFuGl6w3rHOexktaz7KnMsh3V+j2UqIIIhVSmSr+dID
 73INuCNJn6IX0Y5CFMDNUHwOGguji0VCcjWCUni9g6l/Zph4ext6ZFkA3xRxPo1Ehz4Z
 l5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695360042; x=1695964842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOYu7IxJQJgwiUkdz8BBq8fNYpzJ3Ic9U/Cwu8R82Xo=;
 b=gRcFaZu/3lBjJrBYxxF52M6cmPeSPlgDEFYaX3MRDM7r5ymHK0+jTB2TwEvmMFTO+b
 efcFYxBabofpukyqEUfvVnxscadI9i7Fugtp5PW5abElVRlcPMAB9I0zF+WfkJZp+fUL
 9BjrQEcM6cIa6vQOTxUpVp37AjSznXUMseLWxk7Sc1d71maIfiRaclR+0ciRtNnLnid8
 Gh8Min4XPiq9mN0pAzHa7XnR3s5rYqVjLjb89LPCdgjYwSvf3NLCh/DXP6s+p4gXZ7RY
 qlFb1TTSY4sNOlPaG6zHLt87B4cXy00hEUwszL7EBOj4nbLfONkKaw68EvW0fIR27bID
 +lCA==
X-Gm-Message-State: AOJu0Yz2drvckmX728UlnthVtzYTo1oWZetPPSv7qSLqefImSPxBbU+a
 f00IVP93U9j1f20oOdsoztMei1/w49DQ7mqfO2mtbbEZ9jcmvQ==
X-Google-Smtp-Source: AGHT+IE2NMfYPPk71evfqFvMyiitItxCjOecvVAXWDq9byQdyvDfoFrotJ8u6TJDe/P63mXOKQ4D6T5+B5xi+eyvPTY=
X-Received: by 2002:ac5:cd50:0:b0:499:7022:1237 with SMTP id
 n16-20020ac5cd50000000b0049970221237mr3927388vkm.8.1695360041652; Thu, 21 Sep
 2023 22:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-5-chigot@adacore.com>
In-Reply-To: <20230907112640.292104-5-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 15:20:14 +1000
Message-ID: <CAKmqyKMnEofVntirOX+a+r26CNjfMqSzTUDbkfRhwkreu7JyMQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/char: riscv_htif: replace exit calls with
 proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

Do you mind rebasing this on:
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> ---
>  hw/char/riscv_htif.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 37d3ccc76b..7e9b6fcc98 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -31,6 +31,7 @@
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/dma.h"
> +#include "sysemu/runstate.h"
>
>  #define RISCV_DEBUG_HTIF 0
>  #define HTIF_DEBUG(fmt, ...)                                            =
       \
> @@ -205,7 +206,9 @@ static void htif_handle_tohost_write(HTIFState *s, ui=
nt64_t val_written)
>                      g_free(sig_data);
>                  }
>
> -                exit(exit_code);
> +                qemu_system_shutdown_request_with_code(
> +                    SHUTDOWN_CAUSE_GUEST_SHUTDOWN, exit_code);
> +                return;
>              } else {
>                  uint64_t syscall[8];
>                  cpu_physical_memory_read(payload, syscall, sizeof(syscal=
l));
> --
> 2.25.1
>

