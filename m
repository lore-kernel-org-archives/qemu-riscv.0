Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgz4C-0000fv-BJ
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 20:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgz4A-0000cT-Fw; Wed, 12 May 2021 20:19:02 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgz48-0006KN-Sq; Wed, 12 May 2021 20:19:02 -0400
Received: by mail-io1-xd2f.google.com with SMTP id n10so23436885ion.8;
 Wed, 12 May 2021 17:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BDT7h8uU4l9YRcgSefzzH7m9l7WUtdu6VqsKsniz7QA=;
 b=pa02WptnFLEnMxf3h9krVnUkBkNEi+4ienLDYdsAmSwoGy8jQhqQYvcIbai+e1U+/n
 39DpO6BjqsFBMKVHBxz/xBIhD1z+sayfG4nckXXa1AvlOtT8M//zuyCHRRFOQKAZZUWT
 t+v/ZvLWJWvxaQ0DelglrkbT4Y/e0dam3hIEJMWvtFSTeNQwcmImbwgHtxgQGXW31/8q
 ZedrRyms+xcOUPApTH7UoJSYxbFRnaHIA1FsZIwJA3pm6cY1mJlKWAyaqd9xCVGiylYV
 79poa6Bpk6S3klGSDWs/uVfrhmhKebW81xSltqQGOiIAtHpuiPXy5WbETOBFsWWaK5PB
 eIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BDT7h8uU4l9YRcgSefzzH7m9l7WUtdu6VqsKsniz7QA=;
 b=XmUTHiCMzjY+3rglRLm5RbH3JPqTgH/S1EUUZnTn3e+fgEGqyjdhv5fZYKIOzmuihc
 MhrAPUTbI4JQn5QrstvxRtTmQ8TcBR7Uyun9pgNqEXHEw5TiLt4+2elN/WlxotCW8NGS
 h5unRfd+ysFElBA6O7viTIX9rQ+naJSayngNqxNGTPoomaeeXNn2ts0faoHAVvzImr7f
 AWVLre9lwRMabBche9/kxHcLRazONNrwt+xDeISqUKPSoIIMZJMj4NoaavQydyHLjoL2
 mdRE67yjnp+2/owUwnkFM41w0JKGw9LS7xejXwItbw4Mln8G+Q1KdzBoPY0VUheSr5pT
 kbBA==
X-Gm-Message-State: AOAM531QbqyyNuHIXaKlpuMGe/0bun/+vsGsvO890jnilbFkOIv0iRp0
 sRGJ5pIqGr3QRzZb5IMboeM1eS5tJR8wr/wrqoQ=
X-Google-Smtp-Source: ABdhPJwnswlDEYaffKVBxuDZ3IeM/WkbKM1rOKNEVPbFkftOob2xcRnxSu8Njyg//ESuG/mVWSEPAWOvPfaBAB3yXtc=
X-Received: by 2002:a5d:944e:: with SMTP id x14mr29181182ior.175.1620865139486; 
 Wed, 12 May 2021 17:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210428122528.295103-1-changbin.du@gmail.com>
In-Reply-To: <20210428122528.295103-1-changbin.du@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 May 2021 10:18:33 +1000
Message-ID: <CAKmqyKMpYWopj49RsuB+Ug6f3KZNPu2=otEROssFnD9Ov6cEDg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump CSR mscratch/sscratch/satp
To: Changbin Du <changbin.du@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 13 May 2021 00:19:02 -0000

On Wed, Apr 28, 2021 at 10:29 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> This dumps the CSR mscratch/sscratch/satp and meanwhile aligns
> the output of CSR mtval/stval.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b67..73af6f5445ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -281,12 +281,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
>      }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->sbadaddr);
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
> 2.27.0
>
>

