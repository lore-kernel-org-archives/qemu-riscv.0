Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUGou-000673-6W
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 19:43:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUGos-00066K-3r; Tue, 15 Mar 2022 19:43:14 -0400
Received: from [2607:f8b0:4864:20::12e] (port=42762
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUGoq-0001cS-Gg; Tue, 15 Mar 2022 19:43:13 -0400
Received: by mail-il1-x12e.google.com with SMTP id b5so526838ilj.9;
 Tue, 15 Mar 2022 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZDV9kTvCBfYgpaIkH2VGpA4AZd1jtBTqqXJP0UciQw=;
 b=DvKuY9qZTQlDMZieg3F37tdk95WZmUWgiEsUhyvGOsC/Hqjx8vQG1VxhocAXPS0sOL
 Cb07030oEXD+kqR9bhV23hgkNyM5UtE38kFPuw4iQDVPUX2daKSW042CqJZvZWhsBqcz
 Te2HvKJvECbZuVnKXN7LmdZrDSUzqmPIV+XO8YWPTl5LnlnHcAIxD7pJK48jkOJtIn5x
 sZRCR32hATCiXnNEg1fh/gO6nlto9BbgojpSCqUjIVFb0XRuBNVWIvKIg6/89e7Vl0uM
 ONEnkkKpY5CAb/UiGQKLPySkwVXYhyxzPssqalaNus0XTetA4hrYjfFMEY4DVQkZZtD+
 W08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZDV9kTvCBfYgpaIkH2VGpA4AZd1jtBTqqXJP0UciQw=;
 b=q5UHbgxmx1+Syg0uOaFl7qLpoDe8mqzVsb7dfjomalmbrsVNbPA3KobdnpXyRWMjwW
 PYeTiIfgQS4Z5ztjy9dVkT6wJpdtqdkpmWXGEmyqFEjGq0aaALN2yLbAHBNYR7cBrBqQ
 GjZC35c5/yiJFBqCsabjMfaglMAUQqs70+Oajr3UbJiZtuH5ArBh18LNjOOyvi/Xrf4e
 NkJQcYgxViVJMeBovzaoEbAc2qfnIkLCu2uYQRYQ9cRvixomCx2RpfNO6QoK4LGtX0pf
 N4tw9kmiEwQ5lYP+6PDyE4qmRrilI/vh40HyQ4Qr7kJ+o7kvE/RtsZaK/HweeCGXTDFL
 If/g==
X-Gm-Message-State: AOAM5304diIY3M7hlGKbM1tsANGTcJNKM6qCqsT36hlgVKp29jWn2i7d
 Xj4d+tZG0w+bP4oe1hbcgCiGo6FxRw0xhTlJ2/k=
X-Google-Smtp-Source: ABdhPJy15JktwgkaFIRte1qUp57ofozi36gwQvSTpKGEfAIZv7qdQA3l0PeVBVVXH10f3Og8rawjk5TZooXdGtoNbSM=
X-Received: by 2002:a05:6e02:20ec:b0:2c6:158a:cb33 with SMTP id
 q12-20020a056e0220ec00b002c6158acb33mr22899212ilv.113.1647387791072; Tue, 15
 Mar 2022 16:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220315192300.250310-1-idan.horowitz@gmail.com>
In-Reply-To: <20220315192300.250310-1-idan.horowitz@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Mar 2022 09:42:45 +1000
Message-ID: <CAKmqyKPu71vO6WtqSHc_XjXrzCicj-_GRm+11njcRxYH3KhbQA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 15 Mar 2022 23:43:14 -0000

On Wed, Mar 16, 2022 at 5:26 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> If the pages which control the translation of the currently executing
> instructions are changed, and then the TLB is flushed using sfence.vma
> we have to exit the current TB early, to ensure we don't execute stale
> instructions.
>
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_privileged.c.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 53613682e8..f265e8202d 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -114,6 +114,13 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
>  {
>  #ifndef CONFIG_USER_ONLY
>      gen_helper_tlb_flush(cpu_env);
> +    /*
> +     * The flush might have changed the backing physical memory of
> +     * the instructions we're currently executing
> +     */
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  #endif
>      return false;
> --
> 2.35.1
>
>

