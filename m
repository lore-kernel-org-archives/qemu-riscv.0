Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYnTG-0007Dk-Au
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 07:23:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nYnTD-0007DV-0V; Mon, 28 Mar 2022 07:23:35 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:45010 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nYnT9-0002zS-Bn; Mon, 28 Mar 2022 07:23:34 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADHTnekmkFiaz4HAA--.24016S2;
 Mon, 28 Mar 2022 19:23:18 +0800 (CST)
Subject: Re: [PATCH qemu v5 04/14] target/riscv: rvv: Add tail agnostic for vv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164845204233.25323.14607469451359734000-4@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <840f38d8-5026-b6ba-5301-c205b4d7cda0@iscas.ac.cn>
Date: Mon, 28 Mar 2022 19:23:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164845204233.25323.14607469451359734000-4@git.sr.ht>
Content-Type: multipart/alternative;
 boundary="------------E4DCF6E0B4110E18D2792D88"
Content-Language: en-US
X-CM-TRANSID: rQCowADHTnekmkFiaz4HAA--.24016S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GFW5Kw4ftrW7Aw1kKw13CFg_yoWxXryxpw
 4xKrW7KrZrJFWfAw1SqF4UJr18AFs8Cw4Ykw1kuw1kXw45XrZ8XFn8KF12kFy7GFW8Zr1Y
 93Wjyr15ua1rZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 I_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUtkuxUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Mon, 28 Mar 2022 11:23:35 -0000

This is a multi-part message in MIME format.
--------------E4DCF6E0B4110E18D2792D88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


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
>   target/riscv/insn_trans/trans_rvv.c.inc |  11 +
>   target/riscv/internals.h                |   5 +-
>   target/riscv/translate.c                |   2 +
>   target/riscv/vector_helper.c            | 315 ++++++++++++++----------
>   7 files changed, 207 insertions(+), 131 deletions(-)
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
> index 57953923d5..cc80bf00ff 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1223,6 +1223,16 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>       tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>       if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /*
> +             * tail elements may pass vlmax when lmul < 0
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
> @@ -1231,6 +1241,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
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
> index d0452a7756..39c79c59c2 100644
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
> @@ -140,6 +145,19 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>       return scale < 0 ? vlenb >> -scale : vlenb << scale;
>   }
>   
> +/*
> + * Get number of total elements, including prestart, body and tail elements.
> + * Note that when LMUL < 1, the tail includes the elements past VLMAX that
> + * are held in the same vector register.
> + */
> +static inline uint32_t vext_get_total_elems(uint32_t desc, uint32_t esz)
> +{
> +    uint32_t vlenb = simd_maxsz(desc);
> +    int8_t lmul = vext_lmul(desc) < 0 ? 0 : vext_lmul(desc);
> +
> +    return vlenb >> (esz - lmul);
> +}
> +

seems incorrect here. if esz is used here, I think the max elements 
should be:

         (vlenb << lmul) / esz;

otherwise, if take the similar way as vext_max_elems, log2_esz is used, 
the max element can be:

int scale = lmul - log2_esz;

return scale < 0 ? vlenb >> -scale : vlenb << scale;

Regards,

Weiwei Li



--------------E4DCF6E0B4110E18D2792D88
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/1 下午5:07, ~eopxd 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164845204233.25323.14607469451359734000-4@git.sr.ht">
      <pre class="moz-quote-pre" wrap="">From: eopXD <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com">&lt;eop.chen@sifive.com&gt;</a>

This is the first commit regarding the tail agnostic behavior.
Added option 'rvv_ta_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com">&lt;eop.chen@sifive.com&gt;</a>
Reviewed-by: Frank Chang <a class="moz-txt-link-rfc2396E" href="mailto:frank.chang@sifive.com">&lt;frank.chang@sifive.com&gt;</a>
---
 target/riscv/cpu.c                      |   1 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/cpu_helper.c               |   2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  11 +
 target/riscv/internals.h                |   5 +-
 target/riscv/translate.c                |   2 +
 target/riscv/vector_helper.c            | 315 ++++++++++++++----------
 7 files changed, 207 insertions(+), 131 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..cd4cf4b41e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..8c4a79b5a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -369,6 +369,7 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool rvv_ta_all_1s;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
@@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
+FIELD(TB_FLAGS, VTA, 24, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e80..2941c88c31 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env-&gt;vtype, VTYPE, VLMUL));
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
+                    FIELD_EX64(env-&gt;vtype, VTYPE, VTA));
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 57953923d5..cc80bf00ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1223,6 +1223,16 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     if (a-&gt;vm &amp;&amp; s-&gt;vl_eq_vlmax) {
+        if (s-&gt;vta &amp;&amp; s-&gt;lmul &lt; 0) {
+            /*
+             * tail elements may pass vlmax when lmul &lt; 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb = s-&gt;cfg_ptr-&gt;vlen &gt;&gt; 3;
+            tcg_gen_gvec_ori(s-&gt;sew, vreg_ofs(s, a-&gt;rd),
+                             vreg_ofs(s, a-&gt;rd), -1,
+                             vlenb, vlenb);
+        }
         gvec_fn(s-&gt;sew, vreg_ofs(s, a-&gt;rd),
                 vreg_ofs(s, a-&gt;rs2), vreg_ofs(s, a-&gt;rs1),
                 MAXSZ(s), MAXSZ(s));
@@ -1231,6 +1241,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
 
         data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
         data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
+        data = FIELD_DP32(data, VDATA, VTA, s-&gt;vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a-&gt;rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a-&gt;rs1), vreg_ofs(s, a-&gt;rs2),
                            cpu_env, s-&gt;cfg_ptr-&gt;vlen / 8,
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index dbb322bfa7..512c6c30cf 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -24,8 +24,9 @@
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
-FIELD(VDATA, NF, 4, 4)
-FIELD(VDATA, WD, 4, 1)
+FIELD(VDATA, VTA, 4, 1)
+FIELD(VDATA, NF, 5, 4)
+FIELD(VDATA, WD, 5, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fac998a6b5..7775dade26 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -94,6 +94,7 @@ typedef struct DisasContext {
      */
     int8_t lmul;
     uint8_t sew;
+    uint8_t vta;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -1083,6 +1084,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx-&gt;vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx-&gt;sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx-&gt;lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
+    ctx-&gt;vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) &amp;&amp; cpu-&gt;cfg.rvv_ta_all_1s;
     ctx-&gt;vstart = env-&gt;vstart;
     ctx-&gt;vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx-&gt;misa_mxl_max = env-&gt;misa_mxl_max;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d0452a7756..39c79c59c2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
     return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
 
+static inline uint32_t vext_vta(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VTA);
+}
+
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -140,6 +145,19 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
     return scale &lt; 0 ? vlenb &gt;&gt; -scale : vlenb &lt;&lt; scale;
 }
 
+/*
+ * Get number of total elements, including prestart, body and tail elements.
+ * Note that when LMUL &lt; 1, the tail includes the elements past VLMAX that
+ * are held in the same vector register.
+ */
+static inline uint32_t vext_get_total_elems(uint32_t desc, uint32_t esz)
+{
+    uint32_t vlenb = simd_maxsz(desc);
+    int8_t lmul = vext_lmul(desc) &lt; 0 ? 0 : vext_lmul(desc);
+
+    return vlenb &gt;&gt; (esz - lmul);
+}
+</pre>
    </blockquote>
    <p>seems incorrect here. if esz is used here, I think the max
      elements should be:</p>
    <p>        (vlenb &lt;&lt; lmul) / esz;</p>
    <p>otherwise, if take the similar way as <span class="pl-en">vext_max_elems,
        log2_esz is used, the max element can be:</span></p>
    <p>        <span class="pl-k">int</span> scale = <span
        class="pl-c1">lmul</span> - log2_esz;</p>
    <p>        <span class="pl-k">return</span> scale &lt; <span
        class="pl-c1">0</span> ? vlenb &gt;&gt; -scale : vlenb &lt;&lt;
      scale;</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <p><span class="pl-en"></span></p>
    <br>
  </body>
</html>

--------------E4DCF6E0B4110E18D2792D88--


