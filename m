Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXfxv-00063v-1R
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 05:10:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXfxo-00060q-A8; Fri, 25 Mar 2022 05:10:32 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:55516 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXfxl-0001uE-0s; Fri, 25 Mar 2022 05:10:31 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowABnbPj7hj1i9thtBQ--.21270S2;
 Fri, 25 Mar 2022 17:10:19 +0800 (CST)
Subject: Re: [PATCH qemu v4 04/14] target/riscv: rvv: Add tail agnostic for vv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164814860220.28290.11643334198417094464-4@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <a223aa9d-dc2e-ef67-e611-fc2c6b015fa2@iscas.ac.cn>
Date: Fri, 25 Mar 2022 17:10:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164814860220.28290.11643334198417094464-4@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowABnbPj7hj1i9thtBQ--.21270S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW5Cr4fZF48trWkArykGrg_yoWxAw13pw
 48KFW3KrZxtFWxuw1ftF4UJr1rZrs8Cw4Ykw1kCw1kJrs8JrWDWF1DKF12kF17JFW8ur1j
 k3Wjvry5C39YqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUp6w
 ZUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 25 Mar 2022 09:10:32 -0000


在 2022/3/1 下午5:07, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> This is the first commit regarding the tail agnostic behavior.
> Added option 'rvv_ta_all_1s' to enable the behavior, the option
> is default to false.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/cpu.c                      |   1 +
>   target/riscv/cpu.h                      |   2 +
>   target/riscv/cpu_helper.c               |   2 +
>   target/riscv/insn_trans/trans_rvv.c.inc |  10 +
>   target/riscv/internals.h                |   5 +-
>   target/riscv/translate.c                |   2 +
>   target/riscv/vector_helper.c            | 315 ++++++++++++++----------
>   7 files changed, 206 insertions(+), 131 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..cd4cf4b41e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>   
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c069fe85fa..8c4a79b5a0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -369,6 +369,7 @@ struct RISCVCPUConfig {
>       bool ext_zhinxmin;
>       bool ext_zve32f;
>       bool ext_zve64f;
> +    bool rvv_ta_all_1s;
>   
>       /* Vendor-specific custom extensions */
>       bool ext_XVentanaCondOps;
> @@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>   /* If PointerMasking should be applied */
>   FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>   FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> +FIELD(TB_FLAGS, VTA, 24, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1c60fb2e80..2941c88c31 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>                       FIELD_EX64(env->vtype, VTYPE, VLMUL));
>           flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> +        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
> +                    FIELD_EX64(env->vtype, VTYPE, VTA));
>       } else {
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 57953923d5..166ee9df2b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1223,6 +1223,15 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>       tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /* tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>           gvec_fn(s->sew, vreg_ofs(s, a->rd),
>                   vreg_ofs(s, a->rs2), vreg_ofs(s, a->rs1),
>                   MAXSZ(s), MAXSZ(s));
> @@ -1231,6 +1240,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                              cpu_env, s->cfg_ptr->vlen / 8,
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index dbb322bfa7..512c6c30cf 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -24,8 +24,9 @@
>   /* share data between vector helpers and decode code */
>   FIELD(VDATA, VM, 0, 1)
>   FIELD(VDATA, LMUL, 1, 3)
> -FIELD(VDATA, NF, 4, 4)
> -FIELD(VDATA, WD, 4, 1)
> +FIELD(VDATA, VTA, 4, 1)
> +FIELD(VDATA, NF, 5, 4)
> +FIELD(VDATA, WD, 5, 1)
>   
>   /* float point classify helpers */
>   target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fac998a6b5..7775dade26 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -94,6 +94,7 @@ typedef struct DisasContext {
>        */
>       int8_t lmul;
>       uint8_t sew;
> +    uint8_t vta;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
>       uint8_t ntemp;
> @@ -1083,6 +1084,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>       ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>       ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
> +    ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
>       ctx->vstart = env->vstart;
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>       ctx->misa_mxl_max = env->misa_mxl_max;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index d0452a7756..b9976f9d77 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
>       return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
>   }
>   
> +static inline uint32_t vext_vta(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VTA);
> +}
> +
>   /*
>    * Get the maximum number of elements can be operated.
>    *
> @@ -140,6 +145,20 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>       return scale < 0 ? vlenb >> -scale : vlenb << scale;
>   }
>   
> +/*
> + * Get number of total elements, including prestart, body and tail elements.
> + * Note that when LMUL < 1, the tail includes the elements past VLMAX that
> + * are held in the same vector register.
> + */
> +static inline uint32_t vext_get_total_elems(RISCVCPU *cpu, target_ulong vtype)
> +{
> +    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
> +    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3) < 0 ?
> +                  0 : sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
> +    return cpu->cfg.vlen >> (sew + 3 - lmul);
> +}
> +

I have sent another patchset to  try to optimize a few point for rvv.  
One of the point I haven't done is that,

for some rvv instructions, lmul field in 'desc'( or the total desc) is 
assigned in trans_* but not used in helper function.

This field seems can be used here. I think It may be better to use desc 
and esz(just like vext_max_elems) here.

Regards,

Weiwei Li


