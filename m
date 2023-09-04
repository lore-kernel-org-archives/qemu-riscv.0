Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC22C83F2C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 01:48:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcyhC-0006Cp-SB; Sun, 03 Sep 2023 21:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcyh9-0006Ah-PV; Sun, 03 Sep 2023 21:48:05 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcyh6-00079u-8R; Sun, 03 Sep 2023 21:48:03 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7a2785e34b6so283410241.1; 
 Sun, 03 Sep 2023 18:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693792078; x=1694396878; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yo0fw3L22av76GFoRmD14rHKTTjeSQRP0mWxHTnpQVQ=;
 b=ANerQKreiAv/NGLSP90G9nFcW7erIaxiKvBhTXiN2BZTZoSrTuzFTDiweV/OYqgEfh
 aloJfsEDcoKRxN+/O5jjR7y+yqCv9leGTIlYw47Ls41AllpDsea2znB2tBqrO1fzNO4t
 veZ+ozpJoFQeLfRm4OO7G9MEh2dOv8RttJxDXVZTeazrDF95fnw3SSPxCZrIii3UNJNS
 zrJHQZo5ZQm/ZD6HT6E7Hck/rTVthTFrCp8PsZw40rZIqDuuqi5K1hIcgrw0y56cjFRT
 9La6acsEd0Py9CG6nJ3e5hQKsqoO+iZ9aWw7y4oMVqM3PNNr7QtaVoPbdjZNTqH0xPgB
 21JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693792078; x=1694396878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yo0fw3L22av76GFoRmD14rHKTTjeSQRP0mWxHTnpQVQ=;
 b=crp9P5zH0mU2UBr3R9JMRZFsiEX4sY3B5lafIHcbn0bpA7rukhrQYCJapqmf4vFttf
 Pzo8UN34njEmzA9aG1VqDBbX3yy6r/IwND/G7hKS7Zfb2rdGANhRYTePjYIYHbHVDFoe
 pGNO8E+/H9O+HpHN8NxxSLkKvnpAo3gCavC3vvXg8u1jIJ4HWD2R7V+nBoUzkHQ0z7tO
 iLHAezd8kutrI21lrHXJDLPzvVKyF3/p7pEt/Wo5inJFigksQAeGiGXsG6ZvasQt2xrp
 wKvQOHCtpsthBa9CA0ELg/QBoPRBa9UcZv/q8vSmak7/OhVf0ac5tCGgpZu6Zj0YfPM9
 OPLw==
X-Gm-Message-State: AOJu0YyJ87NZA+0gLpipLrMqeCFr8VKJNHRtvgdGMrl63cOomF17vLG5
 8jVTz2hpUMDYNoVv+axylmCyXZPEjyOeq5dLoG3sBcJ7hITLrA==
X-Google-Smtp-Source: AGHT+IHcc1Z9Gudol4MaumGmO5AXgq0gvKemkXmMW2TzscSFHx+/8ho4fDyFBpglHfU+AvCfuLcLzGAu2YpJvGsvG/8=
X-Received: by 2002:a1f:c581:0:b0:48d:461:d9 with SMTP id
 v123-20020a1fc581000000b0048d046100d9mr6725184vkf.13.1693792078588; 
 Sun, 03 Sep 2023 18:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230823070735.363197-1-chigot@adacore.com>
In-Reply-To: <20230823070735.363197-1-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Sep 2023 11:47:32 +1000
Message-ID: <CAKmqyKPuBZxhRT2epuToYmsTpTaaBftTr5Of44Mf-N6jA5333g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gdbstub: replace exit(0) with proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Aug 23, 2023 at 5:08=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adacore=
.com> wrote:
>
> This replaces the exit(0) call by a shutdown request, ensuring a proper
> cleanup of Qemu. Otherwise, some connections could be broken without
> being correctly flushed.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub/gdbstub.c |  3 +--
>  gdbstub/softmmu.c | 13 +++++++++++++
>  gdbstub/user.c    |  2 ++
>  3 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 5f28d5cf57..358eed1935 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1298,7 +1298,6 @@ static void handle_v_kill(GArray *params, void *use=
r_ctx)
>      gdb_put_packet("OK");
>      error_report("QEMU: Terminated via GDBstub");
>      gdb_exit(0);
> -    exit(0);
>  }
>
>  static const GdbCmdParseEntry gdb_v_commands_table[] =3D {
> @@ -1818,7 +1817,7 @@ static int gdb_handle_packet(const char *line_buf)
>          /* Kill the target */
>          error_report("QEMU: Terminated via GDBstub");
>          gdb_exit(0);
> -        exit(0);
> +        break;
>      case 'D':
>          {
>              static const GdbCmdParseEntry detach_cmd_desc =3D {
> diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
> index f509b7285d..fa9b09537d 100644
> --- a/gdbstub/softmmu.c
> +++ b/gdbstub/softmmu.c
> @@ -434,6 +434,19 @@ void gdb_exit(int code)
>      }
>
>      qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
> +
> +    /*
> +     * Shutdown request is a clean way to stop the QEMU, compared
> +     * to a direct call to exit(). But we can't pass the exit code
> +     * through it so avoid doing that when it can matter.
> +     * As this function is also called during the cleanup process,
> +     * avoid sending the request if one is already set.
> +     */
> +    if (code) {
> +        exit(code);
> +    } else if (!qemu_shutdown_requested_get()) {
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }
>  }
>
>  /*
> diff --git a/gdbstub/user.c b/gdbstub/user.c
> index 5b375be1d9..f3d97d621f 100644
> --- a/gdbstub/user.c
> +++ b/gdbstub/user.c
> @@ -113,6 +113,8 @@ void gdb_exit(int code)
>          gdb_put_packet(buf);
>          gdbserver_state.allow_stop_reply =3D false;
>      }
> +
> +    exit(code);
>  }
>
>  int gdb_handlesig(CPUState *cpu, int sig)
> --
> 2.25.1
>
>

