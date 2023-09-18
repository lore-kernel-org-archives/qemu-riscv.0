Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3E7CD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 02:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3cd-00034M-Ot; Sun, 17 Sep 2023 22:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3cc-000346-N3; Sun, 17 Sep 2023 22:04:22 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3cU-0004oc-Sj; Sun, 17 Sep 2023 22:04:16 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4935f87ca26so1694026e0c.3; 
 Sun, 17 Sep 2023 19:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695002653; x=1695607453; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2MM5WAEG+R3s8qGL4cW2JUHCKUDzLu1tyeq/d9WEJE=;
 b=aKOfCV9zMnKqlWkp/PhcJvhQ80yZfKhkRZwyE34hWy3n2swEakckUnmXTr6Ob4fPRb
 6aBD1O9vd5oJ+Ex8vd+IPFyNpqwjJGwLAkSLWRW7eTX7cxUyJDMtpOzzr7ERPUpp42hB
 MrsHzATK9o5xLWIUMZEYLn03LUi3ngK2TIS5u4/KoFFZhp0AQ0wbWc6jWjh/C7HS8YI1
 nV+trTLip5AYsb513wnDmp/9GNXQEzphEb/niPvEcFCWeWohZQfttEJ9UJYaJVUosPkn
 V8LxejkXdVa0BGAzAShzEB0jsibyIkh1DiEYeaU/wWz0Zc9/1cK2oZyVap7IpuQbpxSx
 tyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695002653; x=1695607453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2MM5WAEG+R3s8qGL4cW2JUHCKUDzLu1tyeq/d9WEJE=;
 b=BpfDmGarKlWGioCsK9sgesLVU0qEnqbR4WpKdOatRIDHQND/SBYcpMz0vehs59oSSF
 k9qd+24jQznElyotsLLux0xjsv18CMgwynG6q1D1mP5HhUjMW39+YOMGWPzg9BG4JMTB
 CRQ5/URgO9nbIo2TvPele1mXYZntkNFs8pakUF982NYS+eo9iQBwszyeTR7M4SjA4f3l
 uSng4uf+VspIxNH3rUTcoN1UAGfO5/Osk0GgVXNrj3+5FsvXthJeKmm8wlbURcM+Rao4
 SOwX76vU391aOwN5yYt3DcuQucYLn329DBaST9qlIWvcxbz6T530X6sEEnXJUnqfpA4h
 W54g==
X-Gm-Message-State: AOJu0YzYOeeWZYB3Df/Erf6IGIIpI3OZFQq5YRn9XP5Z5TdT2H6fXcc2
 q1AueGJH+PJ0JSYM86ZJNvUpJ5H6DBzHGjCOlX8qoZgafmI=
X-Google-Smtp-Source: AGHT+IFdtVLH6oA85fwjOfqWxeEVsIsB9dmK6J5Bw8ytJuYLEE6A/tyeaFzol/jnjIZk8/jzuIJCH3pVqFNKLgTZnac=
X-Received: by 2002:ac5:cbeb:0:b0:496:b3e6:e107 with SMTP id
 i11-20020ac5cbeb000000b00496b3e6e107mr995721vkn.1.1695002653525; Sun, 17 Sep
 2023 19:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-2-chigot@adacore.com>
In-Reply-To: <20230907112640.292104-2-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 12:03:46 +1000
Message-ID: <CAKmqyKOR5LqRGHWbNiGjQ9PRbpAofXQGAna=bTQvYx+==yY46g@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] softmmu: add means to pass an exit code when
 requesting a shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
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

On Thu, Sep 7, 2023 at 9:26=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adacore.=
com> wrote:
>
> As of now, the exit code was either EXIT_FAILURE when a panic shutdown
> was requested or EXIT_SUCCESS otherwise.
> However, some hardware could want to pass more complex exit codes. Thus,
> introduce a new shutdown request function allowing that.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sysemu/runstate.h |  2 ++
>  softmmu/runstate.c        | 12 +++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index 7beb29c2e2..1e59e0b12b 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -61,6 +61,8 @@ void qemu_system_wakeup_request(WakeupReason reason, Er=
ror **errp);
>  void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>  void qemu_register_wakeup_notifier(Notifier *notifier);
>  void qemu_register_wakeup_support(void);
> +void qemu_system_shutdown_request_with_code(ShutdownCause reason,
> +                                            int exit_code);
>  void qemu_system_shutdown_request(ShutdownCause reason);
>  void qemu_system_powerdown_request(void);
>  void qemu_register_powerdown_notifier(Notifier *notifier);
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index f3bd862818..ee27e26048 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -345,6 +345,7 @@ void vm_state_notify(bool running, RunState state)
>
>  static ShutdownCause reset_requested;
>  static ShutdownCause shutdown_requested;
> +static int shutdown_exit_code =3D EXIT_SUCCESS;
>  static int shutdown_signal;
>  static pid_t shutdown_pid;
>  static int powerdown_requested;
> @@ -624,6 +625,13 @@ void qemu_system_killed(int signal, pid_t pid)
>      qemu_notify_event();
>  }
>
> +void qemu_system_shutdown_request_with_code(ShutdownCause reason,
> +                                            int exit_code)
> +{
> +    shutdown_exit_code =3D exit_code;
> +    qemu_system_shutdown_request(reason);
> +}
> +
>  void qemu_system_shutdown_request(ShutdownCause reason)
>  {
>      trace_qemu_system_shutdown_request(reason);
> @@ -685,7 +693,9 @@ static bool main_loop_should_exit(int *status)
>          if (shutdown_action =3D=3D SHUTDOWN_ACTION_PAUSE) {
>              vm_stop(RUN_STATE_SHUTDOWN);
>          } else {
> -            if (request =3D=3D SHUTDOWN_CAUSE_GUEST_PANIC &&
> +            if (shutdown_exit_code !=3D EXIT_SUCCESS) {
> +                *status =3D shutdown_exit_code;
> +            } else if (request =3D=3D SHUTDOWN_CAUSE_GUEST_PANIC &&
>                  panic_action =3D=3D PANIC_ACTION_EXIT_FAILURE) {
>                  *status =3D EXIT_FAILURE;
>              }
> --
> 2.25.1
>

