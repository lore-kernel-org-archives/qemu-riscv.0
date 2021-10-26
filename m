Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGKR-00082m-Or
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGKP-00080Y-SY; Tue, 26 Oct 2021 02:52:57 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGKO-0003uJ-A6; Tue, 26 Oct 2021 02:52:57 -0400
Received: by mail-il1-x12f.google.com with SMTP id i6so15822059ila.12;
 Mon, 25 Oct 2021 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yU3PYihiESBasJ4XYlBF9DqKGmQhKjxachCxpcMXx5g=;
 b=fXTeos/bJ6dSxZ+ZbhBL1QvmJsLJ6Tn8QLfnONezR2b1ElfHAyhImmGgB+jiLB0Asy
 lj4BWnz6LqbskVWLaCiQEF86tDZqZSiAZAhZgd6cc0711oZ2vjN6aYsgBnObtwJ4v/6N
 bztr2pb8hw+iI0BFJfDErgLQ5B9uq9DpiSp/xVDgbsZDdH2hG5zz80MczQb0Yk3wzQqd
 eGy8tGLDCSSBpeks4QV6ZUlrrlikFB9rcidEvCiVEDh/fofqcLfOrK6HQ2siTju9MMNS
 2sQTi4sMb/H3qQdCA3L0Fo3g4ZGlp+wpEmRmS5ynK5GTlmDZRF3ygp5TJvJZxbvhv90a
 jAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yU3PYihiESBasJ4XYlBF9DqKGmQhKjxachCxpcMXx5g=;
 b=EtFtLAgzAHNre47s6H3sRRha89QVJAikU27dJiRJ7oYhlEQ0yfa99LSbor+k4M+fiF
 qFlvb/VTN/Zk40EbxxNXAzEwJajCZgOb3JpD3ZGPIP5p8GO63CuOcPy6AteqDvieRvAE
 FdfQvRQVwI4UvzbkZsMV/vFi4P2VesTbKTx6tBHgpsKc0C+2ZYI8M8StMRr549/u2ngb
 p61Fu8lJ1oirZTeGmOdAjiFz5DiDtA4jg5CsU29mxod5E9nIbZ2Zg/RMKUg9IFh0YS8Y
 wJm8mnLV6CyZwhRZAWEVdLGvyayzz/0nkp4g71sOGqkjCR4UMsTrzO24Q989/w6EXe2Y
 7uyQ==
X-Gm-Message-State: AOAM531SRs8aCoQUjBMevfYvwRwXpcwVya+U7CISiWdZY1QpMLgf8LSV
 +ziZxSQiYcBr/waeKRVC6O8KUi6N0PreokvJEcs=
X-Google-Smtp-Source: ABdhPJwBQQqK9OOX7ZmFpF8P/pSF6SydrBs41xvLnDmje4CutoczpiZ9MekkQgYKp5NzBYB6epF5IRQBgLYJwm5X8VU=
X-Received: by 2002:a92:c88c:: with SMTP id w12mr13189104ilo.46.1635231174324; 
 Mon, 25 Oct 2021 23:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-82-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-82-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:52:28 +1000
Message-ID: <CAKmqyKNPFN4S546fLLsVMefSXu53sdXcdcGhmcFJs8q4hc8NYQ@mail.gmail.com>
Subject: Re: [PATCH v8 74/78] target/riscv: rvv-1.0: add vsetivli instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:52:58 -0000

On Fri, Oct 15, 2021 at 7:12 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index d7c6bc9af26..3b6524bad91 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -79,6 +79,7 @@
>  @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
>  @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
>  @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
> +@r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
>  @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
>
>  @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
> @@ -672,6 +673,7 @@ vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
>  vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
>
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
> +vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>
>  # *** RV32 Zba Standard Extension ***
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index d463e494b71..9dedcdf4779 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -160,6 +160,26 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>      return true;
>  }
>
> +static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
> +{
> +    TCGv dst;
> +
> +    if (!require_rvv(s) || !has_ext(s, RVV)) {
> +        return false;
> +    }
> +
> +    dst = dest_gpr(s, rd);
> +
> +    gen_helper_vsetvl(dst, cpu_env, s1, s2);
> +    gen_set_gpr(s, rd, dst);
> +    mark_vs_dirty(s);
> +    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
> +    lookup_and_goto_ptr(s);
> +    s->base.is_jmp = DISAS_NORETURN;
> +
> +    return true;
> +}
> +
>  static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
>  {
>      TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
> @@ -172,6 +192,13 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
>      return do_vsetvl(s, a->rd, a->rs1, s2);
>  }
>
> +static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
> +{
> +    TCGv s1 = tcg_const_tl(a->rs1);
> +    TCGv s2 = tcg_const_tl(a->zimm);
> +    return do_vsetivli(s, a->rd, s1, s2);
> +}
> +
>  /* vector register offset from env */
>  static uint32_t vreg_ofs(DisasContext *s, int reg)
>  {
> --
> 2.25.1
>
>

