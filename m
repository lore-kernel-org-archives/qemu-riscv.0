Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njqeA-0002zg-1E
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njqe8-0002wf-K1; Wed, 27 Apr 2022 19:00:32 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njqe5-0007Uq-TZ; Wed, 27 Apr 2022 19:00:31 -0400
Received: by mail-io1-xd35.google.com with SMTP id z18so4409108iob.5;
 Wed, 27 Apr 2022 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MjdIawdm5yfYFV3aXCJ5RrsO4vucv+u6NAs9aMRMCns=;
 b=pVM5wAH8gZWgyX5eNgk9KsuZpxIWytrH6A5/GKtK/3JCPyFteGOjpCDehW6E89RONH
 me+02FOau7/XL8mEZBWN1DOcmzyn71QN11y4W5B6R56M+4z5dq25uvUaiTghYlcdzCqG
 AcZnrFrPtM8MkRYTgv0f44U6M53XhngZV0jafelBvDNh1PNr4l8xRdr+jBwCEXefmZIJ
 mYX/aBHqebMk3tCPCk15R41oWoB61jaukp4fFFq5VHRm/Uil+lNckPNTpQRwZbfIBqeH
 /Pifh13ec1otlO7Ul9/4InpLOM/0do6k+BgWF1XsYxl8MW/TFPQPAJU3L1yujxWaA39o
 kFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjdIawdm5yfYFV3aXCJ5RrsO4vucv+u6NAs9aMRMCns=;
 b=ypsQQUejLb0iFh6GIubevqiom1XtOyR63cjsa0in0BcECEvH/yjX7yjLSd/UVOUaJK
 cEiZ34to+9bmq8PT8K1brnoqOBbm6ciwV+usmjlnPrudO86rgJ3Af/is0w+Ac7l254k5
 CMY/PunFc7BUuxFobFU0+L66g3DcmP2dgL2WAiR/ArkNadpxf8QZbQmb1FetukGIS0a0
 Nx9pvu28/1tmfa9S/vaHuzuVexqBXpgi1S3PiFwLe2BW8VQmRjpuKdBrJ3eOK2luY0iq
 Y+1ecWwiOAzFqvjOchn9SQ+UOX8t8zNxMc/cb4xwadBwZNX1fkoMNarxyVHBXbJZUE5h
 7lTw==
X-Gm-Message-State: AOAM533AP5D1ObdQUKeB7t9QzznuJ2/TIOASGOBz282JmoKE60A7RiF0
 M9O1sb9kmkYV1Dcgb0xs2nc+Q7QY4szYk0rhoxQ=
X-Google-Smtp-Source: ABdhPJxoooDIEO69ejVucdkFh1+4FISq6pHLCJbsqwj9Pj6p3LvrJDYW12wWgHf371gDFdkKC4nO1nNJn4CDp+21YlI=
X-Received: by 2002:a5d:924e:0:b0:649:af51:9c1a with SMTP id
 e14-20020a5d924e000000b00649af519c1amr12914012iol.203.1651100427377; Wed, 27
 Apr 2022 16:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <165107198903.23549.13907705840662008250-0@git.sr.ht>
 <165107198903.23549.13907705840662008250-2@git.sr.ht>
In-Reply-To: <165107198903.23549.13907705840662008250-2@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 09:00:01 +1000
Message-ID: <CAKmqyKM2CMw8pgy4T7xbyU3asfapfa_bP6D6-0h6KtKWL4wzvQ@mail.gmail.com>
Subject: Re: [PATCH qemu v10 02/14] target/riscv: rvv: Rename ambiguous esz
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>, 
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 23:00:33 -0000

On Thu, Apr 28, 2022 at 1:09 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> No functional change intended in this commit.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 76 ++++++++++++++++++------------------
>  1 file changed, 38 insertions(+), 38 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e94caf1a3c..d0452a7756 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -125,9 +125,9 @@ static inline int32_t vext_lmul(uint32_t desc)
>  /*
>   * Get the maximum number of elements can be operated.
>   *
> - * esz: log2 of element size in bytes.
> + * log2_esz: log2 of element size in bytes.
>   */
> -static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
> +static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>  {
>      /*
>       * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
> @@ -136,7 +136,7 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
>      uint32_t vlenb = simd_maxsz(desc);
>
>      /* Return VLMAX */
> -    int scale = vext_lmul(desc) - esz;
> +    int scale = vext_lmul(desc) - log2_esz;
>      return scale < 0 ? vlenb >> -scale : vlenb << scale;
>  }
>
> @@ -231,11 +231,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>                   target_ulong stride, CPURISCVState *env,
>                   uint32_t desc, uint32_t vm,
>                   vext_ldst_elem_fn *ldst_elem,
> -                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
> +                 uint32_t log2_esz, uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> -    uint32_t max_elems = vext_max_elems(desc, esz);
> +    uint32_t max_elems = vext_max_elems(desc, log2_esz);
>
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> @@ -244,7 +244,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>
>          k = 0;
>          while (k < nf) {
> -            target_ulong addr = base + stride * i + (k << esz);
> +            target_ulong addr = base + stride * i + (k << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
>          }
> @@ -289,18 +289,18 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
>  /* unmasked unit-stride load and store operation*/
>  static void
>  vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
> -             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
> +             vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uint32_t evl,
>               uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> -    uint32_t max_elems = vext_max_elems(desc, esz);
> +    uint32_t max_elems = vext_max_elems(desc, log2_esz);
>
>      /* load bytes from guest memory */
>      for (i = env->vstart; i < evl; i++, env->vstart++) {
>          k = 0;
>          while (k < nf) {
> -            target_ulong addr = base + ((i * nf + k) << esz);
> +            target_ulong addr = base + ((i * nf + k) << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
>          }
> @@ -399,12 +399,12 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>                  void *vs2, CPURISCVState *env, uint32_t desc,
>                  vext_get_index_addr get_index_addr,
>                  vext_ldst_elem_fn *ldst_elem,
> -                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
> +                uint32_t log2_esz, uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
>      uint32_t vm = vext_vm(desc);
> -    uint32_t max_elems = vext_max_elems(desc, esz);
> +    uint32_t max_elems = vext_max_elems(desc, log2_esz);
>
>      /* load bytes from guest memory */
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> @@ -414,7 +414,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>
>          k = 0;
>          while (k < nf) {
> -            abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
> +            abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
>          }
> @@ -480,13 +480,13 @@ static inline void
>  vext_ldff(void *vd, void *v0, target_ulong base,
>            CPURISCVState *env, uint32_t desc,
>            vext_ldst_elem_fn *ldst_elem,
> -          uint32_t esz, uintptr_t ra)
> +          uint32_t log2_esz, uintptr_t ra)
>  {
>      void *host;
>      uint32_t i, k, vl = 0;
>      uint32_t nf = vext_nf(desc);
>      uint32_t vm = vext_vm(desc);
> -    uint32_t max_elems = vext_max_elems(desc, esz);
> +    uint32_t max_elems = vext_max_elems(desc, log2_esz);
>      target_ulong addr, offset, remain;
>
>      /* probe every access*/
> @@ -494,12 +494,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        addr = adjust_addr(env, base + i * (nf << esz));
> +        addr = adjust_addr(env, base + i * (nf << log2_esz));
>          if (i == 0) {
> -            probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
> +            probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
>          } else {
>              /* if it triggers an exception, no need to check watchpoint */
> -            remain = nf << esz;
> +            remain = nf << log2_esz;
>              while (remain > 0) {
>                  offset = -(addr | TARGET_PAGE_MASK);
>                  host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
> @@ -536,7 +536,7 @@ ProbeSuccess:
>              continue;
>          }
>          while (k < nf) {
> -            target_ulong addr = base + ((i * nf + k) << esz);
> +            target_ulong addr = base + ((i * nf + k) << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
>          }
> @@ -576,13 +576,13 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
>   */
>  static void
>  vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
> -                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
> +                vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uintptr_t ra,
>                  MMUAccessType access_type)
>  {
>      uint32_t i, k, off, pos;
>      uint32_t nf = vext_nf(desc);
>      uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -    uint32_t max_elems = vlenb >> esz;
> +    uint32_t max_elems = vlenb >> log2_esz;
>
>      k = env->vstart / max_elems;
>      off = env->vstart % max_elems;
> @@ -590,7 +590,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>      if (off) {
>          /* load/store rest of elements of current segment pointed by vstart */
>          for (pos = off; pos < max_elems; pos++, env->vstart++) {
> -            target_ulong addr = base + ((pos + k * max_elems) << esz);
> +            target_ulong addr = base + ((pos + k * max_elems) << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd, ra);
>          }
>          k++;
> @@ -599,7 +599,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>      /* load/store elements for rest of segments */
>      for (; k < nf; k++) {
>          for (i = 0; i < max_elems; i++, env->vstart++) {
> -            target_ulong addr = base + ((i + k * max_elems) << esz);
> +            target_ulong addr = base + ((i + k * max_elems) << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>          }
>      }
> @@ -4691,11 +4691,11 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
>  GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
>  GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
>
> -#define GEN_VEXT_VSLIE1UP(ESZ, H)                                           \
> -static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
> -                     CPURISCVState *env, uint32_t desc)                     \
> +#define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
> +static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
> +                     void *vs2, CPURISCVState *env, uint32_t desc)          \
>  {                                                                           \
> -    typedef uint##ESZ##_t ETYPE;                                            \
> +    typedef uint##BITWIDTH##_t ETYPE;                                       \
>      uint32_t vm = vext_vm(desc);                                            \
>      uint32_t vl = env->vl;                                                  \
>      uint32_t i;                                                             \
> @@ -4718,11 +4718,11 @@ GEN_VEXT_VSLIE1UP(16, H2)
>  GEN_VEXT_VSLIE1UP(32, H4)
>  GEN_VEXT_VSLIE1UP(64, H8)
>
> -#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
> +#define GEN_VEXT_VSLIDE1UP_VX(NAME, BITWIDTH)                     \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
>                    CPURISCVState *env, uint32_t desc)              \
>  {                                                                 \
> -    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
> +    vslide1up_##BITWIDTH(vd, v0, s1, vs2, env, desc);             \
>  }
>
>  /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=x[rs1], vd[i+1] = vs2[i] */
> @@ -4731,11 +4731,11 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
>  GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
>  GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
>
> -#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                          \
> -static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
> -                       CPURISCVState *env, uint32_t desc)                     \
> +#define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                     \
> +static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
> +                       void *vs2, CPURISCVState *env, uint32_t desc)          \
>  {                                                                             \
> -    typedef uint##ESZ##_t ETYPE;                                              \
> +    typedef uint##BITWIDTH##_t ETYPE;                                         \
>      uint32_t vm = vext_vm(desc);                                              \
>      uint32_t vl = env->vl;                                                    \
>      uint32_t i;                                                               \
> @@ -4758,11 +4758,11 @@ GEN_VEXT_VSLIDE1DOWN(16, H2)
>  GEN_VEXT_VSLIDE1DOWN(32, H4)
>  GEN_VEXT_VSLIDE1DOWN(64, H8)
>
> -#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
> +#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, BITWIDTH)                   \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
>                    CPURISCVState *env, uint32_t desc)              \
>  {                                                                 \
> -    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
> +    vslide1down_##BITWIDTH(vd, v0, s1, vs2, env, desc);           \
>  }
>
>  /* vslide1down.vx vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=x[rs1] */
> @@ -4772,11 +4772,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
>  GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
>
>  /* Vector Floating-Point Slide Instructions */
> -#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
> +#define GEN_VEXT_VFSLIDE1UP_VF(NAME, BITWIDTH)                \
>  void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
>                    CPURISCVState *env, uint32_t desc)          \
>  {                                                             \
> -    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
> +    vslide1up_##BITWIDTH(vd, v0, s1, vs2, env, desc);         \
>  }
>
>  /* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=f[rs1], vd[i+1] = vs2[i] */
> @@ -4784,11 +4784,11 @@ GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
>  GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
>  GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
>
> -#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
> +#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, BITWIDTH)              \
>  void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
>                    CPURISCVState *env, uint32_t desc)          \
>  {                                                             \
> -    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
> +    vslide1down_##BITWIDTH(vd, v0, s1, vs2, env, desc);       \
>  }
>
>  /* vfslide1down.vf vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=f[rs1] */
> --
> 2.34.2
>
>

