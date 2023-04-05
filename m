Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvjC-0003ME-Qp
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvj9-0003LH-N0; Wed, 05 Apr 2023 01:30:35 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvj3-0006CE-TG; Wed, 05 Apr 2023 01:30:33 -0400
Received: by mail-ua1-x92c.google.com with SMTP id e12so24837631uaa.3;
 Tue, 04 Apr 2023 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NU+DyW++2pw6gaebctreNZNqag9dtL51u+4ChKEZj9E=;
 b=oCDuCeOZsO958Q6A5fUjfguBm9vu8DssAwkMuU+yi5s37xv8Us+hCI4aJudJsX06Uu
 FU0McVeUE3i7igy5aS1DlXgj/l8DZQbSxyA/2KHDZveSnEvy2isRQzwo4KsfEUToVpKT
 8pvJiXO9KeB7EvTTKtqAxjUZv2TsuYqFFVFtoCUzO4qll8iI836CQ/90z0h6wQvQiM9j
 sXxwF+H7hNOTSgedPPzawBMCNXmyE38mWq+/TiqmZfVb8Fs+/sq20wzC2J1Dcxc6woUG
 Ral2GiQQnapt+NYFwGua53/VKiiJVLPckHCJltmWZRYIyQyokOyrZB5PtDgIhUM6brQq
 43qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NU+DyW++2pw6gaebctreNZNqag9dtL51u+4ChKEZj9E=;
 b=ULZKFUFbFniD90hpX9KUpADq3er+CMMeEriRSUgEcPQ0d5DmyWXidm0uUAjZ2QcmD6
 /1o2AOG5fzOn60ELRz/qxn/2XMseubB7cTkPrbnL0QK81bHjPsPiYJMpSfODnm5oQdP7
 lUN4nKyw5mt+Qwayjhpa6+xIiB8Xw0VgpqTkV9WMR46OX5er+0WxV3ywmyBOcDT+VzS1
 +YpHn9MBswtajdNqhrfLCLempLma5SY2jz1hTcEefrAaiXW+oWFjQxfHwJJ4fNGQBhWk
 /jY+4yE5gDr6m96SFHmfH1pIiMy0TL85ZPgAFW6oABBKyy0h6gE9vZnarSv2fRzSclZT
 q4tw==
X-Gm-Message-State: AAQBX9fn3jm5Bx1hIV+qoQP4VFUrZxhOdYpTgAz5oXb588dbM/Elho22
 /QtyjPr5DUSnmFItaXuf6irU32EQCxFA1oCcr9o=
X-Google-Smtp-Source: AKy350b2xpRRDt1p9KQduPiy8P9eXWsc/M8vnyKrJlbkBMpSRapvAEauGshqI3oLRfRHLClSxeSEgbgusdhLrD76ThM=
X-Received: by 2002:a9f:37cd:0:b0:764:64c1:9142 with SMTP id
 q71-20020a9f37cd000000b0076464c19142mr1485662uaq.0.1680672626832; Tue, 04 Apr
 2023 22:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-11-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-11-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:30:00 +1000
Message-ID: <CAKmqyKPU238xonsTkAVkAVrG=dkPL7ayjphkfP-n0eEKo8iPJQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] target/riscv: Fix lines with over 80 characters
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:30:36 -0000

On Mon, Mar 27, 2023 at 6:11=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Fix lines with over 80 characters for both code and comments in
> vector_helper.c, pmp.c and pmu.c.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c           |  6 ++-
>  target/riscv/pmu.c           |  3 +-
>  target/riscv/vector_helper.c | 76 ++++++++++++++++++++++++------------
>  3 files changed, 56 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 665a8528d5..428ebe7272 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -129,7 +129,8 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
>      }
>  }
>
> -static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ul=
ong *ea)
> +static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> +                             target_ulong *ea)
>  {
>      /*
>         aaaa...aaa0   8-byte NAPOT range
> @@ -217,7 +218,8 @@ static void pmp_update_rule(CPURISCVState *env, uint3=
2_t pmp_index)
>      pmp_update_rule_nums(env);
>  }
>
> -static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulo=
ng addr)
> +static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
> +                           target_ulong addr)
>  {
>      int result =3D 0;
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 7ad85ab476..903bf29361 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -419,7 +419,8 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_=
t value, uint32_t ctr_idx)
>      } else {
>          return -1;
>      }
> -    overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ov=
erflow_ns;
> +    overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                  overflow_ns;
>
>      if (overflow_at > INT64_MAX) {
>          overflow_left +=3D overflow_at - INT64_MAX;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 81b99a0e3c..b5ab8edcb3 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -385,8 +385,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSta=
te *env, uint32_t desc,
>  }
>
>  /*
> - * masked unit-stride load and store operation will be a special case of=
 stride,
> - * stride =3D NF * sizeof (MTYPE)
> + * masked unit-stride load and store operation will be a special case of
> + * stride, stride =3D NF * sizeof (MTYPE)
>   */
>
>  #define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            =
\
> @@ -681,7 +681,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCV=
State *env, uint32_t desc,
>          /* load/store rest of elements of current segment pointed by vst=
art */
>          for (pos =3D off; pos < max_elems; pos++, env->vstart++) {
>              target_ulong addr =3D base + ((pos + k * max_elems) << log2_=
esz);
> -            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, =
vd, ra);
> +            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, =
vd,
> +                      ra);
>          }
>          k++;
>      }
> @@ -1309,7 +1310,9 @@ GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2,=
 H2, DO_SRL, 0xf)
>  GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f)
>  GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f)
>
> -/* generate the helpers for shift instructions with one vector and one s=
calar */
> +/*
> + * generate the helpers for shift instructions with one vector and one s=
calar
> + */
>  #define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK) \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>                    void *vs2, CPURISCVState *env,            \
> @@ -2168,7 +2171,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,     \
>                   do_##NAME, ESZ);                               \
>  }
>
> -static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, ui=
nt8_t b)
> +static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a,
> +                             uint8_t b)
>  {
>      uint8_t res =3D a + b;
>      if (res < a) {
> @@ -2312,7 +2316,8 @@ static inline int8_t sadd8(CPURISCVState *env, int =
vxrm, int8_t a, int8_t b)
>      return res;
>  }
>
> -static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, in=
t16_t b)
> +static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a,
> +                             int16_t b)
>  {
>      int16_t res =3D a + b;
>      if ((res ^ a) & (res ^ b) & INT16_MIN) {
> @@ -2322,7 +2327,8 @@ static inline int16_t sadd16(CPURISCVState *env, in=
t vxrm, int16_t a, int16_t b)
>      return res;
>  }
>
> -static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, in=
t32_t b)
> +static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a,
> +                             int32_t b)
>  {
>      int32_t res =3D a + b;
>      if ((res ^ a) & (res ^ b) & INT32_MIN) {
> @@ -2332,7 +2338,8 @@ static inline int32_t sadd32(CPURISCVState *env, in=
t vxrm, int32_t a, int32_t b)
>      return res;
>  }
>
> -static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, in=
t64_t b)
> +static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a,
> +                             int64_t b)
>  {
>      int64_t res =3D a + b;
>      if ((res ^ a) & (res ^ b) & INT64_MIN) {
> @@ -2360,7 +2367,8 @@ GEN_VEXT_VX_RM(vsadd_vx_h, 2)
>  GEN_VEXT_VX_RM(vsadd_vx_w, 4)
>  GEN_VEXT_VX_RM(vsadd_vx_d, 8)
>
> -static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, ui=
nt8_t b)
> +static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a,
> +                             uint8_t b)
>  {
>      uint8_t res =3D a - b;
>      if (res > a) {
> @@ -2431,7 +2439,8 @@ static inline int8_t ssub8(CPURISCVState *env, int =
vxrm, int8_t a, int8_t b)
>      return res;
>  }
>
> -static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, in=
t16_t b)
> +static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a,
> +                             int16_t b)
>  {
>      int16_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT16_MIN) {
> @@ -2441,7 +2450,8 @@ static inline int16_t ssub16(CPURISCVState *env, in=
t vxrm, int16_t a, int16_t b)
>      return res;
>  }
>
> -static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, in=
t32_t b)
> +static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a,
> +                             int32_t b)
>  {
>      int32_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT32_MIN) {
> @@ -2451,7 +2461,8 @@ static inline int32_t ssub32(CPURISCVState *env, in=
t vxrm, int32_t a, int32_t b)
>      return res;
>  }
>
> -static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, in=
t64_t b)
> +static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a,
> +                             int64_t b)
>  {
>      int64_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT64_MIN) {
> @@ -2507,7 +2518,8 @@ static inline uint8_t get_round(int vxrm, uint64_t =
v, uint8_t shift)
>      return 0; /* round-down (truncate) */
>  }
>
> -static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a, in=
t32_t b)
> +static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a,
> +                             int32_t b)
>  {
>      int64_t res =3D (int64_t)a + b;
>      uint8_t round =3D get_round(vxrm, res, 1);
> @@ -2515,7 +2527,8 @@ static inline int32_t aadd32(CPURISCVState *env, in=
t vxrm, int32_t a, int32_t b)
>      return (res >> 1) + round;
>  }
>
> -static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a, in=
t64_t b)
> +static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a,
> +                             int64_t b)
>  {
>      int64_t res =3D a + b;
>      uint8_t round =3D get_round(vxrm, res, 1);
> @@ -2580,7 +2593,8 @@ GEN_VEXT_VX_RM(vaaddu_vx_h, 2)
>  GEN_VEXT_VX_RM(vaaddu_vx_w, 4)
>  GEN_VEXT_VX_RM(vaaddu_vx_d, 8)
>
> -static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, in=
t32_t b)
> +static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a,
> +                             int32_t b)
>  {
>      int64_t res =3D (int64_t)a - b;
>      uint8_t round =3D get_round(vxrm, res, 1);
> @@ -2588,7 +2602,8 @@ static inline int32_t asub32(CPURISCVState *env, in=
t vxrm, int32_t a, int32_t b)
>      return (res >> 1) + round;
>  }
>
> -static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a, in=
t64_t b)
> +static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a,
> +                             int64_t b)
>  {
>      int64_t res =3D (int64_t)a - b;
>      uint8_t round =3D get_round(vxrm, res, 1);
> @@ -4501,7 +4516,9 @@ RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, f=
loat32_to_int64)
>  GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 4)
>  GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 8)
>
> -/* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width =
float */
> +/*
> + * vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width =
float.
> + */
>  RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
>  RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
>  RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
> @@ -4518,8 +4535,7 @@ GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 4)
>  GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 8)
>
>  /*
> - * vfwcvt.f.f.v vd, vs2, vm
> - * Convert single-width float to double-width float.
> + * vfwcvt.f.f.v vd, vs2, vm # Convert single-width float to double-width=
 float.
>   */
>  static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
>  {
> @@ -4552,7 +4568,9 @@ GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1)
>  GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2)
>  GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4)
>
> -/* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to =
float */
> +/*
> + * vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to =
float.
> + */
>  RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
>  RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
>  GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2)
> @@ -4702,14 +4720,20 @@ GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t,=
 H4, H4, float32_add)
>  GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
>
>  /* Maximum value */
> -GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum=
_number)
> -GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum=
_number)
> -GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum=
_number)
> +GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2,
> +              float16_maximum_number)
> +GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4,
> +              float32_maximum_number)
> +GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8,
> +              float64_maximum_number)
>
>  /* Minimum value */
> -GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum=
_number)
> -GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum=
_number)
> -GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum=
_number)
> +GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2,
> +              float16_minimum_number)
> +GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4,
> +              float32_minimum_number)
> +GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8,
> +              float64_minimum_number)
>
>  /* Vector Widening Floating-Point Add Instructions */
>  static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
> --
> 2.25.1
>
>

