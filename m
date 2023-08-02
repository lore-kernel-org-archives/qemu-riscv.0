Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D2C001DF
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:23:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRCkp-0008BB-8U; Wed, 02 Aug 2023 10:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRCkh-0008AG-Ra; Wed, 02 Aug 2023 10:23:03 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRCke-0007Qx-0H; Wed, 02 Aug 2023 10:23:03 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-79aa01cc971so1478164241.0; 
 Wed, 02 Aug 2023 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690986168; x=1691590968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3s66DiSXIS1EOtq4NU0z0FuHIHj3ygj4PeUcghO14/8=;
 b=rDBc5UdTkevJBNALYD/Qwm5KlrdUwCmuP9m95m/sZOFx2lmQHVDheJEiRjAvBQNo6h
 pKP0LD2i2o8A5Dv9TDc9sTvXkZe6d9GUcTTmvOmlQ3/nQ75PlLjRyLNqH8cD8++7FhWW
 AzabZTQ3veLjmQtPHXEJfk38PkBlNCVNLM/1+A9xjcxBzl0UMC/MMn4gJXOZkzAHI35w
 31oQYpANiDPKHx72ms4yklFazlCwTcXqaXx/iOJc4Nez+AFbnQJKmn5C4DouW/tCyfUq
 ldbP11boYNakTCLz0T36AsRTxrmGAmLuzRthE9A7+ihxrCTh6o5pNZ2dW3UXaZ7RSilJ
 8hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690986168; x=1691590968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3s66DiSXIS1EOtq4NU0z0FuHIHj3ygj4PeUcghO14/8=;
 b=DQ/1o0dHrb+G1lXBJN49j0g58XdJlK5i1Mw40K+xP4eHQzBIlWhq/Jv7P/Ma+F+MLz
 93PTSh0LT5FP5xUjOI8r+Wb5ocuQR3dqHiItU8spJbQ6D45PiEBaj18TxhFK5N/xXhF/
 hAhgLclW00NjkKsxXrLA7nx2GU8ztgx+lWsFm9iMQjmSIUE5NU7kWQ8lqIL/r+4W9Aq+
 F3lLDm/hXif6S6hys+8iIxU56pY8pH5BoU9IBXfNFg5g4Z5RAE8IcY+nkvW5Y1PD+g8H
 Zl8jVxS3Xq0Eic8R2Db0dDSfu+VDVh9iGkbjVQ45owHy3Z0s7Rz6raHQdhvJ3//YqxWp
 zWYQ==
X-Gm-Message-State: ABy/qLZjFzXnGd3M7vOF9C/e8CFQNhbPEeQTeBbbrVVTTqZJ1UPQqaLg
 qnmhZ5B9yYMhgImfKA81RtcHyhbj4niEtV7myfg=
X-Google-Smtp-Source: APBJJlHvhFR4mvWL0lGH4Gkf+sArCyBkE3bjHeXIJL1gCFDyckkMC6OyhW2AJps7jltA6VE/ndUnyL3qRwBIY49I1Ys=
X-Received: by 2002:a1f:5f97:0:b0:481:521f:b704 with SMTP id
 t145-20020a1f5f97000000b00481521fb704mr5403034vkb.9.1690986167823; Wed, 02
 Aug 2023 07:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230711165917.2629866-1-max.chou@sifive.com>
 <20230711165917.2629866-4-max.chou@sifive.com>
In-Reply-To: <20230711165917.2629866-4-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 10:22:21 -0400
Message-ID: <CAKmqyKMj3f8VQtueddJRUcBBH7cPgLJFw4Db6i0O=Er9sWYmBQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/15] target/riscv: Remove redundant "cpu_vl == 0"
 checks
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, 
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jul 11, 2023 at 1:00=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
>
> Remove the redundant "vl =3D=3D 0" check which is already included within=
 the  vstart >=3D vl check, when vl =3D=3D 0.
>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 31 +------------------------
>  1 file changed, 1 insertion(+), 30 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 4a8e62a8bef..7e194aae34a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -617,7 +617,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
>      TCGv_i32 desc;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -786,7 +785,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
>      TCGv_i32 desc;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -893,7 +891,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
>      TCGv_i32 desc;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -1034,7 +1031,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, u=
int32_t data,
>      TCGv_i32 desc;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -1191,7 +1187,6 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
>          return false;
>      }
>
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
> @@ -1241,7 +1236,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
>      uint32_t data =3D 0;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -1405,7 +1399,6 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
>      uint32_t data =3D 0;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -1492,7 +1485,6 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
>      if (checkfn(s, a)) {
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> @@ -1575,7 +1567,6 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
>      if (opiwv_widen_check(s, a)) {
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> @@ -1648,7 +1639,6 @@ static bool opivv_trans(uint32_t vd, uint32_t vs1, =
uint32_t vs2, uint32_t vm,
>  {
>      uint32_t data =3D 0;
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      data =3D FIELD_DP32(data, VDATA, VM, vm);
> @@ -1842,7 +1832,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>              gen_helper_##NAME##_w,                                 \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2054,7 +2043,6 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
>                  gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
>              };
>              TCGLabel *over =3D gen_new_label();
> -            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>              tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> @@ -2078,7 +2066,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
>          vext_check_ss(s, a->rd, 0, 1)) {
>          TCGv s1;
>          TCGLabel *over =3D gen_new_label();
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
> @@ -2140,7 +2127,6 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
>                  gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
>              };
>              TCGLabel *over =3D gen_new_label();
> -            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>              tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              s1 =3D tcg_constant_i64(simm);
> @@ -2288,7 +2274,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, RISCV_FRM_DYN);                              \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2323,7 +2308,6 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
>      TCGv_i64 t1;
>
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
> @@ -2408,7 +2392,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
>          };                                                       \
>          TCGLabel *over =3D gen_new_label();                        \
>          gen_set_rm(s, RISCV_FRM_DYN);                            \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
>                                                                   \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
> @@ -2483,7 +2466,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, RISCV_FRM_DYN);                              \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2601,7 +2583,6 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
>          gen_set_rm_chkfrm(s, rm);
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> @@ -2713,7 +2694,6 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
>                  gen_helper_vmv_v_x_d,
>              };
>              TCGLabel *over =3D gen_new_label();
> -            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>              tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              t1 =3D tcg_temp_new_i64();
> @@ -2792,7 +2772,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm_chkfrm(s, FRM);                                 \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2844,7 +2823,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, RISCV_FRM_DYN);                              \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2912,7 +2890,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm_chkfrm(s, FRM);                                 \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2962,7 +2939,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm_chkfrm(s, FRM);                                 \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -3053,7 +3029,6 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
>          uint32_t data =3D 0;                                         \
>          gen_helper_gvec_4_ptr *fn =3D gen_helper_##NAME;             \
>          TCGLabel *over =3D gen_new_label();                          \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -3224,7 +3199,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
>          require_vm(a->vm, a->rd)) {
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> @@ -3411,7 +3385,6 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_=
s_x *a)
>          TCGv s1;
>          TCGLabel *over =3D gen_new_label();
>
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          t1 =3D tcg_temp_new_i64();
> @@ -3468,8 +3441,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfm=
v_s_f *a)
>          TCGv_i64 t1;
>          TCGLabel *over =3D gen_new_label();
>
> -        /* if vl =3D=3D 0 or vstart >=3D vl, skip vector register write =
back */
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        /* if vstart >=3D vl, skip vector register write back */
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          /* NaN-box f[rs1] */
> @@ -3720,7 +3692,6 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a,=
 uint8_t seq)
>      uint32_t data =3D 0;
>      gen_helper_gvec_3_ptr *fn;
>      TCGLabel *over =3D gen_new_label();
> -    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      static gen_helper_gvec_3_ptr * const fns[6][4] =3D {
> --
> 2.34.1
>

