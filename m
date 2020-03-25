Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHA4y-0006bZ-2z
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 13:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jHA4u-0006VV-9l
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 13:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jHA4s-00025u-Bp
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 13:44:32 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:36144)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jHA4o-00023R-0n; Wed, 25 Mar 2020 13:44:26 -0400
Received: by mail-vs1-xe43.google.com with SMTP id 184so1302693vsu.3;
 Wed, 25 Mar 2020 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HzTxdhjKRXuGd4FU9D4C1TJdTWnX5bZcMQPDdU84rlI=;
 b=s5OPESJ2nWg7U2Na0jHEiuuS+M38td3aFwZGNgjy2SGxPvRf4QmGE1Rxj5LsiPW6xX
 CsMlBRQsIbTPKJ1+ILuk27PjMigcxSKBOdFLypoWrvae3+27Yyx//ce8OqLE69NI98MW
 gHkTc1b8REAchAZmvz7St4KelGWvqmBE+G83ckR5fCvYujXh7S8yHn6FhgWE7mnZIDKz
 9RvGProQAXUQ+b3w7cWsaI/5iap8wBMcj88mb7pQcIe6aJNdmcorqE4QRTg/QxzwfKWe
 0FBL/wOFydx8Pd6xcmCLDzh27ssJuu1KXMt5Ip3WQu4syi/8szp/wrskjII6SAw5pb2y
 lyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzTxdhjKRXuGd4FU9D4C1TJdTWnX5bZcMQPDdU84rlI=;
 b=PNOXIA4+6hsDw88+bkEEQrVlDp+9PQ6r3kJiIF9d5O2dF6sJmsuBkEWhiAf2yDPmW4
 yxvRpr/tlvUxMVNnb+2jVlwN8LT76oZSZLYPHnxfHYKfa/G2axzKnw1YnoTWvdsnwan/
 Id2yuRKrrLQF8f5alM4DhlwJR19LHI0xgVedUG0CR5oYMl4JUwm0ObvFicG+gX+PTJin
 ReDfxu+NMbSQkupqyyyfiG0X9lKF/xLkdpVi1RRLljAV8ZCks0gCYfYUDH/NkeQMT4Vf
 TpQZK2Tm6gtrsyDV2FjTdG1KeTUzf3UnX6GW8q4VL3lNwYQdgS+Oj4NxNfXwi4koV+8o
 ftLg==
X-Gm-Message-State: ANhLgQ039WJm3oOsXO+bFKV/308EdY/0HxJzpl/pjJvyDna27i3viCmp
 fqm6AxrKK/q7uRrXrMQtnP9ZjXTHFfTjr5Ki5Bg=
X-Google-Smtp-Source: ADFU+vvE9SjldAtbk/tVDnBHQRZIHAyka0cn06olOcXb37LZkCFSiX9P43bk6tDNAuUk/wo/tHib+PGYxsTeGscpf04=
X-Received: by 2002:a67:26c2:: with SMTP id m185mr3659014vsm.180.1585158265268; 
 Wed, 25 Mar 2020 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-19-zhiwei_liu@c-sky.com>
In-Reply-To: <20200317150653.9008-19-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Mar 2020 10:36:25 -0700
Message-ID: <CAKmqyKP3AZXrry+OkJxUejySEuE8JbQ8w7YmJUWNpNfb0nOdEg@mail.gmail.com>
Subject: Re: [PATCH v6 18/61] target/riscv: vector single-width integer
 multiply instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, guoren@linux.alibaba.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
X-List-Received-Date: Wed, 25 Mar 2020 17:44:34 -0000

On Tue, Mar 17, 2020 at 8:43 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  33 +++++
>  target/riscv/insn32.decode              |   8 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  10 ++
>  target/riscv/vector_helper.c            | 156 ++++++++++++++++++++++++
>  4 files changed, 207 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c7d4ff185a..f42a12eef3 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -525,3 +525,36 @@ DEF_HELPER_6(vmax_vx_b, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vmax_vx_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vmax_vx_w, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vmax_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_6(vmul_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmul_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmul_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmul_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmul_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmul_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmul_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulh_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vmulhsu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index aafbdc6be7..abfed469bc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -363,6 +363,14 @@ vmaxu_vv        000110 . ..... ..... 000 ..... 1010111 @r_vm
>  vmaxu_vx        000110 . ..... ..... 100 ..... 1010111 @r_vm
>  vmax_vv         000111 . ..... ..... 000 ..... 1010111 @r_vm
>  vmax_vx         000111 . ..... ..... 100 ..... 1010111 @r_vm
> +vmul_vv         100101 . ..... ..... 010 ..... 1010111 @r_vm
> +vmul_vx         100101 . ..... ..... 110 ..... 1010111 @r_vm
> +vmulh_vv        100111 . ..... ..... 010 ..... 1010111 @r_vm
> +vmulh_vx        100111 . ..... ..... 110 ..... 1010111 @r_vm
> +vmulhu_vv       100100 . ..... ..... 010 ..... 1010111 @r_vm
> +vmulhu_vx       100100 . ..... ..... 110 ..... 1010111 @r_vm
> +vmulhsu_vv      100110 . ..... ..... 010 ..... 1010111 @r_vm
> +vmulhsu_vx      100110 . ..... ..... 110 ..... 1010111 @r_vm
>
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index 53c49ee15c..c276beabd6 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -1452,3 +1452,13 @@ GEN_OPIVX_TRANS(vminu_vx, opivx_check)
>  GEN_OPIVX_TRANS(vmin_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
>  GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
> +
> +/* Vector Single-Width Integer Multiply Instructions */
> +GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
> +GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
> +GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
> +GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
> +GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
> +GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
> +GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
> +GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 32c2760a8a..56ba9a7422 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -852,6 +852,10 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
>  #define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
>  #define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
>  #define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
> +#define OP_SUS_B int8_t, uint8_t, int8_t, uint8_t, int8_t
> +#define OP_SUS_H int16_t, uint16_t, int16_t, uint16_t, int16_t
> +#define OP_SUS_W int32_t, uint32_t, int32_t, uint32_t, int32_t
> +#define OP_SUS_D int64_t, uint64_t, int64_t, uint64_t, int64_t
>
>  /* operation of two vector elements */
>  typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
> @@ -1585,3 +1589,155 @@ GEN_VEXT_VX(vmax_vx_b, 1, 1, clearb)
>  GEN_VEXT_VX(vmax_vx_h, 2, 2, clearh)
>  GEN_VEXT_VX(vmax_vx_w, 4, 4, clearl)
>  GEN_VEXT_VX(vmax_vx_d, 8, 8, clearq)
> +
> +/* Vector Single-Width Integer Multiply Instructions */
> +#define DO_MUL(N, M) (N * M)
> +RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, DO_MUL)
> +RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
> +RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
> +RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
> +GEN_VEXT_VV(vmul_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vmul_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vmul_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vmul_vv_d, 8, 8, clearq)
> +
> +static int8_t do_mulh_b(int8_t s2, int8_t s1)
> +{
> +    return (int16_t)s2 * (int16_t)s1 >> 8;
> +}
> +
> +static int16_t do_mulh_h(int16_t s2, int16_t s1)
> +{
> +    return (int32_t)s2 * (int32_t)s1 >> 16;
> +}
> +
> +static int32_t do_mulh_w(int32_t s2, int32_t s1)
> +{
> +    return (int64_t)s2 * (int64_t)s1 >> 32;
> +}
> +
> +static int64_t do_mulh_d(int64_t s2, int64_t s1)
> +{
> +    uint64_t hi_64, lo_64;
> +
> +    muls64(&lo_64, &hi_64, s1, s2);
> +    return hi_64;
> +}
> +
> +static uint8_t do_mulhu_b(uint8_t s2, uint8_t s1)
> +{
> +    return (uint16_t)s2 * (uint16_t)s1 >> 8;
> +}
> +
> +static uint16_t do_mulhu_h(uint16_t s2, uint16_t s1)
> +{
> +    return (uint32_t)s2 * (uint32_t)s1 >> 16;
> +}
> +
> +static uint32_t do_mulhu_w(uint32_t s2, uint32_t s1)
> +{
> +    return (uint64_t)s2 * (uint64_t)s1 >> 32;
> +}
> +
> +static uint64_t do_mulhu_d(uint64_t s2, uint64_t s1)
> +{
> +    uint64_t hi_64, lo_64;
> +
> +    mulu64(&lo_64, &hi_64, s2, s1);
> +    return hi_64;
> +}
> +
> +static int8_t do_mulhsu_b(int8_t s2, uint8_t s1)
> +{
> +    return (int16_t)s2 * (uint16_t)s1 >> 8;
> +}
> +
> +static int16_t do_mulhsu_h(int16_t s2, uint16_t s1)
> +{
> +    return (int32_t)s2 * (uint32_t)s1 >> 16;
> +}
> +
> +static int32_t do_mulhsu_w(int32_t s2, uint32_t s1)
> +{
> +    return (int64_t)s2 * (uint64_t)s1 >> 32;
> +}
> +
> +static int64_t do_mulhsu_d(int64_t s2, uint64_t s1)
> +{
> +    uint64_t hi_64, lo_64, abs_s2 = s2;
> +
> +    if (s2 < 0) {
> +        abs_s2 = -s2;
> +    }
> +    mulu64(&lo_64, &hi_64, abs_s2, s1);
> +    if (s2 < 0) {
> +        lo_64 = ~lo_64;
> +        hi_64 = ~hi_64;
> +        if (lo_64 == UINT64_MAX) {
> +            lo_64 = 0;
> +            hi_64 += 1;
> +        } else {
> +            lo_64 += 1;
> +        }
> +    }
> +
> +    return hi_64;
> +}
> +
> +RVVCALL(OPIVV2, vmulh_vv_b, OP_SSS_B, H1, H1, H1, do_mulh_b)
> +RVVCALL(OPIVV2, vmulh_vv_h, OP_SSS_H, H2, H2, H2, do_mulh_h)
> +RVVCALL(OPIVV2, vmulh_vv_w, OP_SSS_W, H4, H4, H4, do_mulh_w)
> +RVVCALL(OPIVV2, vmulh_vv_d, OP_SSS_D, H8, H8, H8, do_mulh_d)
> +RVVCALL(OPIVV2, vmulhu_vv_b, OP_UUU_B, H1, H1, H1, do_mulhu_b)
> +RVVCALL(OPIVV2, vmulhu_vv_h, OP_UUU_H, H2, H2, H2, do_mulhu_h)
> +RVVCALL(OPIVV2, vmulhu_vv_w, OP_UUU_W, H4, H4, H4, do_mulhu_w)
> +RVVCALL(OPIVV2, vmulhu_vv_d, OP_UUU_D, H8, H8, H8, do_mulhu_d)
> +RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H1, do_mulhsu_b)
> +RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
> +RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
> +RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
> +GEN_VEXT_VV(vmulh_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vmulh_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vmulh_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vmulh_vv_d, 8, 8, clearq)
> +GEN_VEXT_VV(vmulhu_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vmulhu_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vmulhu_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vmulhu_vv_d, 8, 8, clearq)
> +GEN_VEXT_VV(vmulhsu_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vmulhsu_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vmulhsu_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vmulhsu_vv_d, 8, 8, clearq)
> +
> +RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
> +RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
> +RVVCALL(OPIVX2, vmul_vx_w, OP_SSS_W, H4, H4, DO_MUL)
> +RVVCALL(OPIVX2, vmul_vx_d, OP_SSS_D, H8, H8, DO_MUL)
> +RVVCALL(OPIVX2, vmulh_vx_b, OP_SSS_B, H1, H1, do_mulh_b)
> +RVVCALL(OPIVX2, vmulh_vx_h, OP_SSS_H, H2, H2, do_mulh_h)
> +RVVCALL(OPIVX2, vmulh_vx_w, OP_SSS_W, H4, H4, do_mulh_w)
> +RVVCALL(OPIVX2, vmulh_vx_d, OP_SSS_D, H8, H8, do_mulh_d)
> +RVVCALL(OPIVX2, vmulhu_vx_b, OP_UUU_B, H1, H1, do_mulhu_b)
> +RVVCALL(OPIVX2, vmulhu_vx_h, OP_UUU_H, H2, H2, do_mulhu_h)
> +RVVCALL(OPIVX2, vmulhu_vx_w, OP_UUU_W, H4, H4, do_mulhu_w)
> +RVVCALL(OPIVX2, vmulhu_vx_d, OP_UUU_D, H8, H8, do_mulhu_d)
> +RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, do_mulhsu_b)
> +RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
> +RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
> +RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
> +GEN_VEXT_VX(vmul_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vmul_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vmul_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vmul_vx_d, 8, 8, clearq)
> +GEN_VEXT_VX(vmulh_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vmulh_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vmulh_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vmulh_vx_d, 8, 8, clearq)
> +GEN_VEXT_VX(vmulhu_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vmulhu_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vmulhu_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vmulhu_vx_d, 8, 8, clearq)
> +GEN_VEXT_VX(vmulhsu_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vmulhsu_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vmulhsu_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vmulhsu_vx_d, 8, 8, clearq)
> --
> 2.23.0
>

