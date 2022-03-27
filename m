Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYcKd-0000H3-Us
	for mharc-qemu-riscv@gnu.org; Sun, 27 Mar 2022 19:29:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYcKc-0000GI-Bl; Sun, 27 Mar 2022 19:29:58 -0400
Received: from [2607:f8b0:4864:20::d2a] (port=46597
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYcKa-0002wu-K3; Sun, 27 Mar 2022 19:29:57 -0400
Received: by mail-io1-xd2a.google.com with SMTP id g21so1958891iom.13;
 Sun, 27 Mar 2022 16:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OzOmbrkTBN9eZk5vG2KoFmFQ1wLMoN7NRIkJwnEq1BY=;
 b=lg+0OzjuVo45vEvI4WcUb+4Wj+FSRamt7kAn3IUIpoPNNIPWZchCjaM/NPHcNxSft5
 cmDSTz4QFZHqHhjQbb4U/coYtehS1G3b1gM0hoamno8qbXpg+e9IjVkkeSYwCISkYOhC
 ZVF5wMoxvAlmTEdUcXD8M8h4Kjuy6zPMSehoD/JNpARLhfrx0qZSTFUqls8BXcR25url
 fCk5j0XjDdM2TqhUP64zp5r9SDyZTWv4qHoHHsJ4QWLgIpwlmqqWllZIw8ZaQExgRdEn
 fLn7Z5djS0kScW2I1VDumhrO+Tf+ocNEdJmVixsXQk5qCPWSkzdAr4M9zdx2hVQvLSkA
 siAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzOmbrkTBN9eZk5vG2KoFmFQ1wLMoN7NRIkJwnEq1BY=;
 b=3Yk44P4yz/Y71cb8V7Qmr6Ogx5ijWrjU0XKzuDK2cgi/jDGzYhMqxrfBLOdyyII5Ou
 lXaTyQUSC3BCdepkTmi68O50DCGlE1UcKljP882ea8V+Ux6RUxzGGLDBbthhx4IRSz36
 QEOEnoP7bc6JkWCAscd2DaHiNbiGDgPkqqTyTjh6TNBzTEVvzshQJoErvjD6rbxyxT7S
 7JxAIzU+Rm10ilU2kPLnojSV4jO68qNEevaWZIL5CBPv2WcDFS2t1eNg78AlbhTI/5tV
 mUBq9r4AZrvVp8Dk5/BjVPGI8K9Jy8FCfTnP0wahqtUlgeAHluXNKl/mJDxuVHvZZBCZ
 ppig==
X-Gm-Message-State: AOAM531zp+YuRXF8YvYpkdeNimxi/qSlizOepj4t4wlZFJaDct3g9t6P
 JOBSlM4pdoeRVKe6E/3+CuiprfnpGl0tzXqI9nGJ3muAlW4ByQ==
X-Google-Smtp-Source: ABdhPJxWl+dGCfnF1FYoOhoOV6JA2ML0NrPvkm0D5cKjOdEUdCiq7H7hEUsuGWw9fLSe2LNOcf63fH6VPnS2HCEVHSg=
X-Received: by 2002:a05:6602:45b:b0:645:bdc2:fe13 with SMTP id
 e27-20020a056602045b00b00645bdc2fe13mr4961820iov.114.1648423794523; Sun, 27
 Mar 2022 16:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648270894.git.research_trasio@irq.a4lg.com>
 <dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com>
In-Reply-To: <dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 09:29:28 +1000
Message-ID: <CAKmqyKPGkdOJAXZjSKvk23RaNY01ZpUziG7hCHyc+0YbOqzstQ@mail.gmail.com>
Subject: Re: [PATCH (PING) 1/1] target/riscv: misa to ISA string conversion fix
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 27 Mar 2022 23:29:58 -0000

On Sat, Mar 26, 2022 at 3:46 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Some bits in RISC-V `misa' CSR should not be reflected in the ISA
> string.  For instance, `S' and `U' (represents existence of supervisor
> and user mode, respectively) in `misa' CSR must not be copied since
> neither `S' nor `U' are valid single-letter extensions.

Thanks for the patch.

>
> This commit restricts which bits to copy from `misa' CSR to ISA string
> with another fix: `C' extension should be preceded by `L' extension.

The L extension has been removed, so it probably makes more sense to
just remove it at this stage instead of fixing the order.

>
> It also clarifies that RISC-V extension order string is actually a
> single-letter extension order list.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  target/riscv/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..84877cf24a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,7 +34,7 @@
>
>  /* RISC-V CPU definitions */
>
> -static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> +static const char riscv_single_letter_exts[] = "IEMAFDQLCBJTPVNH";

What about K?

Why not use IEMAFDQCBKJTPVNH instead?

Alistair

>
>  const char * const riscv_int_regnames[] = {
>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
> @@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
> +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
>      char *isa_str = g_new(char, maxlen);
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> -    for (i = 0; i < sizeof(riscv_exts); i++) {
> -        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
> -            *p++ = qemu_tolower(riscv_exts[i]);
> +    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
> +        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> +            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
>          }
>      }
>      *p = '\0';
> --
> 2.32.0
>
>

