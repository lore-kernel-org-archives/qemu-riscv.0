Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AEBEE4993
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 19:01:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYA9M-0000ke-DA; Mon, 21 Aug 2023 15:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYA9J-0000id-Q1; Mon, 21 Aug 2023 15:01:13 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYA9H-0006RL-Iw; Mon, 21 Aug 2023 15:01:13 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so1179180241.1; 
 Mon, 21 Aug 2023 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692644470; x=1693249270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfuV5vCcaHbMFfPNwkE4OdkbJ81M4OGRWiG9Glc+Q1w=;
 b=ZYSOFdqHBkB2QF5cpdl2+swgJ2eSf0xmFbWfIJLGyvUoVviURgS9MQn01MyJOm+w0W
 hoWDK4PmlCmCMYhjPb44NDUpmwuLyGcAmK7pcMeLltBMxSnnYbtDZVMoXt7eNKCvqW5o
 OF3NknlGIQj7p/8XeMdvx4ocflBBJhOHBav72A/JYuc7BrxqN7bVBfTGfghlYsJ7tkoG
 zdKPngU+k/VWXVKhQpuTDIYH5xmZNjYOTXqD/Kx3kKl9qeKaruRP7xgzx1ckJhIlWB69
 NpZQO4MYtEoIA1UACDfRcE3fLwbyPUpHf9/VuvWsumZn/LTelePvfz2L4mJYgpHuXJ0D
 8fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692644470; x=1693249270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfuV5vCcaHbMFfPNwkE4OdkbJ81M4OGRWiG9Glc+Q1w=;
 b=Ol0Sv6ai5tHU3BpxyNVscPu0qj79q9dh3jJlSDylVkBIA+cJtBthV5fgYwc2BSD9nC
 4lXEKedwh9LOWTRbbpWID5TwNIpAd8gGOlAEwo3ksr6Ha03wTEzTA8HCDJWq4i9/48kc
 phyWOKqYB4isaf4GdMEiJTNGM2M9UB5EdvFTvzZC5QqGZXNgjrF69NM31RCLaZoxuo2u
 6t5gallBzOPSVLl5fcaOlXA7daEgUeUCOM+VWUNU+L+LSOEiGvc7GMEd+udqkx4EW1bp
 mcEuhtIUuz5hCWyw7fZBgDDl7E0x4PzhDnlJagN1DOSv0hzDOhVg+v3oj2qv4KlgHmHM
 SZhw==
X-Gm-Message-State: AOJu0YztUVslBCCbX8A+T6QCLQxg2gnzSMg8DI6+QrSsg5CLa/+XlbZg
 5SIDYmRGUZxYSZ+QvZ7ElUBvYLCYaNVPNqOSUCLYk8VWmixQyQ==
X-Google-Smtp-Source: AGHT+IHhTfKGisxJMDKMWi0NkE672kcsExGQ9oNHipRDdy2yv0x7vZUbo6EGauUZlejM77SkpMS87UdXRkPyEii1beA=
X-Received: by 2002:a67:de89:0:b0:44d:4dd6:7966 with SMTP id
 r9-20020a67de89000000b0044d4dd67966mr3260742vsk.34.1692644469761; Mon, 21 Aug
 2023 12:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230818090224.409192-1-chigot@adacore.com>
 <20230818090224.409192-3-chigot@adacore.com>
In-Reply-To: <20230818090224.409192-3-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Aug 2023 15:00:43 -0400
Message-ID: <CAKmqyKN0bFhoqm09K3WfPEpp0DYOiN+eDDmtzPPcZO+vXNx=jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: riscv_htif: replace exit(0) with proper
 shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
>  hw/char/riscv_htif.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 37d3ccc76b..c49d20a221 100644
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
> @@ -205,7 +206,16 @@ static void htif_handle_tohost_write(HTIFState *s, u=
int64_t val_written)
>                      g_free(sig_data);
>                  }
>
> -                exit(exit_code);
> +                /*
> +                 * Shutdown request is a clean way to stop the QEMU, com=
pared
> +                 * to a direct call to exit(). But we can't pass the exi=
t code
> +                 * through it so avoid doing that when it can matter.
> +                 */
> +                if (exit_code) {
> +                    exit(exit_code);
> +                } else {
> +                    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SH=
UTDOWN);
> +                }
>              } else {
>                  uint64_t syscall[8];
>                  cpu_physical_memory_read(payload, syscall, sizeof(syscal=
l));
> --
> 2.25.1
>
>

