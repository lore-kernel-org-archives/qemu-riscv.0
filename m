Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWG90-0001CY-Lx
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 07:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWG8z-0001Bp-3n; Thu, 08 Sep 2022 07:56:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWG8x-0001eI-9P; Thu, 08 Sep 2022 07:56:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso2170023pjd.4; 
 Thu, 08 Sep 2022 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gM8TvyE7JT6tjCcbavNeN6EGNBBQI2oh2kvYMGfrss0=;
 b=EZ6l96cImOXkC0vpmLqwr6PLC568ahjTeodl+O6BbSIUVrYmHiDBb2lnSgUK82Sntc
 7n9IoxhQ+LXFLOYmZE9nLQEzwIg81/nwsum1IeStr62+k+6Iql4xYSJa5TgmE+CSoeKm
 OK1VfaEsXvM8RPCa26ydO2/X7eEhSCkL6VEVc2Zji4inY9V9PA8DIQa1xHBmxOiSsMzs
 6IQcssS0KfEwc8qs/mpyMIPE6FBClS6b350sKRt6shijmRhNEoO95FJl+dozNPrYhGrM
 P6XgH1CeeZLlE/+I+/RB9hvc5qSjv4Y/gBkFSCOyKkbniIO5/Ih/EFgw58yNpWCsH3uB
 ibVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gM8TvyE7JT6tjCcbavNeN6EGNBBQI2oh2kvYMGfrss0=;
 b=gKhnZb/YwKio0bEOOnScnpxOuGQrmMU8bd4541au37aMHqg3IAKSctpvibQYORGDJl
 WBvWb3xysSIraEFppNUVgDJfDjPxQI6Ar57Dm9Ev/mujy3V0b9GqVPrtPKviG9OMplA3
 W1W5C/Lz/9cKSVC+hVSO7WRzHelDs8icmNj+P+0Ychw8ANgI7J11vQ0NnCobP7SRtKLn
 AQzHuPtr2LdWgV43tFprA5rAfIhtHZ3fQ/7jrFCBz1SJIvmd5McWTCF6hD9CdhjOveIY
 FiEstXt5p0/N8ZJkcH+pWdLbVteeBzFEuaAl7ZammFKYUP+JMXKzl6N+QU6gETU6vSrR
 Zobw==
X-Gm-Message-State: ACgBeo0JCo5uHXwQtbAfqitXnpIU3fx7NBFqBAnzhuFVK3Z0mVZZsY3C
 GTUCNetSgLmpjwEDH8gbAaL87SOROFrcsjrs7OQ=
X-Google-Smtp-Source: AA6agR63IvN8FYFYTqlDGkT/11DAWYNN8T9POoz3aQW1fekTNBmN4Zd0RVS2MUCLNrfZiFCEsgAkBP3HPvPYG6PLFlo=
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id
 m15-20020a170902f64f00b00172a790320amr8690971plg.149.1662638183621; Thu, 08
 Sep 2022 04:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPZr7G8Lp0Q=851JSFyb5v7ub5Hi4DaD6mVQKZxFt5UOw@mail.gmail.com>
In-Reply-To: <CAB88-qPZr7G8Lp0Q=851JSFyb5v7ub5Hi4DaD6mVQKZxFt5UOw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 13:55:57 +0200
Message-ID: <CAKmqyKOCeBU5yZkW7d90vFDvL_n+M1KKSGexDZ59DN1LiY9mww@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/timer: ibex_timer.c: Update register addresses
To: Tyler Ng <tkng@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Sep 2022 11:56:29 -0000

On Fri, Sep 2, 2022 at 3:24 AM Tyler Ng <tkng@rivosinc.com> wrote:
>
> Updates the register addresses to match the OpenTitan spec.
>
> These changes were made in this commit:
> https://github.com/lowRISC/opentitan/commit/a25e162b8f91bd0ca32258c83d1d480f93327204

Thanks for the patch

We try to keep all OpenTitan devices in sync with each other. QEMU
currently supports OT commit 217a0168ba118503c166a9587819e3811eeb0c0c

We don't want to update a single device without updating all of them.
If you want you are welcome to update all devices to a newer commit

Also, the commits QEMU supports are generally driven by Tock, as
that's the software running on QEMU OT. Have a look here for the board
https://github.com/tock/tock/tree/master/boards/opentitan or here for
the latest update (which QEMU already supports)
https://github.com/tock/tock/pull/3056

Alistair

>
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> ---
>  hw/timer/ibex_timer.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index 8c2ca364da..9ffd4821e8 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -38,19 +38,19 @@ REG32(ALERT_TEST, 0x00)
>      FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
>  REG32(CTRL, 0x04)
>      FIELD(CTRL, ACTIVE, 0, 1)
> -REG32(CFG0, 0x100)
> -    FIELD(CFG0, PRESCALE, 0, 12)
> -    FIELD(CFG0, STEP, 16, 8)
> -REG32(LOWER0, 0x104)
> -REG32(UPPER0, 0x108)
> -REG32(COMPARE_LOWER0, 0x10C)
> -REG32(COMPARE_UPPER0, 0x110)
> -REG32(INTR_ENABLE, 0x114)
> +REG32(INTR_ENABLE, 0x100)
>      FIELD(INTR_ENABLE, IE_0, 0, 1)
> -REG32(INTR_STATE, 0x118)
> +REG32(INTR_STATE, 0x104)
>      FIELD(INTR_STATE, IS_0, 0, 1)
> -REG32(INTR_TEST, 0x11C)
> +REG32(INTR_TEST, 0x108)
>      FIELD(INTR_TEST, T_0, 0, 1)
> +REG32(CFG0, 0x10C)
> +    FIELD(CFG0, PRESCALE, 0, 12)
> +    FIELD(CFG0, STEP, 16, 8)
> +REG32(LOWER0, 0x110)
> +REG32(UPPER0, 0x114)
> +REG32(COMPARE_LOWER0, 0x118)
> +REG32(COMPARE_UPPER0, 0x11C)
>
>  static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
>  {
> --
> 2.30.2
>

