Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljczg-0006n1-7E
	for mharc-qemu-riscv@gnu.org; Thu, 20 May 2021 03:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljczf-0006mm-5I; Thu, 20 May 2021 03:21:19 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljczZ-0008Bz-O7; Thu, 20 May 2021 03:21:18 -0400
Received: by mail-il1-x130.google.com with SMTP id h6so14389455ila.7;
 Thu, 20 May 2021 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vu2NIKPg1s+KXbitjc2w6/Xvd9FkAfXo70ctr48j8BM=;
 b=FpzaaTNbIkQycy9P9uAtM4G/QkEQy2rg+VXK7jHhZhT23qPhb6KZjHR6p+u8pHDuBD
 aWq20PQnMHQlb/QIhA06zByAOYzcKrgeTVRt4YxxrtjNfVcexMA3OqGOq1v8Eol5Zbwt
 porfEAP3N+gSHrzYT0mrTOMa0Nse7b14CtXtol8/LCplu0HJxLl2/rbghPbdmjbnbPT0
 8+TDiiJia49q9t+3gdi4R4q3eJxOnssXZHZBxNSJyXLk2VuB08zmhIC1lAnLVvbNEWzZ
 3T+g163ZwPwst5lku+kdnXFaLtaBlFaI6vdQgJz+LOi/yMKcVtC8Odoarmu2ryAcQhKf
 8Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vu2NIKPg1s+KXbitjc2w6/Xvd9FkAfXo70ctr48j8BM=;
 b=TlgXaDlxlU2biQyipzbD6SYXB7QknVFCI06otEMRl3nlUWH9KEnOWA0mPkCKS39q9M
 v5dkzQkRS/lJ0bHgYOps3y8/TX6vU5j/BXEJPPacem7WDEEHQd9APDkq/upnUpbZORy2
 0UQaI7Ynez5RWbdaUnz/LIW01bcb5Mu9hrT/4vBNwqLN1NEC1cBDsJTbExSnaGxaEJtk
 KIQ5j08B9knBR2Xee+BTr70GIKqX0vs3lByynZYm4qaWlp0DjYP2SzBio6Wrugk3e3xV
 lIOLr5ApIG9SUjf9d11DL0is5z9hlDscuBs4hAYQiC4uqRiQ0m4HCuFgJ3NUh07rrS/K
 mlFg==
X-Gm-Message-State: AOAM5320Z3/5RYgeTGl454PFAcZuDkhcrgtQ8yMzRW+lXXAUsxpD6RZq
 2FuJc1wq/HW2758MMYqaTTqBG46FOZWW6r9nRow=
X-Google-Smtp-Source: ABdhPJz4dldB/SNyo4fu7A8A+JoR7fnnTZrLO/WM3mp/FI4oSqZNUVz7zF8gKeAWuCV8Cuh7PrUsO7OCmfU8K2zbskE=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr3613084ilc.40.1621495272365;
 Thu, 20 May 2021 00:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210519155738.20486-1-changbin.du@gmail.com>
In-Reply-To: <20210519155738.20486-1-changbin.du@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 May 2021 17:20:46 +1000
Message-ID: <CAKmqyKMm4zDEiC+pJWRTBSy6VdvbaC+vMXV30YKQxyAGJbdO8g@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Dump CSR mscratch/sscratch/satp
To: Changbin Du <changbin.du@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 May 2021 07:21:19 -0000

On Thu, May 20, 2021 at 1:58 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> This dumps the CSR mscratch/sscratch/satp and meanwhile aligns
> the output of CSR mtval/stval.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
> v2: Rebase to latest mainline.
> ---
>  target/riscv/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3191fd0082..c4132d9845 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -286,12 +286,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
>      }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->stval);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
>      }
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
>  #endif
>
>      for (i = 0; i < 32; i++) {
> --
> 2.30.2
>
>

