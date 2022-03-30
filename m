Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZQrf-0001Rh-F9
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 01:27:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZQrd-0001Pi-Aa; Wed, 30 Mar 2022 01:27:25 -0400
Received: from [2607:f8b0:4864:20::d2d] (port=38415
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZQrb-0008RC-Hb; Wed, 30 Mar 2022 01:27:24 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 9so20410835iou.5;
 Tue, 29 Mar 2022 22:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YCkXVIM5PO9sFXFCxlEHl39sQWKxLakrEY28+zQlOw=;
 b=qKA6gcjxLBPPdEyJKCJD07m4gR2wPCqKzXX5F/SohWqDCGAJA0pa1J1RRHi+M92JHl
 x1r7xzTXdfV0vILles2TY+nzLKje/HyUWpV0SHgmMogMzi6YpLw0+ZW6mWcBfGxVN42O
 EjIwr+g5fiJwmi1H3zSretTI/q7/EGuTcxBowcgUzuxwhAm3DG2K+IR5jB/sTgB5io5f
 km+aBSzeS4NlwHyqTfrPvrUWOL6M+dvk90Zk3VxFpa5Cj03A9zA3Iyt34Lv/pT+IJcLt
 wwBIZcslabgyX1oV2vPkilsXlHtVIj8iELJiVR/8uWY1D49ujTCoUqXXVWjI+ZO5CV/V
 T+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YCkXVIM5PO9sFXFCxlEHl39sQWKxLakrEY28+zQlOw=;
 b=mJ3Vj2FBC6gKV3WTDE72SDD5Lv9be87Oue02zIpYjo07vezJHVQCz1n1UtPUCW9rTJ
 bHGbc/VgCp4vCEwHfWydyLOIKQwjeDIncsFr8Gu95l9+3qD0CZAUnirSbTLUS8fPntqr
 SlS6tPzrcxpUqyKi64ftkA+WsWMAblq/wf+GuF68N6iE1gnrxzKAZtQCeqwM+zKGBntO
 9gF1Igu8+Wm38kz0rUHIrJ/HicTVWxblW67xkKiv8Gcgaj+cLYbCn8C7nEr6y0iNCdS8
 8W3XxF/tNuZ+z1GmtKvWTHb6QY23NesohcQoY+fs7OX3bSjZQQze/JI6JdzURTtsxi0b
 ZHMQ==
X-Gm-Message-State: AOAM530bYp7Dd+mbL/s2Px3J9D3j1/IgwnWPwyi/qReSy8PO/wU/nkTo
 Xo0kSNLFM0z0y0mWuU0rbIGf5llPmG7I0cwd7F8=
X-Google-Smtp-Source: ABdhPJwSB93ZCvTCfmh7p7mnQnA1ncruj4gF8L9srZBgg06RygIdTdhypS1ThLG/v81WXewhTdLfsSS1PwqfvOS/pMI=
X-Received: by 2002:a05:6638:24c1:b0:323:61fc:a5c0 with SMTP id
 y1-20020a05663824c100b0032361fca5c0mr9635626jat.267.1648618040990; Tue, 29
 Mar 2022 22:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648473008.git.research_trasio@irq.a4lg.com>
 <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
In-Reply-To: <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Mar 2022 15:26:55 +1000
Message-ID: <CAKmqyKPiPZUspU4D+oTq-Bv1pEVkzNobHtg6ZgTo=m+PxEh_gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: misa to ISA string conversion fix
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 30 Mar 2022 05:27:26 -0000

On Mon, Mar 28, 2022 at 11:11 PM Tsukasa OI
<research_trasio@irq.a4lg.com> wrote:
>
> Some bits in RISC-V `misa' CSR should not be reflected in the ISA
> string.  For instance, `S' and `U' (represents existence of supervisor
> and user mode, respectively) in `misa' CSR must not be copied since
> neither `S' nor `U' are valid single-letter extensions.
>
> This commit also removes all reserved/dropped single-letter "extensions"
> from the list.
>
> -   "B": Not going to be a single-letter extension (misa.B is reserved).
> -   "J": Not going to be a single-letter extension (misa.J is reserved).
> -   "K": Not going to be a single-letter extension (misa.K is reserved).

Interesting, these are still listed in "ISA Extension Naming Conventions".

They can just be re-added if they are used in the future.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> -   "L": Dropped.
> -   "N": Dropped.
> -   "T": Dropped.
>
> It also clarifies that the variable `riscv_single_letter_exts' is a
> single-letter extension order list.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  target/riscv/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..1f68c696eb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,7 +34,7 @@
>
>  /* RISC-V CPU definitions */
>
> -static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> +static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
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

