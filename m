Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1no047-00087E-4y
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 05:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1no03y-00085q-VK; Mon, 09 May 2022 05:52:23 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1no03w-0004yW-9k; Mon, 09 May 2022 05:52:21 -0400
Received: by mail-io1-xd33.google.com with SMTP id o190so14698149iof.10;
 Mon, 09 May 2022 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7zdhBwpU96OGCH47JYXG18VWv/TAh8HCC+chtC5Cz0o=;
 b=AywzKIGsBqcv4cIT1A99LymxJ3GZJV9ouBYw4kk14J9DZvA40piu76PB83JEInTioM
 TG0mdpKF00U1b+YrVMYzrXt2t35LPbXGSOq72tJPU3QrRQa6iJI3yfeqixAxMTmcoDHv
 ab3qHu1CvXH43xqKnGqsJoYYWrjlM83UOS9FSeBYFjmEI8Wu5QaaTpuX0FXmusVbI9KN
 0OJ33YHhym9rwZm69VqjJFfNmcP+DPkvJ3diF2imhQn9VwXK45d3R7f4wBO7PPThoAvX
 85M8JlFucX3RvznwPibOiAF7aHNGgnUg313qjxr/EKmOj4DtCcRtaRBAKAOpLuR3o4fz
 jfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zdhBwpU96OGCH47JYXG18VWv/TAh8HCC+chtC5Cz0o=;
 b=jTZ0xMu4ztLfFbZtES4p87oyy2DT7mrdbc8+JugW41nY1iU359PPpYw1OvYdp6bN/O
 7++200zmt4UyrI5gP2XyoToo234IzY28dMpuKy1hZznEi67COi7Ag/11OOl+Pu289ca7
 KxU1NryzN2oUG+JBfSo9ZDUAagcApBH41J5HWpQSeXtsnJTr+iNEkUfx/vk95pKnhsMg
 7/a2/HH8/Co3L6uy6cWDp1TW01RRTCLzxTVV0mSDWhvpQL/RKjJ69ZYQ0Vfpt/T0H+gn
 iB5TS0c7WpcyU4h1+5Wcypbn38fBIXy4zNn+z9PTQjFc0zgJz20qfh3Wuu0J7GYhqafB
 3WRw==
X-Gm-Message-State: AOAM532mGV5nW/Pc4BgwJterfWQOe0m4ihnuk2EnvHUVeb1fHm2xW2Ri
 tZ87xPUwZgnIYQ9u88cF5eax1GC88By3V6cdE4emR3+YGiYxxZtILlk=
X-Google-Smtp-Source: ABdhPJyZnB1lzyGTsvsMVOxJIfJ3qAnpd5HDxdtCoe+xGEcdP0NPHxLwhj0arYBmfyEJkvldZqJIv/YdSwQDouUf7XU=
X-Received: by 2002:a05:6638:dc7:b0:32b:a483:16b8 with SMTP id
 m7-20020a0566380dc700b0032ba48316b8mr7099000jaj.66.1652089937094; Mon, 09 May
 2022 02:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
 <51c9f2ce37e6d1483317710ddd1e14be74a61e69.1650777360.git.research_trasio@irq.a4lg.com>
In-Reply-To: <51c9f2ce37e6d1483317710ddd1e14be74a61e69.1650777360.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 11:51:50 +0200
Message-ID: <CAKmqyKPw-qtNm3nnLx-ZtE2Z7P2K6E3AH3B633B4nYj2m_4fMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Add short-isa-string option
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Mon, 09 May 2022 09:52:28 -0000

On Sun, Apr 24, 2022 at 7:22 AM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Because some operating systems don't correctly parse long ISA extension
> string, this commit adds short-isa-string boolean option to disable
> generating long ISA extension strings on Device Tree.
>
> Operating Systems which short-isa-string might be helpful:
>
> 1.  Linux (5.17 or earlier)
> 2.  FreeBSD (at least 14.0-CURRENT)
> 3.  OpenBSD (at least current development version)
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  target/riscv/cpu.c | 5 ++++-
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c765f7ff00..9718cd0e7e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -834,6 +834,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +
> +    DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -989,7 +991,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> -    riscv_isa_string_ext(cpu, &isa_str, maxlen);
> +    if (!cpu->cfg.short_isa_string)
> +        riscv_isa_string_ext(cpu, &isa_str, maxlen);

I don't love this, the long strings are part of the ISA, it seems
strange to add an option to disable them.

Can you provide more details on what this breaks?

Alistair

>      return isa_str;
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 34c22d5d3b..5b7fe32218 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -408,6 +408,8 @@ struct RISCVCPUConfig {
>      bool aia;
>      bool debug;
>      uint64_t resetvec;
> +
> +    bool short_isa_string;
>  };
>
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> --
> 2.32.0
>

