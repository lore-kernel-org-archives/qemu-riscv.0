Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgiQE-00037F-CE
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 04:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgiQA-000353-1t; Mon, 27 Mar 2023 04:41:44 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgiQ3-0005a1-T9; Mon, 27 Mar 2023 04:41:41 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAA3PkqvViFkcfudFw--.44843S2;
 Mon, 27 Mar 2023 16:41:20 +0800 (CST)
Message-ID: <8586af63-fe3f-2c3d-c93d-88fe53eded6c@iscas.ac.cn>
Date: Mon, 27 Mar 2023 16:41:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH] riscv: Add support for the Zfa extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>
References: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3PkqvViFkcfudFw--.44843S2
X-Coremail-Antispam: 1UD129KBjvAXoWfCF43Wr1UZrW5Xry7tFWxCrg_yoWrGFy5to
 WxWrnxZrs5Gw47uF93GwsrXr42qFy09an7Jr909r4kK3WI9r42grW5Jws5Aay8Kr4fKry8
 Xa97Za1Yqwn0ywn3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYq7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 08:41:44 -0000


On 2023/3/27 16:00, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> This patch introduces the RISC-V Zfa extension, which introduces
> additional floating-point extensions:
> * fli (load-immediate) with pre-defined immediates
> * fminm/fmaxm (like fmin/fmax but with different NaN behaviour)
> * fround/froundmx (round to integer)
> * fcvtmod.w.d (Modular Convert-to-Integer)
> * fmv* to access high bits of float register bigger than XLEN
> * Quiet comparison instructions (fleq/fltq)
>
> Zfa defines its instructions in combination with the following extensions:
> * single-precision floating-point (F)
> * double-precision floating-point (D)
> * quad-precision floating-point (Q)
> * half-precision floating-point (Zfh)
>
> Since QEMU does not support the RISC-V quad-precision floating-point
> ISA extension (Q), this patch does not include the instructions that
> depend on this extension. All other instructions are included in this
> patch.
>
> The Zfa specification is not frozen at the moment (which is why this
> patch is RFC) and can be found here:
>    https://github.com/riscv/riscv-isa-manual/blob/master/src/zfa.tex
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   target/riscv/cpu.c                        |   8 +
>   target/riscv/cpu.h                        |   1 +
>   target/riscv/fpu_helper.c                 | 324 +++++++++++++++++
>   target/riscv/helper.h                     |  22 ++
>   target/riscv/insn32.decode                |  67 ++++
>   target/riscv/insn_trans/trans_rvzfa.c.inc | 410 ++++++++++++++++++++++
>   target/riscv/translate.c                  |   1 +
>   7 files changed, 833 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvzfa.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..bac9ced4a2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -83,6 +83,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>       ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
>       ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
> +    ISA_EXT_DATA_ENTRY(zfa, true, PRIV_VERSION_1_12_0, ext_zfa),
>       ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
>       ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
>       ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
> @@ -404,6 +405,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       cpu->cfg.ext_u = true;
>       cpu->cfg.ext_s = true;
>       cpu->cfg.ext_icsr = true;
> +    cpu->cfg.ext_zfa = true;
>       cpu->cfg.ext_zfh = true;
>       cpu->cfg.mmu = true;
>       cpu->cfg.ext_xtheadba = true;
> @@ -865,6 +867,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zfa && !cpu->cfg.ext_f) {
> +        error_setg(errp, "Zfa extension requires F extension");
> +        return;
> +    }
> +
>       if (cpu->cfg.ext_zfh) {
>           cpu->cfg.ext_zfhmin = true;
>       }
> @@ -1381,6 +1388,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>       DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
>       DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
> +    DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, false),
>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..deae410fc2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -462,6 +462,7 @@ struct RISCVCPUConfig {
>       bool ext_svpbmt;
>       bool ext_zdinx;
>       bool ext_zawrs;
> +    bool ext_zfa;
>       bool ext_zfh;
>       bool ext_zfhmin;
>       bool ext_zfinx;
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 449d236df6..55c75bf063 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -252,6 +252,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>                       float32_minimum_number(frs1, frs2, &env->fp_status));
>   }
>   
> +uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +
> +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> +        return float32_default_nan(&env->fp_status);
I think we should also add nanbox_s for it.
> +    }
> +
> +    return nanbox_s(env, float32_minimum_number(frs1, frs2, &env->fp_status));
> +}
> +
>   uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float32 frs1 = check_nanbox_s(env, rs1);
> @@ -261,6 +273,18 @@ uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>                       float32_maximum_number(frs1, frs2, &env->fp_status));
>   }
>   
> +uint64_t helper_fmaxm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +
> +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> +        return float32_default_nan(&env->fp_status);
> +    }
> +
> +    return nanbox_s(env, float32_maximum_number(frs1, frs2, &env->fp_status));
> +}
> +
>   uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
>   {
>       float32 frs1 = check_nanbox_s(env, rs1);
> @@ -274,6 +298,13 @@ target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>       return float32_le(frs1, frs2, &env->fp_status);
>   }
>   
> +target_ulong helper_fleq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return float32_le_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>   target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float32 frs1 = check_nanbox_s(env, rs1);
> @@ -281,6 +312,13 @@ target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>       return float32_lt(frs1, frs2, &env->fp_status);
>   }
>   
> +target_ulong helper_fltq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return float32_lt_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>   target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float32 frs1 = check_nanbox_s(env, rs1);
> @@ -338,6 +376,76 @@ target_ulong helper_fclass_s(CPURISCVState *env, uint64_t rs1)
>       return fclass_s(frs1);
>   }
>   
> +uint64_t helper_fround_s(CPURISCVState *env, uint64_t frs1)
> +{
> +    if (float32_is_zero(frs1) ||
> +        float32_is_infinity(frs1)) {
> +        return frs1;
> +    }
> +
> +    if (float32_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NV);
> +        return frs1;
> +    }
> +
> +    int32_t tmp = float32_to_int32(frs1, &env->fp_status);
> +    return nanbox_s(env, int32_to_float32(tmp, &env->fp_status));
It seems that we can  use float32_round_to_int() for fround{nx} 
instructions.
> +}
> +
> +uint64_t helper_froundnx_s(CPURISCVState *env, uint64_t frs1)
> +{
> +    uint64_t ret = helper_fround_s(env, frs1);
> +
> +    if (ret != frs1 && !float32_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NX);
> +    }
> +
> +    return ret;
> +}
> +
> +uint64_t helper_fli_s(CPURISCVState *env, uint32_t rs1)
> +{
> +    const uint32_t fli_s_table[] = {
> +        0xbf800000,  /* -1.0 */
> +        0x00800000,  /* minimum positive normal */
> +        0x37800000,  /* 1.0 * 2^-16 */
> +        0x38000000,  /* 1.0 * 2^-15 */
> +        0x3b800000,  /* 1.0 * 2^-8  */
> +        0x3c000000,  /* 1.0 * 2^-7  */
> +        0x3d800000,  /* 1.0 * 2^-4  */
> +        0x3e000000,  /* 1.0 * 2^-3  */
> +        0x3e800000,  /* 0.25 */
> +        0x3ea00000,  /* 0.3125 */
> +        0x3ec00000,  /* 0.375 */
> +        0x3ee00000,  /* 0.4375 */
> +        0x3f000000,  /* 0.5 */
> +        0x3f200000,  /* 0.625 */
> +        0x3f400000,  /* 0.75 */
> +        0x3f600000,  /* 0.875 */
> +        0x3f800000,  /* 1.0 */
> +        0x3fa00000,  /* 1.25 */
> +        0x3fc00000,  /* 1.5 */
> +        0x3fe00000,  /* 1.75 */
> +        0x40000000,  /* 2.0 */
> +        0x40200000,  /* 2.5 */
> +        0x40400000,  /* 3 */
> +        0x40800000,  /* 4 */
> +        0x41000000,  /* 8 */
> +        0x41800000,  /* 16 */
> +        0x43000000,  /* 2^7 */
> +        0x43800000,  /* 2^8 */
> +        0x47000000,  /* 2^15 */
> +        0x47800000,  /* 2^16 */
> +        0x7f800000,  /* +inf */
> +        float32_default_nan(&env->fp_status),
> +    };
> +
> +    if (rs1 >= 32)
> +        g_assert_not_reached();
> +
> +    return fli_s_table[rs1];
> +}
> +
we can just add support for this in trans_*
>   uint64_t helper_fadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>   {
>       return float64_add(frs1, frs2, &env->fp_status);
> @@ -365,6 +473,15 @@ uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>               float64_minimum_number(frs1, frs2, &env->fp_status);
>   }
>   
> +uint64_t helper_fminm_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +{
> +    if (float64_is_any_nan(frs1) || float64_is_any_nan(frs2)) {
> +        return float64_default_nan(&env->fp_status);
> +    }
> +
> +    return float64_minimum_number(frs1, frs2, &env->fp_status);
> +}
> +
>   uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>   {
>       return env->priv_ver < PRIV_VERSION_1_11_0 ?
> @@ -372,6 +489,15 @@ uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>               float64_maximum_number(frs1, frs2, &env->fp_status);
>   }
>   
> +uint64_t helper_fmaxm_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +{
> +    if (float64_is_any_nan(frs1) || float64_is_any_nan(frs2)) {
> +        return float64_default_nan(&env->fp_status);
> +    }
> +
> +    return float64_maximum_number(frs1, frs2, &env->fp_status);
> +}
> +
>   uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
>   {
>       return nanbox_s(env, float64_to_float32(rs1, &env->fp_status));
> @@ -393,11 +519,21 @@ target_ulong helper_fle_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>       return float64_le(frs1, frs2, &env->fp_status);
>   }
>   
> +target_ulong helper_fleq_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +{
> +    return float64_le_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>   target_ulong helper_flt_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>   {
>       return float64_lt(frs1, frs2, &env->fp_status);
>   }
>   
> +target_ulong helper_fltq_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +{
> +    return float64_lt_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>   target_ulong helper_feq_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>   {
>       return float64_eq_quiet(frs1, frs2, &env->fp_status);
> @@ -408,6 +544,16 @@ target_ulong helper_fcvt_w_d(CPURISCVState *env, uint64_t frs1)
>       return float64_to_int32(frs1, &env->fp_status);
>   }
>   
> +target_ulong helper_fcvtmod_w_d(CPURISCVState *env, uint64_t frs1)
> +{
> +    if (float64_is_any_nan(frs1) ||
> +        float64_is_infinity(frs1)) {
> +        return 0;
> +    }
> +
> +    return float64_to_int32(frs1, &env->fp_status);
> +}

This doesn't take the mod function into consideration , especially when 
float value > MAX_INT32

Regards,

Weiwei Li

> +
>   target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
>   {
>       return (int32_t)float64_to_uint32(frs1, &env->fp_status);
> @@ -448,6 +594,76 @@ target_ulong helper_fclass_d(uint64_t frs1)
>       return fclass_d(frs1);
>   }
>   
> +uint64_t helper_fround_d(CPURISCVState *env, uint64_t frs1)
> +{
> +    if (float64_is_zero(frs1) ||
> +        float64_is_infinity(frs1)) {
> +        return frs1;
> +    }
> +
> +    if (float64_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NV);
> +        return frs1;
> +    }
> +
> +    int64_t tmp = float64_to_int64(frs1, &env->fp_status);
> +    return nanbox_s(env, int64_to_float64(tmp, &env->fp_status));
> +}
> +
> +uint64_t helper_froundnx_d(CPURISCVState *env, uint64_t frs1)
> +{
> +    uint64_t ret = helper_fround_s(env, frs1);
> +
> +    if (ret != frs1 && !float64_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NX);
> +    }
> +
> +    return ret;
> +}
> +
> +uint64_t helper_fli_d(CPURISCVState *env, uint32_t rs1)
> +{
> +    const uint64_t fli_d_table[] = {
> +        0xbff0000000000000,  /* -1.0 */
> +        0x0010000000000000,  /* minimum positive normal */
> +        0x3Ef0000000000000,  /* 1.0 * 2^-16 */
> +        0x3f00000000000000,  /* 1.0 * 2^-15 */
> +        0x3f70000000000000,  /* 1.0 * 2^-8  */
> +        0x3f80000000000000,  /* 1.0 * 2^-7  */
> +        0x3fb0000000000000,  /* 1.0 * 2^-4  */
> +        0x3fc0000000000000,  /* 1.0 * 2^-3  */
> +        0x3fd0000000000000,  /* 0.25 */
> +        0x3fd4000000000000,  /* 0.3125 */
> +        0x3fd8000000000000,  /* 0.375 */
> +        0x3fdc000000000000,  /* 0.4375 */
> +        0x3fe0000000000000,  /* 0.5 */
> +        0x3fe4000000000000,  /* 0.625 */
> +        0x3fe8000000000000,  /* 0.75 */
> +        0x3fec000000000000,  /* 0.875 */
> +        0x3ff0000000000000,  /* 1.0 */
> +        0x3ff4000000000000,  /* 1.25 */
> +        0x3ff8000000000000,  /* 1.5 */
> +        0x3ffc000000000000,  /* 1.75 */
> +        0x4000000000000000,  /* 2.0 */
> +        0x4004000000000000,  /* 2.5 */
> +        0x4008000000000000,  /* 3 */
> +        0x4010000000000000,  /* 4 */
> +        0x4020000000000000,  /* 8 */
> +        0x4030000000000000,  /* 16 */
> +        0x4060000000000000,  /* 2^7 */
> +        0x4070000000000000,  /* 2^8 */
> +        0x40e0000000000000,  /* 2^15 */
> +        0x40f0000000000000,  /* 2^16 */
> +        0x7ff0000000000000,  /* +inf */
> +        float64_default_nan(&env->fp_status),
> +    };
> +
> +    if (rs1 >= 32)
> +        g_assert_not_reached();
> +
> +    return fli_d_table[rs1];
> +}
> +
>   uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float16 frs1 = check_nanbox_h(env, rs1);
> @@ -485,6 +701,18 @@ uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>                       float16_minimum_number(frs1, frs2, &env->fp_status));
>   }
>   
> +uint64_t helper_fminm_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_s(env, rs1);
> +    float16 frs2 = check_nanbox_s(env, rs2);
> +
> +    if (float16_is_any_nan(frs1) || float16_is_any_nan(frs2)) {
> +        return float16_default_nan(&env->fp_status);
> +    }
> +
> +    return nanbox_s(env, float16_minimum_number(frs1, frs2, &env->fp_status));
> +}
> +
>   uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float16 frs1 = check_nanbox_h(env, rs1);
> @@ -494,6 +722,18 @@ uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>                       float16_maximum_number(frs1, frs2, &env->fp_status));
>   }
>   
> +uint64_t helper_fmaxm_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_s(env, rs1);
> +    float16 frs2 = check_nanbox_s(env, rs2);
> +
> +    if (float16_is_any_nan(frs1) || float16_is_any_nan(frs2)) {
> +        return float16_default_nan(&env->fp_status);
> +    }
> +
> +    return nanbox_s(env, float16_maximum_number(frs1, frs2, &env->fp_status));
> +}
> +
>   uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
>   {
>       float16 frs1 = check_nanbox_h(env, rs1);
> @@ -507,6 +747,13 @@ target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>       return float16_le(frs1, frs2, &env->fp_status);
>   }
>   
> +target_ulong helper_fleq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(env, rs1);
> +    float16 frs2 = check_nanbox_h(env, rs2);
> +    return float16_le_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>   target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float16 frs1 = check_nanbox_h(env, rs1);
> @@ -514,6 +761,13 @@ target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>       return float16_lt(frs1, frs2, &env->fp_status);
>   }
>   
> +target_ulong helper_fltq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(env, rs1);
> +    float16 frs2 = check_nanbox_h(env, rs2);
> +    return float16_lt_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>   target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float16 frs1 = check_nanbox_h(env, rs1);
> @@ -527,6 +781,76 @@ target_ulong helper_fclass_h(CPURISCVState *env, uint64_t rs1)
>       return fclass_h(frs1);
>   }
>   
> +uint64_t helper_fround_h(CPURISCVState *env, uint64_t frs1)
> +{
> +    if (float16_is_zero(frs1) ||
> +        float16_is_infinity(frs1)) {
> +        return frs1;
> +    }
> +
> +    if (float16_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NV);
> +        return frs1;
> +    }
> +
> +    int32_t tmp = float16_to_int32(frs1, &env->fp_status);
> +    return nanbox_s(env, int32_to_float16(tmp, &env->fp_status));
> +}
> +
> +uint64_t helper_froundnx_h(CPURISCVState *env, uint64_t frs1)
> +{
> +    uint64_t ret = helper_fround_s(env, frs1);
> +
> +    if (ret != frs1 && !float16_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NX);
> +    }
> +
> +    return ret;
> +}
> +
> +uint64_t helper_fli_h(CPURISCVState *env, uint32_t rs1)
> +{
> +    const uint16_t fli_h_table[] = {
> +        0xbc00,  /* -1.0 */
> +        0x0400,  /* minimum positive normal */
> +        0x0100,  /* 1.0 * 2^-16 */
> +        0x0200,  /* 1.0 * 2^-15 */
> +        0x1c00,  /* 1.0 * 2^-8  */
> +        0x2000,  /* 1.0 * 2^-7  */
> +        0x2c00,  /* 1.0 * 2^-4  */
> +        0x3000,  /* 1.0 * 2^-3  */
> +        0x3400,  /* 0.25 */
> +        0x3500,  /* 0.3125 */
> +        0x3600,  /* 0.375 */
> +        0x3700,  /* 0.4375 */
> +        0x3800,  /* 0.5 */
> +        0x3900,  /* 0.625 */
> +        0x3a00,  /* 0.75 */
> +        0x3b00,  /* 0.875 */
> +        0x3c00,  /* 1.0 */
> +        0x3d00,  /* 1.25 */
> +        0x3e00,  /* 1.5 */
> +        0x3f00,  /* 1.75 */
> +        0x4000,  /* 2.0 */
> +        0x4100,  /* 2.5 */
> +        0x4200,  /* 3 */
> +        0x4400,  /* 4 */
> +        0x4800,  /* 8 */
> +        0x4c00,  /* 16 */
> +        0x5800,  /* 2^7 */
> +        0x5c00,  /* 2^8 */
> +        0x7800,  /* 2^15 */
> +        0x7c00,  /* 2^16 */
> +        0x7c00,  /* +inf */
> +        float16_default_nan(&env->fp_status),
> +    };
> +
> +    if (rs1 >= 32)
> +        g_assert_not_reached();
> +
> +    return fli_h_table[rs1];
> +}
> +
>   target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
>   {
>       float16 frs1 = check_nanbox_h(env, rs1);
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 37b54e0991..0106c197ec 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -25,10 +25,14 @@ DEF_HELPER_FLAGS_3(fsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmul_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fdiv_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmin_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fminm_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmax_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fmaxm_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_2(fsqrt_s, TCG_CALL_NO_RWG, i64, env, i64)
>   DEF_HELPER_FLAGS_3(fle_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fleq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_3(flt_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fltq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_3(feq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_2(fcvt_w_s, TCG_CALL_NO_RWG, tl, env, i64)
>   DEF_HELPER_FLAGS_2(fcvt_wu_s, TCG_CALL_NO_RWG, tl, env, i64)
> @@ -39,6 +43,9 @@ DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fround_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
> +DEF_HELPER_FLAGS_2(froundnx_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fli_s, TCG_CALL_NO_RWG_SE, i64, env, i32)
>   
>   /* Floating Point - Double Precision */
>   DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> @@ -46,14 +53,19 @@ DEF_HELPER_FLAGS_3(fsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmul_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fdiv_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmin_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fminm_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmax_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fmaxm_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_2(fcvt_s_d, TCG_CALL_NO_RWG, i64, env, i64)
>   DEF_HELPER_FLAGS_2(fcvt_d_s, TCG_CALL_NO_RWG, i64, env, i64)
>   DEF_HELPER_FLAGS_2(fsqrt_d, TCG_CALL_NO_RWG, i64, env, i64)
>   DEF_HELPER_FLAGS_3(fle_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fleq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_3(flt_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fltq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_3(feq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_2(fcvt_w_d, TCG_CALL_NO_RWG, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fcvtmod_w_d, TCG_CALL_NO_RWG, tl, env, i64)
>   DEF_HELPER_FLAGS_2(fcvt_wu_d, TCG_CALL_NO_RWG, tl, env, i64)
>   DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, tl, env, i64)
>   DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, tl, env, i64)
> @@ -62,6 +74,9 @@ DEF_HELPER_FLAGS_2(fcvt_d_wu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
> +DEF_HELPER_FLAGS_2(fround_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
> +DEF_HELPER_FLAGS_2(froundnx_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fli_d, TCG_CALL_NO_RWG_SE, i64, env, i32)
>   
>   /* Bitmanip */
>   DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> @@ -78,10 +93,14 @@ DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fminm_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fmaxm_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>   DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
>   DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fleq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fltq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
>   DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
>   DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
> @@ -96,6 +115,9 @@ DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fround_h, TCG_CALL_NO_RWG_SE, i64, env, i64)
> +DEF_HELPER_FLAGS_2(froundnx_h, TCG_CALL_NO_RWG_SE, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fli_h, TCG_CALL_NO_RWG_SE, i64, env, i32)
>   
>   /* Cache-block operations */
>   DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 73d5d1b045..0c216db3c2 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -821,6 +821,73 @@ binvi      01101. ........... 001 ..... 0010011 @sh
>   bset       0010100 .......... 001 ..... 0110011 @r
>   bseti      00101. ........... 001 ..... 0010011 @sh
>   
> +# *** Zfa Standard Extension ***
> +# fli.s ft1,0 = f01000d3
> +fli_s       1111000 00001 ..... 000 ..... 1010011 @r2
> +# fli.d ft1,0 = f21000d3
> +fli_d       1111001 00001 ..... 000 ..... 1010011 @r2
> +# fli.h ft1,0 = f41000d3
> +fli_h       1111010 00001 ..... 000 ..... 1010011 @r2
> +
> +# Inspiration fmin_s, fmin_d, fmax_s, fmax_d
> +# fminm.s ft1, ft2, ft3 = 283120d3
> +fminm_s     0010100 ..... ..... 010 ..... 1010011 @r
> +# fmaxm.s ft1, ft2, ft3 = 283130d3
> +fmaxm_s     0010100 ..... ..... 011 ..... 1010011 @r
> +# fminm.d ft1, ft2, ft3 = 2a3120d3
> +fminm_d     0010101 ..... ..... 010 ..... 1010011 @r
> +# fmaxm.d ft1, ft2, ft3 = 2a3130d3
> +fmaxm_d     0010101 ..... ..... 011 ..... 1010011 @r
> +# fminm.h ft1, ft2, ft3 = 2c3120d3
> +fminm_h     0010110 ..... ..... 010 ..... 1010011 @r
> +# fmaxm.h ft1, ft2, ft3 = 2c3130d3
> +fmaxm_h     0010110 ..... ..... 011 ..... 1010011 @r
> +
> +# fround.s fa0,fa1 = 4045f553
> +# fround.s fa0,fa1,rtz = 40459553
> +fround_s    0100000 00100 ..... ... ..... 1010011 @r2_rm
> +# froundnx.s fa0,fa1 = 4055f553
> +# froundnx.s fa0,fa1,rtz = 40559553
> +froundnx_s  0100000 00101 ..... ... ..... 1010011 @r2_rm
> +# fround.d fa0,fa1 = 4245f553
> +# fround.d fa0,fa1,rtz = 42459553
> +fround_d    0100001 00100 ..... ... ..... 1010011 @r2_rm
> +# froundnx.d fa0,fa1 = 4255f553
> +# froundnx.d fa0,fa1,rtz = 42559553
> +froundnx_d  0100001 00101 ..... ... ..... 1010011 @r2_rm
> +# fround.h fa0,fa1 = 4245f553
> +# fround.h fa0,fa1,rtz = 42459553
> +#[       ]+[0-9a-f]+:[   ]+4445f553[     ]+fround\.h[            ]+fa0,fa1
> +#[       ]+[0-9a-f]+:[   ]+44459553[     ]+fround\.h[            ]+fa0,fa1,rtz
> +fround_h    0100010 00100 ..... ... ..... 1010011 @r2_rm
> +# froundnx.h fa0,fa1 = 4255f553
> +# froundnx.h fa0,fa1,rtz = 42559553
> +#[       ]+[0-9a-f]+:[   ]+4455f553[     ]+froundnx\.h[          ]+fa0,fa1
> +#[       ]+[0-9a-f]+:[   ]+44559553[     ]+froundnx\.h[          ]+fa0,fa1,rtz
> +froundnx_h  0100010 00101 ..... ... ..... 1010011 @r2_rm
> +
> +# fcvtmod.w.d a0,ft1,rtz = c2809553
> +fcvtmod_w_d 1100001 01000 ..... 001 ..... 1010011 @r2
> +
> +# Inspiration: th.fmv, fmv.x.w, fmvp.d.x
> +# fmvh.x.d a0,ft1 = e2108553
> +fmvh_x_d    1110001 00001 ..... 000 ..... 1010011 @r2
> +# fmvp.d.x ft1,a0,a1 = b2b500d3
> +fmvp_d_x    1011001 ..... ..... 000 ..... 1010011 @r
> +
> +#[       ]+[0-9a-f]+:[   ]+a020c553[     ]+fleq\.s[              ]+a0,ft1,ft2
> +fleq_s      1010000 ..... ..... 100 ..... 1010011 @r
> +#[       ]+[0-9a-f]+:[   ]+a020d553[     ]+fltq\.s[              ]+a0,ft1,ft2
> +fltq_s      1010000 ..... ..... 101 ..... 1010011 @r
> +#[       ]+[0-9a-f]+:[   ]+a220c553[     ]+fleq\.d[              ]+a0,ft1,ft2
> +fleq_d      1010001 ..... ..... 100 ..... 1010011 @r
> +#[       ]+[0-9a-f]+:[   ]+a220d553[     ]+fltq\.d[              ]+a0,ft1,ft2
> +fltq_d      1010001 ..... ..... 101 ..... 1010011 @r
> +#[       ]+[0-9a-f]+:[   ]+a420c553[     ]+fleq\.h[              ]+a0,ft1,ft2
> +fleq_h      1010010 ..... ..... 100 ..... 1010011 @r
> +#[       ]+[0-9a-f]+:[   ]+a420d553[     ]+fltq\.h[              ]+a0,ft1,ft2
> +fltq_h      1010010 ..... ..... 101 ..... 1010011 @r
> +
>   # *** RV32 Zfh Extension ***
>   flh        ............   ..... 001 ..... 0000111 @i
>   fsh        .......  ..... ..... 001 ..... 0100111 @s
> diff --git a/target/riscv/insn_trans/trans_rvzfa.c.inc b/target/riscv/insn_trans/trans_rvzfa.c.inc
> new file mode 100644
> index 0000000000..c07977b20e
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzfa.c.inc
> @@ -0,0 +1,410 @@
> +/*
> + * RISC-V translation routines for the Zfa Standard Extension.
> + *
> + * Copyright (c) 2023 Christoph Müllner, christoph.muellner@vrull.eu
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZFA(ctx) do {     \
> +    if (!ctx->cfg_ptr->ext_zfa) { \
> +        return false;             \
> +    }                             \
> +} while (0)
> +
> +#define REQUIRE_ZFH(ctx) do {     \
> +    if (!ctx->cfg_ptr->ext_zfh) { \
> +        return false;             \
> +    }                             \
> +} while (0)
> +
> +
> +static bool trans_fli_s(DisasContext *ctx, arg_fli_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    gen_helper_fli_s(dest, cpu_env, tcg_constant_i32(a->rs1));
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fli_d(DisasContext *ctx, arg_fli_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    gen_helper_fli_d(dest, cpu_env, tcg_constant_i32(a->rs1));
> +    gen_set_fpr_d(ctx, a->rd, dest);
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fli_h(DisasContext *ctx, arg_fli_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    gen_helper_fli_h(dest, cpu_env, tcg_constant_i32(a->rs1));
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fminm_s(DisasContext *ctx, arg_fminm_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fminm_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmaxm_s(DisasContext *ctx, arg_fmaxm_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fmaxm_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fminm_d(DisasContext *ctx, arg_fminm_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +
> +    gen_helper_fminm_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmaxm_d(DisasContext *ctx, arg_fmaxm_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +
> +    gen_helper_fmaxm_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fminm_h(DisasContext *ctx, arg_fminm_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fminm_h(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmaxm_h(DisasContext *ctx, arg_fmaxm_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fmaxm_h(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fround_s(DisasContext *ctx, arg_fround_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fround_s(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_froundnx_s(DisasContext *ctx, arg_froundnx_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_froundnx_s(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fround_d(DisasContext *ctx, arg_fround_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fround_d(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_froundnx_d(DisasContext *ctx, arg_froundnx_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_froundnx_d(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fround_h(DisasContext *ctx, arg_fround_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fround_h(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_froundnx_h(DisasContext *ctx, arg_froundnx_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_froundnx_h(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fcvtmod_w_d(DisasContext *ctx, arg_fcvtmod_w_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +
> +    /* Rounding mode is RTZ. */
> +    gen_set_rm(ctx, RISCV_FRM_RTZ);
> +    gen_helper_fcvtmod_w_d(dest, cpu_env, src1);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +bool trans_fmvh_x_d(DisasContext *ctx, arg_fmvh_x_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv dst = dest_gpr(ctx, a->rd);
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +
> +    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
> +    tcg_gen_trunc_i64_tl(dst, t1);
> +    gen_set_gpr(ctx, a->rd, dst);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fmvp_d_x(DisasContext *ctx, arg_fmvp_d_x *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +
> +    tcg_gen_extu_tl_i64(t1, src1);
> +    tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fleq_s(DisasContext *ctx, arg_fleq_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fleq_s(dest, cpu_env, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fltq_s(DisasContext *ctx, arg_fltq_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fleq_d(DisasContext *ctx, arg_fleq_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fltq_d(DisasContext *ctx, arg_fltq_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +bool trans_fleq_h(DisasContext *ctx, arg_fleq_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fleq_h(dest, cpu_env, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +bool trans_fltq_h(DisasContext *ctx, arg_fltq_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +    gen_helper_fltq_h(dest, cpu_env, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..0e61e31d9f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1081,6 +1081,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   #include "insn_trans/trans_rvzicond.c.inc"
>   #include "insn_trans/trans_rvzawrs.c.inc"
>   #include "insn_trans/trans_rvzicbo.c.inc"
> +#include "insn_trans/trans_rvzfa.c.inc"
>   #include "insn_trans/trans_rvzfh.c.inc"
>   #include "insn_trans/trans_rvk.c.inc"
>   #include "insn_trans/trans_privileged.c.inc"


