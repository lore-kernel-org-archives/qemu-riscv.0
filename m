Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opJ5e-0007Y0-04
	for mharc-qemu-riscv@gnu.org; Sun, 30 Oct 2022 20:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opJ5b-0007Xk-RF; Sun, 30 Oct 2022 20:55:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opJ5a-0005mu-7J; Sun, 30 Oct 2022 20:55:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id b11so9107921pjp.2;
 Sun, 30 Oct 2022 17:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rgG1Ldr0XoLz1BbBGOo5LCY8RORshy9ORtNKdZkw5sA=;
 b=nS4OSx8/BHEtyEF29/trFbisJtk0p2KdU5nLUjoO1jK6Ni5rUEU2/4ylTgD2xwe4MC
 4OK1yI4WAB1XS0rIxjE+kg31AjmrapAd3kostyhdBh5V0MZLrxfGuA2jQyUs/r7SZ0N0
 VCtIQZ0htJXZqA4Ca7dcJ+V3Q075D2mjTLRDXQe3KuwO01mJVtwjnw6NnKItj6crQ0hO
 cXYZQK+lgavi4n2YlqhcCwnLxpBdBDHx/y7LRPPUfW8LEOrqmydJv9vr28mq4URqLKIT
 dlbz0Lu2TQZ4cwNmRnWTQUJxjLH7rMye420QD3YOZfMXPg69Wi7N5guIiMj6Ea9KdCql
 HMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgG1Ldr0XoLz1BbBGOo5LCY8RORshy9ORtNKdZkw5sA=;
 b=JDlJwzDk6y/kZNEj6JotP9dgDMZd9yBprELh8KBbSP95HyU+opUBGnubB4dzol9+aK
 mtQ7O+2cImd/ZBjr6JTzVHmr5+plp1+luR4P4soFQWIoiUqu1C7WCFKm5dH44gXEO5N+
 4FbGowsCwYaJo18/z8lIeM8NVI2rZl+Nc6/vOQwD8aKe4i6TReZ+guHNaLwXS8IxjZfe
 QNavFAbvb4/fzjk6jwZA1cTXchvMGv/KbSVTdI8+O5aDnHhaRgZadFeO3F0xx7F9ec+I
 URBnLwrLiChhR+Bl+VJdAWb8dqXp+kcGYKVgiCWAWbQs9/MbjIXQDMNTew7DYLaKsiU8
 WnpQ==
X-Gm-Message-State: ACrzQf0g9eVKlNrV0lMM8oYaeudlgpEJ5bYyOT6+WCU0pDlalup/zx2H
 Lwmx2uTTR0CSRKCGX1qhf2l3YZSMRn3CPUvHE5M=
X-Google-Smtp-Source: AMsMyM4eB1FTFZqWIjcSbu5R2Ih02nXukrDpen8ru06a3FY0LSBOwckUD1u4o+tV1kZkOYfTWr1R93HpLRYReh+lIOw=
X-Received: by 2002:a17:90a:2d8b:b0:213:b314:4652 with SMTP id
 p11-20020a17090a2d8b00b00213b3144652mr9743039pjd.96.1667177740365; Sun, 30
 Oct 2022 17:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-5-apatel@ventanamicro.com>
In-Reply-To: <20221027164743.194265-5-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 31 Oct 2022 10:55:14 +1000
Message-ID: <CAKmqyKNWdJCQvT-5ddjQBjwMJ=uqBZv_+zG7TSAwqAS1p8oTkQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Mon, 31 Oct 2022 00:55:44 -0000

On Fri, Oct 28, 2022 at 2:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The time CSR will wrap-around immediately after reaching UINT64_MAX
> so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
> in riscv_timer_write_timecmp().

I'm not clear what this is fixing?

If the guest sets a timer for UINT64_MAX shouldn't that still trigger
an event at some point?

Alistair

>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/time_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index 4fb2a471a9..1ee9f94813 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -72,6 +72,14 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>      }
>
> +    /*
> +     * Don't re-start the QEMU timer when timecmp == UINT64_MAX because
> +     * time CSR will wrap-around immediately after reaching UINT64_MAX.
> +     */
> +    if (timecmp == UINT64_MAX) {
> +        return;
> +    }
> +
>      /* otherwise, set up the future timer interrupt */
>      diff = timecmp - rtc_r;
>      /* back to ns (note args switched in muldiv64) */
> --
> 2.34.1
>
>

