Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIlwr-0001RK-3e
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 01:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIlwp-0001R2-B4; Wed, 25 Aug 2021 01:59:39 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIlwm-00060w-K2; Wed, 25 Aug 2021 01:59:38 -0400
Received: by mail-il1-x12e.google.com with SMTP id b4so13292663ilr.11;
 Tue, 24 Aug 2021 22:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9GWbmXLUzi35MPysajZQJYGJ2Hyv5i9GCvQB4aaQwxM=;
 b=ogpAW4AcgGu7ldQMGEJBzjAGdxWXs7cC/POl6gZu2HG/3U/nWujeoOBD0rOR5TKrk+
 qaTOMN+5u3UncJ13MTxXn3lAxbEZie5Xr8bnwypP957YaIKcmxiVROZg4UzbWy/nfA4I
 An07R84KWJCmyyFqofhizeM37DCTiMby3UF8zWOJiM1gBdbR8fdtevYbagqQYiqoZy0t
 FWFvWulHYhmm56LF4MyZcKoebFQV94Zp64/PhlUI51fEvFsJlNr+AjU4aLjsdN+Ryda3
 2abFdoLzK99fl/xrpirHZoN3bjxzdZgvy8mVfmHz3KGdJpg4CLOg6/sePEYuUdrqT+39
 PjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9GWbmXLUzi35MPysajZQJYGJ2Hyv5i9GCvQB4aaQwxM=;
 b=TyKbLdM0EBY+fao1lNyO2LTGfEOf9FyaLoH5UZ5FyJRQrbM5TjY16TImSYziuFLFSD
 OlPR4XA6XnhhFQBWt8TUR/aiiUkE2rxbbf6GrSBcy2JnLALAesrsDbEbwNfk994tQI0h
 ntdbBTYKMxwrJSGMvOKTqtP+xvGhhW+T6vKlhhdnl07UlPkGLun77hzNid2SbOyDcYFf
 e+XcLoz0fYHOo3WGeJN+uT3WoZI7yljgx4x4/dlRro7euEnj2dwvmQg8oN3hNK8zscs7
 tPJtYhsMP8kn/XVSlgrJDTkq9sOCmIAk7p3HgEREdtf7C+Yez5r9DYESK7IENjNmkUqb
 RXcQ==
X-Gm-Message-State: AOAM5303X9591948oXJqWzK/8IBOkElGxHbfQTaUr6i0PtH6QB2tJuPB
 lwETRhaLq6bG9rWAN3IYXVD2FJU/6EZdcuTxmaA=
X-Google-Smtp-Source: ABdhPJxq+68V+BOMh1IgcRFJs39DBGyTU5bs6wA5T2GbE70QOJTbTRF8+wpLfIscwM3esngo7jzEGCCQWYxpP1filtM=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr29029202ilj.227.1629871174489; 
 Tue, 24 Aug 2021 22:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210819051209.17237-1-david@salt-inc.org>
In-Reply-To: <20210819051209.17237-1-david@salt-inc.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 15:59:08 +1000
Message-ID: <CAKmqyKON3ZuDT7-FYQ7K__uGG8T3ZZ53XHONXjvBcshE+bgZPA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/intc/sifive_clint: Fix overflow in
 sifive_clint_write_timecmp()
To: David Hoppenbrouwers <david@salt-inc.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 05:59:39 -0000

On Thu, Aug 19, 2021 at 3:19 PM David Hoppenbrouwers <david@salt-inc.org> wrote:
>
> `muldiv64` would overflow in cases where the final 96-bit value does not
> fit in a `uint64_t`. This would result in small values that cause an
> interrupt to be triggered much sooner than intended.
>
> The overflow can be detected in most cases by checking if the new value is
> smaller than the previous value. If the final result is larger than
> `diff` it is either correct or it doesn't matter as it is effectively
> infinite anyways.
>
> `next` is an `uint64_t` value, but `timer_mod` takes an `int64_t`. This
> resulted in high values such as `UINT64_MAX` being converted to `-1`,
> which caused an immediate timer interrupt.
>
> By limiting `next` to `INT64_MAX` no overflow will happen while the
> timer will still be effectively set to "infinitely" far in the future.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
> Signed-off-by: David Hoppenbrouwers <david@salt-inc.org>
> ---
> I did not account for the multiplication overflow mentioned in the bug
> report. I've amended the patch and I do not spot any erroneous interrupts
> anymore.
>
> I see that the previous patch already got applied to
> riscv-to-apply.next. Do I need to create a new patch?

I have just removed that patch, so this is fine.

>
> David
>
>  hw/intc/sifive_clint.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> index 0f41e5ea1c..aa76e639a9 100644
> --- a/hw/intc/sifive_clint.c
> +++ b/hw/intc/sifive_clint.c
> @@ -59,8 +59,23 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
>      riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
>      diff = cpu->env.timecmp - rtc_r;
>      /* back to ns (note args switched in muldiv64) */
> -    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> +    uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> +
> +    /*
> +     * check if ns_diff overflowed and check if the addition would potentially
> +     * overflow
> +     */
> +    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
> +        ns_diff > INT64_MAX) {
> +        next = INT64_MAX;
> +    } else {
> +        /*
> +         * as it is very unlikely qemu_clock_get_ns will return a value
> +         * greater than INT64_MAX, no additional check is needed.
> +         */
> +        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;

What if ns_diff is INT64_MAX, won't this overflow?

Alistair

> +    }
> +
>      timer_mod(cpu->env.timer, next);
>  }
>
> --
> 2.20.1
>
>

