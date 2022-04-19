Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngfu5-0003qt-4b
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 00:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngfu4-0003qg-8b; Tue, 19 Apr 2022 00:55:52 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngfu2-0004fp-3p; Tue, 19 Apr 2022 00:55:51 -0400
Received: by mail-il1-x12d.google.com with SMTP id y16so9794717ilc.7;
 Mon, 18 Apr 2022 21:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/9nZPnQkybn0WNZ7jRBBZiIAUMuTXkqsRQwkR+Fywg=;
 b=C/dn+wblkMam2oU/+1Q8ZTjwsXCo99iomf4KLdOvO4VoumdGQ9NkRuT5fOrEn0FpqM
 fci1KO1sQnxx7TTekc1h+ZoXNAG3bPFcki0ZtjhwrZ5nqvJq1SbnIxuvXOdiHR74yeaI
 4PKTQzlEt7MZyVyb7xQgPzN1dp/lOZF1jeO9KfzHVYX+IXeZFN770F3KogwPGZMzesMM
 +lYwQpBdR1FRQll1kHEFg2Uy7BCTPn0pTXnpLM/NQKKhVBa9zaRyw57SfC6FTKTK3+rA
 ENxQE2F0ob86X8gs96ncmE0Dk7bnPp2iwDzI84CjU/dLqqoIxvRhQ/DZ3xzG34B3lriu
 OiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/9nZPnQkybn0WNZ7jRBBZiIAUMuTXkqsRQwkR+Fywg=;
 b=G6XG3q1q8g7jTX+TWAHm7WPnMiwjSsarUos1zlE42C/kqKJdW0PvWAT59MEhuiVz3I
 E6ds9dqRBalkIpwTifrJm/2ulTW/s9BRVtE9zGmeV81ct55CpihBEppy61e+UE3f9XMw
 xTWMzzPKuL6fIGqZ61ok7+tF9k7S2OrSBLoREgcDoCV/pwaoU+fMTVCWrK82ZsnuS0IK
 fwOWN+h18vo/loyzBe3h/yJviYYJOdSpTR5p9E7SPX8H1ZqdTn7aCh1FP/V8NkyqjIH8
 saPK5B12Q5V/r5eUi0iCbxK/oQSQPgQkFEVNpJU3zFXEuMV4p7F6YlJXWy/Y5RPx8kaN
 2Hxw==
X-Gm-Message-State: AOAM531WUWsGR6wSS0d30Nf7F+9PUK65Zvm4rJCwO5G5pkNYvx0yTNkk
 bqiUPVAbnH3QusbyjDETMfBCBOVaG1aC1+Ae790=
X-Google-Smtp-Source: ABdhPJxBXwzinVovrx15glyqJrrxJ0Tc0lHJZl+GjPopWAVVTEqzp9hmlPKkjITjMnn/cFTsYS4qqppOfvHZ6uzH8qc=
X-Received: by 2002:a92:c6ce:0:b0:2cb:ed10:83e6 with SMTP id
 v14-20020a92c6ce000000b002cbed1083e6mr6137944ilm.310.1650344148286; Mon, 18
 Apr 2022 21:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <164863587444.17401.9965527486691250478-0@git.sr.ht>
 <164863587444.17401.9965527486691250478-2@git.sr.ht>
In-Reply-To: <164863587444.17401.9965527486691250478-2@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Apr 2022 14:55:22 +1000
Message-ID: <CAKmqyKNio7rPd3DHr0N8es_ZUzSn_G3bjXLHRfXB5S=mLp4KFw@mail.gmail.com>
Subject: Re: [PATCH qemu v7 02/14] target/riscv: rvv: Rename ambiguous esz
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>, 
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Tue, 19 Apr 2022 04:55:52 -0000

On Wed, Mar 30, 2022 at 8:30 PM ~eopxd <eopxd@git.sr.ht> wrote:
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
> 2.34.1
>
>

