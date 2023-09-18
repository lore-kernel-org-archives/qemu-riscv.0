Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD43CD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 02:06:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3eJ-0003wa-E7; Sun, 17 Sep 2023 22:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3eH-0003vg-5v; Sun, 17 Sep 2023 22:06:05 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3eF-00058a-KX; Sun, 17 Sep 2023 22:06:04 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-44d526f96fcso1480193137.1; 
 Sun, 17 Sep 2023 19:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695002762; x=1695607562; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KjdIxP47GJ+g2xXgsGqYB60iSTTexu7a1qTtqE5Hxg=;
 b=mcMdk/njQI3vOnuxaeMF6pjyjnD6w9d6t+383JfmYf9ExaRoArB7FsCsfpknt4zfPt
 ZsWhB3kz7yjp34XW2f7W59wKBWBHudEXZljZIZ5rotD/tZyFQO4ehfgSqKsUzEhE/5HC
 9dQ/M6rFAtpjMeSxTATQCA0DWZ0xoIcb9a0sEPXONbCgMC33I9ZF/Q5H07kE3nZeIza7
 +BsORUE5UdZiDdSSoAIbvKII1AuqKxo8/kUUggj3hmJleN5sDIHouAreg5YtYJWltEqF
 wsGQUdgozk2hTeeuGd35pEwIgA4O0v+CkkOO9/3/09FZNOCIceekolThOMseDgD5Wpa2
 lE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695002762; x=1695607562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KjdIxP47GJ+g2xXgsGqYB60iSTTexu7a1qTtqE5Hxg=;
 b=QOyndeFr1lJ7QNNBvN1pQ6j+GKSaEPULUfqLnbXtke2edGn/4UNLk8WcJfuhw8EnZY
 ctDPqZpgYuXJ4PmtO6bafIW2eiYjNf5p8EaPQKAkXzLjolryppVwgJE51Offubsz0EOG
 mBBXAgh3lAP562t9nPsvnekACnhMcS9uMliru7wOZcGSb95H4Bl+nEO8gJ9xgfmluL9J
 54KPstzQMPNXYi71ExVC122sESb+3t0eF9cV6bBboBEEVoJcyxvmibxFd5fRDiHYxMQT
 XbDJ1NewZdFGRdmGiEbGr2rVLwZ7+wyym6Dyg+K47xTmyvGFW4OQpkeSgaLUR6EeXmUT
 oPuw==
X-Gm-Message-State: AOJu0YzZ9lQEZx76LUh06BbePtTk5mX/zxdthdfmDbseJxjSrB+CpFIc
 F4dYLQ86sz8KaEVf4dCnvRnrgsXoX0WXjgRW5rw=
X-Google-Smtp-Source: AGHT+IFqYX2HYtmCEm9cjTTm7VbDPLYu2rCUxAU+ZgJGSkFUbIPVGZ60bVRYTzKMD930A3BQl4nmr5pTJWpLHs1k/Ss=
X-Received: by 2002:a05:6102:3d84:b0:452:4e56:5e19 with SMTP id
 h4-20020a0561023d8400b004524e565e19mr1286124vsv.13.1695002762176; Sun, 17 Sep
 2023 19:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-3-chigot@adacore.com>
In-Reply-To: <20230907112640.292104-3-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 12:05:35 +1000
Message-ID: <CAKmqyKPYkRF_AFmbw5-gvRn_6pD30yUaAng-oc1=MsYcyPT2oA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] softmmu: pass the main loop status to gdb "Wxx"
 packet
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
> gdb_exit function aims to close gdb sessions and sends the exit code of
> the current execution. It's being called by qemu_cleanup once the main
> loop is over.
> Until now, the exit code sent was always 0. Now that hardware can
> shutdown this main loop with custom exit codes, these codes must be
> transfered to gdb as well.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sysemu/sysemu.h | 2 +-
>  softmmu/main.c          | 2 +-
>  softmmu/runstate.c      | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 25be2a692e..73a37949c2 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -101,7 +101,7 @@ bool defaults_enabled(void);
>
>  void qemu_init(int argc, char **argv);
>  int qemu_main_loop(void);
> -void qemu_cleanup(void);
> +void qemu_cleanup(int);
>
>  extern QemuOptsList qemu_legacy_drive_opts;
>  extern QemuOptsList qemu_common_drive_opts;
> diff --git a/softmmu/main.c b/softmmu/main.c
> index 694388bd7f..9b91d21ea8 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -35,7 +35,7 @@ int qemu_default_main(void)
>      int status;
>
>      status =3D qemu_main_loop();
> -    qemu_cleanup();
> +    qemu_cleanup(status);
>
>      return status;
>  }
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index ee27e26048..d4e2e59e45 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -794,9 +794,9 @@ void qemu_init_subsystems(void)
>  }
>
>
> -void qemu_cleanup(void)
> +void qemu_cleanup(int status)
>  {
> -    gdb_exit(0);
> +    gdb_exit(status);
>
>      /*
>       * cleaning up the migration object cancels any existing migration
> --
> 2.25.1
>

