Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njGrS-0005YD-U2
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 04:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njGrJ-0005Xq-7j; Tue, 26 Apr 2022 04:47:47 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:50442 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njGrF-0008FQ-Hk; Tue, 26 Apr 2022 04:47:44 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowABHT4efsWdiUXL+AA--.24747S2;
 Tue, 26 Apr 2022 16:47:27 +0800 (CST)
Subject: Re: [PATCH qemu 1/9] target/riscv: rvv: Add mask agnostic for vv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <165089631935.4839.7564289944057093570-1@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
Date: Tue, 26 Apr 2022 16:47:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165089631935.4839.7564289944057093570-1@git.sr.ht>
Content-Type: multipart/alternative;
 boundary="------------98C1135EBEB0B15547A5137E"
Content-Language: en-US
X-CM-TRANSID: qwCowABHT4efsWdiUXL+AA--.24747S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF4xWw1fGr1UKr13JFyrWFg_yoWxArWrpr
 48GrWxtrZxGFyfCw1fXF4UAr18Zrs5uw40kw4kuw4kuan5XrZ8XFZ8KF1xCFWUKF45Zr1F
 93WqyryY9395ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 I_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JjjYL9UUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 26 Apr 2022 08:47:50 -0000

This is a multi-part message in MIME format.
--------------98C1135EBEB0B15547A5137E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/17 下午3:26, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> This is the first commit regarding the mask agnostic behavior.
> Added option 'rvv_ma_all_1s' to enable the behavior, the option
> is default to false.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/cpu.c                      | 1 +
>   target/riscv/cpu.h                      | 2 ++
>   target/riscv/cpu_helper.c               | 2 ++
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
>   target/riscv/internals.h                | 5 +++--
>   target/riscv/translate.c                | 2 ++
>   target/riscv/vector_helper.c            | 8 ++++++++
>   7 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cd4cf4b41e..2bf862a5e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -811,6 +811,7 @@ static Property riscv_cpu_properties[] = {
>   
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> +    DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8c4a79b5a0..c76ded515b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -370,6 +370,7 @@ struct RISCVCPUConfig {
>       bool ext_zve32f;
>       bool ext_zve64f;
>       bool rvv_ta_all_1s;
> +    bool rvv_ma_all_1s;
>   
>       /* Vendor-specific custom extensions */
>       bool ext_XVentanaCondOps;
> @@ -518,6 +519,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>   FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>   FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>   FIELD(TB_FLAGS, VTA, 24, 1)
> +FIELD(TB_FLAGS, VMA, 25, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2941c88c31..be94d82ff8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -67,6 +67,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
>           flags = FIELD_DP32(flags, TB_FLAGS, VTA,
>                       FIELD_EX64(env->vtype, VTYPE, VTA));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
> +                    FIELD_EX64(env->vtype, VTYPE, VMA));
>       } else {
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8d87501e03..4610107fb4 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1251,6 +1251,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                              cpu_env, s->cfg_ptr->vlen / 8,
> @@ -1567,6 +1568,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1),
>                              vreg_ofs(s, a->rs2),
> @@ -1649,6 +1651,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1),
>                              vreg_ofs(s, a->rs2),
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 512c6c30cf..00b72fd767 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -25,8 +25,9 @@
>   FIELD(VDATA, VM, 0, 1)
>   FIELD(VDATA, LMUL, 1, 3)
>   FIELD(VDATA, VTA, 4, 1)
> -FIELD(VDATA, NF, 5, 4)
> -FIELD(VDATA, WD, 5, 1)
> +FIELD(VDATA, VMA, 5, 1)
> +FIELD(VDATA, NF, 6, 4)
> +FIELD(VDATA, WD, 6, 1)
>   
>   /* float point classify helpers */
>   target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7775dade26..37893aa348 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -95,6 +95,7 @@ typedef struct DisasContext {
>       int8_t lmul;
>       uint8_t sew;
>       uint8_t vta;
> +    uint8_t vma;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
>       uint8_t ntemp;
> @@ -1085,6 +1086,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>       ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>       ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
> +    ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
>       ctx->vstart = env->vstart;
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>       ctx->misa_mxl_max = env->misa_mxl_max;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index fbde0c9248..141a06ddf0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
>       return FIELD_EX32(simd_data(desc), VDATA, VTA);
>   }
>   
> +static inline uint32_t vext_vma(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VMA);
> +}
> +
>   /*
>    * Get the maximum number of elements can be operated.
>    *
> @@ -797,10 +802,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>       uint32_t vl = env->vl;
>       uint32_t total_elems = vext_get_total_elems(desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>       uint32_t i;
>   
>       for (i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz, (i + 1) * esz);

Similar to our last discussion,  vext_set_elems_1s_fns array can be 
simplified to single vext_set_elems_1s,

since the fourth argement can be used as the start offset.

Another question, may be not related to this patchset, in section 3.4.3 
of the spec:

/"Mask destination tail elements are always treated as tail-agnostic, 
regardless of the setting of vta."/

What does "Mask destination tail elements" mean?

Regards,

Weiwei Li

>               continue;
>           }
>           fn(vd, vs1, vs2, i);

--------------98C1135EBEB0B15547A5137E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/17 下午3:26, ~eopxd 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:165089631935.4839.7564289944057093570-1@git.sr.ht">
      <pre class="moz-quote-pre" wrap="">From: Yueh-Ting (eop) Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com">&lt;eop.chen@sifive.com&gt;</a>

This is the first commit regarding the mask agnostic behavior.
Added option 'rvv_ma_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com">&lt;eop.chen@sifive.com&gt;</a>
Reviewed-by: Frank Chang <a class="moz-txt-link-rfc2396E" href="mailto:frank.chang@sifive.com">&lt;frank.chang@sifive.com&gt;</a>
---
 target/riscv/cpu.c                      | 1 +
 target/riscv/cpu.h                      | 2 ++
 target/riscv/cpu_helper.c               | 2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 target/riscv/internals.h                | 5 +++--
 target/riscv/translate.c                | 2 ++
 target/riscv/vector_helper.c            | 8 ++++++++
 7 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cd4cf4b41e..2bf862a5e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -811,6 +811,7 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
+    DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8c4a79b5a0..c76ded515b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -370,6 +370,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool rvv_ta_all_1s;
+    bool rvv_ma_all_1s;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
@@ -518,6 +519,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VTA, 24, 1)
+FIELD(TB_FLAGS, VMA, 25, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2941c88c31..be94d82ff8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -67,6 +67,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
         flags = FIELD_DP32(flags, TB_FLAGS, VTA,
                     FIELD_EX64(env-&gt;vtype, VTYPE, VTA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
+                    FIELD_EX64(env-&gt;vtype, VTYPE, VMA));
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8d87501e03..4610107fb4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1251,6 +1251,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
         data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
         data = FIELD_DP32(data, VDATA, VTA, s-&gt;vta);
+        data = FIELD_DP32(data, VDATA, VMA, s-&gt;vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a-&gt;rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a-&gt;rs1), vreg_ofs(s, a-&gt;rs2),
                            cpu_env, s-&gt;cfg_ptr-&gt;vlen / 8,
@@ -1567,6 +1568,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
         data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
         data = FIELD_DP32(data, VDATA, VTA, s-&gt;vta);
+        data = FIELD_DP32(data, VDATA, VMA, s-&gt;vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a-&gt;rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a-&gt;rs1),
                            vreg_ofs(s, a-&gt;rs2),
@@ -1649,6 +1651,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
         data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
         data = FIELD_DP32(data, VDATA, VTA, s-&gt;vta);
+        data = FIELD_DP32(data, VDATA, VMA, s-&gt;vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a-&gt;rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a-&gt;rs1),
                            vreg_ofs(s, a-&gt;rs2),
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 512c6c30cf..00b72fd767 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -25,8 +25,9 @@
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
 FIELD(VDATA, VTA, 4, 1)
-FIELD(VDATA, NF, 5, 4)
-FIELD(VDATA, WD, 5, 1)
+FIELD(VDATA, VMA, 5, 1)
+FIELD(VDATA, NF, 6, 4)
+FIELD(VDATA, WD, 6, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7775dade26..37893aa348 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -95,6 +95,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint8_t vta;
+    uint8_t vma;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -1085,6 +1086,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx-&gt;sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx-&gt;lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx-&gt;vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) &amp;&amp; cpu-&gt;cfg.rvv_ta_all_1s;
+    ctx-&gt;vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) &amp;&amp; cpu-&gt;cfg.rvv_ma_all_1s;
     ctx-&gt;vstart = env-&gt;vstart;
     ctx-&gt;vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx-&gt;misa_mxl_max = env-&gt;misa_mxl_max;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fbde0c9248..141a06ddf0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VTA);
 }
 
+static inline uint32_t vext_vma(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VMA);
+}
+
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -797,10 +802,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
     uint32_t vl = env-&gt;vl;
     uint32_t total_elems = vext_get_total_elems(desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
     uint32_t i;
 
     for (i = env-&gt;vstart; i &lt; vl; i++) {
         if (!vm &amp;&amp; !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz, (i + 1) * esz);</pre>
    </blockquote>
    <p>Similar to our last discussion,  vext_set_elems_1s_fns array can
      be simplified to single vext_set_elems_1s,<br>
    </p>
    <p>since the fourth argement can be used as the start offset. <br>
    </p>
    <p>Another question, may be not related to this patchset, in section
      3.4.3 of the spec: <br>
    </p>
    <p><i>"Mask destination tail elements are always treated as
        tail-agnostic, regardless of the setting of vta."</i></p>
    <p>What does "Mask destination tail elements" mean?</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:165089631935.4839.7564289944057093570-1@git.sr.ht">
      <pre class="moz-quote-pre" wrap="">
             continue;
         }
         fn(vd, vs1, vs2, i);
</pre>
    </blockquote>
  </body>
</html>

--------------98C1135EBEB0B15547A5137E--


