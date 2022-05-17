Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlFy-0005uO-6Q
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlFw-0005rk-9b; Mon, 16 May 2022 20:40:08 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlFu-0002Wh-9c; Mon, 16 May 2022 20:40:07 -0400
Received: by mail-io1-xd30.google.com with SMTP id m6so17809611iob.4;
 Mon, 16 May 2022 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IbpqT9t2HN/X2d5+T1xjUlIzsoZ+RtzmfdilGpTv98=;
 b=RRLOw8Av6PocYEb1E/oU4CbnLWfEfr/6aaE5S8UKWCHd9Gv7spuXrVSLdYAsUuiGBY
 oGfi5ORdED8zwFXUpWgaRSd1SlHsVInzFo8DTGJycHejNbSk1RJGcY6V4waimUN8VURY
 fQr9uSbgabayTWbtl3qBvKdyXO3cx/IpW3GX1J2vGAmKLUKVcDxG0PnMI2RU02j8enRG
 3WYFVLAHW/32iWvI8WYNlUmD6Ez3sndJ99CHQ/4WVOZ1N4hNzaUtqad+cnwQam5q4OzI
 NosdqEfX2hb4ZXxlivam+KECdpHekA4e7gRRScMh/aTRqi8uiynrVUC6EDmmE4CF7qtP
 S5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IbpqT9t2HN/X2d5+T1xjUlIzsoZ+RtzmfdilGpTv98=;
 b=NvHccc/wSbOr34yobjDuZqwz9InUNzCMJckBkhK9eLYNmlf+H3DsTzoHXhaQMEHADG
 56m8BsyjTuk/rKde6Yd/eVjYORwmWkQFzG5NEs1ue94HmBLbAQkmQNC4mnBQ54BZfiZN
 PlQ5Ekr4PpYNweEXDYsCBwyfvFtc8GgCyEIzCLZ5nSkk5dL2Hxlo2b0dvbpGhlYoz49i
 rrcaEeSyGqtM5uUW6QtY+odJH8yifdZxYsv1kDgxpfm6gZuJjDbS1HdzwjzzvIHi3QZt
 QPT4WprjqchAZXE6xzMJvKNNjwPyoq6vkatGX2dB+eBXUJI0WBwmt/SKoai7+OXM/mDZ
 Cpuw==
X-Gm-Message-State: AOAM533HdCO7uGHDsr50DwJHPZGRTOyFt75ueGo/7QjMZV+cT/GS92IX
 Sy+BU6x0XXTt7rEsBf1ls6cUAD7Md5sqCdfAThE=
X-Google-Smtp-Source: ABdhPJz/h4xC9WRnuCNlNRgtkM+RvmKAgdhAKgctPZr5lQXv9NGkpEKUSesqwpjEvLz6jwjh4MXelPjW/rcQ1pnKt7k=
X-Received: by 2002:a05:6638:190a:b0:32b:95b7:4e64 with SMTP id
 p10-20020a056638190a00b0032b95b74e64mr9995205jal.212.1652748004944; Mon, 16
 May 2022 17:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <def2b95c85943a5a2fa7406dcafbb82fe78bceb4.1652435138.git.research_trasio@irq.a4lg.com>
In-Reply-To: <def2b95c85943a5a2fa7406dcafbb82fe78bceb4.1652435138.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:39:39 +1000
Message-ID: <CAKmqyKPy+E2ABMPnWfEBd2ASy8u1bZ7RC1HtwsK=EHfAjozfhw@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/riscv: Disable "G" by default
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:40:08 -0000

On Fri, May 13, 2022 at 7:46 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Because "G" virtual extension expands to "IMAFD", we cannot separately
> disable extensions like "F" or "D" without disabling "G".  Because all
> "IMAFD" are enabled by default, it's harmless to disable "G" by default.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 00bf26ec8b..3ea68d5cd7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -812,7 +812,7 @@ static Property riscv_cpu_properties[] = {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> -    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
> +    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>      DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
>      DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
> --
> 2.34.1
>

