Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdgrK-0004Mk-86
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 18:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgrI-0004FT-7g; Thu, 21 Oct 2021 18:48:24 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgrF-0001or-T9; Thu, 21 Oct 2021 18:48:23 -0400
Received: by mail-il1-x129.google.com with SMTP id s3so2424990ild.0;
 Thu, 21 Oct 2021 15:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7rOn5+2KqB28LX6y7GO6P5ftXOIHD5aFv81muxBJxX0=;
 b=i9aHCvR+SR8QJVEBM8B8GZK7Z/zhuc0SGL52khxSS45W7yr+JAfCiyF9yj8FyXL2A7
 lHkaLmr5GWfbhF8PCtRS8PohN8MBiuA8OtDkU23OLmO5RTo0j9fotDA42wWFl1nMOlNE
 8gB73J41dfxYlWUufFkjVeKJE68dJacTI3hgCdr87Ua9zKuZTCcg5J6i4zhdKBtd4nFR
 OL1KArPvJVyKcCgcI41Gmov8/JMDNJTBkRyOLvuNM0TSB+g4RLcu30O0IjjRQ1nFTdHD
 LItkqV7B0Zan0bTeY8jBUiUl7WruPCS5+mBi2hnkqzGHAMjZldNYydrWfdY/Tm8H89PZ
 WGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7rOn5+2KqB28LX6y7GO6P5ftXOIHD5aFv81muxBJxX0=;
 b=V/Obx2WTCfovsubhJG/fzvNYUDjel627gYIJPxNxcTlr6ySOJDemhTHpKGO/bL2/LL
 a/aIECF63pbrb9Qi+Q/Ltcc/yEwSHKXjZGT0duKyJlGYo+PekIjWrTyEA8Rsov1rNcpG
 ZOH8EjWRJjUVXGSkNT/JbB/9X8v3Lnoh1FbCjYwttfOxlA1H6uO0vAknd/PE6FULZf/F
 6oqPnHFaWiSpHFjZ/SWc+dF3JdxNl5Mc9XiEj5pPoVnUpDciWot7BrTnZgjqr8wC6omJ
 4BUQ/iR2CJSFclHoXs7LmJgSoi4l1NwvyWwl2LRh594t7i1SCk/T9cm0D7DZPEJKpWVJ
 q8lw==
X-Gm-Message-State: AOAM5327fw8ySPsG6iAhtUcQNvRilP6ayzzrm5wA3c2G2vH5HnKjzZr1
 DbXHOPonW4iaSED+cZ0XlRvBJAAg+hNdVLq2lZM=
X-Google-Smtp-Source: ABdhPJy92hCLP1KyiRpMsqRRGnxenVEIolrc5WWNPpTE+7EGnPOFQaw/3vQVLfGOx3uRFoyOIExLkRQkapoyb/Pc9Js=
X-Received: by 2002:a92:c88c:: with SMTP id w12mr4377719ilo.46.1634856500282; 
 Thu, 21 Oct 2021 15:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211021150921.721630-1-ruinland@andestech.com>
In-Reply-To: <20211021150921.721630-1-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 08:47:54 +1000
Message-ID: <CAKmqyKO3MawZxqSf+gsdtCd5kHAaJuXh0r6VRieCJOzBVgQ8rw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/3] riscv: Add preliminary custom CSR support
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, ycliang@andestech.com, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 22:48:24 -0000

On Fri, Oct 22, 2021 at 1:13 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> Hi Alistair, Bin and all :
>
> Sorry for bumping this stale topic.
> As our last discussion, I have removed Kconfigs and meson options.
> The custom CSR logic is in-built by default and whether a custom CSR
> is presented on the accessing hart will be checked at runtime.

No worries!

This looks great! I had a look through this and I think we are almost
there. I left a few comments, but otherwise I think we are close.

Let's see if anyone else has any comments. Otherwise can you run
checkpatch on each patch and then send a PATCH series (not an RFC) in
a week or so and we can go from there.

>
> Changes from V4 :
> Remove Kconfigs and meson options.
> Make custom CSR handling logic self-contained.
> Use g_hash_table_new instead of g_hash_table_new_full.
>
> The performance slowdown could be easily tested with a simple program
> running on linux-user mode :
>
> /* test_csr.c */
> #include <stdio.h>
> #include <unistd.h>
> #include <sys/time.h>
>
> int main (int ac, char *av[]) {
>    struct  timeval start;
>    struct  timeval end;
>    gettimeofday(&start,NULL);
>    unsigned int loop_n = 999999 ;
>    unsigned char i;
>    unsigned char o;
>    do {
>        for(i=0; i<32; i++) {
>        #if defined(FCSR)
>        __asm__("csrw fcsr, %0;"::"r"(i));
>        __asm__("csrr %0, fcsr;":"=r"(o));
>        #elif defined(UITB)
>        __asm__("csrw 0x800, %0;"::"r"(i));
>        __asm__("csrr %0, 0x800;":"=r"(o));
>        #endif
>        }
>        --loop_n;
>    } while (loop_n > 0);
>    gettimeofday(&end,NULL);
>    unsigned long diff = 1000000 *
> (end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
>    printf("%f\n", (double)(diff)/1000000);
>    return 0;
> }
>
> $ riscv64-linux-gnu-gcc -static -DUITB ./test_csr.c -o ./u
> $ riscv64-linux-gnu-gcc -static -DFCSR ./test_csr.c -o ./f
> $ qemu-riscv64 ./{u,f}

Do you have the results?

Alistair

>
> Cordially yours,
> Ruinland Chuan-Tzu Tsai
>
> Ruinland Chuan-Tzu Tsai (3):
>   riscv: Adding Andes A25 and AX25 cpu models
>   riscv: Introduce custom CSR hooks to riscv_csrrw()
>   riscv: Enable custom CSR support for Andes AX25 and A25 CPUs
>
>  target/riscv/andes_cpu_bits.h  | 129 +++++++++++++++++++++++
>  target/riscv/cpu.c             |  39 +++++++
>  target/riscv/cpu.h             |  15 ++-
>  target/riscv/csr.c             |  38 +++++--
>  target/riscv/csr_andes.c       | 183 +++++++++++++++++++++++++++++++++
>  target/riscv/custom_csr_defs.h |   8 ++
>  target/riscv/meson.build       |   1 +
>  7 files changed, 404 insertions(+), 9 deletions(-)
>  create mode 100644 target/riscv/andes_cpu_bits.h
>  create mode 100644 target/riscv/csr_andes.c
>  create mode 100644 target/riscv/custom_csr_defs.h
>
> --
> 2.25.1
>

