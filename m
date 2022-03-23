Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWvBx-0001OQ-Uo
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 03:14:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nWvBv-0001Np-VC; Wed, 23 Mar 2022 03:13:59 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39860 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nWvBs-0002qm-Ho; Wed, 23 Mar 2022 03:13:59 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowADn7NinyDpiWzQCBQ--.48578S2;
 Wed, 23 Mar 2022 15:13:45 +0800 (CST)
Subject: Re: [PATCH qemu v3 03/14] target/riscv: rvv: Early exit when vstart
 >= vl
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>
References: <164800788276.12449.15168787569124374586-3@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4518f298-507f-2dd5-f696-d8db16501ef3@iscas.ac.cn>
Date: Wed, 23 Mar 2022 15:13:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164800788276.12449.15168787569124374586-3@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADn7NinyDpiWzQCBQ--.48578S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGr43GFWrJw1kCrW3Xr45Awb_yoWkWryrpr
 17tr4fZ39rGa4rJ34Fgw45Ar4FvF40kr4F9wnIyr4rGrW8Jr4DJr4DGw4Ygr1IvF43XrW2
 ya17ZFyqganxGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 23 Mar 2022 07:14:00 -0000


在 2022/3/12 下午2:28, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec (section 5.4):
> When vstart ≥ vl, there are no body elements, and no elements are
> updated in any destination vector register group, including that
> no tail elements are updated with agnostic values.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 29 +++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 275fded6e4..1e51a3e79c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -652,6 +652,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -818,6 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -925,6 +927,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -1067,6 +1070,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -1216,6 +1220,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>       }
>   
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       if (a->vm && s->vl_eq_vlmax) {
>           gvec_fn(s->sew, vreg_ofs(s, a->rd),
> @@ -1263,6 +1268,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -1427,6 +1433,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -1513,6 +1520,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -1593,6 +1601,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -1670,6 +1679,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           };                                                         \
>           TCGLabel *over = gen_new_label();                          \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -1851,6 +1861,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           };                                                         \
>           TCGLabel *over = gen_new_label();                          \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2061,6 +2072,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
>               };
>               TCGLabel *over = gen_new_label();
>               tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>               tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
>                                  cpu_env, s->cfg_ptr->vlen / 8,
> @@ -2084,6 +2096,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>           TCGv s1;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           s1 = get_gpr(s, a->rs1, EXT_SIGN);
>   
> @@ -2139,6 +2152,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>               };
>               TCGLabel *over = gen_new_label();
>               tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>               s1 = tcg_constant_i64(simm);
>               dest = tcg_temp_new_ptr();
> @@ -2291,6 +2305,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           TCGLabel *over = gen_new_label();                          \
>           gen_set_rm(s, RISCV_FRM_DYN);                              \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2321,6 +2336,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>   
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       dest = tcg_temp_new_ptr();
>       mask = tcg_temp_new_ptr();
> @@ -2409,6 +2425,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>           TCGLabel *over = gen_new_label();                        \
>           gen_set_rm(s, RISCV_FRM_DYN);                            \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
>                                                                    \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
> @@ -2483,6 +2500,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           TCGLabel *over = gen_new_label();                          \
>           gen_set_rm(s, RISCV_FRM_DYN);                              \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2604,6 +2622,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>           TCGLabel *over = gen_new_label();
>           gen_set_rm(s, rm);
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -2717,6 +2736,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>               };
>               TCGLabel *over = gen_new_label();
>               tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>               t1 = tcg_temp_new_i64();
>               /* NaN-box f[rs1] */
> @@ -2805,6 +2825,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           TCGLabel *over = gen_new_label();                          \
>           gen_set_rm(s, FRM);                                        \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2856,6 +2877,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           TCGLabel *over = gen_new_label();                          \
>           gen_set_rm(s, RISCV_FRM_DYN);                              \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> @@ -2921,6 +2943,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           TCGLabel *over = gen_new_label();                          \
>           gen_set_rm(s, FRM);                                        \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2974,6 +2997,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           TCGLabel *over = gen_new_label();                          \
>           gen_set_rm(s, FRM);                                        \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> @@ -3061,6 +3085,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
>           gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
>           TCGLabel *over = gen_new_label();                          \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> @@ -3201,6 +3226,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -3229,6 +3255,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -3674,6 +3701,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>           };
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   

vmsbf.m, vmsif.m,vmsof.m, viota.m, vcompress instructions themselves 
require vstart to be zero.

So it seems unnecessary here.  By the way, I remember I have commented 
this in last patchset. We

both lost it in our previous discussion.

Regards,
Weiwei Li
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
> @@ -3746,6 +3774,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
>       gen_helper_gvec_3_ptr *fn;
>       TCGLabel *over = gen_new_label();
>       tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       static gen_helper_gvec_3_ptr * const fns[6][4] = {
>           {


