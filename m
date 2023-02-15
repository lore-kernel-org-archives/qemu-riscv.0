Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSQ1m-0006jh-2v
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 17:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSQ1k-0006gG-AL
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 17:13:24 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSQ1g-0006p9-Om
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 17:13:24 -0500
Received: by mail-pg1-x544.google.com with SMTP id c29so64243pgm.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 14:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BilwY7Tlx4YkoBsA420NkRDl6OmmyFWfKk90bN4tXEw=;
 b=KvtUJ9nbumArvX9O6FEavMTDPGZuW/AOZAOa/IKpyJ6vk4MdkWrxDdnkn6tZQm95v4
 hZDa5/X8+l6NvCvbUwFwSkK2wxR9mDIX95a6BFuJquYsmYF/Od7NffLrOpy5iHOjWyHW
 8o4R1w268m8cy6VYrCq/KOrN8jPb6nBmfJyDn8S2qwJeid7Oo6VZZYeWT8ItAdbUwQZx
 0mPsH2ZgzufcJvxQ2XaH82VhwCHcUvb3SBOS0SbsQa6drfoVIE89Mu08DG7ma87BeHz6
 Bt2BMjH9c4DG9her6JLm+AzuKKt3WTWQxcmH0QSASXt8rmLNXiMwlv3v1VnkJ/ACO7is
 qp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BilwY7Tlx4YkoBsA420NkRDl6OmmyFWfKk90bN4tXEw=;
 b=uS2Qft4GaZSd0USXxcOEXUocuh22CY5gEazpZBEPtPsSYfO2o+qMD6owFOyJBXdDdM
 zVYhlMffOV94u4+9H5IQOufRuQCbtgdZOs7aIiAy6Y7TB7NeXNQWanDYPmdcROFHmDjj
 zyT17NiunCDwTvY26pZhPCWa4NAStHNIovEWFoZw49bWiY8G/7mclKgQN4tCOt1SZVl4
 Z3dQMfurBzV1fpmVg8Xlf2OF67oGNAJxEDrtCybdJtV4UPYdubXEs0XleJYam6zTkVFP
 wwiQSXUVuEGaowZVxoBKZB8bw7mQ3fO27oFil9sb6nfJVz4/ia2oKnmSnWCHGqWf1WpA
 eRyg==
X-Gm-Message-State: AO0yUKXx54QvRqhulxj+E1gSqazRneWZJN57GS9bMR3dEKZLu76oUOZp
 Ddpf/eDRTxMNnUGIo1mpH/GNFg==
X-Google-Smtp-Source: AK7set8S/3qVBrRyfFWRRZ+kdQYBfH5RuOlBytGpWpPGCmTinlMte+2T4c1C/qFg6zc69Jnz0g7Mpw==
X-Received: by 2002:a62:8413:0:b0:5a8:a8b5:d185 with SMTP id
 k19-20020a628413000000b005a8a8b5d185mr2988974pfd.1.1676499198914; 
 Wed, 15 Feb 2023 14:13:18 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 t8-20020aa79388000000b005a817973a81sm2385630pfe.43.2023.02.15.14.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 14:13:18 -0800 (PST)
Message-ID: <80575b72-65f7-e5ea-c6e1-558efbe4052a@linaro.org>
Date: Wed, 15 Feb 2023 12:13:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 3/4] target/riscv: implement Zicbom extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
 <20230215205911.695745-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215205911.695745-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 22:13:24 -0000

On 2/15/23 10:59, Daniel Henrique Barboza wrote:
> From: Christoph Muellner <cmuellner@linux.com>
> 
> Zicbom is the Cache-Block Management extension defined in the already
> ratified RISC-V Base Cache Management Operation (CBO) ISA extension [1].
> 
> The extension contains three instructions: cbo.clean, cbo.flush and
> cbo.inval. All of them must be implemented in the same group as LQ and
> cbo.zero due to overlapping patterns.
> 
> All these instructions can throw a Illegal Instruction/Virtual
> Instruction exception, similar to the existing cbo.zero. The same
> check_zicbo_envcfg() is used to handle these exceptions.
> 
> Aside from that, these instructions also need to handle page faults and
> guest page faults. This is done in a new check_zicbom_access() helper.
> 
> As with Zicboz, the cache block size for Zicbom is also configurable.
> Note that the spec determines that Zicbo[mp] and Zicboz can have
> different cache sizes (Section 2.7 of [1]), so we also include a
> 'cbom_blocksize' to go along with the existing 'cboz_blocksize'. They
> are set to the same size, so unless users want to play around with the
> settings both sizes will be the same.
> 
> [1] https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf
> 
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c                          |   3 +
>   target/riscv/cpu.h                          |   2 +
>   target/riscv/helper.h                       |   2 +
>   target/riscv/insn32.decode                  |   5 +
>   target/riscv/insn_trans/trans_rvzicbo.c.inc |  27 +++++
>   target/riscv/op_helper.c                    | 107 ++++++++++++++++++++
>   6 files changed, 146 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7dd37de7f9..4b779b1775 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -74,6 +74,7 @@ struct isa_ext_data {
>   static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>       ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
>       ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
>       ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>       ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
> @@ -1127,6 +1128,8 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
>       DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>   
> +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
>       DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
>       DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6b4c714d3a..a0673b4604 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -447,6 +447,7 @@ struct RISCVCPUConfig {
>       bool ext_zkt;
>       bool ext_ifencei;
>       bool ext_icsr;
> +    bool ext_icbom;
>       bool ext_icboz;
>       bool ext_zihintpause;
>       bool ext_smstateen;
> @@ -495,6 +496,7 @@ struct RISCVCPUConfig {
>       char *vext_spec;
>       uint16_t vlen;
>       uint16_t elen;
> +    uint16_t cbom_blocksize;
>       uint16_t cboz_blocksize;
>       bool mmu;
>       bool pmp;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index ce165821b8..37b54e0991 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -98,6 +98,8 @@ DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
>   
>   /* Cache-block operations */
> +DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> +DEF_HELPER_2(cbo_inval, void, env, tl)
>   DEF_HELPER_2(cbo_zero, void, env, tl)
>   
>   /* Special functions */
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3985bc703f..3788f86528 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -181,6 +181,11 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>   ldu      ............   ..... 111 ..... 0000011 @i
>   {
>     [
> +    # *** RV32 Zicbom Standard Extension ***
> +    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
> +    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
> +    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
> +
>       # *** RV32 Zicboz Standard Extension ***
>       cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
>     ]
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> index feabc28342..7df9c30b58 100644
> --- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -16,12 +16,39 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#define REQUIRE_ZICBOM(ctx) do {    \
> +    if (!ctx->cfg_ptr->ext_icbom) { \
> +        return false;               \
> +    }                               \
> +} while (0)
> +
>   #define REQUIRE_ZICBOZ(ctx) do {    \
>       if (!ctx->cfg_ptr->ext_icboz) { \
>           return false;               \
>       }                               \
>   } while (0)
>   
> +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
>   static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
>   {
>       REQUIRE_ZICBOZ(ctx);
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 154007af80..573cca4cd3 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -176,6 +176,113 @@ void helper_cbo_zero(CPURISCVState *env, target_ulong address)
>       memset(mem, 0, cbozlen);
>   }
>   
> +/*
> + * check_zicbom_access
> + *
> + * Check access permissions (LOAD, STORE or FETCH as specified in
> + * section 2.5.2 of the CMO specification) for Zicbom, raising
> + * either store page-fault (non-virtualized) or store guest-page
> + * fault (virtualized).
> + */
> +static void check_zicbom_access(CPURISCVState *env,
> +                                target_ulong address,
> +                                uintptr_t ra)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    int mmu_idx = cpu_mmu_index(env, false);
> +    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
> +    void *phost;
> +    int ret;
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbomlen - 1);
> +
> +    /*
> +     * Section 2.5.2 of cmobase v1.0.1:
> +     *
> +     * "A cache-block management instruction is permitted to
> +     * access the specified cache block whenever a load instruction
> +     * or store instruction is permitted to access the corresponding
> +     * physical addresses. If neither a load instruction nor store
> +     * instruction is permitted to access the physical addresses,
> +     * but an instruction fetch is permitted to access the physical
> +     * addresses, whether a cache-block management instruction is
> +     * permitted to access the cache block is UNSPECIFIED.
> +     *
> +     * This means we have to make a choice of whether checking
> +     * MMU_INST_FETCH is worth it or not. We'll go the easier
> +     * route and check MMU_DATA_LOAD and MMU_DATA_STORE only.
> +     */
> +    ret = probe_access_range_flags(env, address, cbomlen,
> +                                   MMU_DATA_LOAD,
> +                                   mmu_idx, true, &phost, ra);
> +
> +    if (ret == TLB_INVALID_MASK) {
> +        probe_access_range_flags(env, address, cbomlen,
> +                                 MMU_DATA_STORE,
> +                                 mmu_idx, true, &phost, ra);

Not assigning to ret.

That said, it seems like all this is too complicated.

The paragraph you quote above says that either LOAD or STORE are required (not both), but 
UNSPECIFIED if only execute.

Thus

     ret = probe_access_flags(env, address, MMU_DATA_LOAD, mmu_idx, true, &phost, ra);
     if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
     }

     /*
      * Since not readable, must be writable.
      * On failure, store-amo fault will be raised by riscv_cpu_tlb_fill.
      */
     probe_write(env, address, cbomlen, mmu_idx, ra);


seems like it would be sufficient.
At which point the new probe_acccess_range_flags is not needed.


r~

