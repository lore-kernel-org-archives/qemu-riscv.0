Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aex-0006Uf-WD
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:39:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aew-0006Tg-96; Mon, 17 Jan 2022 17:39:30 -0500
Received: from [2607:f8b0:4864:20::133] (port=33698
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aeu-0007Ta-P4; Mon, 17 Jan 2022 17:39:29 -0500
Received: by mail-il1-x133.google.com with SMTP id a2so10133030ilr.0;
 Mon, 17 Jan 2022 14:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CCuZd4k4pJMjMvTrczKQQIZUc6D9beR9U8HIUs17Cbo=;
 b=ED2AH8sxilUtYIsH58W1SHo4wcP9LwahXJhDF611vz82Vh9y5xUvxz1BHrRf1WcKRP
 XchO0cY8sl2bl/vYP+ziAe3y38PdmbcrVP7KMIlmyGpy4imrrrI/aEvLWTnsU29EMb9J
 eIGFnUoqORanLv0MeKEyP3IBU2NDKTTDt6iElmEdBzQquW+QzrTuDqHHftJxiHUTbJWJ
 OOkZ5YSdhNXIm6u7ScYX3cIzNSp1QabACymZswyIh+SR+GCUW0UXbs0Kgrm0blzL7lcY
 H9yd0l6ZPEkljTBeUuxmhkRUczNnk+Pd7SIywyjAeKfhJR1nEMBE25iNJwVtP2Tasp4M
 yxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CCuZd4k4pJMjMvTrczKQQIZUc6D9beR9U8HIUs17Cbo=;
 b=zmR+dUdLx6AjuvoU1ZAvmxAMbTSw8nBHdCszmQA1ECRWGwWmCbo61wKhzzBxglXx/U
 5fAABg53pHmTD3dQ/vwAbo3BDXi02CtmNWl7gnyPK7eVL6u2QFZinsVfg0MbTx3LuGJp
 X3t4vBErmWCrAQ6IzNvFOjXzqAKWlDVBePyIEpXFd0gBz0IsUgKi6aQZSKYstIdQsC1Q
 jVMRroHM+KR3N2lbTjz6+9FcYKi/tmiiL35J4PyJwGV4Jl8Zfq7PTi9b/G01aBSnAJno
 +06Py+QhHh6t8jD28DM2IZ4fpuTuHia9yMgz68xxhO+yC0IyXJt/JpT4eqhj4sD984L0
 N+2g==
X-Gm-Message-State: AOAM53263jsihA9Bj8aWJTg12ubbZZFoLOSNqbLwBbQ2W3LyNQ5gVX5a
 62Q2srexMNNRq9r/pivFNJBdHxjgytj6XBIMVgs=
X-Google-Smtp-Source: ABdhPJytow7oAvAVubeViGjQvNljP+KUHgJVRf0Rp5UGDCSQRmmIQabMg+zZUGg1S7iMPEe4vZ8XFZaIUylN0hj2vzs=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr12287534ilu.290.1642459167379; 
 Mon, 17 Jan 2022 14:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-7-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-7-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:39:00 +1000
Message-ID: <CAKmqyKNYaN1HYRP+MR=Q10JZ-nW4VOCTQoG3H8Mq6VEtAqCJfg@mail.gmail.com>
Subject: Re: [PATCH 06/17] target/riscv: rvv-1.0: Add Zve64f support for
 scalar fp insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 22:39:30 -0000

On Wed, Dec 29, 2021 at 12:43 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Zve64f extension requires the scalar processor to implement the F
> extension and implement all vector floating-point instructions for
> floating-point operands with EEW=32 (i.e., no widening floating-point
> operations).
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 41 +++++++++++++++++++------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index a1e403fe86..0aa8b7918f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
>      }
>  }
>
> +static bool require_zve64f(DisasContext *s)
> +{
> +    /* RVV + Zve64f = RVV. */
> +    if (has_ext(s, RVV)) {
> +        return true;
> +    }
> +
> +    /* Zve64f doesn't support FP64. (Section 18.2) */
> +    return s->ext_zve64f ? s->sew <= MO_32 : true;
> +}
> +
>  /* Destination vector register group cannot overlap source mask register. */
>  static bool require_vm(int vm, int vd)
>  {
> @@ -2204,7 +2215,8 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
>      return require_rvv(s) &&
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
> +           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           require_zve64f(s);
>  }
>
>  /* OPFVV without GVEC IR */
> @@ -2284,7 +2296,8 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
>      return require_rvv(s) &&
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_ss(s, a->rd, a->rs2, a->vm);
> +           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> +           require_zve64f(s);
>  }
>
>  /* OPFVF without GVEC IR */
> @@ -2501,7 +2514,8 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             /* OPFV instructions ignore vs1 check */
> -           vext_check_ss(s, a->rd, a->rs2, a->vm);
> +           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> +           require_zve64f(s);
>  }
>
>  static bool do_opfv(DisasContext *s, arg_rmr *a,
> @@ -2566,7 +2580,8 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
>      return require_rvv(s) &&
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_mss(s, a->rd, a->rs1, a->rs2);
> +           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
> +           require_zve64f(s);
>  }
>
>  GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
> @@ -2579,7 +2594,8 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
>      return require_rvv(s) &&
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_ms(s, a->rd, a->rs2);
> +           vext_check_ms(s, a->rd, a->rs2) &&
> +           require_zve64f(s);
>  }
>
>  GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
> @@ -2600,7 +2616,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>      if (require_rvv(s) &&
>          require_rvf(s) &&
>          vext_check_isa_ill(s) &&
> -        require_align(a->rd, s->lmul)) {
> +        require_align(a->rd, s->lmul) &&
> +        require_zve64f(s)) {
>          gen_set_rm(s, RISCV_FRM_DYN);
>
>          TCGv_i64 t1;
> @@ -3326,7 +3343,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>  {
>      if (require_rvv(s) &&
>          require_rvf(s) &&
> -        vext_check_isa_ill(s)) {
> +        vext_check_isa_ill(s) &&
> +        require_zve64f(s)) {
>          gen_set_rm(s, RISCV_FRM_DYN);
>
>          unsigned int ofs = (8 << s->sew);
> @@ -3352,7 +3370,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>  {
>      if (require_rvv(s) &&
>          require_rvf(s) &&
> -        vext_check_isa_ill(s)) {
> +        vext_check_isa_ill(s) &&
> +        require_zve64f(s)) {
>          gen_set_rm(s, RISCV_FRM_DYN);
>
>          /* The instructions ignore LMUL and vector register group. */
> @@ -3403,13 +3422,15 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
>  static bool fslideup_check(DisasContext *s, arg_rmrr *a)
>  {
>      return slideup_check(s, a) &&
> -           require_rvf(s);
> +           require_rvf(s) &&
> +           require_zve64f(s);
>  }
>
>  static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
>  {
>      return slidedown_check(s, a) &&
> -           require_rvf(s);
> +           require_rvf(s) &&
> +           require_zve64f(s);
>  }
>
>  GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
> --
> 2.31.1
>
>

