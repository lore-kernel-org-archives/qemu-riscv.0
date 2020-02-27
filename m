Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7OfN-0000XW-6D
	for mharc-qemu-riscv@gnu.org; Thu, 27 Feb 2020 14:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7OfK-0000T2-0k
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7OfI-00036l-De
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:17:45 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7OfI-00036C-6a
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:17:44 -0500
Received: by mail-pl1-x642.google.com with SMTP id g6so186496plp.6
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2020 11:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rkZ3dNlnom8394SX7fXjtihYKPXDxrUBwwgevdf0LLw=;
 b=vu5DrgXjdJxGo1+Q4Lq67uO6mE8thJqVTz9+hxl0L+PTYGwlvOCFGXWcd95UVCw4HB
 CeMfgDAYkwAzDHbmmAPJY8qrNKRemY3oluOnUzS5Xp/0DoSSvWc2b8zhamXyAEoLzqJm
 oaKatgqvySc0Vk2US6jkm8keIg+T/mI5SSKH9tdNAAAO/qY3BKB/twVVJpIltpayh0oi
 a5GpKUQLCB7sApUGgffk75UnIGHSCJTpB4u1b0/Yvv9lyZ1/6WhzIwAdbaFn6ucrpNZx
 USPXF9+gSfE6YO835gya8Gt37M1FdFWMuGMxl1/62BWBjdKIeEGCUvi+S8n/lP8BB1F6
 mkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkZ3dNlnom8394SX7fXjtihYKPXDxrUBwwgevdf0LLw=;
 b=pKacalbYU9DqGnSf7lDuGklUPiMeDwxsQN38j1elUOMsFxDMTn83CUvkLMipitLNFu
 FjWutV/f+rluHBq0aHLsX2RP0ZafmKr3gd8yZa7vpGDvc7aizjmrx/cjYbQubMWURpHt
 QNY3kq5ccdE/s6mJdepdnM6VWIZlVGlAE5gPil79Tr2X4sK0l/f5V8WfBvsqRIS9WJ17
 o7bJNUn5eSPUQtlYIkMNtmo0KUoecp3Aq0vBtILXC6iBVe2ezC9K8BelqVXgtX/lx1lU
 B/TOIozJFexvkYZ6w8/LrO4lns2X5nBHgszRy8q8tHOmd4n5O4yGZbShsgcMKRk0Prmh
 /nqg==
X-Gm-Message-State: APjAAAVVZJHnme4/GyADXuuiYO+Ij73c/o4z4xXbICT0Xe+VHx9dC86y
 +8+35JOLozfQ0XRy7Et0/yth/tsLqbM=
X-Google-Smtp-Source: APXvYqyv6vN8hBGWJ3ssD3m9+mn61b+lNdySW+MEc+9+iXhOL2IrvswEl8N/JbqtGHTz0ueUWXlVVQ==
X-Received: by 2002:a17:90a:8806:: with SMTP id
 s6mr414229pjn.141.1582831062693; 
 Thu, 27 Feb 2020 11:17:42 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 k4sm7899602pfg.40.2020.02.27.11.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 11:17:41 -0800 (PST)
Subject: Re: [PATCH v4 1/5] target/riscv: add vector unit stride load and
 store instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 linux-csky@vger.kernel.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200225103508.7651-1-zhiwei_liu@c-sky.com>
 <20200225103508.7651-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cfb56d6-34a5-0e35-87a0-2aefaafa4221@linaro.org>
Date: Thu, 27 Feb 2020 11:17:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225103508.7651-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Thu, 27 Feb 2020 19:17:47 -0000

On 2/25/20 2:35 AM, LIU Zhiwei wrote:
> +static bool vext_check_reg(DisasContext *s, uint32_t reg, bool widen)
> +{
> +    int legal = widen ? 2 << s->lmul : 1 << s->lmul;
> +
> +    return !((s->lmul == 0x3 && widen) || (reg % legal));
> +}
> +
> +static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool vm)
> +{
> +    return !(s->lmul > 1 && vm == 0 && vd == 0);
> +}
> +
> +static bool vext_check_nf(DisasContext *s, uint32_t nf)
> +{
> +    return s->lmul * (nf + 1) <= 8;
> +}

Some commentary would be good here, quoting the rule being applied.  E.g. "The
destination vector register group for a masked vector instruction can only
overlap the source mask regis-
ter (v0) when LMUL=1. (Section 5.3)"

> +static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
> +{
> +    uint8_t nf = a->nf + 1;

Perhaps NF should have the +1 done during decode, so that it cannot be
forgotten here or elsewhere.  E.g.

%nf      31:3  !function=ex_plus_1
@r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... \
         &r2nfvm %nf %rs1 %rd

Where ex_plus_1 is the obvious modification of ex_shift_1().

> +static inline uint32_t vext_nf(uint32_t desc)
> +{
> +    return (simd_data(desc) >> 11) & 0xf;
> +}
> +
> +static inline uint32_t vext_mlen(uint32_t desc)
> +{
> +    return simd_data(desc) & 0xff;
> +}
> +
> +static inline uint32_t vext_vm(uint32_t desc)
> +{
> +    return (simd_data(desc) >> 8) & 0x1;
> +}
> +
> +static inline uint32_t vext_lmul(uint32_t desc)
> +{
> +    return (simd_data(desc) >> 9) & 0x3;
> +}

You should use FIELD() to define the fields, and then use FIELD_EX32 and
FIELD_DP32 to reference them.

> +/*
> + * This function checks watchpoint before real load operation.
> + *
> + * In softmmu mode, the TLB API probe_access is enough for watchpoint check.
> + * In user mode, there is no watchpoint support now.
> + *
> + * It will triggle an exception if there is no mapping in TLB

trigger.

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
> +        addr += curlen;
> +        len -= curlen;
> +    }
> +}
> +
> +static void probe_write_access(CPURISCVState *env, target_ulong addr,
> +        target_ulong len, uintptr_t ra)
> +{
> +    while (len) {
> +        const target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
> +        const target_ulong curlen = MIN(pagelen, len);
> +
> +        probe_write(env, addr, curlen, cpu_mmu_index(env, false), ra);
> +        addr += curlen;
> +        len -= curlen;
> +    }
> +}

A loop is overkill -- the access cannot span to 3 pages.  These two functions
can be merged using probe_access and MMU_DATA_{LOAD,STORE}.

> +
> +#ifdef HOST_WORDS_BIGENDIAN
> +static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
> +{
> +    /*
> +     * Split the remaining range to two parts.
> +     * The first part is in the last uint64_t unit.
> +     * The second part start from the next uint64_t unit.
> +     */
> +    int part1 = 0, part2 = tot - cnt;
> +    if (cnt % 64) {
> +        part1 = 64 - (cnt % 64);
> +        part2 = tot - cnt - part1;
> +        memset(tail & ~(63ULL), 0, part1);
> +        memset((tail + 64) & ~(63ULL), 0, part2);

You're confusing bit and byte offsets -- cnt and tot are both byte offsets.

> +static inline int vext_elem_mask(void *v0, int mlen, int index)
> +{
> +
> +    int idx = (index * mlen) / 8;
> +    int pos = (index * mlen) % 8;
> +
> +    switch (mlen) {
> +    case 8:
> +        return *((uint8_t *)v0 + H1(index)) & 0x1;
> +    case 16:
> +        return *((uint16_t *)v0 + H2(index)) & 0x1;
> +    case 32:
> +        return *((uint32_t *)v0 + H4(index)) & 0x1;
> +    case 64:
> +        return *((uint64_t *)v0 + index) & 0x1;
> +    default:
> +        return (*((uint8_t *)v0 + H1(idx)) >> pos) & 0x1;
> +    }

This is not what I had in mind, and looks wrong as well.

    int idx = (index * mlen) / 64;
    int pos = (index * mlen) % 64;
    return (((uint64_t *)v0)[idx] >> pos) & 1;

You also might consider passing log2(mlen), so the multiplication could be
strength-reduced to a shift.

> +#define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)              \
> +static void vext_##NAME##_ld_elem(CPURISCVState *env, abi_ptr addr, \
> +        uint32_t idx, void *vd, uintptr_t retaddr)                  \
> +{                                                                   \
> +    int mmu_idx = cpu_mmu_index(env, false);                        \
> +    MTYPE data;                                                     \
> +    ETYPE *cur = ((ETYPE *)vd + H(idx));                            \
> +    data = cpu_##LDSUF##_mmuidx_ra(env, addr, mmu_idx, retaddr);    \
> +    *cur = data;                                                    \
> +}                                                                   \

If you're going to use cpu_mmu_index, you might as well use cpu_SUFF_data_ra(),
which does not require the mmu_idx parameter.

> +#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)                       \
> +static void vext_##NAME##_st_elem(CPURISCVState *env, abi_ptr addr,   \
> +        uint32_t idx, void *vd, uintptr_t retaddr)                    \
> +{                                                                     \
> +    int mmu_idx = cpu_mmu_index(env, false);                          \
> +    ETYPE data = *((ETYPE *)vd + H(idx));                             \
> +    cpu_##STSUF##_mmuidx_ra(env, addr, data, mmu_idx, retaddr);       \
> +}

Likewise.

> +/*
> + *** unit-stride: load vector element from continuous guest memory
> + */
> +static inline void vext_ld_us_mask(void *vd, void *v0, target_ulong base,
> +        CPURISCVState *env, uint32_t desc,
> +        vext_ld_elem_fn ld_elem,
> +        vext_ld_clear_elem clear_elem,
> +        uint32_t esz, uint32_t msz, uintptr_t ra)
> +{
> +    uint32_t i, k;
> +    uint32_t mlen = vext_mlen(desc);

You don't need to pass mlen, since it's

> +/* unit-stride: store vector element to guest memory */
> +static void vext_st_us_mask(void *vd, void *v0, target_ulong base,
> +        CPURISCVState *env, uint32_t desc,
> +        vext_st_elem_fn st_elem,
> +        uint32_t esz, uint32_t msz, uintptr_t ra)
> +{
> +    uint32_t i, k;
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +
> +    /* probe every access*/
> +    for (i = 0; i < env->vl; i++) {
> +        if (!vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        probe_write_access(env, base + nf * i * msz, nf * msz, ra);
> +    }
> +    /* store bytes to guest memory */
> +    for (i = 0; i < env->vl; i++) {
> +        k = 0;
> +        if (!vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            target_ulong addr = base + (i * nf + k) * msz;
> +            st_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +}

I'll note that vext_ld_us_mask and vext_st_us_mask are identical, except for:

1) probe_read/write_access (which I already suggested merging, using
MMUAccessType),

2) the name of the ld_elem/st_elem variable (the function types are already
identical), and

3) the clear loop at the end of the load (which could be conditional on
clear_elem != NULL; after inlining, this should be optimized away).

> +static void vext_st_us(void *vd, target_ulong base,
> +        CPURISCVState *env, uint32_t desc,
> +        vext_st_elem_fn st_elem,
> +        uint32_t esz, uint32_t msz, uintptr_t ra)

Similarly.


r~

