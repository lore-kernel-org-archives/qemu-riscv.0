Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZT5s-0000qw-Fz
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 03:50:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZT5o-0000mJ-Sx; Wed, 30 Mar 2022 03:50:12 -0400
Received: from [2607:f8b0:4864:20::12c] (port=46890
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZT5n-00006h-6w; Wed, 30 Mar 2022 03:50:12 -0400
Received: by mail-il1-x12c.google.com with SMTP id j15so13984691ila.13;
 Wed, 30 Mar 2022 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qb6NgRcam4wb6iL1ZZsOJAgr8WXQtzBYRGFxpGruTSM=;
 b=SfpwXpMdv/ih3n9pt0zyA+LKMoLyoTCqS6NZtGGSZFHOuCInkwNHRN3sSTjlf4xQTO
 pCcqRzVxCgkoIs+B/gK5EOCZr7FkhwGKeZoZouRHMfOpx6YTVa2nmoF1W3AHQNk+ahfT
 XyfHFXzWKU+jXW7CB63hHls9r3KC18tZwEvez8gBLygp11cDL/CvPZ+RmiaDUPKLkY4r
 GwXK6txsMF2ewqyj/YjSViBhWNV9qt0U4FbhKQBLFhJvyZ6PvI70BQm6TSfoTTUvqaph
 xjLof7qr0EkzOPktbbWRsMRVH6xyoj76aL2yHk/rtUa4b3yRrm23FxVYRmzSvGvtk65O
 AOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qb6NgRcam4wb6iL1ZZsOJAgr8WXQtzBYRGFxpGruTSM=;
 b=nUQK2JdDLWs8J3y52Et+cVd7U/uV+fEBb2abuWQuy7Ln19U0cIn+4RvmkQxWTML1T3
 FRxori4THlnmEQOLMv62UlCwPEi4IdFPIijpWDY6fDu6LM9J95+WfNEGrgaxnQx33oo0
 B8CJkJAIVt2hxypC9IKNRGR1AlLM8RUq5DyO+7qEORT1SpKKIyaAsyd04l6+7SZbjJxK
 8C786N0Zu2YOd4cKPeSbzJyJYVtoPxeq6ZX1gywYgoldm/dLUCR1LHdt2zg0UG7PE2J5
 DTZWeaIEqyetew/D7k4G/I0doE1inT3MHfrAOiMbhhxNlb5jfGlPDZqaESki4PCoCjEi
 CqUA==
X-Gm-Message-State: AOAM532ty+xBe11op+anPFCbmp2x0xBWbpb5H4lw9FYEKA2vxJn8mlAh
 a9wZ9K8xNKFGTwNumBNXofIc2NdlJWIVB4vtacA=
X-Google-Smtp-Source: ABdhPJwQ6Etk7YShRL+WJoZwPEdmZz3sYSeQ5teuvIWZw7vLwv7P3YiXGUvitHMxAKPXBGOTN3BH8Ss1zchDxCc4iDk=
X-Received: by 2002:a05:6e02:1c2a:b0:2c9:defa:d061 with SMTP id
 m10-20020a056e021c2a00b002c9defad061mr1942290ilh.260.1648626609617; Wed, 30
 Mar 2022 00:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648473008.git.research_trasio@irq.a4lg.com>
 <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
In-Reply-To: <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Mar 2022 17:49:43 +1000
Message-ID: <CAKmqyKMuPU=4FiJKj-Y+gt=w8xQknFkGhUz7dcPoRLzmLoC94A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: misa to ISA string conversion fix
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Wed, 30 Mar 2022 07:50:13 -0000

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
> -   "L": Dropped.
> -   "N": Dropped.
> -   "T": Dropped.
>
> It also clarifies that the variable `riscv_single_letter_exts' is a
> single-letter extension order list.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

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

