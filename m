Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06AACD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 02:07:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3fr-0005CS-JO; Sun, 17 Sep 2023 22:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3fq-0005Bp-DQ; Sun, 17 Sep 2023 22:07:42 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3fo-0005gJ-VX; Sun, 17 Sep 2023 22:07:42 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-493a661d7b6so3312743e0c.1; 
 Sun, 17 Sep 2023 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695002859; x=1695607659; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DyZR0XKHPW3PYKmmxnMrszUUSY7lZUqYxsVy7FTFulc=;
 b=Xva/FnGz4s7aJs80E8jsj1FM+S6ohEUV1rbpybQFtYI7JCI9e17OJW3Gc2YOGB4r3n
 ZXyseg/jc7YG/uL9KFfgcVaIecOKchRaYAxNrC7FyEeJj9wM0Ug9GHAio6Q8ESL10SGO
 15UPIu5xpUBBKNoLbFJZ5he5WAeliPFB+8VAUDhb4IPBSXT9S0MuVB/sNv7wlfEqWGls
 cFhVbDORIGdC6K+SQY/A1Iuwo7SN2/seAG+siH/CXFMo7+/dLzmQ9bcPfXX4invaJy12
 s9ZsHuuxmGDvJeO+pbUhdPdx88SgUDRoOhwWVvA5g+Dlz4pOs2M0fLsqnmbKO6OysFde
 AwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695002859; x=1695607659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DyZR0XKHPW3PYKmmxnMrszUUSY7lZUqYxsVy7FTFulc=;
 b=sU7bzknDhc7yqbnnWA98Kw7gXs6x9IhyfoYZfjdcrh7uuYTx3CoiZ1j3tDx0G3qHUP
 ZQf+MQts5pvrFfSMup+0HLAP+whxLZ+2vFhFShMgX6SuNEwhM9k1cDtoc2LIMrzFKzqz
 xdQU0V5PNxHBbT9A0ZqZtBSDi6KMRPEhwZB3VftIXksoyYmlSflDPNq+7puM3wJJ27Nu
 ftZSgXIa68aZKE9YSH4Fwr+Zb4a4G5gmweqR1K5rcRRjzROhVoG4YCTdnor8FowwHrMi
 s4c+jWmCSWWzSkAUtx1XsYbV3svEl+oixojltV065bkYKuS/L8ZhFVcBX/MwPGGiaqyo
 f+yA==
X-Gm-Message-State: AOJu0YySgH+Yn7Ntcis4t1RCdWYbduInbyzM+Uqch92KzeX42KI6TS88
 pU5pNz8VdQG89K7cM7yZuxga1AE07RBuYejOp38QT+kt+lw=
X-Google-Smtp-Source: AGHT+IHIKiJCvUsBpKsAQBFqNfiv9MTBJWi+pFlogjHkJNZICz3OIl0SoCZeo0u/cJ4POQimizJ95q+JQLaAdwjZ0is=
X-Received: by 2002:a05:6122:420f:b0:495:e18f:67cb with SMTP id
 cm15-20020a056122420f00b00495e18f67cbmr5821102vkb.7.1695002859559; Sun, 17
 Sep 2023 19:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-5-chigot@adacore.com>
In-Reply-To: <20230907112640.292104-5-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 12:07:13 +1000
Message-ID: <CAKmqyKNkWCue1TLgRWVkp+gDDJ80tySfdaj6YBMjhpTQafFQxQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/char: riscv_htif: replace exit calls with
 proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

