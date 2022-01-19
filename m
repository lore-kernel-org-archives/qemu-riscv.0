Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1Xh-0005MW-NB
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:21:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1Xg-0005Jh-L8; Tue, 18 Jan 2022 22:21:48 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=44571
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1Xf-0002gO-5m; Tue, 18 Jan 2022 22:21:48 -0500
Received: by mail-io1-xd2c.google.com with SMTP id h23so1155514iol.11;
 Tue, 18 Jan 2022 19:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1J/Bp5+6N9bCAEx+sqRp4UoJOkinCqzS4GvwFmKa1I=;
 b=Ohaz2FB58VoWqgvOiCdbiinZ7adUUIGbWmNkqNbmE8wNAU545wvF3nanHr7y13y03b
 tcFpuqXDJ0GLL34ynRJFR02ICsbfo7Nl6LasoPm9rjv4CC7GRscIohmfgH+EGB5DsHPN
 T6HJGsciTdobnWU7NuDT8q+l7iVR2T5rPEKmBKD7OmlcNgsNT8ix8AxL8n+jObiUnlWt
 s0v4GDajLTlVLqB9v6bf7L8qKK/JhWCLRTqkkrAyKGst1A157xy/wI/X5oXmw9Dcnfvb
 lsPrxMh/7ch8+nfBbvBKLhEfz0wU27dN2j9Z+miN40wF9zKlFxfgnbv2TL/zVmr+CR3L
 QnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1J/Bp5+6N9bCAEx+sqRp4UoJOkinCqzS4GvwFmKa1I=;
 b=zO2m+xQogxV88UBr1sdVV+RKk/IYaGvwSbslOhZmpznrA5VqNq2ffEHRvTp0NIG/HU
 irC+0I90+mWuwTGs6/3DnTMBL0jTLmRVHIlywgMJBt4hIsiRkLJlsEYpuirTze1qIpUe
 t6wl0aQhb9ClvAP8ZGKRTVtVyrEcCJq6smOo1EGeS2rLMK1ML46nBBPk2bZg50uXWFq1
 ReDdRj03zAUKRbhW2/uXl1lI3GaQstcWi8Cq/Lmt8ay13rUTe9Gwtmg+UglWEgcHHLxN
 Amvk5njYb3r2lpwSNqF5jHACeQXvZp1Z8zOYOo8rQmavRmurnYn0jwvDgJzfLUuxwvgf
 F3NA==
X-Gm-Message-State: AOAM532PDk3HSfmde3KbcZAk7Y1IqFKi490ylv6Zr0UMdewZ1y+4C+JC
 tx+jKKzJ2QEnwxOea7fUBzEi0I0UA+c+mych4+w=
X-Google-Smtp-Source: ABdhPJzN17t9D0NfccYW1Y6I7iYw7CuQ25i1DrQ9KyUaVQoM1ZFVjdxSnxh1pMtazQsM4OnSfyZqC0j+4lfpct5JPoU=
X-Received: by 2002:a02:6954:: with SMTP id e81mr13212488jac.63.1642562505726; 
 Tue, 18 Jan 2022 19:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
 <20220113114004.286796-4-zhiwei_liu@c-sky.com>
In-Reply-To: <20220113114004.286796-4-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:21:19 +1000
Message-ID: <CAKmqyKP5EyPV5tn9pZOXaMsYRKOCG-5AoCZrusnK1EPCDMqxxA@mail.gmail.com>
Subject: Re: [PATCH v6 03/22] target/riscv: Sign extend link reg for jal and
 jalr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 03:21:49 -0000

On Thu, Jan 13, 2022 at 9:45 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 4 +---
>  target/riscv/translate.c                | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 3a0ae28fef..b9ba57f266 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -68,9 +68,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>          tcg_temp_free(t0);
>      }
>
> -    if (a->rd != 0) {
> -        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
> -    }
> +    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
>      tcg_gen_lookup_and_goto_ptr();
>
>      if (misaligned) {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 615048ec87..b47b308920 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -367,10 +367,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>              return;
>          }
>      }
> -    if (rd != 0) {
> -        tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
> -    }
>
> +    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
>      gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for safety */
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
> --
> 2.25.1
>
>

