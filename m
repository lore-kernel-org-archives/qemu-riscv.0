Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9EFC83F33
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 09:23:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd5o2-0002IY-U3; Mon, 04 Sep 2023 05:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qd5nw-0002Ho-On
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:23:32 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qd5nm-0007dY-7S
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:23:24 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50091b91a83so2065126e87.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693819399; x=1694424199; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUq8bfNPYZgiJtNPTEdlgSJW/Yo5i05h5j1OZ9GNjNc=;
 b=Ox9fPOFvKcJ16rzr1E0iwjAqff/8RE63YvaEszT/JswMZudWhTwLr/jnop8R7A5kLG
 LW0ZOK/cF89oZ6Edj0LP1CcyTy1e6lNczP6TgO/HT3t7/rMULCf2UpPkjLq81g2KWDeV
 3mZGY+Xx3kBMPuewNacJpcxl6GOvGLpcI1jGRBKaceN/b4BOn07xrGmjNiUscKiABawq
 VZzRiRblqoP5iOkIRG7zRQSVCtgNDdcoGhiJLiPujKGrvqFbhFYQ/4Hz973ncvTBZZKH
 VDFw3fPOE6cD/0iNeQ42WX3mxgJIeYEMvRZm5IGr5HvsixV6l1U/fOcdSvAxt+wEeAYJ
 aWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693819399; x=1694424199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YUq8bfNPYZgiJtNPTEdlgSJW/Yo5i05h5j1OZ9GNjNc=;
 b=E6R0YeGqb50KDPZLit7XDvNEaOB7VFj5u7EJHLzi/0O118jac2+U7PTWG2ozOrvi0N
 g6dJyiMBYxidaaSuFkmeRoGiPuCrhRzoURa3I5q9sg7PvSUm3n5Jdfe1tMHHDVw6RKdV
 AniwW5Al5qKXUr7CTlDf1u7w68HjTnv0ZAbsSpAIfE7Br8M4xZwl18AXvYRYMw9c1ymX
 N79PeSWIaVZmhEvwtHuCBXjYfPeQA3dg64IM4swn6V5FN2/PgFYseQ7sFZvHj+M/REa+
 42uW5sK/W0ot4eFjJ0drAdwyIXeI0JK52CIzE74Zzk0FDFyn7x5A9LkgzMrDJBe0YYax
 t6YA==
X-Gm-Message-State: AOJu0YxcP6s1p2oeEmc+c6bL8Xo9EReClul50I7uml2mNElBf3f9Vz6V
 GX0QJ8c+pKznrONAKrRtoEo4uZLm1Om9sc30aKAH7Q==
X-Google-Smtp-Source: AGHT+IEzg1U6Bq1X2kenrm5UNt/+vhwd+sU8GIVRGVamPfKkyjZxfy4+annl+5lzwxn/IPFg78iQVPz0070Kzy+l46Q=
X-Received: by 2002:ac2:52ab:0:b0:500:79a6:38d4 with SMTP id
 r11-20020ac252ab000000b0050079a638d4mr5935204lfm.40.1693819399391; Mon, 04
 Sep 2023 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230823070735.363197-1-chigot@adacore.com>
In-Reply-To: <20230823070735.363197-1-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2023 10:23:08 +0100
Message-ID: <CAFEAcA9EHpyPuJOCAbLCn8=F+aaSZ=yzwDPwT70VUyCgMDLmYw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gdbstub: replace exit(0) with proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 23 Aug 2023 at 08:07, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> This replaces the exit(0) call by a shutdown request, ensuring a proper
> cleanup of Qemu. Otherwise, some connections could be broken without
> being correctly flushed.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
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

This definitely doesn't look right. Either exit() is OK
to call, or it is not. We shouldn't be exiting one way
if the exit status is 0 and another way if it is non-0.

thanks
-- PMM

