Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdPex-0004TH-Si
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 00:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPew-0004QM-Of; Thu, 21 Oct 2021 00:26:30 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPeu-00080n-M1; Thu, 21 Oct 2021 00:26:30 -0400
Received: by mail-il1-x132.google.com with SMTP id h2so3799526ili.11;
 Wed, 20 Oct 2021 21:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jGpNECxP98Qp+62Nc39s6s7tKSuNAcM86hAEa77/TzM=;
 b=YPUN78AgSg42/WWr+DTuUZbl1BdIEOwfuf5ubpt5+aY8aHz1lCB7ZuKLmpgh0ulEgn
 Oj7CWk/nS1N3nc//j7hY/rdN840MN3F8ugod3WEKP+7NCTwW6Jw/+XwSiFI2kRjbmK8q
 SdVuyOpGBXTgmXNZ89W5WthBPAjiczG10pAu6EaZn+JQNcVPajSnf5Z06Mgbu1lZW+kp
 U1bfeXSRvoNwjL89QS7CeQhfSQ+nFqKaON103TaHD/bwC241oJmTNXCg1M1uwMX6Qh0D
 Vf/Phrzd0WuATNQsrHdcdJerYxHmpYO8u4HIWFRW96F26TJqFkz307/aQZnoJhzvZy6o
 M9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jGpNECxP98Qp+62Nc39s6s7tKSuNAcM86hAEa77/TzM=;
 b=vwm3/OuJVAB5abPH7r2TFt1fzjaVnWC4/Jm2FHRHzaMZRcyJCJFfppu2DlAnarPP5E
 TYmHhgVQp5QKbF2xJV+2LTUTQuX1DBMgr/y7HJwBgFPz9ZewlhgnmetTEChjmZ4ys/3K
 iry0t+OIeGF8WMR9cXUT/41PhYZDZD3p98orpthkKeEqtH06N5Ww9vtx3inavBlo7xX7
 BfeUyjvA+XolTHWqAAz+ULX4t0Y8yH5jfWFgMpjrzbnN1SAPTHkZuS8tqHxQ7pAhzBCj
 ZXVG7jDKCa5XN6MRQxsydGXaXpgQeHb5tmGBJMlFpkBYEiexHcfZ+94GVlMwyYc9Y1mr
 YbIw==
X-Gm-Message-State: AOAM532RGEF6Qd/TegYHgwmDK9uKnxhjC50MwKD5J/g2Bgo3n4RFZ8dL
 T5rgl9bhB5q6lCLB1C9Vff21znA8vNkKJ0RnRJ0=
X-Google-Smtp-Source: ABdhPJw6r66ZyobFMg7jOqznodXaWd2ks2ELn7YEXNhVvmEcl3i8/68HwZd5XF0I8G1Di9/mVvh864rfbDlVXenHYak=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr2159429ilo.208.1634790386906; 
 Wed, 20 Oct 2021 21:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-46-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-46-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 14:26:00 +1000
Message-ID: <CAKmqyKPNUb5dqsH7AtRXDQBKxh1zy313PRY=GZmxHFUZoy8AzA@mail.gmail.com>
Subject: Re: [PATCH v8 38/78] target/riscv: rvv-1.0: floating-point scalar
 move instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 04:26:31 -0000

On Fri, Oct 15, 2021 at 6:15 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> NaN-boxed the scalar floating-point register based on RVV 1.0's rules.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  4 +--
>  target/riscv/insn_trans/trans_rvv.c.inc | 38 ++++++++++++-------------
>  target/riscv/internals.h                |  5 ----
>  3 files changed, 21 insertions(+), 26 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e33ec82fdf8..ab5fdbf9be8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -637,8 +637,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
>  vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
>  vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
>  vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
> -vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
> -vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
> +vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
> +vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
>  vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
>  vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
>  vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 1340ce56806..aec0316fba4 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3046,14 +3046,19 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>  /* Floating-Point Scalar Move Instructions */
>  static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>  {
> -    if (!s->vill && has_ext(s, RVF) &&
> -        (s->mstatus_fs != 0) && (s->sew != 0)) {
> -        unsigned int len = 8 << s->sew;
> +    if (require_rvv(s) &&
> +        require_rvf(s) &&
> +        vext_check_isa_ill(s)) {
> +        unsigned int ofs = (8 << s->sew);
> +        unsigned int len = 64 - ofs;
> +        TCGv_i64 t_nan;
>
>          vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
> -        if (len < 64) {
> -            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
> -                            MAKE_64BIT_MASK(len, 64 - len));
> +        /* NaN-box f[rd] as necessary for SEW */
> +        if (len) {
> +            t_nan = tcg_constant_i64(UINT64_MAX);
> +            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
> +                                t_nan, ofs, len);
>          }
>
>          mark_fs_dirty(s);
> @@ -3065,25 +3070,20 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>  /* vfmv.s.f vd, rs1 # vd[0] = rs1 (vs2=0) */
>  static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>  {
> -    if (!s->vill && has_ext(s, RVF) && (s->sew != 0)) {
> -        TCGv_i64 t1;
> +    if (require_rvv(s) &&
> +        require_rvf(s) &&
> +        vext_check_isa_ill(s)) {
>          /* The instructions ignore LMUL and vector register group. */
> -        uint32_t vlmax = s->vlen >> 3;
> +        TCGv_i64 t1;
> +        TCGLabel *over = gen_new_label();
>
>          /* if vl == 0, skip vector register write back */
> -        TCGLabel *over = gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
> -        /* zeroed all elements */
> -        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), vlmax, vlmax, 0);
> -
> -        /* NaN-box f[rs1] as necessary for SEW */
> +        /* NaN-box f[rs1] */
>          t1 = tcg_temp_new_i64();
> -        if (s->sew == MO_64 && !has_ext(s, RVD)) {
> -            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));
> -        } else {
> -            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
> -        }
> +        do_nanbox(s, t1, cpu_fpr[a->rs1]);
> +
>          vec_element_storei(s, a->rd, 0, t1);
>          tcg_temp_free_i64(t1);
>          mark_vs_dirty(s);
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 81f5dfa477a..ac062dc0b4e 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -32,11 +32,6 @@ target_ulong fclass_h(uint64_t frs1);
>  target_ulong fclass_s(uint64_t frs1);
>  target_ulong fclass_d(uint64_t frs1);
>
> -#define SEW8  0
> -#define SEW16 1
> -#define SEW32 2
> -#define SEW64 3
> -
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_riscv_cpu;
>  #endif
> --
> 2.25.1
>
>

