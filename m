Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYdv4-0007Aa-Ot
	for mharc-qemu-riscv@gnu.org; Sun, 27 Mar 2022 21:11:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYdv3-00078t-AH; Sun, 27 Mar 2022 21:11:41 -0400
Received: from [2607:f8b0:4864:20::12d] (port=43902
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYdv1-00008O-Ly; Sun, 27 Mar 2022 21:11:41 -0400
Received: by mail-il1-x12d.google.com with SMTP id d3so8937246ilr.10;
 Sun, 27 Mar 2022 18:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WnPRm8LeSMCXxRdOBDwdcn6i2Dkrd2ics/7vBvBMYNM=;
 b=Eyriib2sGLuGS9QWeDnGhlCevQ3yDdDbHJ5IIFhgPYh8xug/tW5FJc6CaVn8q9BMTk
 P7xruwS0LP/4YDY3zca1xN9kfDjOrUqy8SXlc28BASLbe4JBEioSeRvzKzLycNSBZE5k
 ExIoUiSCIO+3Ieai62CS7XH3MfMyk7sd5VAh27Z2SmG02tVDr27Dv4ZRHttp/7vwaA/0
 K9+NghvrIPo5pu6P9nzBAzEQIxcbIeapCJkeaNy1b9GSukUF8nNTnChaCxM4qfprWCiW
 LSFzU/+OerVooQCeuY+7K5BDpKt/1BjvyXY1wxyEPW75z22yZrI821avGnwh4LIN5bKe
 pSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WnPRm8LeSMCXxRdOBDwdcn6i2Dkrd2ics/7vBvBMYNM=;
 b=dyutmH8Hq539Xacez5pZHn0nh4Mnm1Hh2PtK+erXB3vokUXKge4Dd3r5X4re+kSwHO
 nCdRDyjobXkM2AJBMnJ+VQ4+US1Ns3psoDVvoG8mim/3f8oODNfQwHDoUC+Be0QzExs6
 JC9anmvelkjq7bhbL3xywR+DcUGzSgpj1T9mUd1djMt3lIGWBuHuflnnlkrfkMj0jTOw
 pAWUofGU7kh8hdHWihsi83HeAme7eMvJTJ0hHO+MfS8H5c2mRCeb2b00RzO5xOcdW3R4
 9ij7jWfec5SkMh2OXx3t4FkFZu9whuhBzY//v0QiQa8sLySX4xLeWGe5WrQ9NqcRNA4m
 DYJA==
X-Gm-Message-State: AOAM533FYLuI7S5jw5Jrfm4O5vhRhRgcI+aqTlephJZ25Vcybv+rKoIw
 gVKneL71M2GmyX1c/G20TbLJnolsU8/695JZ5Dw=
X-Google-Smtp-Source: ABdhPJyHoTV2wSGgPw28ZXY6Eudwpf/p38PKIB+ZwttdFH53EeGrs1aNzT1WBJgdLGhd3nI2JKVEf0U6a2HqvQQlI5c=
X-Received: by 2002:a05:6e02:219c:b0:2c9:a936:7a1 with SMTP id
 j28-20020a056e02219c00b002c9a93607a1mr2939970ila.55.1648429898221; Sun, 27
 Mar 2022 18:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
 <20220325085902.29500-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220325085902.29500-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 11:11:11 +1000
Message-ID: <CAKmqyKOLdqCXc7TgS4Mnn1-Y231rRA8TuqffgfQThXDB5Yc8QA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: optimize helper for vmv<nr>r.v
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 28 Mar 2022 01:11:41 -0000

On Fri, Mar 25, 2022 at 7:01 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> LEN is not used for GEN_VEXT_VMV_WHOLE macro, so vmv<nr>r.v can share
> the same helper
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  5 +----
>  target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++----------
>  target/riscv/vector_helper.c            | 29 ++++++++++---------------
>  3 files changed, 18 insertions(+), 33 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 26bbab2fab..a669d0187b 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1086,10 +1086,7 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
> -DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
> -DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
> -DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
> +DEF_HELPER_4(vmvr_v, void, ptr, ptr, env, i32)
>
>  DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 2878ca3132..ec7c0e0d36 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3695,7 +3695,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>   * Whole Vector Register Move Instructions ignore vtype and vl setting.
>   * Thus, we don't need to check vill bit. (Section 16.6)
>   */
> -#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             \
> +#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
>  static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>  {                                                                       \
>      if (require_rvv(s) &&                                               \
> @@ -3710,13 +3710,8 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>          } else {                                                        \
>              TCGLabel *over = gen_new_label();                           \
>              tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  \
> -                                                                        \
> -            static gen_helper_gvec_2_ptr * const fns[4] = {             \
> -                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 \
> -                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 \
> -            };                                                          \
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
> -                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     \
> +                               cpu_env, maxsz, maxsz, 0, gen_helper_vmvr_v); \
>              mark_vs_dirty(s);                                           \
>              gen_set_label(over);                                        \
>          }                                                               \
> @@ -3725,10 +3720,10 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>      return false;                                                       \
>  }
>
> -GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
> -GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
> -GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
> -GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
> +GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
> +GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
> +GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
> +GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
>
>  static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
>  {
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 3bd4aac9c9..1d4982ef7f 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4888,25 +4888,18 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
>  GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
>
>  /* Vector Whole Register Move */
> -#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
> -void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
> -                  uint32_t desc)                           \
> -{                                                          \
> -    /* EEW = 8 */                                          \
> -    uint32_t maxsz = simd_maxsz(desc);                     \
> -    uint32_t i = env->vstart;                              \
> -                                                           \
> -    memcpy((uint8_t *)vd + H1(i),                          \
> -           (uint8_t *)vs2 + H1(i),                         \
> -           maxsz - env->vstart);                           \
> -                                                           \
> -    env->vstart = 0;                                       \
> -}
> +void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
> +{
> +    /* EEW = 8 */
> +    uint32_t maxsz = simd_maxsz(desc);
> +    uint32_t i = env->vstart;
> +
> +    memcpy((uint8_t *)vd + H1(i),
> +           (uint8_t *)vs2 + H1(i),
> +           maxsz - env->vstart);
>
> -GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
> -GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
> -GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
> -GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
> +    env->vstart = 0;
> +}
>
>  /* Vector Integer Extension */
>  #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
> --
> 2.17.1
>
>

