Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmY96-0002mr-4h
	for mharc-qemu-riscv@gnu.org; Thu, 05 May 2022 05:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmY92-0002kP-0Z; Thu, 05 May 2022 05:51:36 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmY90-0005ds-HK; Thu, 05 May 2022 05:51:35 -0400
Received: by mail-il1-x134.google.com with SMTP id f5so2488977ilj.13;
 Thu, 05 May 2022 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hi4fXnNdc64r9xFqzZ0Vb3zTAJaCbAOQ4TcQGgHhy3o=;
 b=Wdw4DVDTvJogq9pImYXW8vjOJug7oSEn/LNmQEkeduvz9ZXNprn/QkD9f4RZDrqVwj
 4QagEGa+Pknhua0mtXjwq2dlzBRlZ+nmQl4EqyDpvMUSK9a71Y8Zp6plyIJHPSC2ZsvA
 aF/Qr7Nr3XGe3o7Yt3CHtMw9mxJCVc1fB4a9iWFjh5Su8PWmJvcnKmd3vDoUW4hE5lw2
 Z82BT+YGnHY+sATN5rEm66nJHzvbrZEWfJ/TgZC1fAyQcV2tuIYbHYDu2GA7dNJJ1NNJ
 O51lIrhaCS/Dlin2pzsxn8GMen8SgfYug7cmvGITVqKBcOcwuChP6Ar2+afE8tnf6Bs6
 HawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hi4fXnNdc64r9xFqzZ0Vb3zTAJaCbAOQ4TcQGgHhy3o=;
 b=5Jl7+Y+h7Qtreg2ysw2CUoB9rbraW+7MWhCLuKRURIivhzfbillq+B1k0mla64YmkF
 Y+Q8L9GZBhLSVtQwAZGdkkZ+Sg2XJbjSVdflpRxLaWqXccGCfnJy16ZzVeggqLdOiNzh
 OA3vrN7Uqg5hgm5AW5MOfTBppmo2CKu9kaWdOW/he6IuDvQku9/jVpOzhLwz1DaDAn1H
 dsX4qIhblp3FlwQfECcKqCFaYJYnzwTOgmWhj4VFqBB2/MDkgsLGLs4KO22Xh/C/rMEi
 YMwZMWHk98O1Q+AeB0dugjiJQvjHfXtfh/vPBexfgaVzUQ0qIl32X7wwOeyHFBWQoqlb
 32dg==
X-Gm-Message-State: AOAM533v0DlgKzOutS6Il25ZNOHPtwBSHl94qWNqAy2Rhvtrs+jgOGMp
 9YitXgVhwBsJ7AeAlze7VCRRLE97UCBJJIA0gZY=
X-Google-Smtp-Source: ABdhPJze5DgTo9/XPR3Z/ww22bD+b8S+iQreZu2oVwREnpmXW60J+pDvLqW6qga4zLlbguTsu8ghspFQUYBG+F0EJbU=
X-Received: by 2002:a05:6e02:10c1:b0:2cc:14ab:ceb7 with SMTP id
 s1-20020a056e0210c100b002cc14abceb7mr10201512ilj.55.1651744293072; Thu, 05
 May 2022 02:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-3-apatel@ventanamicro.com>
In-Reply-To: <20220429033409.258707-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 May 2022 19:51:07 +1000
Message-ID: <CAKmqyKMFVanzOMKPuo_i7hWZEJOmReBpp+wgqv3e2ExV2Jb-7g@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Thu, 05 May 2022 09:51:36 -0000

On Fri, Apr 29, 2022 at 1:38 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, QEMU does not set hstatus.GVA bit for traps taken from
> HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
> on QEMU. This was working previously.
>
> This patch updates riscv_cpu_do_interrupt() to fix the above issue.
>
> Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu_helper.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e1aa4f2097..d83579accf 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  /* Trap into HS mode */
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
>                  htval = env->guest_phys_fault_addr;
> -                write_gva = false;

This doesn't seem right.

"Field GVA (Guest Virtual Address) is written by the implementation
whenever a trap is taken
into HS-mode. For any trap (breakpoint, address misaligned, access
fault, page fault, or guest-
page fault) that writes a guest virtual address to stval, GVA is set
to 1. For any other trap into
HS-mode, GVA is set to 0"

So if we are trapping from HS to HS, the address in stval should not
be a guest virtual address, at least in general.

We probably aren't correctly setting GVA if MPRV is set though, as
then the page faults should be guest addresses. That's probably the
issue you are seeing.

Alistair

>              }
>              env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
>          }
> --
> 2.34.1
>
>

