Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCzJ4-00079O-Hb
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 01:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzJ1-000797-NR
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzJ0-0004v8-9q
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:25:51 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCzJ0-0004tP-2h
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:25:50 -0400
Received: by mail-pf1-x443.google.com with SMTP id c19so6539993pfo.13
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 22:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TOBikSYrzNz6xNkj6oqXaH51nkfUb9JB5NaDAXgIHGc=;
 b=tMw06WEpwP9MT/4EEo0dPCZ+mxK+3C+zq0wl+9RsN4oTYlSUEm4uXUTUGxW6Yagf/9
 791mJV0xMlv0bo5QLhPsvhC6nglzcHPafxdR6FP5mEVy1+Ns6vq9Qbp7VW5/zs0okgZK
 RUxgSvKAZdCcIXVOX9veF1x//1ejcwpQeP567s1mZTjkKEvEjJawl+CaJkWYYcJkCCbl
 CU2nXyE/RAoveHPgAwTOwJJwlvlb8PakwsklHrtBLx6Eho8Kci1D/e/OfpE4n97uQhr0
 yYWhh0PCYPycN4DJFi4mAgud9hiDS5gJObMjzbWtYw4v8kjeiX3iPwmWClZeDO9/Rtmw
 qkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TOBikSYrzNz6xNkj6oqXaH51nkfUb9JB5NaDAXgIHGc=;
 b=ev1u3JrIOuzBMMkjOLGEEaTMY32QyoD/DvwWZFZfKPs1WbuByeWBwTZjkGzu3aPebh
 eOLj6UJ+5je+XctjpqZnUeIavLJaSHWvs+21s1l8qF4shIsRGfKUI6mqgJS639jwACQq
 SKR/1FUF3MX+maRLBnCAmTNqvE6eXVocx3uQXMFkKSqfRYrsbd3/lOhHaQjoM3QgUj0Z
 dKih9cKNsSqMW3KusRxz4EUJUMD/x673wZFqhnCMM/HNkJCJwdLDMQ0zKOC8XgFcnMoT
 MYzxyqUUGgxsRTHI/UL56aOv6NtvSBhvO4kj4KwnvcwD3pslcwHa+wm3UKUh8h9kaCgz
 Kbiw==
X-Gm-Message-State: ANhLgQ2NzyAVWANZpt+0sTTkOofDWabD8j0waoTuInV0kWGaQ8eMN4tw
 UDJNBB4s/eXSLNOffit4aNL3/AEMaYk=
X-Google-Smtp-Source: ADFU+vtX3eaNbvC8WSCZ5LdBQ/P419sQwONv9kgstwVhsz1t2LrJAChavR07hUEO+XLM06KlfUQgNQ==
X-Received: by 2002:a63:24c6:: with SMTP id
 k189mr16318265pgk.436.1584163548587; 
 Fri, 13 Mar 2020 22:25:48 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s11sm30780158pfh.7.2020.03.13.22.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 22:25:47 -0700 (PDT)
Subject: Re: [PATCH v5 09/60] target/riscv: vector single-width integer add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-10-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49490839-077a-5bb6-c56e-95298c5ef74f@linaro.org>
Date: Fri, 13 Mar 2020 22:25:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-10-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Sat, 14 Mar 2020 05:25:53 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +    if (a->vm && s->vl_eq_vlmax) {                                 \
> +        tcg_gen_gvec_##GVSUF(8 << s->sew, vreg_ofs(s, a->rd),      \
> +            vreg_ofs(s, a->rs2), vreg_ofs(s, a->rs1),              \
> +            MAXSZ(s), MAXSZ(s));                                   \

The first argument here should be just s->sew.
You should have see the assert fire:

    tcg_debug_assert(vece <= MO_64);

It would be nice to pull out the bulk of GEN_OPIVV_GVEC_TRANS as a function,
and pass in tcg_gen_gvec_* as a function pointer, and fns as a pointer.

In general, I prefer the functions that are generated by macros like this to
have exactly one executable statement -- the call to the helper that does all
of the work using the arguments provided.  That way a maximum number of lines
are available for stepping with the debugger.

> +        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);                        \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                            \
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                        \

Why are these replicated in each trans_* function, and not done in opiv?_trans,
where the rest of the descriptor is created?

> +/* OPIVX without GVEC IR */
> +#define GEN_OPIVX_TRANS(NAME, CHECK)                                     \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
> +{                                                                        \
> +    if (CHECK(s, a)) {                                                   \
> +        uint32_t data = 0;                                               \
> +        static gen_helper_opivx const fns[4] = {                         \
> +            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                \
> +            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
> +        };                                                               \
> +                                                                         \
> +        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);                   \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                       \
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                   \
> +        return opivx_trans(a->rd, a->rs1, a->rs2, data, fns[s->sew], s); \
> +    }                                                                    \
> +    return false;                                                        \
> +}
> +
> +GEN_OPIVX_TRANS(vrsub_vx, opivx_check)

Note that you *can* generate vector code for this,
you just have to write your own helpers.

E.g.

static void gen_vec_rsub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 a)
{
    tcg_gen_vec_sub8_i64(d, b, a);
}
// etc, reversing the arguments and passing on to sub.

static const GVecGen2s rsub_op[4] = {
    { .fni8 = tcg_gen_vec_rsub8_i64,
      .fniv = tcg_gen_rsub_vec,
      .fno = gen_helper_gvec_rsubs8,
      .opt_opc = vecop_list_sub,
      .vece = MO_8 },
    { .fni8 = tcg_gen_vec_rsub16_i64,
      .fniv = tcg_gen_rsub_vec,
      .fno = gen_helper_gvec_rsubs16,
      .opt_opc = vecop_list_sub,
      .vece = MO_16 },
    { .fni4 = tcg_gen_rsub_i32,
      .fniv = tcg_gen_rsub_vec,
      .fno = gen_helper_gvec_rsubs32,
      .opt_opc = vecop_list_sub,
      .vece = MO_32 },
    { .fni8 = tcg_gen_rsub_i64,
      .fniv = tcg_gen_rsub_vec,
      .fno = gen_helper_gvec_rsubs64,
      .opt_opc = vecop_list_sub,
      .prefer_i64 = TCG_TARGET_REG_BITS == 64,
      .vece = MO_64 },
};

static void gen_gvec_rsubs(unsigned vece, uint32_t dofs,
    uint32_t aofs, TCGv_i64 c,
    uint32_t oprsz, uint32_t maxsz)
{
    tcg_debug_assert(vece <= MO_64);
    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &rsub_op[vece]);
}

static void gen_gvec_rsubi(unsigned vece, uint32_t dofs,
    uint32_t aofs, int64_t c,
    uint32_t oprsz, uint32_t maxsz)
{
    tcg_debug_assert(vece <= MO_64);
    tcg_gen_gvec_2i(dofs, aofs, oprsz, maxsz, c, &rsub_op[vece]);
}

> +/* generate the helpers for OPIVV */
> +#define GEN_VEXT_VV(NAME, ESZ, DSZ, CLEAR_FN)             \
> +void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
> +        void *vs2, CPURISCVState *env, uint32_t desc)     \
> +{                                                         \
> +    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
> +    uint32_t mlen = vext_mlen(desc);                      \
> +    uint32_t vm = vext_vm(desc);                          \
> +    uint32_t vl = env->vl;                                \
> +    uint32_t i;                                           \
> +    for (i = 0; i < vl; i++) {                            \
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
> +            continue;                                     \
> +        }                                                 \
> +        do_##NAME(vd, vs1, vs2, i);                       \
> +    }                                                     \
> +    if (i != 0) {                                         \
> +        CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);         \
> +    }                                                     \
> +}
> +
> +GEN_VEXT_VV(vadd_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vadd_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vadd_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vadd_vv_d, 8, 8, clearq)
> +GEN_VEXT_VV(vsub_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vsub_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vsub_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vsub_vv_d, 8, 8, clearq)

The body of GEN_VEXT_VV can be an inline function, calling the helper functions
that you generated above.

> +/*
> + * If XLEN < SEW, the value from the x register is sign-extended to SEW bits.
> + * So (target_long)s1 is need. (T1)(target_long)s1 gives the real operator type.
> + * (TX1)(T1)(target_long)s1 expands the operator type of widen operations
> + * or narrow operations
> + */
> +#define OPIVX2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
> +static void do_##NAME(void *vd, target_ulong s1, void *vs2, int i)  \
> +{                                                                   \
> +    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
> +    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)(target_long)s1);         \
> +}

Why not just make the type of s1 be target_long in the parameter?

> +/* generate the helpers for instructions with one vector and one sclar */
> +#define GEN_VEXT_VX(NAME, ESZ, DSZ, CLEAR_FN)             \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
> +        void *vs2, CPURISCVState *env, uint32_t desc)     \
> +{                                                         \
> +    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
> +    uint32_t mlen = vext_mlen(desc);                      \
> +    uint32_t vm = vext_vm(desc);                          \
> +    uint32_t vl = env->vl;                                \
> +    uint32_t i;                                           \
> +                                                          \
> +    for (i = 0; i < vl; i++) {                            \
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
> +            continue;                                     \
> +        }                                                 \
> +        do_##NAME(vd, s1, vs2, i);                        \
> +    }                                                     \
> +    if (i != 0) {                                         \
> +        CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);         \
> +    }                                                     \
> +}

Likewise an inline function.


r~

