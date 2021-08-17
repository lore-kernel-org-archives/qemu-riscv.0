Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFpiQ-0007md-1K
	for mharc-qemu-riscv@gnu.org; Mon, 16 Aug 2021 23:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mFpiO-0007mQ-JZ; Mon, 16 Aug 2021 23:24:36 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:34780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mFpiM-0005Ha-Qp; Mon, 16 Aug 2021 23:24:36 -0400
Received: by mail-il1-x12e.google.com with SMTP id j15so8228462ila.1;
 Mon, 16 Aug 2021 20:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JRlwFlcDVjkJ0Slv93hi05h1j6bycmC/7sCimj7TcY=;
 b=traR0Ycc5nagyUrXT84Ug3qENzOBIBys6Rz3e7a54d40hkzoR6U1jxh81n5n5xKpUQ
 yLO+QIOGxT1d/xj7wBsu/LKuGTHKk5h9Pgztm1XAaLPIaFlFbUWsqrIckTBVQE/04l9e
 kBGUQmhZ4C0xzE0Qso+FWPQhRqX4DAkhR+jXYenWZGgcSmdPmfihIYLe0Y+0YHgsUdPW
 UN3BYvBe3bDAx6AGziCM2cD46LGuCTlJBz8OGnGwOuRIXCmErjO0+S/2yrcZBHMszwfv
 UTgDLvkUc30Rua72advJEb1wSkHEC1mNqywS/F9BaezpIbtp7XQwTloAQzL3tcHpHp09
 dtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JRlwFlcDVjkJ0Slv93hi05h1j6bycmC/7sCimj7TcY=;
 b=eNDH9zhMWxrLXzczYizeG7k+0vZEL6W67p7dDlvQfhGNjs9woV1uUKtHPnmk1hqmD+
 cPmB0DKjpQ2IL9zAigMbfOqqshi8EHxIq8YTDNom7PqO/aD3XMacAdvu++ANTnXnd9yE
 UFGhU8lJE14Yukv7fa5O9Fujf0BzrvHQHCS9PdEn+eay56jDv40g41jfuheoSr1p+xxG
 f4WYR7UBf3IU9NCZILzN3Ta6Q0Z52e9iQJ17RrqcJhENpFgH1HbVpBrsahZk7l+9c5mV
 wNvxJZhjEE6iRTJQyZNZDfjRCx98JjtouQc2qD9jpkYy8wavr3MdDC+T9d/GrVtxtz5Z
 ivmQ==
X-Gm-Message-State: AOAM530j77xluUfr9ly2xBr9C85mRl2un0QkciWJZWcrjyuKXJM3z8RN
 QPmtJIJ/CjmeOqHW6SyC+6LK1LAO5ggNXJjdKeA=
X-Google-Smtp-Source: ABdhPJz9jC+2Uq1Y6juuBPz1jXGIJx8LIgkh6qwZT6nZkBG3XouC2xYSsaYhotIpAMTmr+0wl/wTNC0FBfyAbUu+4gA=
X-Received: by 2002:a92:d3cf:: with SMTP id c15mr884885ilh.131.1629170672480; 
 Mon, 16 Aug 2021 20:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210816183655.18492-1-david@salt-inc.org>
In-Reply-To: <20210816183655.18492-1-david@salt-inc.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Aug 2021 13:24:06 +1000
Message-ID: <CAKmqyKO-0OmKO=8PZE=gJavXB_cBt2vQoMRwqxpKhA=9dLOWLA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/sifive_clint: Fix overflow in
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
X-List-Received-Date: Tue, 17 Aug 2021 03:24:36 -0000

On Tue, Aug 17, 2021 at 4:39 AM David Hoppenbrouwers <david@salt-inc.org> wrote:
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
> I wrongly used `MAX` instead of `MIN`. I've amended the patch.
>
>  hw/intc/sifive_clint.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> index 0f41e5ea1c..de47571fca 100644
> --- a/hw/intc/sifive_clint.c
> +++ b/hw/intc/sifive_clint.c
> @@ -61,6 +61,8 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
>      /* back to ns (note args switched in muldiv64) */
>      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>          muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> +    /* ensure next does not overflow, as timer_mod takes a signed value */
> +    next = MIN(next, INT64_MAX);
>      timer_mod(cpu->env.timer, next);
>  }
>
> --
> 2.20.1
>
>

