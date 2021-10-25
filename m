Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1metFS-0006jQ-2y
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 02:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1metFP-0006iB-63; Mon, 25 Oct 2021 02:14:15 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:46926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1metFM-00036t-SI; Mon, 25 Oct 2021 02:14:14 -0400
Received: by mail-io1-xd34.google.com with SMTP id n10so4510910iod.13;
 Sun, 24 Oct 2021 23:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGnuryys+Ey8PEFwInEtwzitz5t0yqvSlkFOY5FLj1A=;
 b=gkeisXPru5iAHSNfBSgxHGi1y807XtAi4RGusb6cYJROi6KKit0mG/nnBgnc8K0XUW
 Z1MAhbkANhMzCL65s/XmuC5wk8kxtMgGf3IE1mrPiRkO4yXbaBaCCgt9WAsYwmOsHeOG
 7a3WTbgo6YR6APSLU39wrZStA8X1qlJyZ7lHpVMMH2V9NNLBjgGSL/eFgrenfRwCg0Ci
 Iu7lPuC1A6AMvsuu3np2M18PTwifCHyZTDmJTkDQISt7RUKryL5u7W2K+oRkWOZEAw+N
 AjR4N9jIUQZBfyVmMSWDUJVnrwCvTCpDLIROQWI+H4hmqX+L823KPhpALHChI6JdjxPV
 vtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGnuryys+Ey8PEFwInEtwzitz5t0yqvSlkFOY5FLj1A=;
 b=lOMXXVLVkECvLvd8VrfKmvIa32FKXkJbY/nFsrwyHGwfkwryh/bjAS2hpCu6dlM2gr
 8UgKXyU3ZTzp3T99Kar+3Xb/9vce+5ztReRJ9Eri+LxpC9YM4wKMJNYt6UNhHmD25sCz
 KTf7JB2l8IQGgQt+bE83D5NJN4SHEdR5I8+0dtHxCuCgb5/XAF0vSPAKufpIXoBv5fkS
 iy47i1YrOQitm9H7FyQSfJmy177axeFgUKDCv6Om5RiNxKgIt1cKieWxVJwKqn+AlUKm
 88AFAAK5vly/i8YrpBp320J038EEo8GicOolmqTd/7R/F+mj7hv2+snzhEbEabRCV0Eu
 pf9g==
X-Gm-Message-State: AOAM532F9BUDpdEnHUGGYCpnLwLGO5Q8sM68ujWoR6BukL9fe736IEIk
 TYghyPuyKKov+Yha03tm79IGBKaB2i5M4/mY1uQ=
X-Google-Smtp-Source: ABdhPJzsjZSb6+hB7D4Rl5MAURivml1+Jhw2bxQDRKvtRvV9dbvovDwEe0CrfZepTk4AiQSdFRHYKHY5kTtbo29ntss=
X-Received: by 2002:a05:6602:2bf7:: with SMTP id
 d23mr9217165ioy.187.1635142451224; 
 Sun, 24 Oct 2021 23:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-59-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-59-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 16:13:44 +1000
Message-ID: <CAKmqyKNsbkVh4Mu=apDu3j0D0noHi0yKjKVvJPTz_dqy62xiNQ@mail.gmail.com>
Subject: Re: [PATCH v8 51/78] target/riscv: rvv-1.0: floating-point slide
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 06:14:15 -0000

On Fri, Oct 15, 2021 at 6:38 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add the following instructions:
>
> * vfslide1up.vf
> * vfslide1down.vf
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   7 ++
>  target/riscv/insn32.decode              |   2 +
>  target/riscv/insn_trans/trans_rvv.c.inc |  16 +++
>  target/riscv/vector_helper.c            | 141 ++++++++++++++++--------
>  4 files changed, 121 insertions(+), 45 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 304c12494d4..012d0343771 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1071,6 +1071,13 @@ DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vslide1down_vx_w, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vslide1down_vx_d, void, ptr, ptr, tl, ptr, env, i32)
>
> +DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)
> +
>  DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 7548b71efdb..c5cc14c45c4 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -577,6 +577,8 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
>  vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
>  vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
>  vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
> +vfslide1up_vf   001110 . ..... ..... 101 ..... 1010111 @r_vm
> +vfslide1down_vf 001111 . ..... ..... 101 ..... 1010111 @r_vm
>  vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
>  vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
>  vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index e59fc5a01d8..7ee1e122e8e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3120,6 +3120,22 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
>  GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
>  GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
>
> +/* Vector Floating-Point Slide Instructions */
> +static bool fslideup_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return slideup_check(s, a) &&
> +           require_rvf(s);
> +}
> +
> +static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return slidedown_check(s, a) &&
> +           require_rvf(s);
> +}
> +
> +GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
> +GEN_OPFVF_TRANS(vfslide1down_vf, fslidedown_check)
> +
>  /* Vector Register Gather Instruction */
>  static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
>  {
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index d79f59e443e..7fa5189af4e 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4455,57 +4455,108 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
>  GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
>  GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
>
> -#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H)                             \
> -void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
> -                  CPURISCVState *env, uint32_t desc)                      \
> -{                                                                         \
> -    uint32_t vm = vext_vm(desc);                                          \
> -    uint32_t vl = env->vl;                                                \
> -    uint32_t i;                                                           \
> -                                                                          \
> -    for (i = 0; i < vl; i++) {                                            \
> -        if (!vm && !vext_elem_mask(v0, i)) {                              \
> -            continue;                                                     \
> -        }                                                                 \
> -        if (i == 0) {                                                     \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> -        } else {                                                          \
> -            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
> -        }                                                                 \
> -    }                                                                     \
> +#define GEN_VEXT_VSLIE1UP(ESZ, H)                                           \
> +static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
> +                     CPURISCVState *env, uint32_t desc)                     \
> +{                                                                           \
> +    typedef uint##ESZ##_t ETYPE;                                            \
> +    uint32_t vm = vext_vm(desc);                                            \
> +    uint32_t vl = env->vl;                                                  \
> +    uint32_t i;                                                             \
> +                                                                            \
> +    for (i = 0; i < vl; i++) {                                              \
> +        if (!vm && !vext_elem_mask(v0, i)) {                                \
> +            continue;                                                       \
> +        }                                                                   \
> +        if (i == 0) {                                                       \
> +            *((ETYPE *)vd + H(i)) = s1;                                     \
> +        } else {                                                            \
> +            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));             \
> +        }                                                                   \
> +    }                                                                       \
> +}
> +
> +GEN_VEXT_VSLIE1UP(8,  H1)
> +GEN_VEXT_VSLIE1UP(16, H2)
> +GEN_VEXT_VSLIE1UP(32, H4)
> +GEN_VEXT_VSLIE1UP(64, H8)
> +
> +#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
> +                  CPURISCVState *env, uint32_t desc)              \
> +{                                                                 \
> +    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
>  }
>
>  /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=x[rs1], vd[i+1] = vs2[i] */
> -GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t,  H1)
> -GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2)
> -GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4)
> -GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8)
> -
> -#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H)                           \
> -void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
> -                  CPURISCVState *env, uint32_t desc)                      \
> -{                                                                         \
> -    uint32_t vm = vext_vm(desc);                                          \
> -    uint32_t vl = env->vl;                                                \
> -    uint32_t i;                                                           \
> -                                                                          \
> -    for (i = 0; i < vl; i++) {                                            \
> -        if (!vm && !vext_elem_mask(v0, i)) {                              \
> -            continue;                                                     \
> -        }                                                                 \
> -        if (i == vl - 1) {                                                \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> -        } else {                                                          \
> -            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
> -        }                                                                 \
> -    }                                                                     \
> +GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, 8)
> +GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
> +GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
> +GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
> +
> +#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                          \
> +static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
> +                       CPURISCVState *env, uint32_t desc)                     \
> +{                                                                             \
> +    typedef uint##ESZ##_t ETYPE;                                              \
> +    uint32_t vm = vext_vm(desc);                                              \
> +    uint32_t vl = env->vl;                                                    \
> +    uint32_t i;                                                               \
> +                                                                              \
> +    for (i = 0; i < vl; i++) {                                                \
> +        if (!vm && !vext_elem_mask(v0, i)) {                                  \
> +            continue;                                                         \
> +        }                                                                     \
> +        if (i == vl - 1) {                                                    \
> +            *((ETYPE *)vd + H(i)) = s1;                                       \
> +        } else {                                                              \
> +            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));               \
> +        }                                                                     \
> +    }                                                                         \
> +}
> +
> +GEN_VEXT_VSLIDE1DOWN(8,  H1)
> +GEN_VEXT_VSLIDE1DOWN(16, H2)
> +GEN_VEXT_VSLIDE1DOWN(32, H4)
> +GEN_VEXT_VSLIDE1DOWN(64, H8)
> +
> +#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
> +                  CPURISCVState *env, uint32_t desc)              \
> +{                                                                 \
> +    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
>  }
>
>  /* vslide1down.vx vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=x[rs1] */
> -GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t,  H1)
> -GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
> -GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
> -GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
> +GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, 8)
> +GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, 16)
> +GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
> +GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
> +
> +/* Vector Floating-Point Slide Instructions */
> +#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
> +void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
> +                  CPURISCVState *env, uint32_t desc)          \
> +{                                                             \
> +    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
> +}
> +
> +/* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=f[rs1], vd[i+1] = vs2[i] */
> +GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
> +GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
> +GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
> +
> +#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
> +void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
> +                  CPURISCVState *env, uint32_t desc)          \
> +{                                                             \
> +    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
> +}
> +
> +/* vfslide1down.vf vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=f[rs1] */
> +GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_h, 16)
> +GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_w, 32)
> +GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
>
>  /* Vector Register Gather Instruction */
>  #define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                    \
> --
> 2.25.1
>
>

