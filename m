Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46002C44500
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:40:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgZFf-0002DK-IU; Sun, 05 Jul 2026 22:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZFd-0002Bo-WD
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:40:06 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZFc-0007bH-06
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:40:05 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f35so3808006a12.3
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 19:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783305601; cv=none;
 d=google.com; s=arc-20260327;
 b=JBi5wmaxyq4ANdl18hZQLRQgxVwV+6NP7/fZFMGh41WCQKQTjHkshgJMgJoKYx2Sc7
 BKgHP+pDhdbVFIWVYEDVG2J2LyI1p7i1+WhyS1g3Plh33XoidBtkWn9r9lRAMHomVcIF
 MzaG+QncTxxWh/uGZKHdTDfGiK2O5PY+cRwYFAb4gT2nR3DvzU5SBk2jNisUqL/jEXqb
 Oz7jxNQQztONuG0WTd860NK2NUXrideqaf3rqyy94o0APWCtJkQczgoZbx1IJuEhQUAh
 JqLVecQ+XrM8FJGe060OQk/ruaCvc+sOCuU/dJw2X/SD/Cx6gfoAbixL2DwLMsvHXz/f
 YVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yjk0asO8W1etPqSVINFVAHitNTeccYjA0bM83IdqgzQ=;
 fh=n5fQb0RIEyfpV5m6EN8BmVkkXQWHXd9GaDT0R8N7llw=;
 b=GaeWyWpcs3pbRO5oekyolblS/q7DVJbTvqeQb0/qCrXWdPs5KKD6kMfP5PBWmVQqLj
 Vl9rG0mnpzIe9rpq8py1ex85fFL1xsnPnrBz3NV6/BAWCTUFVOW6FPQUyv2TiPDu2med
 mw82ca/3q+SPdsNOMC55B1xkH4I1VVi8m3XlfJ8wT9F4dn3Z1he6BtnUm98gdbxrGrJQ
 iGIUalrPTW5Umzo8/ozluNwDKNsSe08E7QfUXIDQEAL3hGWA/egaqy81ajHYDMmwfk7A
 C46tVzutNfxaqcoVMln1O6Zyf5ahf0+ljWLt5xyEGgUR4RTyhpEki0wS0qFw5KW9oDHy
 deDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783305601; x=1783910401; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjk0asO8W1etPqSVINFVAHitNTeccYjA0bM83IdqgzQ=;
 b=GibZ2FBB7To/mO5B1VDTOPvj1q3nNIVs/bO9DNsDZ8ML4QlR1W7/x0jlZwxiXNOc/S
 2cvBfx9ySqhvVQrnNGW/xtUu4qg5KY7dnp9q9RRo0yZKGx7iTuI2TvE0iDIsXqPDHNHw
 gxPL7g7/dXUlnuTergTIhK6o4hmyS/XupPYd/9RDcGvHltU2CH2QIF/bXVALHxUtpXIH
 OWI1xMrV6qchlSGKrfOc84J6SzDR2e2tFgN5Kv/VLBKOPCgGeXUSEAooiYumt9c/CaXh
 P/187PI9J7LfOQJRyVSSGrIb5pOkN7sqECzVwWqc/7n9i4nNlKawxLWTtMbR+2VwbnIX
 054Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783305601; x=1783910401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yjk0asO8W1etPqSVINFVAHitNTeccYjA0bM83IdqgzQ=;
 b=Y6pxNx4cK9kDk1qC2ug4PsYXCwDrxaLoBLcf/U3UkWFX/EgY6SZRTS+BFvdOjY9KDh
 Pvd0wOWTle9865FuqdmYZfLZ7pec9JFVY2EPCKdvnFpFkGesqGyFKHdD/pVdBui4FCsb
 PHpQvi1p9mLcBRX93TzT7vjBs2PVnQcXBGrsBwcv/krH6ywVRgzoA4UJcDeC7OH1cMMd
 7OR3/ZwejGxO8AA2upCyAJim7ZFV+8AorHyTsQcPY3h3T5OpDliCOTyRA10iSSydgEo6
 iph6XbsWWUv5KIn4cRo8NQP+sKj5eXqVE3rYOR3+NCWCD5YD+aIXJByS2n7kiZtzN0cH
 F2jA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLmE7w0bJipxO8gPHfoDysKd2QsgD0bteh/jpAgonnlFphtaxsXbJknfbC39Uf/J9CHyvWfBqkGBP+@nongnu.org
X-Gm-Message-State: AOJu0Yz615ToCJGJYPDV0ZuadNdAlRAOEen6tK208Y9JfS9/TDD4ZxxQ
 uPZztgZv76NEY3CyVGVlOvmG+PpYdVYgOQEhWhNsseqs9fsrIs+n7vE42U0F1MZpPcAKIWXzFKw
 Md0LxCbgb3LCMoxmwogm5KT06K5qxoc0=
X-Gm-Gg: AfdE7cnGCxwEw4Lllgr2F93xVmuO3gY/RWoR1quRJk+HKz6VKIjEzWRmjUmigfuPs0X
 rj2d0UFwd2wAY0D2P4U58N4N72eeOxUSai8ts8dI6UbFn6vjZli1jCPca8HcMbblJ8HPIFSJPI3
 Sfe/zb0YT9MtPK23uaLOyPa3l5+dQ9FYR02caArFhLd9/nXDqMgwx6sflmzeQ02O4b/uwRyxRjU
 N4iROyRA18qcihjDgQoRL11afSS61kMIKAi459I4ZSoXSYdznsweGS3DUF2ZhDqtpdM11ZFyJts
 XcCOsh1quLp0u/LuhpOwNg1Cet5dnuJYkd8Fcw==
X-Received: by 2002:a05:6402:458b:b0:698:3b7c:7e2a with SMTP id
 4fb4d7f45d1cf-69a1a3b219cmr2692149a12.34.1783305601037; Sun, 05 Jul 2026
 19:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260630104350.748267-1-frank.chang@sifive.com>
 <20260630104350.748267-4-frank.chang@sifive.com>
In-Reply-To: <20260630104350.748267-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 12:39:34 +1000
X-Gm-Features: AVVi8Cdla-Raj98pRMhUalAwwgXIttizX9E9qpANzlRmGlF7_M20w1uzSpaw5FM
Message-ID: <CAKmqyKPXJvgx1Aq-223FB4cDcKj9sBKD_4RFN4rnKQW-hfVsUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] target/riscv: Support raising misaligned
 exceptions for vector loads/stores
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Max Chou <max.chou@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 30, 2026 at 8:46=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> When the Zicclsm extension is not enabled, raise misaligned load/store
> exceptions for misaligned accesses from vector load/store instructions.
>
> We will skip the host fast-path and fall back to the slow TLB-path to
> raise misaligned load/store exceptions for the misaligned accesses when
> Zicclsm extension is disabled.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++--
>  target/riscv/vector_helper.c            | 65 +++++++++++++++++++------
>  2 files changed, 65 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 23262b1d036..a22e2cae6ce 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1191,26 +1191,38 @@ static bool ldst_whole_trans(uint32_t vd, uint32_=
t rs1, uint32_t nf,
>       * Use the helper function if either:
>       * - vstart is not 0.
>       */
> -
>      bool use_helper_fn =3D !s->vstart_eq_zero;
>
>      if (!use_helper_fn) {
>          uint32_t size =3D s->cfg_ptr->vlenb * nf;
>          TCGv_i64 t8 =3D tcg_temp_new_i64();
>          MemOp atomicity =3D MO_ATOM_NONE;
> +        MemOp alignment =3D MO_UNALN;
> +
> +        /*
> +         * If Zicclsm is disabled, require alignment based on element si=
ze.
> +         * Use MO_ALIGN_* based on log2_esz (0 =3D MO_UNALN, 1 =3D MO_AL=
IGN_2, etc).
> +         */
> +        if (!s->cfg_ptr->ext_zicclsm) {
> +            alignment =3D log2_esz << MO_ASHIFT;
> +        }
> +
>          if (log2_esz =3D=3D 0) {
>              atomicity =3D MO_ATOM_NONE;
>          } else {
>              atomicity =3D MO_ATOM_IFALIGN_PAIR;
>          }
> +
>          for (int i =3D 0; i < size; i +=3D 8) {
>              TCGv addr =3D get_address(s, rs1, i);
>              if (is_load) {
> -                tcg_gen_qemu_ld_i64(t8, addr, s->mem_idx, MO_LEUQ | atom=
icity);
> +                tcg_gen_qemu_ld_i64(t8, addr, s->mem_idx,
> +                                    MO_LEUQ | atomicity | alignment);
>                  tcg_gen_st_i64(t8, tcg_env, vreg_ofs(s, vd) + i);
>              } else {
>                  tcg_gen_ld_i64(t8, tcg_env, vreg_ofs(s, vd) + i);
> -                tcg_gen_qemu_st_i64(t8, addr, s->mem_idx, MO_LEUQ | atom=
icity);
> +                tcg_gen_qemu_st_i64(t8, addr, s->mem_idx,
> +                                    MO_LEUQ | atomicity | alignment);
>              }
>              if (i =3D=3D size - 8) {
>                  tcg_gen_movi_i32(cpu_vstart, 0);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e321ca26161..e28d8a3d9fd 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -199,20 +199,34 @@ static inline void vext_set_elem_mask(void *v0, int=
 index,
>      ((uint64_t *)v0)[idx] =3D deposit64(old, pos, 1, value);
>  }
>
> +static inline MemOpIdx vext_make_memop_idx(CPURISCVState *env, size_t si=
ze)
> +{
> +    int mmu_idx =3D riscv_env_mmu_index(env, false);
> +    MemOp memop =3D size_memop(size) | mo_endian_env(env);
> +
> +    if (!riscv_cpu_cfg(env)->ext_zicclsm) {
> +        memop |=3D MO_ALIGN;
> +    }
> +
> +    return make_memop_idx(memop, mmu_idx);
> +}
> +
>  /* elements operations for load and store */
>  typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
>                                     uint32_t idx, void *vd, uintptr_t ret=
addr);
>  typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
>
> -#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)             \
> +#define GEN_VEXT_TLB_LD_ELEM(NAME, ETYPE, H, LDSUF)         \
>  static inline QEMU_ALWAYS_INLINE                            \
>  void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
>                  uint32_t idx, void *vd, uintptr_t retaddr)  \
>  {                                                           \
>      ETYPE *cur =3D ((ETYPE *)vd + H(idx));                    \
> -    *cur =3D cpu_##LDSUF##_data_ra(env, addr, retaddr);       \
> +    MemOpIdx oi =3D vext_make_memop_idx(env, sizeof(ETYPE));  \
> +    *cur =3D cpu_##LDSUF##_mmu(env, addr, oi, retaddr);       \
>  }                                                           \
> -                                                            \
> +
> +#define GEN_VEXT_HOST_LD_ELEM(NAME, ETYPE, H, LDSUF)        \
>  static inline QEMU_ALWAYS_INLINE                            \
>  void NAME##_host(void *vd, uint32_t idx, void *host)        \
>  {                                                           \
> @@ -220,20 +234,27 @@ void NAME##_host(void *vd, uint32_t idx, void *host=
)        \
>      *cur =3D (ETYPE)LDSUF##_p(host);                          \
>  }
>
> -GEN_VEXT_LD_ELEM(lde_b, uint8_t,  H1, ldub)
> -GEN_VEXT_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
> -GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
> -GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
> +GEN_VEXT_TLB_LD_ELEM(lde_b, uint8_t,  H1, ldb)
> +GEN_VEXT_TLB_LD_ELEM(lde_h, uint16_t, H2, ldw)
> +GEN_VEXT_TLB_LD_ELEM(lde_w, uint32_t, H4, ldl)
> +GEN_VEXT_TLB_LD_ELEM(lde_d, uint64_t, H8, ldq)
>
> -#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)             \
> +GEN_VEXT_HOST_LD_ELEM(lde_b, uint8_t,  H1, ldub)
> +GEN_VEXT_HOST_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
> +GEN_VEXT_HOST_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
> +GEN_VEXT_HOST_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
> +
> +#define GEN_VEXT_TLB_ST_ELEM(NAME, ETYPE, H, STSUF)         \
>  static inline QEMU_ALWAYS_INLINE                            \
>  void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
>                  uint32_t idx, void *vd, uintptr_t retaddr)  \
>  {                                                           \
>      ETYPE data =3D *((ETYPE *)vd + H(idx));                   \
> -    cpu_##STSUF##_data_ra(env, addr, data, retaddr);        \
> +    MemOpIdx oi =3D vext_make_memop_idx(env, sizeof(ETYPE));  \
> +    cpu_##STSUF##_mmu(env, addr, data, oi, retaddr);        \
>  }                                                           \
> -                                                            \
> +
> +#define GEN_VEXT_HOST_ST_ELEM(NAME, ETYPE, H, STSUF)        \
>  static inline QEMU_ALWAYS_INLINE                            \
>  void NAME##_host(void *vd, uint32_t idx, void *host)        \
>  {                                                           \
> @@ -241,10 +262,15 @@ void NAME##_host(void *vd, uint32_t idx, void *host=
)        \
>      STSUF##_p(host, data);                                  \
>  }
>
> -GEN_VEXT_ST_ELEM(ste_b, uint8_t,  H1, stb)
> -GEN_VEXT_ST_ELEM(ste_h, uint16_t, H2, stw_le)
> -GEN_VEXT_ST_ELEM(ste_w, uint32_t, H4, stl_le)
> -GEN_VEXT_ST_ELEM(ste_d, uint64_t, H8, stq_le)
> +GEN_VEXT_TLB_ST_ELEM(ste_b, uint8_t,  H1, stb)
> +GEN_VEXT_TLB_ST_ELEM(ste_h, uint16_t, H2, stw)
> +GEN_VEXT_TLB_ST_ELEM(ste_w, uint32_t, H4, stl)
> +GEN_VEXT_TLB_ST_ELEM(ste_d, uint64_t, H8, stq)
> +
> +GEN_VEXT_HOST_ST_ELEM(ste_b, uint8_t,  H1, stb)
> +GEN_VEXT_HOST_ST_ELEM(ste_h, uint16_t, H2, stw_le)
> +GEN_VEXT_HOST_ST_ELEM(ste_w, uint32_t, H4, stl_le)
> +GEN_VEXT_HOST_ST_ELEM(ste_d, uint64_t, H8, stq_le)
>
>  static inline QEMU_ALWAYS_INLINE void
>  vext_continuous_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst=
_tlb,
> @@ -398,7 +424,16 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, targ=
et_ulong addr,
>      probe_pages(env, addr, size, ra, access_type, mmu_index, &host, &fla=
gs,
>                  true);
>
> -    if (flags =3D=3D 0) {
> +    bool misaligned =3D addr & (esz - 1);
> +
> +    /*
> +     * Allow the host fast-pash when:
> +     *   1. Page permission/pmp/watchpoint are checked and we have a con=
tigous
> +     *      host mapping.
> +     *   2. Zicclsm is enabled or load/store is not a misaligned access.
> +     * Otherwise, we will fall back to the slow TLB-path.
> +     */
> +    if (flags =3D=3D 0 && (riscv_cpu_cfg(env)->ext_zicclsm || !misaligne=
d)) {
>          if (nf =3D=3D 1) {
>              vext_continuous_ldst_host(env, ldst_host, vd, evl, env->vsta=
rt,
>                                        host, esz, is_load);
> --
> 2.43.0
>
>

