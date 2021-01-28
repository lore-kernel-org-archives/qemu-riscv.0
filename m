Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5Eh3-0004Rx-7b
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jan 2021 16:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5Eh2-0004RU-0f; Thu, 28 Jan 2021 16:19:08 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5Eh0-00074i-39; Thu, 28 Jan 2021 16:19:07 -0500
Received: by mail-io1-xd36.google.com with SMTP id n2so7120063iom.7;
 Thu, 28 Jan 2021 13:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FSkTVv7DkBfBjya7YXN+zpjtaqkJcdHnOkW0S7PGBU=;
 b=fJNVoSoiK81tv7Rb9jZ+DZv54w6j7BR2owTlsfvdlGL0uJvI0+cjNU1Rgfc7iI/sph
 qFMI81iq4zauFNfqh+VjlhDzSi+7sbXyAqNwLsYO6RCO/A2OoUP+dJuFLpA/4Yi0VW/P
 B/+zzsNpuFhOHKoL2ZI8sXvLJ2vileRfMmsExjLqPd4zYipKOThDSY/W2/gx2gkhDK8i
 g9bxhHS8HuVGiv7gkI85WiMWY2MIPxjGT5RTfU0evi8BBkx2z74NbBIeFHo3B5nXHb/L
 NRQJiQ33nNj7M3mqY6XQqeKGY+va/z8lwarBG0O1WbFA8zr+/NxlXxMLaJG+3iGq/28p
 rgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FSkTVv7DkBfBjya7YXN+zpjtaqkJcdHnOkW0S7PGBU=;
 b=GCasky5s+XT8zbfBvdMv74aZ+YKRC4Cl2cm90gubjNgJZKsmLew+W6lZB7zg8pa3vv
 3U3izoKDBlaUbMDEP0cqV2BTgN4Z+az7QvjnGc1uE35YzCn6D9Po2qmPcXdvgikaVmIn
 1fgPIVbu9U752xqJYdyx/iEKZEPgyeR3Wt0Rj9/UsGVX5GjLy15g5wx8VJJwWmQG4WMa
 hPRZEJG/CbfG+MMdU1tTYQ7XcdBLRTFBXRUulLdzaRNNGRkVGoAyIpAmhq3vj2Ke/apU
 3pCA6rZfnfk0qOy1GeTD2968l4XYcXLKV/PA/DPg+uKitFpvUfcBOXF3YoSiQnraorvQ
 9VDA==
X-Gm-Message-State: AOAM530/jJZGToP6KrCQLbuHvy++gKQihO2g/jJiaKM+NcwLfW211Ab9
 lrhM6vib4q8Bqxt5yV2eg8SlhHvhpBhtbGH4bC4=
X-Google-Smtp-Source: ABdhPJyDpwW8DMWdAyIC7FoskZggAf2WDCk5pZvDRleanw15cBgUKHzA3I4Sg2aGDWl/A0iz1qRKJDRuX3mx5DFqQM8=
X-Received: by 2002:a6b:d30d:: with SMTP id s13mr1594293iob.175.1611868744634; 
 Thu, 28 Jan 2021 13:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-35-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-35-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Jan 2021 13:18:38 -0800
Message-ID: <CAKmqyKOy+3zjrDAd-EAC5AYwbEnkM=OSMFSk61pHJrJgH9+t_A@mail.gmail.com>
Subject: Re: [PATCH v6 34/72] target/riscv: rvv-1.0: register gather
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 28 Jan 2021 21:19:08 -0000

On Tue, Jan 12, 2021 at 2:10 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> * Add vrgatherei16.vv instruction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  4 ++++
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvv.c.inc | 27 ++++++++++++++++++++++---
>  target/riscv/vector_helper.c            | 23 ++++++++++++---------
>  4 files changed, 43 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index abf08dbc710..ea6c39b49a8 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1100,6 +1100,10 @@ DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrgatherei16_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrgatherei16_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrgatherei16_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrgatherei16_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vx_b, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vx_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index a593938e5c8..85cb3c81be0 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -620,6 +620,7 @@ vslidedown_vx   001111 . ..... ..... 100 ..... 1010111 @r_vm
>  vslidedown_vi   001111 . ..... ..... 011 ..... 1010111 @r_vm
>  vslide1down_vx  001111 . ..... ..... 110 ..... 1010111 @r_vm
>  vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
> +vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
>  vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
>  vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
>  vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 72222d73e0e..bc780912b2b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3323,7 +3323,25 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
>             require_vm(a->vm, a->rd);
>  }
>
> +static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
> +{
> +    int8_t emul = MO_16 - s->sew + s->lmul;
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           (emul >= -3 && emul <= 3) &&
> +           require_align(a->rd, s->lmul) &&
> +           require_align(a->rs1, emul) &&
> +           require_align(a->rs2, s->lmul) &&
> +           (a->rd != a->rs2 && a->rd != a->rs1) &&
> +           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
> +                          a->rs1, 1 << MAX(emul, 0)) &&
> +           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
> +                          a->rs2, 1 << MAX(s->lmul, 0)) &&
> +           require_vm(a->vm, a->rd);
> +}
> +
>  GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
> +GEN_OPIVV_TRANS(vrgatherei16_vv, vrgatherei16_vv_check)
>
>  static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
>  {
> @@ -3343,7 +3361,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> -        int vlmax = s->vlen;
> +        int scale = s->lmul - (s->sew + 3);
> +        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
>          TCGv_i64 dest = tcg_temp_new_i64();
>
>          if (a->rs1 == 0) {
> @@ -3374,8 +3393,10 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> -        if (a->rs1 >= s->vlen) {
> -            tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd),
> +        int scale = s->lmul - (s->sew + 3);
> +        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
> +        if (a->rs1 >= vlmax) {
> +            tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), 0);
>          } else {
>              tcg_gen_gvec_dup_mem(s->sew, vreg_ofs(s, a->rd),
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 8ccf538141c..782fe086f3e 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4666,11 +4666,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
>  GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
>
>  /* Vector Register Gather Instruction */
> -#define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H)                              \
> +#define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                    \
>  void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>                    CPURISCVState *env, uint32_t desc)                      \
>  {                                                                         \
> -    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
> +    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS1)));             \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
>      uint32_t index, i;                                                    \
> @@ -4679,20 +4679,25 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
> -        index = *((ETYPE *)vs1 + H(i));                                   \
> +        index = *((TS1 *)vs1 + HS1(i));                                   \
>          if (index >= vlmax) {                                             \
> -            *((ETYPE *)vd + H(i)) = 0;                                    \
> +            *((TS2 *)vd + HS2(i)) = 0;                                    \
>          } else {                                                          \
> -            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(index));           \
> +            *((TS2 *)vd + HS2(i)) = *((TS2 *)vs2 + HS2(index));           \
>          }                                                                 \
>      }                                                                     \
>  }
>
>  /* vd[i] = (vs1[i] >= VLMAX) ? 0 : vs2[vs1[i]]; */
> -GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  H1)
> -GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, H2)
> -GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, H4)
> -GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
> +GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  uint8_t,  H1, H1)
> +GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, uint16_t, H2, H2)
> +GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, uint32_t, H4, H4)
> +GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, uint64_t, H8, H8)
> +
> +GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_b, uint16_t, uint8_t,  H2, H1)
> +GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_h, uint16_t, uint16_t, H2, H2)
> +GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_w, uint16_t, uint32_t, H2, H4)
> +GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_d, uint16_t, uint64_t, H2, H8)
>
>  #define GEN_VEXT_VRGATHER_VX(NAME, ETYPE, H)                              \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
> --
> 2.17.1
>
>

