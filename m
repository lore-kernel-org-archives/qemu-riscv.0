Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nX1Vl-0001oQ-QP
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 09:58:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nX1Vf-0001jz-5O; Wed, 23 Mar 2022 09:58:48 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39742 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nX1VZ-00014X-Bj; Wed, 23 Mar 2022 09:58:45 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABHT5uFJztim95LBA--.49616S2;
 Wed, 23 Mar 2022 21:58:31 +0800 (CST)
Subject: Re: [PATCH qemu v3 04/14] target/riscv: rvv: Add tail agnostic for vv
 instructions
To: =?UTF-8?B?6Zmz57SE5bu3?= <yueh.ting.chen@gmail.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <164800788276.12449.15168787569124374586-4@git.sr.ht>
 <145ed096-a2fb-7dd3-c60b-d93055869ea8@iscas.ac.cn>
 <4DA46204-103B-416B-A367-061CA68BDC73@gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <ed5e00e3-3ca0-7f3b-bd8f-f1e9e1d45990@iscas.ac.cn>
Date: Wed, 23 Mar 2022 21:58:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4DA46204-103B-416B-A367-061CA68BDC73@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------38F8F945702D34469A9979BA"
Content-Language: en-US
X-CM-TRANSID: rQCowABHT5uFJztim95LBA--.49616S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ur1DAry5Zr1xWr43ZryxKrg_yoWDCw4Dpr
 18GrW7JryUJFyxJw18Jr4UJryUJr1UGw1UJr18XF1DJr4UJr4jqr1DXr1j9r1UJr48Ar15
 tF1UAr1UZr4UXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 I_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbzVbPUUUU
 U==
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
X-List-Received-Date: Wed, 23 Mar 2022 13:58:48 -0000

This is a multi-part message in MIME format.
--------------38F8F945702D34469A9979BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/23 下午3:30, 陳約廷 写道:
> How about ‘total_elem'?

LGTM.

>
>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> 於 
>> 2022年3月23日 下午3:28 寫道：
>>
>>
>> 在 2022/3/1 下午5:07, ~eopxd 写道:
>>> From: eopXD <eop.chen@sifive.com <mailto:eop.chen@sifive.com>>
>>>
>>> This is the first commit regarding the tail agnostic behavior.
>>> Added option 'rvv_ta_all_1s' to enable the behavior, the option
>>> is default to false.
>>>
>>> Signed-off-by: eop Chen <eop.chen@sifive.com 
>>> <mailto:eop.chen@sifive.com>>
>>> Reviewed-by: Frank Chang <frank.chang@sifive.com 
>>> <mailto:frank.chang@sifive.com>>
>>> ---
>>>  target/riscv/cpu.c                      |   1 +
>>>  target/riscv/cpu.h                      |   2 +
>>>  target/riscv/cpu_helper.c               |   2 +
>>>  target/riscv/insn_trans/trans_rvv.c.inc |   1 +
>>>  target/riscv/internals.h                |   5 +-
>>>  target/riscv/translate.c                |   2 +
>>>  target/riscv/vector_helper.c            | 315 ++++++++++++++----------
>>>  7 files changed, 197 insertions(+), 131 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index ddda4906ff..cd4cf4b41e 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] = {
>>>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>>>        DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, 
>>> DEFAULT_RSTVEC),
>>> +    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, 
>>> false),
>>>      DEFINE_PROP_END_OF_LIST(),
>>>  };
>>>  diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index c069fe85fa..8c4a79b5a0 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -369,6 +369,7 @@ struct RISCVCPUConfig {
>>>      bool ext_zhinxmin;
>>>      bool ext_zve32f;
>>>      bool ext_zve64f;
>>> +    bool rvv_ta_all_1s;
>>>        /* Vendor-specific custom extensions */
>>>      bool ext_XVentanaCondOps;
>>> @@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>>>  /* If PointerMasking should be applied */
>>>  FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>>>  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>>> +FIELD(TB_FLAGS, VTA, 24, 1)
>>>    #ifdef TARGET_RISCV32
>>>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 1c60fb2e80..2941c88c31 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, 
>>> target_ulong *pc,
>>>          flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>>>                      FIELD_EX64(env->vtype, VTYPE, VLMUL));
>>>          flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
>>> +        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
>>> +                    FIELD_EX64(env->vtype, VTYPE, VTA));
>>>      } else {
>>>          flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>>>      }
>>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>>> b/target/riscv/insn_trans/trans_rvv.c.inc
>>> index 1e51a3e79c..603abe0e9f 100644
>>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>>> @@ -1231,6 +1231,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, 
>>> GVecGen3Fn *gvec_fn,
>>>            data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>>>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>>>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>>>                             cpu_env, s->cfg_ptr->vlen / 8,
>>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>>> index dbb322bfa7..512c6c30cf 100644
>>> --- a/target/riscv/internals.h
>>> +++ b/target/riscv/internals.h
>>> @@ -24,8 +24,9 @@
>>>  /* share data between vector helpers and decode code */
>>>  FIELD(VDATA, VM, 0, 1)
>>>  FIELD(VDATA, LMUL, 1, 3)
>>> -FIELD(VDATA, NF, 4, 4)
>>> -FIELD(VDATA, WD, 4, 1)
>>> +FIELD(VDATA, VTA, 4, 1)
>>> +FIELD(VDATA, NF, 5, 4)
>>> +FIELD(VDATA, WD, 5, 1)
>>>    /* float point classify helpers */
>>>  target_ulong fclass_h(uint64_t frs1);
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index fac998a6b5..7775dade26 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -94,6 +94,7 @@ typedef struct DisasContext {
>>>       */
>>>      int8_t lmul;
>>>      uint8_t sew;
>>> +    uint8_t vta;
>>>      target_ulong vstart;
>>>      bool vl_eq_vlmax;
>>>      uint8_t ntemp;
>>> @@ -1083,6 +1084,7 @@ static void 
>>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>>      ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>>>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>>>      ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>>> +    ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && 
>>> cpu->cfg.rvv_ta_all_1s;
>>>      ctx->vstart = env->vstart;
>>>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>>>      ctx->misa_mxl_max = env->misa_mxl_max;
>>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>>> index d0452a7756..6c47d39251 100644
>>> --- a/target/riscv/vector_helper.c
>>> +++ b/target/riscv/vector_helper.c
>>> @@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
>>>      return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
>>>  }
>>>  +static inline uint32_t vext_vta(uint32_t desc)
>>> +{
>>> +    return FIELD_EX32(simd_data(desc), VDATA, VTA);
>>> +}
>>> +
>>>  /*
>>>   * Get the maximum number of elements can be operated.
>>>   *
>>> @@ -140,6 +145,20 @@ static inline uint32_t vext_max_elems(uint32_t 
>>> desc, uint32_t log2_esz)
>>>      return scale < 0 ? vlenb >> -scale : vlenb << scale;
>>>  }
>>>  +/*
>>> + * Get number of total elements, including prestart, body and tail 
>>> elements.
>>> + * Note that when LMUL < 1, the tail includes the elements past 
>>> VLMAX that
>>> + * are held in the same vector register.
>>> + */
>>> +static inline uint32_t vext_get_total_elem(RISCVCPU *cpu, 
>>> target_ulong vtype)
>>> +{
>>> +    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
>>> +    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3) 
>>> < 0 ?
>>> +                  0 : sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 
>>> 0, 3);
>>> +    return cpu->cfg.vlen >> (sew + 3 - lmul);
>>> +}
>>> +
>>> +
>>>  static inline target_ulong adjust_addr(CPURISCVState *env, 
>>> target_ulong addr)
>>>  {
>>>      return (addr & env->cur_pmmask) | env->cur_pmbase;
>>> @@ -172,6 +191,32 @@ static void probe_pages(CPURISCVState *env, 
>>> target_ulong addr,
>>>      }
>>>  }
>>>  +static void vext_set_elems_1s(void *base, uint32_t is_agnostic, 
>>> uint32_t cnt,
>>> +                              uint32_t tot)
>>> +{
>>> +    if (is_agnostic == 0) {
>>> +        /* policy undisturbed */
>>> +        return;
>>> +    }
>>> +    if (tot - cnt == 0) {
>>> +        return ;
>>> +    }
>>> +    memset(base, -1, tot - cnt);
>>> +}
>>> +
>>> +/* Set agnostic elements to 1s */
>>> +#define GEN_SET_ELEMS_1S(SET_ELEMS_1S_FN, ETYPE, H) 
>>>                            \
>>> +static void SET_ELEMS_1S_FN(void *vd, uint32_t is_agnostic, 
>>> uint32_t idx,      \
>>> +                            uint32_t cnt, uint32_t tot) 
>>>                        \
>>> +{ 
>>>                                                                              \
>>> +    ETYPE *cur = ((ETYPE *)vd + H(idx)); 
>>>                                       \
>>> +    vext_set_elems_1s(cur, is_agnostic, cnt, tot); 
>>>                             \
>>> +}
>>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_b, int8_t, H1)
>>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_h, int16_t, H2)
>>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_w, int32_t, H4)
>>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_d, int64_t, H8)
>>> +
>>>  static inline void vext_set_elem_mask(void *v0, int index,
>>>                                        uint8_t value)
>>>  {
>>> @@ -197,6 +242,14 @@ static inline int vext_elem_mask(void *v0, int 
>>> index)
>>>  typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
>>>                                 uint32_t idx, void *vd, uintptr_t 
>>> retaddr);
>>>  +/* set bytes to all 1s for agnostic elements */
>>> +typedef void vext_set_elems_1s_fn(void *vd, uint32_t vta, uint32_t idx,
>>> +                                  uint32_t cnt, uint32_t tot);
>>> +static vext_set_elems_1s_fn *vext_set_elems_1s_fns[4] = {
>>> +    vext_set_elems_1s_b, vext_set_elems_1s_h,
>>> +    vext_set_elems_1s_w, vext_set_elems_1s_d
>>> +};
>>> +
>>>  #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
>>>  static void NAME(CPURISCVState *env, abi_ptr addr,         \
>>>                   uint32_t idx, void *vd, uintptr_t retaddr)\
>>> @@ -710,10 +763,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, 
>>> H8, DO_SUB)
>>>    static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>>>                         CPURISCVState *env, uint32_t desc,
>>> -                       opivv2_fn *fn)
>>> +                       opivv2_fn *fn, uint32_t esz)
>>>  {
>>>      uint32_t vm = vext_vm(desc);
>>>      uint32_t vl = env->vl;
>>> +    uint32_t vlmax = vext_get_total_elem(env_archcpu(env), env->vtype);
>>
>> 'vlmax' seems a bit confusing here. Maybe can use 'total' or 'max' ...
>>
>> Regards,
>>
>> Weiwei Li
>

--------------38F8F945702D34469A9979BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/23 下午3:30, 陳約廷 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4DA46204-103B-416B-A367-061CA68BDC73@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      How about ‘total_elem'?<br class="">
    </blockquote>
    <p>LGTM.</p>
    <blockquote type="cite"
      cite="mid:4DA46204-103B-416B-A367-061CA68BDC73@gmail.com">
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">Weiwei Li &lt;<a
              href="mailto:liweiwei@iscas.ac.cn" class=""
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; 於
            2022年3月23日 下午3:28 寫道：</div>
          <br class="Apple-interchange-newline">
          <div class="">
            <meta charset="UTF-8" class="">
            <br style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">在 2022/3/1 下午5:07, ~eopxd 写道:</span><br
              style="caret-color: rgb(0, 0, 0); font-family: Helvetica;
              font-size: 12px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              text-align: start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <blockquote type="cite" style="font-family: Helvetica;
              font-size: 12px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              orphans: auto; text-align: start; text-indent: 0px;
              text-transform: none; white-space: normal; widows: auto;
              word-spacing: 0px; -webkit-text-size-adjust: auto;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">From: eopXD &lt;<a
                href="mailto:eop.chen@sifive.com" class=""
                moz-do-not-send="true">eop.chen@sifive.com</a>&gt;<br
                class="">
              <br class="">
              This is the first commit regarding the tail agnostic
              behavior.<br class="">
              Added option 'rvv_ta_all_1s' to enable the behavior, the
              option<br class="">
              is default to false.<br class="">
              <br class="">
              Signed-off-by: eop Chen &lt;<a
                href="mailto:eop.chen@sifive.com" class=""
                moz-do-not-send="true">eop.chen@sifive.com</a>&gt;<br
                class="">
              Reviewed-by: Frank Chang &lt;<a
                href="mailto:frank.chang@sifive.com" class=""
                moz-do-not-send="true">frank.chang@sifive.com</a>&gt;<br
                class="">
              ---<br class="">
               target/riscv/cpu.c                      |   1 +<br
                class="">
               target/riscv/cpu.h                      |   2 +<br
                class="">
               target/riscv/cpu_helper.c               |   2 +<br
                class="">
               target/riscv/insn_trans/trans_rvv.c.inc |   1 +<br
                class="">
               target/riscv/internals.h                |   5 +-<br
                class="">
               target/riscv/translate.c                |   2 +<br
                class="">
               target/riscv/vector_helper.c            | 315
              ++++++++++++++----------<br class="">
               7 files changed, 197 insertions(+), 131 deletions(-)<br
                class="">
              <br class="">
              diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br
                class="">
              index ddda4906ff..cd4cf4b41e 100644<br class="">
              --- a/target/riscv/cpu.c<br class="">
              +++ b/target/riscv/cpu.c<br class="">
              @@ -810,6 +810,7 @@ static Property riscv_cpu_properties[]
              = {<br class="">
                   DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),<br
                class="">
                     DEFINE_PROP_UINT64("resetvec", RISCVCPU,
              cfg.resetvec, DEFAULT_RSTVEC),<br class="">
              +    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU,
              cfg.rvv_ta_all_1s, false),<br class="">
                   DEFINE_PROP_END_OF_LIST(),<br class="">
               };<br class="">
               diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br
                class="">
              index c069fe85fa..8c4a79b5a0 100644<br class="">
              --- a/target/riscv/cpu.h<br class="">
              +++ b/target/riscv/cpu.h<br class="">
              @@ -369,6 +369,7 @@ struct RISCVCPUConfig {<br class="">
                   bool ext_zhinxmin;<br class="">
                   bool ext_zve32f;<br class="">
                   bool ext_zve64f;<br class="">
              +    bool rvv_ta_all_1s;<br class="">
                     /* Vendor-specific custom extensions */<br class="">
                   bool ext_XVentanaCondOps;<br class="">
              @@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)<br class="">
               /* If PointerMasking should be applied */<br class="">
               FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)<br class="">
               FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)<br class="">
              +FIELD(TB_FLAGS, VTA, 24, 1)<br class="">
                 #ifdef TARGET_RISCV32<br class="">
               #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)<br
                class="">
              diff --git a/target/riscv/cpu_helper.c
              b/target/riscv/cpu_helper.c<br class="">
              index 1c60fb2e80..2941c88c31 100644<br class="">
              --- a/target/riscv/cpu_helper.c<br class="">
              +++ b/target/riscv/cpu_helper.c<br class="">
              @@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState
              *env, target_ulong *pc,<br class="">
                       flags = FIELD_DP32(flags, TB_FLAGS, LMUL,<br
                class="">
                                   FIELD_EX64(env-&gt;vtype, VTYPE,
              VLMUL));<br class="">
                       flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX,
              vl_eq_vlmax);<br class="">
              +        flags = FIELD_DP32(flags, TB_FLAGS, VTA,<br
                class="">
              +                    FIELD_EX64(env-&gt;vtype, VTYPE,
              VTA));<br class="">
                   } else {<br class="">
                       flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);<br
                class="">
                   }<br class="">
              diff --git a/target/riscv/insn_trans/trans_rvv.c.inc
              b/target/riscv/insn_trans/trans_rvv.c.inc<br class="">
              index 1e51a3e79c..603abe0e9f 100644<br class="">
              --- a/target/riscv/insn_trans/trans_rvv.c.inc<br class="">
              +++ b/target/riscv/insn_trans/trans_rvv.c.inc<br class="">
              @@ -1231,6 +1231,7 @@ do_opivv_gvec(DisasContext *s,
              arg_rmrr *a, GVecGen3Fn *gvec_fn,<br class="">
                         data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);<br
                class="">
                       data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);<br
                class="">
              +        data = FIELD_DP32(data, VDATA, VTA, s-&gt;vta);<br
                class="">
                       tcg_gen_gvec_4_ptr(vreg_ofs(s, a-&gt;rd),
              vreg_ofs(s, 0),<br class="">
                                          vreg_ofs(s, a-&gt;rs1),
              vreg_ofs(s, a-&gt;rs2),<br class="">
                                          cpu_env,
              s-&gt;cfg_ptr-&gt;vlen / 8,<br class="">
              diff --git a/target/riscv/internals.h
              b/target/riscv/internals.h<br class="">
              index dbb322bfa7..512c6c30cf 100644<br class="">
              --- a/target/riscv/internals.h<br class="">
              +++ b/target/riscv/internals.h<br class="">
              @@ -24,8 +24,9 @@<br class="">
               /* share data between vector helpers and decode code */<br
                class="">
               FIELD(VDATA, VM, 0, 1)<br class="">
               FIELD(VDATA, LMUL, 1, 3)<br class="">
              -FIELD(VDATA, NF, 4, 4)<br class="">
              -FIELD(VDATA, WD, 4, 1)<br class="">
              +FIELD(VDATA, VTA, 4, 1)<br class="">
              +FIELD(VDATA, NF, 5, 4)<br class="">
              +FIELD(VDATA, WD, 5, 1)<br class="">
                 /* float point classify helpers */<br class="">
               target_ulong fclass_h(uint64_t frs1);<br class="">
              diff --git a/target/riscv/translate.c
              b/target/riscv/translate.c<br class="">
              index fac998a6b5..7775dade26 100644<br class="">
              --- a/target/riscv/translate.c<br class="">
              +++ b/target/riscv/translate.c<br class="">
              @@ -94,6 +94,7 @@ typedef struct DisasContext {<br
                class="">
                    */<br class="">
                   int8_t lmul;<br class="">
                   uint8_t sew;<br class="">
              +    uint8_t vta;<br class="">
                   target_ulong vstart;<br class="">
                   bool vl_eq_vlmax;<br class="">
                   uint8_t ntemp;<br class="">
              @@ -1083,6 +1084,7 @@ static void
              riscv_tr_init_disas_context(DisasContextBase *dcbase,
              CPUState *cs)<br class="">
                   ctx-&gt;vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);<br
                class="">
                   ctx-&gt;sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);<br
                class="">
                   ctx-&gt;lmul = sextract32(FIELD_EX32(tb_flags,
              TB_FLAGS, LMUL), 0, 3);<br class="">
              +    ctx-&gt;vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA)
              &amp;&amp; cpu-&gt;cfg.rvv_ta_all_1s;<br class="">
                   ctx-&gt;vstart = env-&gt;vstart;<br class="">
                   ctx-&gt;vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS,
              VL_EQ_VLMAX);<br class="">
                   ctx-&gt;misa_mxl_max = env-&gt;misa_mxl_max;<br
                class="">
              diff --git a/target/riscv/vector_helper.c
              b/target/riscv/vector_helper.c<br class="">
              index d0452a7756..6c47d39251 100644<br class="">
              --- a/target/riscv/vector_helper.c<br class="">
              +++ b/target/riscv/vector_helper.c<br class="">
              @@ -122,6 +122,11 @@ static inline int32_t
              vext_lmul(uint32_t desc)<br class="">
                   return sextract32(FIELD_EX32(simd_data(desc), VDATA,
              LMUL), 0, 3);<br class="">
               }<br class="">
               +static inline uint32_t vext_vta(uint32_t desc)<br
                class="">
              +{<br class="">
              +    return FIELD_EX32(simd_data(desc), VDATA, VTA);<br
                class="">
              +}<br class="">
              +<br class="">
               /*<br class="">
                * Get the maximum number of elements can be operated.<br
                class="">
                *<br class="">
              @@ -140,6 +145,20 @@ static inline uint32_t
              vext_max_elems(uint32_t desc, uint32_t log2_esz)<br
                class="">
                   return scale &lt; 0 ? vlenb &gt;&gt; -scale : vlenb
              &lt;&lt; scale;<br class="">
               }<br class="">
               +/*<br class="">
              + * Get number of total elements, including prestart, body
              and tail elements.<br class="">
              + * Note that when LMUL &lt; 1, the tail includes the
              elements past VLMAX that<br class="">
              + * are held in the same vector register.<br class="">
              + */<br class="">
              +static inline uint32_t vext_get_total_elem(RISCVCPU *cpu,
              target_ulong vtype)<br class="">
              +{<br class="">
              +    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);<br
                class="">
              +    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE,
              VLMUL), 0, 3) &lt; 0 ?<br class="">
              +                  0 : sextract32(FIELD_EX64(vtype, VTYPE,
              VLMUL), 0, 3);<br class="">
              +    return cpu-&gt;cfg.vlen &gt;&gt; (sew + 3 - lmul);<br
                class="">
              +}<br class="">
              +<br class="">
              +<br class="">
               static inline target_ulong adjust_addr(CPURISCVState
              *env, target_ulong addr)<br class="">
               {<br class="">
                   return (addr &amp; env-&gt;cur_pmmask) |
              env-&gt;cur_pmbase;<br class="">
              @@ -172,6 +191,32 @@ static void probe_pages(CPURISCVState
              *env, target_ulong addr,<br class="">
                   }<br class="">
               }<br class="">
               +static void vext_set_elems_1s(void *base, uint32_t
              is_agnostic, uint32_t cnt,<br class="">
              +                              uint32_t tot)<br class="">
              +{<br class="">
              +    if (is_agnostic == 0) {<br class="">
              +        /* policy undisturbed */<br class="">
              +        return;<br class="">
              +    }<br class="">
              +    if (tot - cnt == 0) {<br class="">
              +        return ;<br class="">
              +    }<br class="">
              +    memset(base, -1, tot - cnt);<br class="">
              +}<br class="">
              +<br class="">
              +/* Set agnostic elements to 1s */<br class="">
              +#define GEN_SET_ELEMS_1S(SET_ELEMS_1S_FN, ETYPE, H)
                                         \<br class="">
              +static void SET_ELEMS_1S_FN(void *vd, uint32_t
              is_agnostic, uint32_t idx,      \<br class="">
              +                            uint32_t cnt, uint32_t tot)
                                     \<br class="">
              +{
                                                                             \<br
                class="">
              +    ETYPE *cur = ((ETYPE *)vd + H(idx));
                                                    \<br class="">
              +    vext_set_elems_1s(cur, is_agnostic, cnt, tot);
                                          \<br class="">
              +}<br class="">
              +GEN_SET_ELEMS_1S(vext_set_elems_1s_b, int8_t, H1)<br
                class="">
              +GEN_SET_ELEMS_1S(vext_set_elems_1s_h, int16_t, H2)<br
                class="">
              +GEN_SET_ELEMS_1S(vext_set_elems_1s_w, int32_t, H4)<br
                class="">
              +GEN_SET_ELEMS_1S(vext_set_elems_1s_d, int64_t, H8)<br
                class="">
              +<br class="">
               static inline void vext_set_elem_mask(void *v0, int
              index,<br class="">
                                                     uint8_t value)<br
                class="">
               {<br class="">
              @@ -197,6 +242,14 @@ static inline int vext_elem_mask(void
              *v0, int index)<br class="">
               typedef void vext_ldst_elem_fn(CPURISCVState *env,
              target_ulong addr,<br class="">
                                              uint32_t idx, void *vd,
              uintptr_t retaddr);<br class="">
               +/* set bytes to all 1s for agnostic elements */<br
                class="">
              +typedef void vext_set_elems_1s_fn(void *vd, uint32_t vta,
              uint32_t idx,<br class="">
              +                                  uint32_t cnt, uint32_t
              tot);<br class="">
              +static vext_set_elems_1s_fn *vext_set_elems_1s_fns[4] = {<br
                class="">
              +    vext_set_elems_1s_b, vext_set_elems_1s_h,<br class="">
              +    vext_set_elems_1s_w, vext_set_elems_1s_d<br class="">
              +};<br class="">
              +<br class="">
               #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)
                         \<br class="">
               static void NAME(CPURISCVState *env, abi_ptr addr,
                      \<br class="">
                                uint32_t idx, void *vd, uintptr_t
              retaddr)\<br class="">
              @@ -710,10 +763,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D,
              H8, H8, H8, DO_SUB)<br class="">
                 static void do_vext_vv(void *vd, void *v0, void *vs1,
              void *vs2,<br class="">
                                      CPURISCVState *env, uint32_t desc,<br
                class="">
              -                       opivv2_fn *fn)<br class="">
              +                       opivv2_fn *fn, uint32_t esz)<br
                class="">
               {<br class="">
                   uint32_t vm = vext_vm(desc);<br class="">
                   uint32_t vl = env-&gt;vl;<br class="">
              +    uint32_t vlmax =
              vext_get_total_elem(env_archcpu(env), env-&gt;vtype);<br
                class="">
            </blockquote>
            <br style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">'vlmax' seems a bit confusing here.
              Maybe can use 'total' or 'max' ...</span><br
              style="caret-color: rgb(0, 0, 0); font-family: Helvetica;
              font-size: 12px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              text-align: start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <br style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">Regards,</span><br
              style="caret-color: rgb(0, 0, 0); font-family: Helvetica;
              font-size: 12px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              text-align: start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <br style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 12px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">Weiwei Li</span></div>
        </blockquote>
      </div>
      <br class="">
    </blockquote>
  </body>
</html>

--------------38F8F945702D34469A9979BA--


