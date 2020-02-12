Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1nio-0001pQ-Uc
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 03:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1nil-0001ml-Dy
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 03:50:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1nik-0003kb-3O
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 03:50:11 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:36669)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j1nif-0003bo-U0; Wed, 12 Feb 2020 03:50:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436303|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.758985-0.00729214-0.233723;
 DS=CONTINUE|ham_regular_dialog|0.177221-0.000613269-0.822166;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03309; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.GnDbdkE_1581497395; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GnDbdkE_1581497395)
 by smtp.aliyun-inc.com(10.147.41.121);
 Wed, 12 Feb 2020 16:49:56 +0800
Subject: Re: [PATCH v3 1/5] target/riscv: add vector unit stride load and
 store instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210074256.11412-1-zhiwei_liu@c-sky.com>
 <20200210074256.11412-2-zhiwei_liu@c-sky.com>
 <9054a6fb-adee-4dcc-d7c6-9a974a83668a@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <9ffcc075-1cef-fde3-16df-34f5b34e6b4c@c-sky.com>
Date: Wed, 12 Feb 2020 16:55:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9054a6fb-adee-4dcc-d7c6-9a974a83668a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Wed, 12 Feb 2020 08:50:13 -0000

Hi, Richard

Thanks for comments.

On 2020/2/12 14:38, Richard Henderson wrote:
> On 2/9/20 11:42 PM, LIU Zhiwei wrote:
>> +/*
>> + * As simd_desc supports at most 256 bytes, and in this implementation,
>> + * the max vector group length is 2048 bytes. So split it into two parts.
>> + *
>> + * The first part is floor(maxsz, 64), encoded in maxsz of simd_desc.
>> + * The second part is (maxsz % 64) >> 3, encoded in data of simd_desc.
>> + */
>> +static uint32_t maxsz_part1(uint32_t maxsz)
>> +{
>> +    return ((maxsz & ~(0x3f)) >> 3) + 0x8; /* add offset 8 to avoid return 0 */
>> +}
>> +
>> +static uint32_t maxsz_part2(uint32_t maxsz)
>> +{
>> +    return (maxsz & 0x3f) >> 3;
>> +}
> I would much rather adjust simd_desc to support 2048 bytes.
>
> I've just posted a patch set that removes an assert in target/arm that would
> trigger if SIMD_DATA_SHIFT was increased to make room for a larger oprsz.
Do you mean "assert(maxsz % 8 == 0 && maxsz <= (8 << SIMD_MAXSZ_BITS));" 
in tcg-op-gvec.c?
If it is removed, I can pass 2048 bytes by set maxsz == 256.
> Or, since we're not going through tcg_gen_gvec_* for ldst, don't bother with
> simd_desc at all, and just pass vlen, unencoded.
  Vlen is not enough,  lmul is also needed in helpers.
>
>> +/* define check conditions data structure */
>> +struct vext_check_ctx {
>> +
>> +    struct vext_reg {
>> +        uint8_t reg;
>> +        bool widen;
>> +        bool need_check;
>> +    } check_reg[6];
>> +
>> +    struct vext_overlap_mask {
>> +        uint8_t reg;
>> +        uint8_t vm;
>> +        bool need_check;
>> +    } check_overlap_mask;
>> +
>> +    struct vext_nf {
>> +        uint8_t nf;
>> +        bool need_check;
>> +    } check_nf;
>> +    target_ulong check_misa;
>> +
>> +} vchkctx;
> You cannot use a global variable.  The data must be thread-safe.
>
> If we're going to do the checks this way, with a structure, it needs to be on
> the stack or within DisasContext.
>> +#define GEN_VEXT_LD_US_TRANS(NAME, DO_OP, SEQ)                            \
>> +static bool trans_##NAME(DisasContext *s, arg_r2nfvm* a)                  \
>> +{                                                                         \
>> +    vchkctx.check_misa = RVV;                                             \
>> +    vchkctx.check_overlap_mask.need_check = true;                         \
>> +    vchkctx.check_overlap_mask.reg = a->rd;                               \
>> +    vchkctx.check_overlap_mask.vm = a->vm;                                \
>> +    vchkctx.check_reg[0].need_check = true;                               \
>> +    vchkctx.check_reg[0].reg = a->rd;                                     \
>> +    vchkctx.check_reg[0].widen = false;                                   \
>> +    vchkctx.check_nf.need_check = true;                                   \
>> +    vchkctx.check_nf.nf = a->nf;                                          \
>> +                                                                          \
>> +    if (!vext_check(s)) {                                                 \
>> +        return false;                                                     \
>> +    }                                                                     \
>> +    return DO_OP(s, a, SEQ);                                              \
>> +}
> I don't see the improvement from a pointer.  Something like
>
>      if (vext_check_isa_ill(s) &&
>          vext_check_overlap(s, a->rd, a->rm) &&
>          vext_check_reg(s, a->rd, false) &&
>          vext_check_nf(s, a->nf)) {
>          return DO_OP(s, a, SEQ);
>      }
>      return false;
>
> seems just as clear without the extra data.
I am not quite sure which is clearer. In my opinion, setting datas is 
more easy than call different intefaces.
>> +#ifdef CONFIG_USER_ONLY
>> +#define MO_SB 0
>> +#define MO_LESW 0
>> +#define MO_LESL 0
>> +#define MO_LEQ 0
>> +#define MO_UB 0
>> +#define MO_LEUW 0
>> +#define MO_LEUL 0
>> +#endif
> What is this for?  We already define these unconditionally.
Yes. I miss a head file "exec/memop.h". When I compile in user mode,  
some make errors appear.
I will remove these codes next patch.
>
>> +static inline int vext_elem_mask(void *v0, int mlen, int index)
>> +{
>> +    int idx = (index * mlen) / 8;
>> +    int pos = (index * mlen) % 8;
>> +
>> +    return (*((uint8_t *)v0 + idx) >> pos) & 0x1;
>> +}
> This is a little-endian indexing of the mask.  Just above we talk about using a
> host-endian ordering of uint64_t.
>
> Thus this must be based on uint64_t instead of uint8_t.
>
>> +/*
>> + * This function checks watchpoint before really load operation.
>> + *
>> + * In softmmu mode, the TLB API probe_access is enough for watchpoint check.
>> + * In user mode, there is no watchpoint support now.
>> + *
>> + * It will triggle an exception if there is no mapping in TLB
>> + * and page table walk can't fill the TLB entry. Then the guest
>> + * software can return here after process the exception or never return.
>> + */
>> +static void probe_read_access(CPURISCVState *env, target_ulong addr,
>> +        target_ulong len, uintptr_t ra)
>> +{
>> +    while (len) {
>> +        const target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
>> +        const target_ulong curlen = MIN(pagelen, len);
>> +
>> +        probe_read(env, addr, curlen, cpu_mmu_index(env, false), ra);
> The return value here is non-null when we can read directly from host memory.
> It would be a shame to throw that work away.
Yes. These host addresses can be useful. I just ignore them, because it 
will have to
add some local variables to use them. And cpu_*_mmuidx_ra will just 
search tlb table by tlb_hit.
I am not quite sure if I should keep host address in an array.

Do you think it is necessary?
>
>> +/* data structure and common functions for load and store */
>> +typedef void vext_ld_elem_fn(CPURISCVState *env, target_ulong addr,
>> +        uint32_t idx, void *vd, uintptr_t retaddr);
>> +typedef void vext_st_elem_fn(CPURISCVState *env, target_ulong addr,
>> +        uint32_t idx, void *vd, uintptr_t retaddr);
>> +typedef target_ulong vext_get_index_addr(target_ulong base,
>> +        uint32_t idx, void *vs2);
>> +typedef void vext_ld_clear_elem(void *vd, uint32_t idx,
>> +        uint32_t cnt, uint32_t tot);
>> +
>> +struct vext_ldst_ctx {
>> +    struct vext_common_ctx vcc;
>> +    uint32_t nf;
>> +    target_ulong base;
>> +    target_ulong stride;
>> +    int mmuidx;
>> +
>> +    vext_ld_elem_fn *ld_elem;
>> +    vext_st_elem_fn *st_elem;
>> +    vext_get_index_addr *get_index_addr;
>> +    vext_ld_clear_elem *clear_elem;
>> +};
> I think you should pass these elements directly, as needed, rather than putting
> them all in a struct.
>
> This would allow the main helper function to be inlined, which in turn allows
> the mini helper functions to be inlined.
The structure is to reduce main helper function code size and reduce the 
number of arguments
of mini helper functions.
I once pass these elements directly before this patch. It's more 
confused as so many scatted
variables and arguments.

I'm not quite sure about the efficiency improvements. If you are sure 
about that, could you
explain more details about how to achieve it.

Best Regards,
Zhiwei

>
>
> r~


