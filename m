Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSmhE-0003m5-2C
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 15:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSmh8-0003lY-WF; Wed, 14 Oct 2020 15:44:19 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSmh7-0004Na-A9; Wed, 14 Oct 2020 15:44:18 -0400
Received: by mail-il1-x142.google.com with SMTP id t18so685078ilo.12;
 Wed, 14 Oct 2020 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQEOS25+du7KObVd2C3/q3nUcmTbJj0cyCxvOra4+xI=;
 b=MPge2MA3VNsqq7/gFOb2Ngy9L+5eZucd8jHqWGg2oY36PlV6F/d9PpJ+xf/NmLfaV8
 oMfl/TddBjtsOL6bWdcSOvzbqs5J0Gk5DryQj/bR4vOTWTI6yiP1OdbqOxI91uccx/yG
 qFqLr4BFekpN3jtOlPzC9QQ167G7p6/7o3V0oK4Y/W/QRIiFZ5plV96FLMNfM9jZDu/4
 eT/4mdYR/UQb9nOXKhDYq1yXp0Cn5HlDMonqI8CdEhwWIcCWl+l7YbE8IG90iMR8Qooa
 OH6DYDu/7MG4SF1cQe8p70yR/BZnQfGLQtgTeuKw/X6cJvWdaHNPj69DC9krns3xWpa9
 CXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQEOS25+du7KObVd2C3/q3nUcmTbJj0cyCxvOra4+xI=;
 b=LLkUF3erAv34X0yFs653FuEpLmEGCp3qMos63LH3VyyCxMiWgBOR5fucHZ+WCP/IP2
 VVV2+7rgiytaq0BR4DDyH6YjUgzEo71fGeIUMeAWeHs9ZrOdn3xQIfoCtwNyPhFng9we
 hm2JK5uYzPMxr6wqebJV8KJp9AUzrPRrfo4BDk/GBIiySOyrKeqWrHotxKXVqtTJOxDU
 Mjy+otAWBpPf95VzjkXyJl/zej/tt1UiX1nxY01o48MLnzjvEwzDKkOQ2Xd4FsQjhwC3
 zcYwv8QyRGIUOzao347hud2jsJQrL9VaaAR+rgJ7xsHUKwczU+ncx4M58IgBWvh3EZSf
 oRow==
X-Gm-Message-State: AOAM532QxjQ27lvG4lYiOYm4WiE2gK5Q8w8pljgpyzWfYblaPIgXNzTV
 XeeEO3+OGClqz4gs1EXgu1xedKCrOl8Uiy9+SfkiEwcNiOc=
X-Google-Smtp-Source: ABdhPJwPUoqyTTO4P9qCIdojrh1JKcGMljxpECwjvjfWidr7kUYViWmI6J3A4cAQncvcCwcWWgBXY+FdaWtvXBWqum8=
X-Received: by 2002:a92:ba8d:: with SMTP id t13mr656320ill.131.1602704655766; 
 Wed, 14 Oct 2020 12:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201013151054.396481-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20201013151054.396481-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 14 Oct 2020 12:32:37 -0700
Message-ID: <CAKmqyKNjaqfdGM4=bwP5KTy8Yt1oMGF_9+xCiMtgQF97_E_Efw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix update of hstatus.SPVP
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2020 19:44:20 -0000

On Tue, Oct 13, 2020 at 8:11 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> When trapping from virt into HS mode, hstatus.SPVP was set to
> the value of sstatus.SPP, as according to the specification both
> flags should be set to the same value.
> However, the assignment of SPVP takes place before SPP itself is
> updated, which results in SPVP having an outdated value.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 904899054d..1d7d10377d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -932,7 +932,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  /* Trap into HS mode, from virt */
>                  riscv_cpu_swap_hypervisor_regs(env);
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPVP,
> -                                         get_field(env->mstatus, SSTATUS_SPP));
> +                                         env->priv);
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
>                                           riscv_cpu_virt_enabled(env));
>
> --
> 2.25.1
>
>

