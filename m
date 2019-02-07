Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grXmt-0006HK-NL
	for mharc-qemu-riscv@gnu.org; Wed, 06 Feb 2019 19:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1grXms-0006HC-0K
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 19:43:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1grXmq-0000tg-Er
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 19:43:29 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1grXmm-0000sD-Nm; Wed, 06 Feb 2019 19:43:26 -0500
Received: by mail-lf1-x143.google.com with SMTP id b20so6811324lfa.12;
	Wed, 06 Feb 2019 16:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uItE6vVvHHJSq0ULvOZfLgNlu38NUckx1jg+7x3ddLk=;
	b=imZSns0trFLnIG/rP5/lkNhyy56vkNAgGbhql2k1YcnQqoFcp9oDYgzgdL42fZq9GK
	HoTiSKGK9qydONJscAoJNqzgpnuiNxsLm0s14VrV9KVO6F3BbIkyftVBUSKrRNmUHv7x
	HvFiwkpvDQVzMsDtpe5CiyrkC9MUbyPrTmkMmvaegEAcLVSMcy/uml/cy/p/HZjNmyMF
	6UzsupiKgVtOCnlg220rsT5bZvTSh7XllgxZsOlqdA4ytRTjv54CL49EMW5o4QfIl0oe
	u2tAqNbyZ8UCqLhQm70BuFKFxb4Jf7s59TrL3A9KXjC3B3uCDUBLiDQAqab9Y7jJkhph
	cAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uItE6vVvHHJSq0ULvOZfLgNlu38NUckx1jg+7x3ddLk=;
	b=X8yDeBaYIzRh2sa/8caK8jRU90GVQp0yQr1hwt8RCh7jGzIGg5flkw4b8nyOlWJt64
	xDZxSxU6EM+ULjQ7E1dBWdwrrWcGg3VGj2ecsZ892zfqFyUf6OAEYgEGleQvjVbuQ2IY
	Eo2lQ7Y1u80yOtGWiDLq3PygrRWMvvcPNEH+4R7SvauXeiUHqg5MITr6LB2cRp5TK4hl
	NKp31CidmcrEvxmKO/k39ot/FqCPKFcnuzKuso7z/N1d/t7eSvoo9QN2BNGYUOW1yySf
	wrPIX52kQEwdjBuhncJo1zqDYaIIoMLLDxWa//ToXAaqnXg3Qp8mMacihTEwmEMjPGEn
	Pt0Q==
X-Gm-Message-State: AHQUAuYFOlsmneQrvL2vIHZJOaZqHmxFRUhX62h7Vv8JTh0wyCYmhXCB
	m5unrlVq8vrk50dzyq/5rjDQjfjjZyUAa4VWvhg=
X-Google-Smtp-Source: AHgI3IZJ+VE5RayZ4tQQOLU+HBhTbop8PFgw4cvw8tzS+lrW2of2+EnIdRc7G0PvMECLoOG+KkCHM49N8ZlGTLNE6Ck=
X-Received: by 2002:a19:7018:: with SMTP id h24mr8174253lfc.162.1549500201775; 
	Wed, 06 Feb 2019 16:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20190130185242.12490-1-chouteau@adacore.com>
In-Reply-To: <20190130185242.12490-1-chouteau@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Feb 2019 16:42:42 -0800
Message-ID: <CAKmqyKMNqYBN9ZCESAxfqWSOidjFRhQNofN130MOPDOyRwQ28w@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Michael Clark <mjc@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/sifive_clint.c:
 avoid integer overflow in timecmp write
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 00:43:31 -0000

On Wed, Jan 30, 2019 at 10:53 AM Fabien Chouteau <chouteau@adacore.com> wrote:
>
> Writing a high value in timecmp leads to an integer overflow. This patch
> modifies the code to detect such case, and use the maximum integer value
> as the next trigger for the timer.
>
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  hw/riscv/sifive_clint.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> index d4c159e937..1ca1f8c75e 100644
> --- a/hw/riscv/sifive_clint.c
> +++ b/hw/riscv/sifive_clint.c
> @@ -38,8 +38,10 @@ static uint64_t cpu_riscv_read_rtc(void)
>   */
>  static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value)
>  {
> -    uint64_t next;
>      uint64_t diff;
> +    uint64_t lapse_ns;
> +    uint64_t clock_ns;
> +    int64_t  next_ns;
>
>      uint64_t rtc_r = cpu_riscv_read_rtc();
>
> @@ -54,10 +56,29 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value)
>      /* otherwise, set up the future timer interrupt */
>      riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
>      diff = cpu->env.timecmp - rtc_r;
> -    /* back to ns (note args switched in muldiv64) */
> -    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -        muldiv64(diff, NANOSECONDS_PER_SECOND, SIFIVE_CLINT_TIMEBASE_FREQ);
> -    timer_mod(cpu->env.timer, next);
> +
> +    /*
> +     * How many nanoseconds until the next trigger (note args switched in
> +     * muldiv64)
> +     */
> +    lapse_ns = muldiv64(diff,
> +                        NANOSECONDS_PER_SECOND,
> +                        SIFIVE_CLINT_TIMEBASE_FREQ);
> +
> +    /* Current time in nanoseconds */
> +    clock_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> +    if ((G_MAXINT64 - clock_ns) <= lapse_ns) {
> +        /*
> +         * clock + lapse would overflow on 64bit. The highest 64bit value is
> +         * used as the next trigger time.
> +         */
> +        next_ns = G_MAXINT64;
> +    } else {
> +        next_ns = clock_ns + lapse_ns;
> +    }

Can you describe what this fixes?

Won't an overflow be ok as we then just wrap around anyway? I guess
there is a problem if we want a value so large that we wrap around
past our current time though.

Alistair

> +
> +    timer_mod(cpu->env.timer, next_ns);
>  }
>
>  /*
> --
> 2.17.1
>
>

