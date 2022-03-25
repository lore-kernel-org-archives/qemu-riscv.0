Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXhLH-0001P8-3W
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 06:38:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhLG-0001Ov-BS; Fri, 25 Mar 2022 06:38:50 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39388 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhLD-0007Q7-AW; Fri, 25 Mar 2022 06:38:50 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACXt5itmz1iEJKaBA--.6837S2;
 Fri, 25 Mar 2022 18:38:38 +0800 (CST)
Subject: Re: [PATCH qemu v4 09/14] target/riscv: rvv: Add tail agnostic for
 vector integer merge and move instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164814860220.28290.11643334198417094464-9@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <2da6b6be-b634-c7ca-d97f-c0c3cc5697aa@iscas.ac.cn>
Date: Fri, 25 Mar 2022 18:38:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164814860220.28290.11643334198417094464-9@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowACXt5itmz1iEJKaBA--.6837S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UJr4kXF1fAr4DGw1Dtrb_yoWxtrWrp3
 WkKrWfXrs5GF97Xw1SgF4UAF15ZFn5Ww1jkwnay3WFkayUGrWkGF4DtasIkr15tF97Cr1Y
 ya1DArWa9w4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbE_M3
 UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 25 Mar 2022 10:38:50 -0000


在 2022/3/7 下午5:53, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
>   target/riscv/vector_helper.c            | 28 +++++++++++++++++
>   2 files changed, 68 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index ccbc55a2ab..24784b6f5f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2113,11 +2113,21 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
>           /* vmv.v.v has rs2 = 0 and vm = 1 */
>           vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
>           if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /* tail elements may pass vlmax when lmul < 0
> +                * set tail elements to 1s
> +                */
similar to patch 6.
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                vreg_ofs(s, a->rd), -1,
> +                                vlenb, vlenb);
Not aligned here.
> +            }
>               tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
>                                vreg_ofs(s, a->rs1),
>                                MAXSZ(s), MAXSZ(s));
>           } else {
>               uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>               static gen_helper_gvec_2_ptr * const fns[4] = {
>                   gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
>                   gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
> @@ -2153,6 +2163,15 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>           s1 = get_gpr(s, a->rs1, EXT_SIGN);
>   
>           if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /* tail elements may pass vlmax when lmul < 0
> +                * set tail elements to 1s
> +                */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                vreg_ofs(s, a->rd), -1,
> +                                vlenb, vlenb);
Not aligned too.
> +            }
>               tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), s1);
>           } else {
> @@ -2160,6 +2179,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>               TCGv_i64 s1_i64 = tcg_temp_new_i64();
>               TCGv_ptr dest = tcg_temp_new_ptr();
>               uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>               static gen_helper_vmv_vx * const fns[4] = {
>                   gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
>                   gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
> @@ -2190,6 +2210,15 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>           vext_check_ss(s, a->rd, 0, 1)) {
>           int64_t simm = sextract64(a->rs1, 0, 5);
>           if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /* tail elements may pass vlmax when lmul < 0
> +                * set tail elements to 1s
> +                */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                vreg_ofs(s, a->rd), -1,
> +                                vlenb, vlenb);
here too.
> +            }
>               tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
>                                    MAXSZ(s), MAXSZ(s), simm);
>               mark_vs_dirty(s);
> @@ -2198,6 +2227,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>               TCGv_i64 s1;
>               TCGv_ptr dest;
>               uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>               static gen_helper_vmv_vx * const fns[4] = {
>                   gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
>                   gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
> @@ -2770,6 +2800,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>           TCGv_i64 t1;
>   
>           if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /* tail elements may pass vlmax when lmul < 0
> +                * set tail elements to 1s
> +                */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                vreg_ofs(s, a->rd), -1,
> +                                vlenb, vlenb);
here too.
> +            }
>               t1 = tcg_temp_new_i64();
>               /* NaN-box f[rs1] */
>               do_nanbox(s, t1, cpu_fpr[a->rs1]);
> @@ -2781,6 +2820,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>               TCGv_ptr dest;
>               TCGv_i32 desc;
>               uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>               static gen_helper_vmv_vx * const fns[3] = {
>                   gen_helper_vmv_v_x_h,
>                   gen_helper_vmv_v_x_w,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a972946bc2..89927a424f 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1964,6 +1964,10 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
>                     uint32_t desc)                                     \
>   {                                                                    \
>       uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env_archcpu(env),    \
> +                                         env->vtype);                \
> +    uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
> @@ -1971,6 +1975,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
>           *((ETYPE *)vd + H(i)) = s1;                                  \
>       }                                                                \
>       env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
> +                                     total_elems * esz);             \
>   }
>   
>   GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
> @@ -1983,12 +1990,19 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
>                     uint32_t desc)                                     \
>   {                                                                    \
>       uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env_archcpu(env),    \
> +                                         env->vtype);                \
> +    uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
>           *((ETYPE *)vd + H(i)) = (ETYPE)s1;                           \
>       }                                                                \
>       env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
> +                                     total_elems * esz);             \
>   }
>   
>   GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
> @@ -2001,6 +2015,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
>                     CPURISCVState *env, uint32_t desc)                 \
>   {                                                                    \
>       uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env_archcpu(env),    \
> +                                         env->vtype);                \
> +    uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
> @@ -2008,6 +2026,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
>           *((ETYPE *)vd + H(i)) = *(vt + H(i));                        \
>       }                                                                \
>       env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
> +                                     total_elems * esz);             \
>   }
>   
>   GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
> @@ -2020,6 +2041,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
>                     void *vs2, CPURISCVState *env, uint32_t desc)      \
>   {                                                                    \
>       uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env_archcpu(env),    \
> +                                         env->vtype);                \
better aligned here too.
> +    uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
> @@ -2029,6 +2054,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
>           *((ETYPE *)vd + H(i)) = d;                                   \
>       }                                                                \
>       env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
> +                                     total_elems * esz);             \
>   }
>   
>   GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)

Regards,

Weiwei Li


