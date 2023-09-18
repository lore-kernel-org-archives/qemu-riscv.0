Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA02BCD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 02:10:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3iZ-0006XN-19; Sun, 17 Sep 2023 22:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3iW-0006Wu-Qh; Sun, 17 Sep 2023 22:10:28 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3iV-0006BT-8l; Sun, 17 Sep 2023 22:10:28 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-450f68feee2so1399931137.1; 
 Sun, 17 Sep 2023 19:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695003026; x=1695607826; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8XpVup53PXb5M+AjtqYbt8ZrhesrxmoaV1xAMZY1H6c=;
 b=JIIyRG66usMvxEYSjeQk8ImOETpc4M2/njQAX9B6GITU+giWAXO6WDsAVEVTFd9Inz
 lRKKAgNRCbb4djQEqD8GmCA+SFiq/9sFeWOpF2iRo0kPJ6zAZS1Wtxlp+CABRzdv8oiv
 Z13YcmeOFwntAan8MU/z5+hr3IcE+z5cM43qfq93BDwlsv24mNQn7cvsOwwKmMZtVJZs
 BuuSpChAbfjnh2QpecZbdjI09cYS4vGiouLEXLYd+t0IR0uF6zx5sOX3jkEpv6SisJSo
 3+3RXyKuHx0rvYFK7ojD2CQWC6KTyD1yyzlTFTCUMgAWL7kKLCu6CXw4q3SCxh7z3MvT
 3pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695003026; x=1695607826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8XpVup53PXb5M+AjtqYbt8ZrhesrxmoaV1xAMZY1H6c=;
 b=FiPzGMkgY6Uu+R0XvQb6+0MjnqxMVtnHbvTshhNDGTMwxUaUnac/Pck/vhB+/j5UwA
 pRXTGL9/9X6OIebt86KnoPXlQk08lGPDgw4rVk6GSBskgaJFjouAUnw1L/nNryGXHU1S
 5ylblRxFsnbXKYAdT3AHJRrS3Rv7fFB5XCjoquPStiplOOloNUvdvnVtiJjRKtvyiTec
 RB3to+yLZwbylxybD58uc3XtBciyXOJO2Hc8qULiHCiBMJOiE8GZlBXk93IQ/cGrKCOn
 8rSt9L76epDd1wHnErWDDbdhLoYllVhTXJkbF0w3mCRMYq9dnjNevfSfeqTTO+2e9lfZ
 DV2g==
X-Gm-Message-State: AOJu0YzX75curNEfCeWB/GxDGN8YefKzw5afNqJmdnI0pQUTyrDqYlyx
 uZh386tpc/OWCps9UwFlh7UnrZ2AXn33X/rUUy0=
X-Google-Smtp-Source: AGHT+IH57nLFoxzXXUmYpv7trVrK86BExCkDV1mXFn7OhcMBqqRJRDuaT8tqX74EEz/7LA5PJAszAmbz6HmXyIHzSNY=
X-Received: by 2002:a67:eb14:0:b0:44d:476b:3bc0 with SMTP id
 a20-20020a67eb14000000b0044d476b3bc0mr6241948vso.28.1695003025760; Sun, 17
 Sep 2023 19:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-6-chigot@adacore.com>
In-Reply-To: <20230907112640.292104-6-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 12:09:59 +1000
Message-ID: <CAKmqyKNAymAeCOahe8ZMY=zJT_r4O+L1d9Q6joDRthV3jnEXiw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] gdbstub: replace exit calls with proper shutdown
 for softmmu
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
> cleanup of Qemu. Features like net/vhost-vdpa.c are expecting
> qemu_cleanup to be called to remove their last residuals.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub/gdbstub.c          | 5 +++--
>  gdbstub/softmmu.c          | 6 ++++++
>  gdbstub/user.c             | 6 ++++++
>  include/gdbstub/syscalls.h | 9 +++++++++
>  4 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 349d348c7b..1cb6d65306 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1327,7 +1327,7 @@ static void handle_v_kill(GArray *params, void *use=
r_ctx)
>      gdb_put_packet("OK");
>      error_report("QEMU: Terminated via GDBstub");
>      gdb_exit(0);
> -    exit(0);
> +    gdb_qemu_exit(0);
>  }
>
>  static const GdbCmdParseEntry gdb_v_commands_table[] =3D {
> @@ -1846,7 +1846,8 @@ static int gdb_handle_packet(const char *line_buf)
>          /* Kill the target */
>          error_report("QEMU: Terminated via GDBstub");
>          gdb_exit(0);
> -        exit(0);
> +        gdb_qemu_exit(0);
> +        break;
>      case 'D':
>          {
>              static const GdbCmdParseEntry detach_cmd_desc =3D {
> diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
> index 9f0b8b5497..a5d6e04c79 100644
> --- a/gdbstub/softmmu.c
> +++ b/gdbstub/softmmu.c
> @@ -435,6 +435,12 @@ void gdb_exit(int code)
>      qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
>  }
>
> +void gdb_qemu_exit(int code)
> +{
> +    qemu_system_shutdown_request_with_code(SHUTDOWN_CAUSE_GUEST_SHUTDOWN=
,
> +                                           code);
> +}
> +
>  /*
>   * Memory access
>   */
> diff --git a/gdbstub/user.c b/gdbstub/user.c
> index 7ab6e5d975..dbe1d9b887 100644
> --- a/gdbstub/user.c
> +++ b/gdbstub/user.c
> @@ -113,6 +113,12 @@ void gdb_exit(int code)
>          gdb_put_packet(buf);
>          gdbserver_state.allow_stop_reply =3D false;
>      }
> +
> +}
> +
> +void gdb_qemu_exit(int code)
> +{
> +    exit(code);
>  }
>
>  int gdb_handlesig(CPUState *cpu, int sig)
> diff --git a/include/gdbstub/syscalls.h b/include/gdbstub/syscalls.h
> index 243eaf8ce4..54ff7245a1 100644
> --- a/include/gdbstub/syscalls.h
> +++ b/include/gdbstub/syscalls.h
> @@ -110,4 +110,13 @@ int use_gdb_syscalls(void);
>   */
>  void gdb_exit(int code);
>
> +/**
> + * gdb_qemu_exit: ask qemu to exit
> + * @code: exit code reported
> + *
> + * This requests qemu to exit. This function is allowed to return as
> + * the exit request might be processed asynchronously by qemu backend.
> + */
> +void gdb_qemu_exit(int code);
> +
>  #endif /* _SYSCALLS_H_ */
> --
> 2.25.1
>

