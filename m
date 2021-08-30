Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKakL-0007A1-4O
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 02:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKakI-00070K-Py; Mon, 30 Aug 2021 02:26:14 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKakH-0008VH-10; Mon, 30 Aug 2021 02:26:14 -0400
Received: by mail-il1-x136.google.com with SMTP id i13so14879962ilm.4;
 Sun, 29 Aug 2021 23:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tb0zSWhg3UjMLub3KbfL43K/aQO47njriunHw2KJfLk=;
 b=fFtsm2BjTjzlwNLyIBw56+u9e+3MR+KugStyk+2oAuOTh+p+cPLaA7IXHMAYVoLVaZ
 vobQcC9HNdMdhKO6hLSvvCW2ErA9IkuBlmAOUMUZbWVWlsxotkb6t/6M187dL3pn9Bmd
 df8g3+AEl6JsCs1Y335RjMwSHaEMWAz2L1CXC2TEQyU8S44qZpxbRUgGfUTpIUEmcJnV
 g147O09Xhf7UEkl31C8FnukemXo0dPturjlUjyrn+WNH+vWCa3NVK4T0JOtis15Ngt2K
 3cytS1yTl+EArIV47yyD95FS/RXnbNEpRRs5nMiN1SiqoGP9J6aVm+yVG/NQ0TpWZqxn
 SYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tb0zSWhg3UjMLub3KbfL43K/aQO47njriunHw2KJfLk=;
 b=drA6yexCITcY+syWgI7PbOa5B8a3HXWc16f4ZpAZWibgd3T6TuMAmVZNR2n7lUuDmi
 CnZFLPvwmR64zqDi+HJKuLt+beDZTciKRuSXDZG0on22SRODnxJ1K0c9TfD0/SLvN8zT
 HgkVn1/ZCFDgfqRE63WCxkuEd+dt9Qx0/BJFYWWQWfRTbWn6RcI1dJbMgpoCyvVP60nb
 hBTlrLMB+q6VTOc3MwiJhcVUeHN1r9USTrbF17AILrScUtKu1vCnh/B1YqXXWBqXa5yD
 UDJabubMfHXP4aSzI4udyV9H34x6wyPcAeK6n/0bSdAjOyZotpChotsg8ocrWns0umMU
 coeA==
X-Gm-Message-State: AOAM5301QelUxlvW9nW1bR69FLbOVbLwhDZct3kTSMNly7bEdM1D5+/t
 jcfUDR0X5M5uq3YNcw3c0fXPIHMuo4qS6Q7W/d8=
X-Google-Smtp-Source: ABdhPJwcL+B3nz3NFdxiPOzmObWsXVqGGNaSPU7OslCtzQBVKbwYGKNPSA8wpEEnzQ4TD7Gmiv3tEjLlarBtnL6U4Zo=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr14882469ilj.227.1630304771567; 
 Sun, 29 Aug 2021 23:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <aa466b05545e360b9a96249a659c5d1e@m101.nthu.edu.tw>
 <e7340f10bfbab7bead0a045aa9ae09f7@m101.nthu.edu.tw>
 <113c061817fc2caa934930182da7ab63@m101.nthu.edu.tw>
In-Reply-To: <113c061817fc2caa934930182da7ab63@m101.nthu.edu.tw>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 16:25:45 +1000
Message-ID: <CAKmqyKM+HTBsvgQ-A19WSGy8-hWZ-RgyFxMD0t0w32Rg_c9LOg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/sifive_clint: Fix expiration time logic
To: s101062801 <s101062801@m101.nthu.edu.tw>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Mon, 30 Aug 2021 06:26:15 -0000

On Sun, Aug 29, 2021 at 12:27 PM s101062801 <s101062801@m101.nthu.edu.tw> wrote:
>
> After timecmp is modified, the value is converted into nanosecond,
> and pass to timer_mod.  However, timer_mod perceives the value as
> a signed integer.  An example that goes wrong is as follows:
>
> OpenSBI v0.9 initializes the cold boot hart's timecmp to
> 0xffffffff_ffffffff.  timer_mod then interprets the product of the
> following calculation as a negative value.  As a result, the clint
> timer is pulled out of timerlist because it looks like it has
> expired, which cause the MIP.MTIP is set before any real timer
> interrupt.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
> Signed-off-by: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
> ---
> v2:
>   - Fix the calculation for next.
>   - Link to issue 493.
>   - I saw David's after I made this patch.  Yet I want to correct the
> error
>     in v1.

Hello,

Thanks for the patch!

As David's was sent first I am going to apply that instead of this
one. Sorry about that.

Please feel free to send more QEMU patches in the future or to review
other people's patches.

Hopefully we will see you again :)

Alistair

> ---
>   hw/intc/sifive_clint.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> index 0f41e5ea1c..78f01d17d3 100644
> --- a/hw/intc/sifive_clint.c
> +++ b/hw/intc/sifive_clint.c
> @@ -44,6 +44,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
> uint64_t value,
>   {
>       uint64_t next;
>       uint64_t diff;
> +    uint64_t now;
>
>       uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
>
> @@ -59,9 +60,11 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
> uint64_t value,
>       riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
>       diff = cpu->env.timecmp - rtc_r;
>       /* back to ns (note args switched in muldiv64) */
> -    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> -    timer_mod(cpu->env.timer, next);
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    next = now + muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> +    timer_mod(cpu->env.timer, (next <= now) ?
> +                              (int64_t)((1ULL << 63) - 1) :
> +                              next);
>   }
>
>   /*
> --
> 2.32.0
>

