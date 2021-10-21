Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdPdI-00029S-MR
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 00:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPdG-00024Q-Ke; Thu, 21 Oct 2021 00:24:46 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPdC-0006YT-Rk; Thu, 21 Oct 2021 00:24:46 -0400
Received: by mail-il1-x12f.google.com with SMTP id h27so18694384ila.5;
 Wed, 20 Oct 2021 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mf5Iindv+dtJ6JCZYC13YBeyakfHDvNtwlQvTt+eQcs=;
 b=KKQ2Z+dhyDlLOIyyJ/d/BTpazrRo5fTe+3okCtH82LbcduMg1q4IRVL8dpnmdaZ+7+
 gWcApqU7g2Js6OhnSzGtZVsIaMgE9a1mt7MnpTSJyVzaOu/uRqzqKgZORRbSawGZxFc6
 qGvT96i5EliUYAz2KejkZDdSiLzlQNPP0zNQN0FyGZRG0ZmbFY70dDXH/t9gKu4Ysb9T
 gzYpRM+ANH6gOvBGqt5vXmXM1joZXZ/SgOpZqtkM4bzjglvtrrinpy83xb0kCNOWiuJ6
 N2OeKFsp1cppFz+h+iR4WflKbegPJG4Py5pjPvfRzcGI52yoWgv42S7I7/WxCTrd95Tn
 /QcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mf5Iindv+dtJ6JCZYC13YBeyakfHDvNtwlQvTt+eQcs=;
 b=XJy+86D/DQ1wpAugrTqf9uPmGkgeXJ0qumR+/U3mchvkaWhWCz7/3W3hCI1c5l56lv
 hmHLTGDGJrEVCMdR/vbHTLzVpln2eq3GjoipItq5SdWDf5SreTQm6+RXYbjY3r8KwsYI
 7GSs0SwaV+VOkiBx0nqbyfwbJ4FWIcYOVElLSyXZ5nMB2MaZWQKK4d+IWDVI3QekNsJq
 NDeeJbYQnNQlQ07uConXIbp2ZsdT8XZxA2T0hn/QoEfSW4aZipGQl8O7gL/TdpVB3LhZ
 f9oqNz053JgIwxv9emcBrT7k5poiDbXD7XtpNXSAbYPEWVf0aN07I0q2S+lbGwVuNUgm
 LfNQ==
X-Gm-Message-State: AOAM531O9HIGYyBweg0ofUIOv2xOm+aO9+6dIDAB+UMkwZLuzcAkfnLZ
 6LVHKdiDoFm+m5qr/IHFaFQlPem2O6XArH9Ezks=
X-Google-Smtp-Source: ABdhPJxOdX40qme0hTI346V4I8q4kcu/h/GPfFtMtUkbt9M3P6iy+UzUfD8JihMdN3sro0zK4CQLYAXcS0u3jUuZnqE=
X-Received: by 2002:a05:6e02:1885:: with SMTP id
 o5mr2080756ilu.221.1634790281284; 
 Wed, 20 Oct 2021 21:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-44-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-44-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 14:24:15 +1000
Message-ID: <CAKmqyKNP3Ea73ktT5On_BErud6SQB7BbUp=K430xdE38X_V1gQ@mail.gmail.com>
Subject: Re: [PATCH v8 36/78] target/riscv: rvv-1.0: integer scalar move
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
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
X-List-Received-Date: Thu, 21 Oct 2021 04:24:47 -0000

On Fri, Oct 15, 2021 at 6:13 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> * Remove "vmv.s.x: dothing if rs1 == 0" constraint.
> * Add vmv.x.s instruction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  3 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 43 ++++++++++++++++++++-----
>  2 files changed, 37 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4653a9679ef..e33ec82fdf8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -634,8 +634,9 @@ vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
>  vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
>  viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
>  vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
> +vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
> +vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
>  vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
> -vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
>  vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
>  vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
>  vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 43da36f4200..42a9f2764d5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2977,27 +2977,54 @@ static void vec_element_storei(DisasContext *s, int vreg,
>      store_element(val, cpu_env, endian_ofs(s, vreg, idx), s->sew);
>  }
>
> +/* vmv.x.s rd, vs2 # x[rd] = vs2[0] */
> +static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
> +{
> +    if (require_rvv(s) &&
> +        vext_check_isa_ill(s)) {
> +        TCGv_i64 t1;
> +        TCGv dest;
> +
> +        t1 = tcg_temp_new_i64();
> +        dest = tcg_temp_new();
> +        /*
> +         * load vreg and sign-extend to 64 bits,
> +         * then truncate to XLEN bits before storing to gpr.
> +         */
> +        vec_element_loadi(s, t1, a->rs2, 0, true);
> +        tcg_gen_trunc_i64_tl(dest, t1);
> +        gen_set_gpr(s, a->rd, dest);
> +        tcg_temp_free_i64(t1);
> +        tcg_temp_free(dest);
> +
> +        return true;
> +    }
> +    return false;
> +}
> +
>  /* vmv.s.x vd, rs1 # vd[0] = rs1 */
>  static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>  {
> -    if (vext_check_isa_ill(s)) {
> +    if (require_rvv(s) &&
> +        vext_check_isa_ill(s)) {
>          /* This instruction ignores LMUL and vector register groups */
> -        int maxsz = s->vlen >> 3;
>          TCGv_i64 t1;
> +        TCGv s1;
>          TCGLabel *over = gen_new_label();
>
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> -        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), maxsz, maxsz, 0);
> -        if (a->rs1 == 0) {
> -            goto done;
> -        }
>
>          t1 = tcg_temp_new_i64();
> -        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
> +
> +        /*
> +         * load gpr and sign-extend to 64 bits,
> +         * then truncate to SEW bits when storing to vreg.
> +         */
> +        s1 = get_gpr(s, a->rs1, EXT_NONE);
> +        tcg_gen_ext_tl_i64(t1, s1);
>          vec_element_storei(s, a->rd, 0, t1);
>          tcg_temp_free_i64(t1);
>          mark_vs_dirty(s);
> -    done:
>          gen_set_label(over);
>          return true;
>      }
> --
> 2.25.1
>
>

