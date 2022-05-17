Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlGy-00073Y-JV
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlGw-000705-Oi; Mon, 16 May 2022 20:41:10 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlGv-0002qb-5z; Mon, 16 May 2022 20:41:10 -0400
Received: by mail-il1-x131.google.com with SMTP id l15so11667322ilh.3;
 Mon, 16 May 2022 17:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9tvmbJnwsSsO8fwubAIw7zgCpsADcAQ+1Bj+93SZO9Q=;
 b=e1KkZTHHSnhu33a+/dx8SNxQt74J9XheULmHFoZKtJKb4Q6i241JRPzlcQiusmM0yd
 y5MM43NZ7qBZtSeoweVREAPeXFFUbz+FDBRZDL+dSBsSkI+hpud8Crpfu3BTMj9PMw5q
 AexmARL53JXsyYtxDf55BjwLgzCOWDfrEXd4QJMk/vVsNgOB120bEnQxvRiwEGhbZUwC
 lAav6hSGvmkLXFZwM23h2FsmlurgOzcmJLblYgeqNCqfb6L0ShOBJc91R0+eIcL3J2nz
 nUdAAWbF6GKx1y+kCONEeHMcwd96bCPZALCNW6UJitils27HvwVC4hlR0knUF1T0dfXF
 4zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9tvmbJnwsSsO8fwubAIw7zgCpsADcAQ+1Bj+93SZO9Q=;
 b=wqwJo6QSNfptN/HHov+CdxX7ICb45Ohb+kI3arPOwZxA4flog0WSjnu4mcOSEPs+gF
 4KqmCTY01CaG3TzvbfbO4JUX7usK1rdFNKQMjuZzt5CfENLxG9M/NfZUESmcIWOQmFB7
 OaHvGIMHKjKaI4GskWO1QYSe3H0VK9ip4UezMUivhQ0x/ErbTm+1J/S4iaINZdfWNbsP
 MrM1qyM2Uode5pzgdRF63Z2GqVF0d51773wfoj764A5CvMVT/AI1dUGfLjZRzjlfQVNb
 3ug8TtPr0SB5bP4thIDpBJ8njQVSw6N5032ZR/J6PAPmew8EjxgHClqX8fv27AFythLg
 VCpw==
X-Gm-Message-State: AOAM530A7otlbHIqD82Gn87jnKuvqaIT44E6KprpWQIdaoOnxI49MvUy
 9CqPCyuu5qwcLvj9v3Yioa4OcfoE5wrf6V1oziY=
X-Google-Smtp-Source: ABdhPJxdL5mdrCAOoENJcQLZZUpj5lkvGSO/s66jpwL2ipuPDbFuhpINbvdUxvAU4FGp2iYcs7sEQVN96lUQxsp8mPU=
X-Received: by 2002:a05:6e02:170b:b0:2cf:9f8f:afdf with SMTP id
 u11-20020a056e02170b00b002cf9f8fafdfmr10824997ill.260.1652748067769; Mon, 16
 May 2022 17:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <d1b5be550a2893a0fd32c928f832d2ff7bfafe35.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <d1b5be550a2893a0fd32c928f832d2ff7bfafe35.1652583332.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:40:41 +1000
Message-ID: <CAKmqyKMzdFBXqPBjLgi5sj96RJgbR2H71FxQiCy2vLaFrwanzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/riscv: Change "G" expansion
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:41:11 -0000

On Sun, May 15, 2022 at 12:56 PM Tsukasa OI
<research_trasio@irq.a4lg.com> wrote:
>
> On ISA version 20190608 or later, "G" expands to "IMAFD_Zicsr_Zifencei".
> Both "Zicsr" and "Zifencei" are enabled by default and "G" is supposed to
> be (virtually) enabled as well, it should be safe to change its expansion.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3ea68d5cd7..0854ca9103 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -598,13 +598,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>
>          if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>                                  cpu->cfg.ext_a && cpu->cfg.ext_f &&
> -                                cpu->cfg.ext_d)) {
> -            warn_report("Setting G will also set IMAFD");
> +                                cpu->cfg.ext_d &&
> +                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> +            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>              cpu->cfg.ext_i = true;
>              cpu->cfg.ext_m = true;
>              cpu->cfg.ext_a = true;
>              cpu->cfg.ext_f = true;
>              cpu->cfg.ext_d = true;
> +            cpu->cfg.ext_icsr = true;
> +            cpu->cfg.ext_ifencei = true;
>          }
>
>          if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> --
> 2.34.1
>

