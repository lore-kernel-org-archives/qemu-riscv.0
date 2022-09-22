Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obU1Y-0006Sx-2u
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 17:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU1T-0006PB-Js; Thu, 22 Sep 2022 17:46:23 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU1J-0006Kz-J3; Thu, 22 Sep 2022 17:46:11 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso6389700pjq.1; 
 Thu, 22 Sep 2022 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=yyJXb7FcyqwfPPqcCEUifYdsKZjNZ0aKpR1SalwKPDE=;
 b=fut0d33N2llfdXrDJz1y2RLHJR6BwCN42H+AJFx85TINg5zb/sWnZdjREo6BLmX+9w
 8sMHplVpENNl30OTatj4i66jKkgP3J2iQ+3Mlzk8VTrS677nu1AzylkiSOZZymoQQwiK
 SQet0j3su3uhkQ8XeQicLZnIFin1JWTk7N3nMJQ0IINfRLiLHkNXKOw+DHtB7B5iLl6t
 BfozGZKxrkcB+ub4J0mPgzWcaTuQ41xd/zT58HoTP4MMPNyvaO82aQlnPq8C+D146IJz
 SgC2uGh80tauVNnZC8i2yLHjd2l3bbAkjaXfgJ2I+yEJY3295j/SNNceFCPKyRPAF/1K
 Uihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=yyJXb7FcyqwfPPqcCEUifYdsKZjNZ0aKpR1SalwKPDE=;
 b=z1CQ+JcYaLkL98l7UbBgRiJ3ZpA4uynHDV53+OrI5cNlzzljUn1iBY4mtSHtuHB9c2
 8dyNyyo3GyWGauZUWTztmZ4z9aL+zcqpPvwiKLsqwFzjG8Mm2G+OiHefyzj1oNTQQlba
 bMs67Utz0tMfP5Zai2T3ve8aXzeHcoDgQcPAt/nyDcBOma0HHp2f67O9rO5XnQPCgLfM
 PMLaIZhB7DQzUMkmExUyUKOEKd5XyKPfH8sw4P7qTWipMNh8zhTvnM6yiZEkKIbFtweo
 hn5cW9X11dq8hFTkCLEnkn3ngrqYmcVEuLqAVLLvdgrgETkrJcF7HJjdGRXq93WXnvy6
 Ggyg==
X-Gm-Message-State: ACrzQf0shlnYUDjSA1yFTbIbKGfn4b6T5oeOqffdg9847GYbkg1RZ9hL
 tuCpDLiJZqwCwKPi+oDWjVM=
X-Google-Smtp-Source: AMsMyM4duImPOKBBB9trIHubNNrpv1YGHeidoz8FrY+CU0dqoCloNpJkKXy3ApQnJKKw6/L3Gd0Tjg==
X-Received: by 2002:a17:903:2290:b0:178:272b:e41e with SMTP id
 b16-20020a170903229000b00178272be41emr5224740plh.48.1663883154550; 
 Thu, 22 Sep 2022 14:45:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a21-20020aa794b5000000b00537a8d2c2easm4839301pfl.80.2022.09.22.14.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:45:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <99d260b4-2e06-e64b-48b0-f1ecbec8b39b@amsat.org>
Date: Thu, 22 Sep 2022 23:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to
 mtime
Content-Language: en-US
To: Tyler Ng <tkng@rivosinc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <CAB88-qOuB+uR6epr7h5F76A9qNOB358WikXDfmpvn-ceW71p7Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAB88-qOuB+uR6epr7h5F76A9qNOB358WikXDfmpvn-ceW71p7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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
X-List-Received-Date: Thu, 22 Sep 2022 21:46:23 -0000

On 22/9/22 17:58, Tyler Ng wrote:
> 1. Adds fields to hold the value of mtime in timer_upper0 and timer_lower0.
> 
> 2. Changes the read and write functions to use the mtime fields.
> 
> 3. Updates the value of mtime in update_mtime() by extrapolating the
> time elapsed. This will need to change if/when the prescalar is
> implemented.
> 
> 4. Adds a qtest for the ibex timer.
> 
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> ---
>   hw/timer/ibex_timer.c         |  98 +++++++++++++------
>   include/hw/timer/ibex_timer.h |   6 ++
>   tests/qtest/ibex-timer-test.c | 178 ++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build       |   3 +-
>   4 files changed, 256 insertions(+), 29 deletions(-)
>   create mode 100644 tests/qtest/ibex-timer-test.c

> -static void ibex_timer_update_irqs(IbexTimerState *s)
> +/*
> + * The goal of this function is to:
> + * 1. Check if the timer is enabled. If not, return false,
> + * 2. Calculate the amount of time that has passed since.
> + * 3. Extrapolate the number of ticks that have passed, and add it to `mtime`.
> + * 4. Return true.
> + */
> +static bool update_mtime(IbexTimerState *s)
>   {
> -    uint64_t value = s->timer_compare_lower0 |
> -                         ((uint64_t)s->timer_compare_upper0 << 32);
> -    uint64_t next, diff;
> -    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> -
>       if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> -        /* Timer isn't active */
> +        return false;
> +    }
> +    /* Get the time then extrapolate the number of ticks that have elapsed */
> +    uint64_t mtime = get_mtime(s);
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t elapsed = now - s->timer_last_update;
> +    if (elapsed < 0) {
> +        /* We jumped back in time. */
> +        mtime -= muldiv64((uint64_t)(-elapsed), s->timebase_freq,
> +                           NANOSECONDS_PER_SECOND);
> +    } else {
> +        mtime += muldiv64(elapsed, s->timebase_freq, NANOSECONDS_PER_SECOND);
> +    }
> +    s->timer_lower0 = mtime & 0xffffffff;
> +    s->timer_upper0 = (mtime >> 32) & 0xffffffff;

Could use extract64(mtime, 0, 32) and extract64(mtime, 32, 32);

> +    /* update last-checkpoint timestamp */
> +    s->timer_last_update = now;
> +    return true;
> +}

