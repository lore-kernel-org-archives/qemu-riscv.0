Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKaNl-0006uR-VB
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 02:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKaNk-0006tZ-6W; Mon, 30 Aug 2021 02:02:56 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKaNi-0005fU-7o; Mon, 30 Aug 2021 02:02:55 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b7so18410979iob.4;
 Sun, 29 Aug 2021 23:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/9vx44xz2WgINlJwaRfidJjsn6WvWS3ez6lukaxFMQ=;
 b=ENf5DS1369jE7vH9kv723oA8q8AfCRmesZ+HSB8qE9b4VIin11rQCLReIky2CNO6Ha
 2TWk1NZLLd9g2x7/JT+lui2HGzAUhQ1w6I6sp/+2anbX+Gei2b64JmNYKyq2WS5K578M
 it4Y0qp1f6iC6Tb7nCLAk2+hZLiFGRwZidlXlD/u9CQOlQTKaF0boU6pu5lYWPQUW+G0
 KNu5RV3XtWajxktJcUOgoD+4ZXnovJVWgWoIDYU7nmb1WOGEm3Azbi0Wj0cfR5P2bKoE
 CBu/6f2IYx/p025pf8j6HRyVNuGqC2WvpjG3ZeA/i9wOLAqTBYHNuavQt3tPzcZyhAwW
 46Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/9vx44xz2WgINlJwaRfidJjsn6WvWS3ez6lukaxFMQ=;
 b=f62H1L30Obc2JMDjsUL2xPzZ+odUefeWw8iFEE/f9SiZIesbbeIyHuS+7jOoRNMp3q
 zhVGyX+sP/jHtt3IZ4wcIVOauCIe3JOMu7NV2txJknOi2IC7iRrnBAE3gUzi7zSpHuOK
 Q8Vb/r3n6QKbMRm+jH14sdaW1EmpY0LecrkDhEuYorSe+ZPtbcH0byQACBbsqcRu6aDo
 pVtr0y5sw9kMTnSubdZMJQoDXuY9qchMlzXray5DONyHVtuUo4MTvIQ/Y5ZoYj1NmDY9
 TocgMt1t3znLR12BdAX+/+vp9DhUSLay4cZhxMcS+pXB4mkzca7aasJIwTzqDTlF++Dq
 ix+g==
X-Gm-Message-State: AOAM530+/feOOHGyxYCkdTuMZDEmD7SX/PxwY/P8DvTzZ6ZEGiJBozDa
 9l6Wsv2wGrjg2Ao8i7upO7mCDidR9imLBH173eE=
X-Google-Smtp-Source: ABdhPJw0V33zHV+wXHeTmBYAF+e66e/2vt+CbB0vlbazTHKZ4wUxLLkUgX6YQt5uVVLalWO3J9jr0+8M+hVVC4m7dWI=
X-Received: by 2002:a6b:5819:: with SMTP id m25mr16858909iob.105.1630303372987; 
 Sun, 29 Aug 2021 23:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210827152324.5201-1-david@salt-inc.org>
In-Reply-To: <20210827152324.5201-1-david@salt-inc.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 16:02:26 +1000
Message-ID: <CAKmqyKOZzx8sgoNmeAMPXjOOR87oxaOT5O240+k8F22Rqbcy_A@mail.gmail.com>
Subject: Re: [PATCH v4] hw/intc/sifive_clint: Fix muldiv64 overflow in
 sifive_clint_write_timecmp()
To: David Hoppenbrouwers <david@salt-inc.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Mon, 30 Aug 2021 06:02:56 -0000

On Sat, Aug 28, 2021 at 1:28 AM David Hoppenbrouwers <david@salt-inc.org> wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> I addressed the potential signed integer overflow if `ns_diff` is
> `INT64_MAX`. An unsigned integer overflow still should not be able to
> happen practically.
>
> David
>
>  hw/intc/sifive_clint.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> index 0f41e5ea1c..99c870ced2 100644
> --- a/hw/intc/sifive_clint.c
> +++ b/hw/intc/sifive_clint.c
> @@ -59,8 +59,29 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
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
> +         * greater than INT64_MAX, no additional check is needed for an
> +         * unsigned integer overflow.
> +         */
> +        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
> +        /*
> +         * if ns_diff is INT64_MAX next may still be outside the range
> +         * of a signed integer.
> +         */
> +        next = MIN(next, INT64_MAX);
> +    }
> +
>      timer_mod(cpu->env.timer, next);
>  }
>
> --
> 2.20.1
>
>

