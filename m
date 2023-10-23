Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A79CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 01:16:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qujYA-0001tb-S5; Sun, 22 Oct 2023 21:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujY7-0001sk-Ve; Sun, 22 Oct 2023 21:16:08 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujY6-000864-Fr; Sun, 22 Oct 2023 21:16:07 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7b747c9b067so60914241.3; 
 Sun, 22 Oct 2023 18:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698023765; x=1698628565; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6DXdC9f1WlC1e97I5EOZ3vLTTVEeHSVPAbV9h4zQGm0=;
 b=I1ILFB4iaPbvRlOBNJ/qAekWnQi9jXppUILgudEqLrh+f7PlPTItcNDs1gxQYPHsGb
 0Sz/7aYCPiOlCV7A4ERmvsXCXm7rwXWL8XFqF3Zm0T/kctMKqxt84YbRazI2NeEoZkSv
 Qu9phCkNT3SGkVL0K1Uvgc9yuuOBiYu7vmXS7gdAnbWYqUuM7wNQPRwWKg/lyijaacau
 vYCQSm0zzTc8/mGS5dEtGrpWXUwq8wfMLn9aT2FaL8ATSNUNGdYw5N/lFFLE1IEk8s/y
 oYHH5J9UzshLkecWseiDmGd3Iv8nf8Ml72hJK6/2BXQYw+nRZAeM+MazfttedtS1apoj
 BlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698023765; x=1698628565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6DXdC9f1WlC1e97I5EOZ3vLTTVEeHSVPAbV9h4zQGm0=;
 b=WBaCW875szsKJ/gJNYlwFvgbPNPPM1zJu6Kxd7yVvrqA5aHB3cc3UX7mM44HLDErHw
 y/PEPCyj5zRUly+gp5G0XUlfOeOhCGGSu7DF35pd0qXYWYEiJLxhek/bzLTCOp9ZdP1p
 lc+zi5BNGpRtNRvQT9AJFUBsRVJXnMa8d6N3l6svoi52aTGOdGeZLkKBrs90bJgGMsBX
 aBxqOur34f32/oJ3hSAVhrX15X59rT8C+HdA5zjgCfPBKEwUrMjuZcX0pcee4+S0VOQ2
 iMrxmMU0Uqjo+IXSAKN88StHEWHDiyWoyIcqp2QXXqxwsMLkI+Wy2rNK5ZC3kYpx0dh2
 wFUg==
X-Gm-Message-State: AOJu0YzLaUL+EOrqLeofQ79ErB6S7d1IC+2bA1fIZV++fy63yGDbZ/p+
 DyWdz3wM0fIr8CrrbDhsabAIhns0K9A5UkFZfug=
X-Google-Smtp-Source: AGHT+IGtgrWQE/+DS7yUfCC5JY+p7v2TPCCNvjFUcwwpqL5VfyhOVFEQWM49y5YGjXnaT/d6/ASkHVbRFmEvx7eJ0xE=
X-Received: by 2002:a67:c19a:0:b0:457:c511:8e71 with SMTP id
 h26-20020a67c19a000000b00457c5118e71mr4190902vsj.30.1698023765225; Sun, 22
 Oct 2023 18:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231020200247.334403-1-dbarboza@ventanamicro.com>
 <20231020200247.334403-2-dbarboza@ventanamicro.com>
In-Reply-To: <20231020200247.334403-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:15:38 +1000
Message-ID: <CAKmqyKMosgjPkCXnTsDsiTQB4EjMp0G59FyczvqsWaAre=gUNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs/system/riscv: update 'virt' machine core limit
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
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

On Sat, Oct 21, 2023 at 6:03=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The 'virt' RISC-V machine does not have a 8 core limit. The current
> limit is set in include/hw/riscv/virt.h, VIRT_CPUS_MAX, set to 512 at
> this moment.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1945
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/riscv/virt.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index f9a2eac544..f5fa7b8b29 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -12,7 +12,7 @@ Supported devices
>
>  The ``virt`` machine supports the following devices:
>
> -* Up to 8 generic RV32GC/RV64GC cores, with optional extensions
> +* Up to 512 generic RV32GC/RV64GC cores, with optional extensions
>  * Core Local Interruptor (CLINT)
>  * Platform-Level Interrupt Controller (PLIC)
>  * CFI parallel NOR flash memory
> --
> 2.41.0
>
>

