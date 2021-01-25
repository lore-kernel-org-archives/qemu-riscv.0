Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BMW-00012Q-Db
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BMT-000122-0c; Mon, 25 Jan 2021 18:33:33 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:45341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BMQ-0001H8-6M; Mon, 25 Jan 2021 18:33:32 -0500
Received: by mail-io1-xd32.google.com with SMTP id p72so30119778iod.12;
 Mon, 25 Jan 2021 15:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CfLh10qChs9mBGuymEnA3a9D4CfQc1NkTroJxzBjoJA=;
 b=DZTWNn7489+dbAey41TAo/P/kXhDniFCzXW+9frGU1Zxfv9DxJ+i6hb3cjlzPGvewI
 j5AADVT8WIhF9aHgj/d3McpVerdPGmQ1OVxlEzoD3w+pKURxsMzUGp1PmI7rLfGjxA97
 p+P4twfNwFCQNvLBHSvvkOnRAcC+mtXafC+U6pH5hzYRPpzkVVIqxIlIpmVPDX6XaMIy
 StVznLD9gwjtbs8UxmTdKknKI7D7DoFkJKZm8gfNaHAQ115nPWwTHHjbuc0UodlL8IPs
 MW9cWv00nKSdXG28LrkV5sQvLK5D6NJUHqPCxnwJAQ/I+psY2GNnomi/KlX+6FZKtOcP
 4KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CfLh10qChs9mBGuymEnA3a9D4CfQc1NkTroJxzBjoJA=;
 b=F0IDtSaKBryGo0WjWlglJivzxfBizq0HuzGeOPCFD5dT0lji9Trh87tfVhPoR2wGOX
 kKsUNFrXcpRBx7i+RU2BgPKlLhMwTITgEckp+idd9sPReu3rO/CdP6ToLl9ocKmJwn/I
 yEV8ynnujJqH0gXaar06tGc6W5rYRMQfekD6W4eQ1NP2+2nY5yslaalLabl2a49/8/rz
 FLNXKESya1zbVNXn6wu4F7de8n+v/H7JxB25fZSb6UzUtQEhzLyZw2HtiARPEX7RGAS5
 wGyDO/vHAU5dHXq84vccwpDM9lan/s5hEqj2TbTLE5a86hMf0PKM/n0a8vqD9JiEHrsl
 KThQ==
X-Gm-Message-State: AOAM531VUDV8V7T21gPNbhUfHBGHCkAgJS9IgjkYNP3xII9qwbJ0KauH
 j5YqczkZgp/9KuXWvC7mXP3xrFTFuJcL1pxoRvE=
X-Google-Smtp-Source: ABdhPJw2pkQTOfilOUrqbR2g44pMiuG88xPEFAixMNXQjgBKgrkcWSc+gNVMHKyDccLHpouZj7KXf55uuH7KeROp97s=
X-Received: by 2002:a02:634b:: with SMTP id j72mr2626880jac.106.1611617608488; 
 Mon, 25 Jan 2021 15:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-25-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-25-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:33:02 -0800
Message-ID: <CAKmqyKM7Hgi2Hv5Np2Ohjkt0vq-AQs--md-bg7adH9n8iy-Zhg@mail.gmail.com>
Subject: Re: [PATCH v6 24/72] target/riscv: rvv-1.0: update vext_max_elems()
 for load/store insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 23:33:34 -0000

On Tue, Jan 12, 2021 at 1:59 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++--
>  target/riscv/vector_helper.c            | 90 ++++++++++++++-----------
>  2 files changed, 74 insertions(+), 48 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 2b0e0590efc..367fb28186f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -586,6 +586,12 @@ static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
>      return false;                                            \
>  }
>
> +static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
> +{
> +    int8_t emul = eew - s->sew + s->lmul;
> +    return emul < 0 ? 0 : emul;
> +}
> +
>  /*
>   *** unit stride load and store
>   */
> @@ -651,8 +657,14 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>          return false;
>      }
>
> +    /*
> +     * Vector load/store instructions have the EEW encoded
> +     * directly in the instructions. The maximum vector size is
> +     * calculated with EMUL rather than LMUL.
> +     */
> +    uint8_t emul = vext_get_emul(s, eew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
> @@ -687,8 +699,9 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>          return false;
>      }
>
> +    uint8_t emul = vext_get_emul(s, eew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>  }
> @@ -761,8 +774,9 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>          return false;
>      }
>
> +    uint8_t emul = vext_get_emul(s, eew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
> @@ -789,8 +803,9 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>          gen_helper_vsse32_v,  gen_helper_vsse64_v
>      };
>
> +    uint8_t emul = vext_get_emul(s, eew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      fn = fns[eew];
>      if (fn == NULL) {
> @@ -887,8 +902,9 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>
>      fn = fns[eew][s->sew];
>
> +    uint8_t emul = vext_get_emul(s, s->sew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
> @@ -938,8 +954,9 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>
>      fn = fns[eew][s->sew];
>
> +    uint8_t emul = vext_get_emul(s, s->sew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>  }
> @@ -1003,8 +1020,9 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>          return false;
>      }
>
> +    uint8_t emul = vext_get_emul(s, eew);
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> -    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      return ldff_trans(a->rd, a->rs1, data, fn, s);
>  }
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 57564c5c0c9..8556ab3b0df 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -17,6 +17,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/host-utils.h"
>  #include "cpu.h"
>  #include "exec/memop.h"
>  #include "exec/exec-all.h"
> @@ -121,14 +122,21 @@ static uint32_t vext_wd(uint32_t desc)
>  }
>
>  /*
> - * Get vector group length in bytes. Its range is [64, 2048].
> + * Get the maximum number of elements can be operated.
>   *
> - * As simd_desc support at most 256, the max vlen is 512 bits.
> - * So vlen in bytes is encoded as maxsz.
> + * esz: log2 of element size in bytes.
>   */
> -static inline uint32_t vext_maxsz(uint32_t desc)
> +static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
>  {
> -    return simd_maxsz(desc) << vext_lmul(desc);
> +    /*
> +     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
> +     * so vlen in bytes (vlenb) is encoded as maxsz.
> +     */
> +    uint32_t vlenb = simd_maxsz(desc);
> +
> +    /* Return VLMAX */
> +    int scale = vext_lmul(desc) - esz;
> +    return scale < 0 ? vlenb >> -scale : vlenb << scale;
>  }
>
>  /*
> @@ -221,14 +229,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> -    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    uint32_t max_elems = vext_max_elems(desc, esz);
>
>      /* probe every access*/
>      for (i = 0; i < env->vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        probe_pages(env, base + stride * i, nf * esz, ra, access_type);
> +        probe_pages(env, base + stride * i, nf << esz, ra, access_type);
>      }
>      /* do real access */
>      for (i = 0; i < env->vl; i++) {
> @@ -237,8 +245,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>              continue;
>          }
>          while (k < nf) {
> -            target_ulong addr = base + stride * i + k * esz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            target_ulong addr = base + stride * i + (k << esz);
> +            ldst_elem(env, addr, i + k * max_elems, vd, ra);
>              k++;
>          }
>      }
> @@ -251,7 +259,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
>  {                                                                       \
>      uint32_t vm = vext_vm(desc);                                        \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
> -                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
> +                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
>  }
>
>  GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
> @@ -266,7 +274,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
>  {                                                                       \
>      uint32_t vm = vext_vm(desc);                                        \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
> -                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
> +                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
>  }
>
>  GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
> @@ -286,16 +294,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> -    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    uint32_t max_elems = vext_max_elems(desc, esz);
>
>      /* probe every access */
> -    probe_pages(env, base, env->vl * nf * esz, ra, access_type);
> +    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
>      /* load bytes from guest memory */
>      for (i = 0; i < env->vl; i++) {
>          k = 0;
>          while (k < nf) {
> -            target_ulong addr = base + (i * nf + k) * esz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            target_ulong addr = base + ((i * nf + k) << esz);
> +            ldst_elem(env, addr, i + k * max_elems, vd, ra);
>              k++;
>          }
>      }
> @@ -310,16 +318,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>  void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
>                           CPURISCVState *env, uint32_t desc)             \
>  {                                                                       \
> -    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
> +    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   \
> -                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
> +                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
>  }                                                                       \
>                                                                          \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
>                    CPURISCVState *env, uint32_t desc)                    \
>  {                                                                       \
>      vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
> -                 sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);                \
> +                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
>  }
>
>  GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
> @@ -331,16 +339,16 @@ GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
>  void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
>                           CPURISCVState *env, uint32_t desc)             \
>  {                                                                       \
> -    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
> +    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
> -                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
> +                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
>  }                                                                       \
>                                                                          \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
>                    CPURISCVState *env, uint32_t desc)                    \
>  {                                                                       \
>      vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
> -                 sizeof(ETYPE), GETPC(), MMU_DATA_STORE);               \
> +                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         \
>  }
>
>  GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
> @@ -376,14 +384,14 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
>      uint32_t vm = vext_vm(desc);
> -    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    uint32_t max_elems = vext_max_elems(desc, esz);
>
>      /* probe every access*/
>      for (i = 0; i < env->vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        probe_pages(env, get_index_addr(base, i, vs2), nf * esz, ra,
> +        probe_pages(env, get_index_addr(base, i, vs2), nf << esz, ra,
>                      access_type);
>      }
>      /* load bytes from guest memory */
> @@ -393,8 +401,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>              continue;
>          }
>          while (k < nf) {
> -            abi_ptr addr = get_index_addr(base, i, vs2) + k * esz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
> +            ldst_elem(env, addr, i + k * max_elems, vd, ra);
>              k++;
>          }
>      }
> @@ -405,7 +413,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
>                    void *vs2, CPURISCVState *env, uint32_t desc)            \
>  {                                                                          \
>      vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
> -                    LOAD_FN, sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);       \
> +                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD); \
>  }
>
>  GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
> @@ -430,7 +438,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
>                    void *vs2, CPURISCVState *env, uint32_t desc)  \
>  {                                                                \
>      vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
> -                    STORE_FN, sizeof(ETYPE),                     \
> +                    STORE_FN, ctzl(sizeof(ETYPE)),               \
>                      GETPC(), MMU_DATA_STORE);                    \
>  }
>
> @@ -464,7 +472,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>      uint32_t i, k, vl = 0;
>      uint32_t nf = vext_nf(desc);
>      uint32_t vm = vext_vm(desc);
> -    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    uint32_t max_elems = vext_max_elems(desc, esz);
>      target_ulong addr, offset, remain;
>
>      /* probe every access*/
> @@ -472,24 +480,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        addr = base + nf * i * esz;
> +        addr = base + i * (nf << esz);
>          if (i == 0) {
> -            probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
> +            probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
>          } else {
>              /* if it triggers an exception, no need to check watchpoint */
> -            remain = nf * esz;
> +            remain = nf << esz;
>              while (remain > 0) {
>                  offset = -(addr | TARGET_PAGE_MASK);
>                  host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
>                                           cpu_mmu_index(env, false));
>                  if (host) {
>  #ifdef CONFIG_USER_ONLY
> -                    if (page_check_range(addr, nf * esz, PAGE_READ) < 0) {
> +                    if (page_check_range(addr, nf << esz, PAGE_READ) < 0) {
>                          vl = i;
>                          goto ProbeSuccess;
>                      }
>  #else
> -                    probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
> +                    probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
>  #endif
>                  } else {
>                      vl = i;
> @@ -514,8 +522,8 @@ ProbeSuccess:
>              continue;
>          }
>          while (k < nf) {
> -            target_ulong addr = base + (i * nf + k) * esz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            target_ulong addr = base + ((i * nf + k) << esz);
> +            ldst_elem(env, addr, i + k * max_elems, vd, ra);
>              k++;
>          }
>      }
> @@ -526,7 +534,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
>                    CPURISCVState *env, uint32_t desc)      \
>  {                                                         \
>      vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
> -              sizeof(ETYPE), GETPC());                    \
> +              ctzl(sizeof(ETYPE)), GETPC());              \
>  }
>
>  GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
> @@ -739,7 +747,7 @@ void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
>  {                                                               \
>      vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
>                        INDEX_FN, vext_##NAME##_noatomic_op,      \
> -                      sizeof(ETYPE), GETPC());                  \
> +                      ctzl(sizeof(ETYPE)), GETPC());            \
>  }
>
>  GEN_VEXT_AMO(vamoswapei8_32_v,  int32_t, idx_b)
> @@ -1225,7 +1233,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>                    void *vs2, CPURISCVState *env, uint32_t desc) \
>  {                                                               \
>      uint32_t vl = env->vl;                                      \
> -    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
> +    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
>      uint32_t i;                                                 \
>                                                                  \
>      for (i = 0; i < vl; i++) {                                  \
> @@ -3880,7 +3888,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>  {                                                                   \
>      uint32_t vm = vext_vm(desc);                                    \
>      uint32_t vl = env->vl;                                          \
> -    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
> +    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
>      uint32_t i;                                                     \
>                                                                      \
>      for (i = 0; i < vl; i++) {                                      \
> @@ -4666,7 +4674,7 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
>  void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>                    CPURISCVState *env, uint32_t desc)                      \
>  {                                                                         \
> -    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
> +    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
>      uint32_t index, i;                                                    \
> @@ -4694,7 +4702,7 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>                    CPURISCVState *env, uint32_t desc)                      \
>  {                                                                         \
> -    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
> +    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
>      uint32_t index = s1, i;                                               \
> --
> 2.17.1
>
>

