Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVZqq-0006m2-Fe
	for mharc-qemu-riscv@gnu.org; Sat, 19 Mar 2022 10:14:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVZqp-0006ln-7a; Sat, 19 Mar 2022 10:14:39 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:43486 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVZqn-0000du-0M; Sat, 19 Mar 2022 10:14:38 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAAXt8RH5TVimaJTBA--.56439S2;
 Sat, 19 Mar 2022 22:14:32 +0800 (CST)
Subject: Re: [PATCH qemu 05/13] target/riscv: rvv: Add tail agnostic for vx,
 vvm, vxm instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-5@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <418dcf55-d0e8-e81b-9383-8e57dff36d71@iscas.ac.cn>
Date: Sat, 19 Mar 2022 22:14:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-5@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAAXt8RH5TVimaJTBA--.56439S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xAFy8AF4kXw18WFWfXwb_yoWrWF17p3
 WkKrWSqrsxKFyfZ3WSqF4UZr1Fvan5Kw1jkr1vgw4rCas8t3ykXFWDta1Iyry2ya43CF40
 k3WrA3ya9anYyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUj2jg7UUUUU==
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
X-List-Received-Date: Sat, 19 Mar 2022 14:14:39 -0000


在 2022/3/7 下午3:32, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |   5 +
>   target/riscv/vector_helper.c            | 311 +++++++++++++-----------
>   2 files changed, 178 insertions(+), 138 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 3efac1efe0..ac6379a8fc 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1278,6 +1278,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>   
>       data = FIELD_DP32(data, VDATA, VM, vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                         s->cfg_ptr->vlen / 8, data));
>   
> @@ -1443,6 +1444,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>   
>       data = FIELD_DP32(data, VDATA, VM, vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                         s->cfg_ptr->vlen / 8, data));
>   
> @@ -1525,6 +1527,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1),
>                              vreg_ofs(s, a->rs2),
> @@ -1606,6 +1609,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1),
>                              vreg_ofs(s, a->rs2),
> @@ -1684,6 +1688,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 2e8a9f3578..56a32adcb9 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -815,10 +815,12 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
>   
>   static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>                          CPURISCVState *env, uint32_t desc,
> -                       opivx2_fn fn)
> +                       opivx2_fn fn, uint32_t esz)
>   {
>       uint32_t vm = vext_vm(desc);
>       uint32_t vl = env->vl;
> +    uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> +    uint32_t vta = vext_vta(desc);
>       uint32_t i;
>   
>       for (i = env->vstart; i < vl; i++) {
> @@ -828,30 +830,32 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>           fn(vd, s1, vs2, i);
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz);
>   }
>   
>   /* generate the helpers for OPIVX */
> -#define GEN_VEXT_VX(NAME)                                 \
> +#define GEN_VEXT_VX(NAME, ETYPE)                          \
>   void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
>                     void *vs2, CPURISCVState *env,          \
>                     uint32_t desc)                          \
>   {                                                         \
>       do_vext_vx(vd, v0, s1, vs2, env, desc,                \
> -               do_##NAME);                                \
> -}
> -
> -GEN_VEXT_VX(vadd_vx_b)
> -GEN_VEXT_VX(vadd_vx_h)
> -GEN_VEXT_VX(vadd_vx_w)
> -GEN_VEXT_VX(vadd_vx_d)
> -GEN_VEXT_VX(vsub_vx_b)
> -GEN_VEXT_VX(vsub_vx_h)
> -GEN_VEXT_VX(vsub_vx_w)
> -GEN_VEXT_VX(vsub_vx_d)
> -GEN_VEXT_VX(vrsub_vx_b)
> -GEN_VEXT_VX(vrsub_vx_h)
> -GEN_VEXT_VX(vrsub_vx_w)
> -GEN_VEXT_VX(vrsub_vx_d)
> +               do_##NAME, sizeof(ETYPE));                 \
> +}
> +
Similar to last patch, can use ESZ directly here.

Regards,

Weiwei Li


