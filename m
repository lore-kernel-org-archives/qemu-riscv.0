Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMfp7-0006Kl-0C
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 20:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMfp5-0006KQ-7L; Mon, 30 Jan 2023 20:52:35 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMfp3-0001Oj-LT; Mon, 30 Jan 2023 20:52:34 -0500
Received: by mail-ej1-x631.google.com with SMTP id qw12so21575601ejc.2;
 Mon, 30 Jan 2023 17:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L0Gz4FCjZLtMEIrEO+t+wu6eeaYm1K9bsdu5Y0eSeoE=;
 b=EuTZqwoQhWquLdnUBekFKSXoarGXoAJSk2hlodmODqp2CuUyR8/gN7y6HZkC++flxO
 GjDc6/gahpoNWEzrpYx85qIRq1HMc+yPHdAn0FQuMaqqFjk+9Ra4DqNn+GzGbbttD9YM
 xv8PebhZcqaQUTd/1vX7SFhmweCnHB8kIvtbEso5DF7C8iBXmOrXu0Wx9shiQten+HCY
 CTF4E27IW9BVEKgAq3ih5QirXy6nFkj/zH09NDeCKHNdHirlox7iWl56Z2HWwRZIR0wb
 dp5Ttg+VjQJED3mGS79cEA1RYEvKnuwAkACGGt1mUeiVH4JXaL2n5/WRbZaq+CMNVF3j
 t2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0Gz4FCjZLtMEIrEO+t+wu6eeaYm1K9bsdu5Y0eSeoE=;
 b=IZa3Qz9Hsb8P5/uK7DGadO3PHqSIWZf5C/aVFAAoGOqP7HIETd16xT1ioprsEUN6vo
 iri00NO+xwG2+OY59l5ne0Pb9Pr4dOxjWM6H0YuVzhCa/sH/Eiade0Y9/7nj8++IPuik
 OeaLgXCBnht/Fv17+nvsZA2l2tqGKJC/CNMCrA29NsU3jAAMA2aSWBQKyRnzr4He7ZDw
 JxmQ7cGbFHWCPP2xnWdq0tYCZHcvbeDT/jyfbRU7aYdYtfLNm8l2ZKKq22I6VqWUMtRx
 051jHHlDjrdbhxw1TVaYa2bdYosgvdQYtXqQsx6qC+Tabl+VT5caFhBn9URmDcZdhBQL
 6iew==
X-Gm-Message-State: AO0yUKWgvi1BYtEQjRS1CEWMgMky4M6AG9FZ54iSC/6fc6jKKOXm5uOo
 dBRQy1/2sw1YsOsUmQS7ZB6FMtWn3m9YpOt2Sl0=
X-Google-Smtp-Source: AK7set9XV6FbF3Dka9uoplvmlXFUGJy7sOoMRCze9RgOySXbsmpdXGYwovzmizBxmFgyUVpeHZm4kKSlium4XXAD2HE=
X-Received: by 2002:a17:906:7087:b0:878:4d11:2694 with SMTP id
 b7-20020a170906708700b008784d112694mr4355527ejk.26.1675129950588; Mon, 30 Jan
 2023 17:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20230130100757.721372-1-geomatsi@gmail.com>
 <CAKmqyKMiP9N8CX844++qb+dFFn46Peic87P7-5dJrRfLAyM4wA@mail.gmail.com>
In-Reply-To: <CAKmqyKMiP9N8CX844++qb+dFFn46Peic87P7-5dJrRfLAyM4wA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 31 Jan 2023 09:52:18 +0800
Message-ID: <CAEUhbmXa=P+JCB3+JnzTdkWdqTZFr9NZR58uEzjK=Pz3ohLD4A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: set tval for triggered watchpoints
To: Alistair Francis <alistair23@gmail.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 01:52:36 -0000

On Tue, Jan 31, 2023 at 8:59 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Jan 30, 2023 at 8:08 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> >
> > According to priviledged spec, if [sm]tval is written with a nonzero
> > value when a breakpoint exception occurs, then [sm]tval will contain
> > the faulting virtual address. Set tval to hit address when breakpoint
> > exception is triggered by hardware watchpoint.
> >
> > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next

Oops, too quick, but I have one comment :)

>
> Alistair
>
> > ---
> >  target/riscv/cpu_helper.c | 3 +++
> >  target/riscv/debug.c      | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 9a28816521..d3be8c0511 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1641,6 +1641,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> >              tval = env->bins;
> >              break;
> > +        case RISCV_EXCP_BREAKPOINT:
> > +            tval = env->badaddr;

RISCV_EXCP_BREAKPOINT may come from 'ebreak' so we should test if this
exception comes from the debug module.

The spec also says about icount trigger that:

"If the trigger fires with action =0 then zero is written to the tval
CSR on the breakpoint trap."

So we can't blindly set tval for every breakpoint exception.

> > +            break;
> >          default:
> >              break;
> >          }
> > diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> > index bf4840a6a3..48ef3c59ea 100644
> > --- a/target/riscv/debug.c
> > +++ b/target/riscv/debug.c
> > @@ -761,6 +761,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
> >
> >      if (cs->watchpoint_hit) {
> >          if (cs->watchpoint_hit->flags & BP_CPU) {
> > +            env->badaddr = cs->watchpoint_hit->hitaddr;
> >              cs->watchpoint_hit = NULL;
> >              do_trigger_action(env, DBG_ACTION_BP);
> >          }
> > --

Regards,
Bin

