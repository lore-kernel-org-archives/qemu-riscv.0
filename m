Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqk1B-0005v0-VI
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 19:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk1A-0005rx-Cn; Mon, 16 May 2022 19:20:48 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk18-0006RR-PS; Mon, 16 May 2022 19:20:48 -0400
Received: by mail-il1-x12d.google.com with SMTP id e4so2331759ils.12;
 Mon, 16 May 2022 16:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CIb0iZE3IChyYenSRF0h1ZzcuqxDmlEqVytPONWfDvI=;
 b=oMkSCswr8xVLy9KQt8QaKRYZ4g4Ko3VwvPe45aFUd7ESTke1k+60xQoBAeSPOlgl+w
 4sesVJVx2huo9L1O3wDmXtJJ+dim7IR9XIexKVHxhs4wSJGbzJ6BqfBuE9NloqCFyIkv
 BiS3FzH1q/2HcKHmxhFzE+LONKpw2sJmvT/QNN4pAWEU+sd2rnIB9CnORun2Rmi4lVLc
 pWzuOS71VciX4PNhW+kAfyTBRlzyli3k2UoDFUQ8WR1qR1P3/crLgY+QubEymCPsnlQq
 Vm8Fze6tz/bG4W4oE6NgrmeQgm2xgNF80XKFCddHnNsIHya1MGzWKlaHSmzc+yxiAJ6u
 IMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIb0iZE3IChyYenSRF0h1ZzcuqxDmlEqVytPONWfDvI=;
 b=naQFEHwI4HSukCCW61bDA06x0xIrQyceD93TLAaj+6up8e4E95SMlawprrF3jSG6PU
 zKGNOwG/sH4PPyByhnnXMjvaQON1plES4h+OQwwJgw+Lqbj87fm1L5AIv+yj9Y06FMi5
 F8+nx+nuZb50hitywRX6Gfh+EplvUIQxqEYL89IuK37A/uZJIM2m4BPmFUINNvqi134D
 S0EralIzCT4aYfiGIglY+AReIEmwXudGDJBTtxvgfpht+95I/AnWc8CqrDPJiQrd2XSB
 8kf2GsgZMsbVyeZ5e6SqiYS0QSjfzby3ZvU9d0z1iEPx8piUIqsUk6CGazoCw+6wwZRU
 UjuQ==
X-Gm-Message-State: AOAM532PU0vOWe7GQoaRWATbx2Vfz33/n1XefJdce2LZkesFElIFjDH6
 VsSuHXgv5jZLMcybH7IUdJg5uOX912BdHxpxLFEaRkV+EJY=
X-Google-Smtp-Source: ABdhPJwgJRZXyiIaCXc+Fmt/w2c4KZR0jQLc0UPIDWgW9Ss2kamextF5lFW5ER05DWmEc2WOL6HzJaS0Fz3r5eE4p5s=
X-Received: by 2002:a05:6e02:188f:b0:2d1:58f:41a6 with SMTP id
 o15-20020a056e02188f00b002d1058f41a6mr7511356ilu.86.1652743245067; Mon, 16
 May 2022 16:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652181972.git.research_trasio@irq.a4lg.com>
 <7c1fe5f06b0a7646a47e9bcdddb1042bb60c69c8.1652181972.git.research_trasio@irq.a4lg.com>
In-Reply-To: <7c1fe5f06b0a7646a47e9bcdddb1042bb60c69c8.1652181972.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 09:20:19 +1000
Message-ID: <CAKmqyKPMnPKj-scsUhtbkX0cN0QCtWmfPiZJNXNp-QCD+JG3pA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add short-isa-string option
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 16 May 2022 23:20:48 -0000

On Tue, May 10, 2022 at 9:29 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Because some operating systems don't correctly parse long ISA extension
> string, this commit adds short-isa-string boolean option to disable
> generating long ISA extension strings on Device Tree.
>
> For instance, enabling Zfinx and Zdinx extensions and booting Linux (5.17 or
> earlier) with FPU support caused a kernel panic.
>
> Operating Systems which short-isa-string might be helpful:
>
> 1.  Linux (5.17 or earlier)
> 2.  FreeBSD (at least 14.0-CURRENT)
> 3.  OpenBSD (at least current development version)
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 ++++-
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9f38e56316..4db3dce25a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -879,6 +879,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +
> +    DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -1049,7 +1051,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> -    riscv_isa_string_ext(cpu, &isa_str, maxlen);
> +    if (!cpu->cfg.short_isa_string)
> +        riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe6c9a2c92..f5ff7294c6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -425,6 +425,8 @@ struct RISCVCPUConfig {
>      bool aia;
>      bool debug;
>      uint64_t resetvec;
> +
> +    bool short_isa_string;
>  };
>
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> --
> 2.34.1
>

