Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMezH-0001wy-H5
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 19:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMezF-0001wl-Gp; Mon, 30 Jan 2023 19:59:01 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMezD-0008RF-3A; Mon, 30 Jan 2023 19:59:00 -0500
Received: by mail-vs1-xe35.google.com with SMTP id i185so14504031vsc.6;
 Mon, 30 Jan 2023 16:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5YrtKzsIEeu5HdmG4qgzqGUF26ZFDk0oYv83WILhxi8=;
 b=j+RyWNnNkiP+lkKorHw8bnRYtyPl8I1dvW49wFQgwoDuSzuldlrS96+2D+gnKknPua
 d4ZpEkVjpdw05wKhOefA3jR1GGYTzk+x6oBQBSIP+JaGDv8/3+QzTnzFJiGlw5wMByld
 7WT2tnOqTYrhrUrhjBcpFGtIQiLEt2ym+jbenRGD+/JNwMRi2Djmq1thI/enteFjRLeG
 ratF7Tr5oj0Xfsv2Le/bYryTEhwi6DFeYS08dcyh7YrxTgA6oo/4sEYZXLnVINKn3uyu
 vVtP8tcUOyiKphUhr+npnNjaczb0xgRMGfKci4euaQgp4DfYCHEXhuvhnvsm98xqL2AM
 owGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5YrtKzsIEeu5HdmG4qgzqGUF26ZFDk0oYv83WILhxi8=;
 b=qL6kmyR2dXVd9uqW9+ZBbdZki6pqwJuFPdUpejsBRnlTZzfsNXVogH7pbMEPn9kGBx
 DQJyKwrLSXJAyYLsRHPJeFZt1L4RbhJ21gnSB/N3F59ELQDY07zLT/ZTrULJXDGsFU90
 Bp3uaWRqpVAJSz6wMHU9yMIQFN/LFlnIIXPqhCvq8Rf171NGbrO3f4Op/8cdBISlXNGy
 6hYnHiDiwSa5Bp81QOlivqrk3jZwS5X/y0YS3kn7IltozFwNvWYPU4gbesOiitDQCBic
 By7Jg7ngefiYnB2i5Q44oNMeLJnFkHpcB3MqyYLeO6wr9ihTDb1zXaM7nh74GVlocdcL
 D5Sw==
X-Gm-Message-State: AO0yUKXbhLn/kt0U+EDPLZ+RipKRJgHhMYTOqC5D3A47Z25C6ZNyVKdQ
 5RDPK/U9EhSx4BHQEwBL6wObmdRXpNaliKaq+AI=
X-Google-Smtp-Source: AK7set/5rSg1Js6+z3K9YrBNm0pAqs/LJ9/fO73XS4DxfAuOMG/w5cWTAfIwTgkB6ZrWwLvl5hwiuT1LI6E8CJeJYUQ=
X-Received: by 2002:a67:e184:0:b0:3eb:f205:2c08 with SMTP id
 e4-20020a67e184000000b003ebf2052c08mr2229609vsl.10.1675126737458; Mon, 30 Jan
 2023 16:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20230130100757.721372-1-geomatsi@gmail.com>
In-Reply-To: <20230130100757.721372-1-geomatsi@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 10:58:31 +1000
Message-ID: <CAKmqyKMiP9N8CX844++qb+dFFn46Peic87P7-5dJrRfLAyM4wA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: set tval for triggered watchpoints
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 00:59:01 -0000

On Mon, Jan 30, 2023 at 8:08 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> According to priviledged spec, if [sm]tval is written with a nonzero
> value when a breakpoint exception occurs, then [sm]tval will contain
> the faulting virtual address. Set tval to hit address when breakpoint
> exception is triggered by hardware watchpoint.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +++
>  target/riscv/debug.c      | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9a28816521..d3be8c0511 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1641,6 +1641,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
>              tval = env->bins;
>              break;
> +        case RISCV_EXCP_BREAKPOINT:
> +            tval = env->badaddr;
> +            break;
>          default:
>              break;
>          }
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index bf4840a6a3..48ef3c59ea 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -761,6 +761,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>
>      if (cs->watchpoint_hit) {
>          if (cs->watchpoint_hit->flags & BP_CPU) {
> +            env->badaddr = cs->watchpoint_hit->hitaddr;
>              cs->watchpoint_hit = NULL;
>              do_trigger_action(env, DBG_ACTION_BP);
>          }
> --
> 2.39.0
>
>

