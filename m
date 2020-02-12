Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1lfF-000511-1U
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 01:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1lfB-0004xs-LX
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 01:38:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1lfA-0006R6-3g
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 01:38:21 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1lf9-0006Qr-Re
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 01:38:20 -0500
Received: by mail-pg1-x543.google.com with SMTP id b9so534847pgk.12
 for <qemu-riscv@nongnu.org>; Tue, 11 Feb 2020 22:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X9D0b1lJ5QLqGlvltVOL/NUOjKyZ/EqclHSYn+Yw5mE=;
 b=V7H5tjoIvD/TWEWyWxCUmUPAZV28gj9OhBE+vBTvCF7WZPYHxOOZ251xn93J2OfHOM
 xG9c/70fvYO9FloHyamZydrV2q7v/zGPOKr4ucX3NB3d+cqFs/LxEPEUAmebKpAdI9HH
 CJuqp8fLwgTzKFtprv0xPGaxDek4m9zlNDzha+e4JWOUCUPt6HS63id3W0x+PhfgsieC
 CL4nL38gl9El3Aw+KdcsG+kVyTJzPN2mIA/qg3h29XoGpkc7E+UxdaurKzcJQMvj5LCE
 GJv4F1XAh6pLkEJKeF/jDzKyyK3Sr12rdSPGD/Cct9YiSY2F/Q+vhd9yvTvxQwRtymKz
 xLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X9D0b1lJ5QLqGlvltVOL/NUOjKyZ/EqclHSYn+Yw5mE=;
 b=tSJQowN7MgtLFSDhx/7TGtRVuEyIatLmLXcIyEkFjGc6P4LCGfmzsu//cSpKX82PPP
 4MFlKxKZfX03a5bAq/2H0zC2cfisImdDUt58pcPrPU6vRCE7hdV3STuk+K9dMG2Vsqpy
 08ldGZmgKhuJU58h6dA+x3GwweCx8WNZ7SRXV+aEdCnTEd8aEufRR77zAkQHGYsw1UrI
 qSoB2XROeV2YeL8wEKk/pwEGwnNZmuzCLfiXrwS7uuCw4I8Zed52W+EzrmCBaKVHkFiv
 c4HW8VyXqXTe2+09UbcGdwn3DP8Ekd5kR23QenfzlvrfflsYS2thCy7ZMe4n9IlU1yUl
 yTtA==
X-Gm-Message-State: APjAAAULaI6ApytpZv0DZUYkQuzCA0gU9nPXCZp9ZnYQzFR8YDmcUSc0
 hEzvwCLO9Y2g+KEIBLqXkAYsgG59mlY=
X-Google-Smtp-Source: APXvYqx0y9UfTmQm0jIGLaai0LCH1SMTV5br4xSkLW0neHTeIWug2tCXukg+bF2qKjfGYNEVpsf0QQ==
X-Received: by 2002:aa7:8587:: with SMTP id w7mr10319925pfn.39.1581489497393; 
 Tue, 11 Feb 2020 22:38:17 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 v9sm5532417pja.26.2020.02.11.22.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:38:16 -0800 (PST)
Subject: Re: [PATCH v3 1/5] target/riscv: add vector unit stride load and
 store instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210074256.11412-1-zhiwei_liu@c-sky.com>
 <20200210074256.11412-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9054a6fb-adee-4dcc-d7c6-9a974a83668a@linaro.org>
Date: Tue, 11 Feb 2020 22:38:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210074256.11412-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Wed, 12 Feb 2020 06:38:23 -0000

On 2/9/20 11:42 PM, LIU Zhiwei wrote:
> +/*
> + * As simd_desc supports at most 256 bytes, and in this implementation,
> + * the max vector group length is 2048 bytes. So split it into two parts.
> + *
> + * The first part is floor(maxsz, 64), encoded in maxsz of simd_desc.
> + * The second part is (maxsz % 64) >> 3, encoded in data of simd_desc.
> + */
> +static uint32_t maxsz_part1(uint32_t maxsz)
> +{
> +    return ((maxsz & ~(0x3f)) >> 3) + 0x8; /* add offset 8 to avoid return 0 */
> +}
> +
> +static uint32_t maxsz_part2(uint32_t maxsz)
> +{
> +    return (maxsz & 0x3f) >> 3;
> +}

I would much rather adjust simd_desc to support 2048 bytes.

I've just posted a patch set that removes an assert in target/arm that would
trigger if SIMD_DATA_SHIFT was increased to make room for a larger oprsz.

Or, since we're not going through tcg_gen_gvec_* for ldst, don't bother with
simd_desc at all, and just pass vlen, unencoded.

> +/* define check conditions data structure */
> +struct vext_check_ctx {
> +
> +    struct vext_reg {
> +        uint8_t reg;
> +        bool widen;
> +        bool need_check;
> +    } check_reg[6];
> +
> +    struct vext_overlap_mask {
> +        uint8_t reg;
> +        uint8_t vm;
> +        bool need_check;
> +    } check_overlap_mask;
> +
> +    struct vext_nf {
> +        uint8_t nf;
> +        bool need_check;
> +    } check_nf;
> +    target_ulong check_misa;
> +
> +} vchkctx;

You cannot use a global variable.  The data must be thread-safe.

If we're going to do the checks this way, with a structure, it needs to be on
the stack or within DisasContext.

> +#define GEN_VEXT_LD_US_TRANS(NAME, DO_OP, SEQ)                            \
> +static bool trans_##NAME(DisasContext *s, arg_r2nfvm* a)                  \
> +{                                                                         \
> +    vchkctx.check_misa = RVV;                                             \
> +    vchkctx.check_overlap_mask.need_check = true;                         \
> +    vchkctx.check_overlap_mask.reg = a->rd;                               \
> +    vchkctx.check_overlap_mask.vm = a->vm;                                \
> +    vchkctx.check_reg[0].need_check = true;                               \
> +    vchkctx.check_reg[0].reg = a->rd;                                     \
> +    vchkctx.check_reg[0].widen = false;                                   \
> +    vchkctx.check_nf.need_check = true;                                   \
> +    vchkctx.check_nf.nf = a->nf;                                          \
> +                                                                          \
> +    if (!vext_check(s)) {                                                 \
> +        return false;                                                     \
> +    }                                                                     \
> +    return DO_OP(s, a, SEQ);                                              \
> +}

I don't see the improvement from a pointer.  Something like

    if (vext_check_isa_ill(s) &&
        vext_check_overlap(s, a->rd, a->rm) &&
        vext_check_reg(s, a->rd, false) &&
        vext_check_nf(s, a->nf)) {
        return DO_OP(s, a, SEQ);
    }
    return false;

seems just as clear without the extra data.

> +#ifdef CONFIG_USER_ONLY
> +#define MO_SB 0
> +#define MO_LESW 0
> +#define MO_LESL 0
> +#define MO_LEQ 0
> +#define MO_UB 0
> +#define MO_LEUW 0
> +#define MO_LEUL 0
> +#endif

What is this for?  We already define these unconditionally.


> +static inline int vext_elem_mask(void *v0, int mlen, int index)
> +{
> +    int idx = (index * mlen) / 8;
> +    int pos = (index * mlen) % 8;
> +
> +    return (*((uint8_t *)v0 + idx) >> pos) & 0x1;
> +}

This is a little-endian indexing of the mask.  Just above we talk about using a
host-endian ordering of uint64_t.

Thus this must be based on uint64_t instead of uint8_t.

> +/*
> + * This function checks watchpoint before really load operation.
> + *
> + * In softmmu mode, the TLB API probe_access is enough for watchpoint check.
> + * In user mode, there is no watchpoint support now.
> + *
> + * It will triggle an exception if there is no mapping in TLB
> + * and page table walk can't fill the TLB entry. Then the guest
> + * software can return here after process the exception or never return.
> + */
> +static void probe_read_access(CPURISCVState *env, target_ulong addr,
> +        target_ulong len, uintptr_t ra)
> +{
> +    while (len) {
> +        const target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
> +        const target_ulong curlen = MIN(pagelen, len);
> +
> +        probe_read(env, addr, curlen, cpu_mmu_index(env, false), ra);

The return value here is non-null when we can read directly from host memory.
It would be a shame to throw that work away.


> +/* data structure and common functions for load and store */
> +typedef void vext_ld_elem_fn(CPURISCVState *env, target_ulong addr,
> +        uint32_t idx, void *vd, uintptr_t retaddr);
> +typedef void vext_st_elem_fn(CPURISCVState *env, target_ulong addr,
> +        uint32_t idx, void *vd, uintptr_t retaddr);
> +typedef target_ulong vext_get_index_addr(target_ulong base,
> +        uint32_t idx, void *vs2);
> +typedef void vext_ld_clear_elem(void *vd, uint32_t idx,
> +        uint32_t cnt, uint32_t tot);
> +
> +struct vext_ldst_ctx {
> +    struct vext_common_ctx vcc;
> +    uint32_t nf;
> +    target_ulong base;
> +    target_ulong stride;
> +    int mmuidx;
> +
> +    vext_ld_elem_fn *ld_elem;
> +    vext_st_elem_fn *st_elem;
> +    vext_get_index_addr *get_index_addr;
> +    vext_ld_clear_elem *clear_elem;
> +};

I think you should pass these elements directly, as needed, rather than putting
them all in a struct.

This would allow the main helper function to be inlined, which in turn allows
the mini helper functions to be inlined.


r~

