Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVNPa-0007TX-95
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 21:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVNPY-0007Nr-5v; Thu, 23 Feb 2023 21:02:12 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVNPU-0006kn-Kn; Thu, 23 Feb 2023 21:02:11 -0500
Received: from [192.168.0.120] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADn7vKUGvhjyK38Bw--.36989S2;
 Fri, 24 Feb 2023 10:01:57 +0800 (CST)
Message-ID: <1adcc557-31bb-29bb-377a-ab8a9fc21da4@iscas.ac.cn>
Date: Fri, 24 Feb 2023 10:01:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 3/4] target/riscv: implement Zicbom extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-4-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230223234427.521114-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADn7vKUGvhjyK38Bw--.36989S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFyDZFy5ZF43uryfAFW5ZFb_yoWfGr48pF
 WxWay3GFWkXryxZw4xtF1UJF1rKws3ua1UK3s3JwnYyay3Jr4xJF1DK3y2kF4UJFWkur1j
 9F4Yvry2y3yUXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
 McIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4I
 kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
 WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
 0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
 JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
 IYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 02:02:12 -0000


On 2023/2/24 07:44, Daniel Henrique Barboza wrote:
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

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

> ---
>   target/riscv/cpu.c                          |  3 +
>   target/riscv/cpu.h                          |  2 +
>   target/riscv/helper.h                       |  2 +
>   target/riscv/insn32.decode                  |  5 ++
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 27 +++++++++
>   target/riscv/op_helper.c                    | 67 +++++++++++++++++++++
>   6 files changed, 106 insertions(+)
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
> index 72a8ca31fc..5e0f0b622d 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -188,6 +188,73 @@ void helper_cbo_zero(CPURISCVState *env, target_ulong address)
>       }
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
> +     * permitted to access the cache block is UNSPECIFIED."
> +     */
> +    ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
> +                             mmu_idx, true, &phost, ra);
> +    if (ret != TLB_INVALID_MASK) {
> +        /* Success: readable */
> +        return;
> +    }
> +
> +    /*
> +     * Since not readable, must be writable. On failure, store
> +     * fault/store guest amo fault will be raised by
> +     * riscv_cpu_tlb_fill(). PMP exceptions will be caught
> +     * there as well.
> +     */
> +    probe_write(env, address, cbomlen, mmu_idx, ra);
> +}
> +
> +void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)
> +{
> +    uintptr_t ra = GETPC();
> +    check_zicbo_envcfg(env, MENVCFG_CBCFE, ra);
> +    check_zicbom_access(env, address, ra);
> +
> +    /* We don't emulate the cache-hierarchy, so we're done. */
> +}
> +
> +void helper_cbo_inval(CPURISCVState *env, target_ulong address)
> +{
> +    uintptr_t ra = GETPC();
> +    check_zicbo_envcfg(env, MENVCFG_CBIE, ra);
> +    check_zicbom_access(env, address, ra);
> +
> +    /* We don't emulate the cache-hierarchy, so we're done. */
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   
>   target_ulong helper_sret(CPURISCVState *env)


