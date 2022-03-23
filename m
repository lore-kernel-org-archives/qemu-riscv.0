Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nX1Dj-00037O-Ka
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 09:40:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yueh.ting.chen@gmail.com>)
 id 1nWvRz-0002Xk-JN; Wed, 23 Mar 2022 03:30:35 -0400
Received: from [2607:f8b0:4864:20::102b] (port=44797
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yueh.ting.chen@gmail.com>)
 id 1nWvRw-0001rR-Vi; Wed, 23 Mar 2022 03:30:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so932095pjp.3; 
 Wed, 23 Mar 2022 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=N9kZJUA8xdP5vqBbxNXt5lOgJRwcmGOou+pxBqLE96s=;
 b=CW+gniwG9yh38tX7GQAO6Sha6I6/Z3RLQtla6RdBV6qSEG811Pvx+t1MmE4A+l6Tvm
 M2uZGQlupssJRik1q+vB549n7OjXQUNnIwknJeW+un7UzoXA8tpNHCj2EE1cGXCqKAbO
 hm2U9wQEgA00K9s8LYRyOvwlI/ODgY2wPu8gjm0a6tEh0BuociD8Z8PglwBC+ASu69M6
 qDPBoEyqVALGj+1fF7U17J83tUuJsP6gloiDoonuZbztsR3IQkCSCKN4KMxsPkJOrrOO
 DNkhh5YIWZ93cSNwHvp9hqCUNSeq0KUQhgace11myqEsTHnyCp2m15caBTAHsK0rCFWf
 h/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=N9kZJUA8xdP5vqBbxNXt5lOgJRwcmGOou+pxBqLE96s=;
 b=cMZR4ThIO7SJHbCZWccNiklqbZBl0T/KRDLBB5rZYxAhaEYb69y5ohSi8Xz+JBr0vY
 UhwyNtqsG3+H/9LHJEbG+01R5U8OT4xbHZKzprYU/YVWa4eKXIek8SpzwyU9jOw0QLb+
 uvaDg21sgk/+4YtFTtXVlpexX9Wj/zTUbUzz6F8ifMVEQz9fl1BVjw5mFkmXJEfV0u9H
 jbWuLSvKfWCEsIIJ1N4emHOTg2M065VZ6fX42nOlk673Q5Tl0e9Umil1/xDUdQUlSm0H
 h2SL7PzCobv/snsswBVqydpfBc1AiUu01X/ILrPoKH9fpw0HMgfHz/qoJ885CjilyJtf
 HvKQ==
X-Gm-Message-State: AOAM533xA7thecVaJJn3dQBUDnVN9Oaq81k8m68dIAPtPmyPD+l4bR1u
 9HdfzxitRR/O5eNSHeur4pnLGx7BE6On6A==
X-Google-Smtp-Source: ABdhPJw/XKd06S2Kcz+twQ17IDnbo26v+aB0+EkCaVETWE7BALoWEcNlW6zOr8FfeXTdDK2jWJhVoA==
X-Received: by 2002:a17:902:ce8b:b0:154:42e2:924e with SMTP id
 f11-20020a170902ce8b00b0015442e2924emr18085147plg.138.1648020630650; 
 Wed, 23 Mar 2022 00:30:30 -0700 (PDT)
Received: from smtpclient.apple (111-250-91-21.dynamic-ip.hinet.net.
 [111.250.91.21]) by smtp.gmail.com with ESMTPSA id
 n3-20020a056a0007c300b004fa3e9f59cdsm19926513pfu.39.2022.03.23.00.30.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Mar 2022 00:30:30 -0700 (PDT)
From: =?utf-8?B?6Zmz57SE5bu3?= <yueh.ting.chen@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E2CBCCD7-A232-4A03-BCC3-B22EC6845A52"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v3 04/14] target/riscv: rvv: Add tail agnostic for vv
 instructions
Date: Wed, 23 Mar 2022 15:30:28 +0800
References: <164800788276.12449.15168787569124374586-4@git.sr.ht>
 <145ed096-a2fb-7dd3-c60b-d93055869ea8@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <145ed096-a2fb-7dd3-c60b-d93055869ea8@iscas.ac.cn>
Message-Id: <4DA46204-103B-416B-A367-061CA68BDC73@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=yueh.ting.chen@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Mar 2022 09:40:11 -0400
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
X-List-Received-Date: Wed, 23 Mar 2022 07:30:36 -0000


--Apple-Mail=_E2CBCCD7-A232-4A03-BCC3-B22EC6845A52
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

How about =E2=80=98total_elem'?

> Weiwei Li <liweiwei@iscas.ac.cn> =E6=96=BC 2022=E5=B9=B43=E6=9C=8823=E6=97=
=A5 =E4=B8=8B=E5=8D=883:28 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
>=20
> =E5=9C=A8 2022/3/1 =E4=B8=8B=E5=8D=885:07, ~eopxd =E5=86=99=E9=81=93:
>> From: eopXD <eop.chen@sifive.com>
>>=20
>> This is the first commit regarding the tail agnostic behavior.
>> Added option 'rvv_ta_all_1s' to enable the behavior, the option
>> is default to false.
>>=20
>> Signed-off-by: eop Chen <eop.chen@sifive.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>  target/riscv/cpu.c                      |   1 +
>>  target/riscv/cpu.h                      |   2 +
>>  target/riscv/cpu_helper.c               |   2 +
>>  target/riscv/insn_trans/trans_rvv.c.inc |   1 +
>>  target/riscv/internals.h                |   5 +-
>>  target/riscv/translate.c                |   2 +
>>  target/riscv/vector_helper.c            | 315 =
++++++++++++++----------
>>  7 files changed, 197 insertions(+), 131 deletions(-)
>>=20
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ddda4906ff..cd4cf4b41e 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] =3D {
>>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>>        DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, =
DEFAULT_RSTVEC),
>> +    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, =
false),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index c069fe85fa..8c4a79b5a0 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -369,6 +369,7 @@ struct RISCVCPUConfig {
>>      bool ext_zhinxmin;
>>      bool ext_zve32f;
>>      bool ext_zve64f;
>> +    bool rvv_ta_all_1s;
>>        /* Vendor-specific custom extensions */
>>      bool ext_XVentanaCondOps;
>> @@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>>  /* If PointerMasking should be applied */
>>  FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>>  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>> +FIELD(TB_FLAGS, VTA, 24, 1)
>>    #ifdef TARGET_RISCV32
>>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 1c60fb2e80..2941c88c31 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, =
target_ulong *pc,
>>          flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
>>                      FIELD_EX64(env->vtype, VTYPE, VLMUL));
>>          flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, =
vl_eq_vlmax);
>> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
>> +                    FIELD_EX64(env->vtype, VTYPE, VTA));
>>      } else {
>>          flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>>      }
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc =
b/target/riscv/insn_trans/trans_rvv.c.inc
>> index 1e51a3e79c..603abe0e9f 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -1231,6 +1231,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, =
GVecGen3Fn *gvec_fn,
>>            data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
>> +        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>>                             cpu_env, s->cfg_ptr->vlen / 8,
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index dbb322bfa7..512c6c30cf 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -24,8 +24,9 @@
>>  /* share data between vector helpers and decode code */
>>  FIELD(VDATA, VM, 0, 1)
>>  FIELD(VDATA, LMUL, 1, 3)
>> -FIELD(VDATA, NF, 4, 4)
>> -FIELD(VDATA, WD, 4, 1)
>> +FIELD(VDATA, VTA, 4, 1)
>> +FIELD(VDATA, NF, 5, 4)
>> +FIELD(VDATA, WD, 5, 1)
>>    /* float point classify helpers */
>>  target_ulong fclass_h(uint64_t frs1);
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index fac998a6b5..7775dade26 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -94,6 +94,7 @@ typedef struct DisasContext {
>>       */
>>      int8_t lmul;
>>      uint8_t sew;
>> +    uint8_t vta;
>>      target_ulong vstart;
>>      bool vl_eq_vlmax;
>>      uint8_t ntemp;
>> @@ -1083,6 +1084,7 @@ static void =
riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>      ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>>      ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>>      ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), =
0, 3);
>> +    ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && =
cpu->cfg.rvv_ta_all_1s;
>>      ctx->vstart =3D env->vstart;
>>      ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, =
VL_EQ_VLMAX);
>>      ctx->misa_mxl_max =3D env->misa_mxl_max;
>> diff --git a/target/riscv/vector_helper.c =
b/target/riscv/vector_helper.c
>> index d0452a7756..6c47d39251 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
>>      return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, =
3);
>>  }
>>  +static inline uint32_t vext_vta(uint32_t desc)
>> +{
>> +    return FIELD_EX32(simd_data(desc), VDATA, VTA);
>> +}
>> +
>>  /*
>>   * Get the maximum number of elements can be operated.
>>   *
>> @@ -140,6 +145,20 @@ static inline uint32_t vext_max_elems(uint32_t =
desc, uint32_t log2_esz)
>>      return scale < 0 ? vlenb >> -scale : vlenb << scale;
>>  }
>>  +/*
>> + * Get number of total elements, including prestart, body and tail =
elements.
>> + * Note that when LMUL < 1, the tail includes the elements past =
VLMAX that
>> + * are held in the same vector register.
>> + */
>> +static inline uint32_t vext_get_total_elem(RISCVCPU *cpu, =
target_ulong vtype)
>> +{
>> +    uint8_t sew =3D FIELD_EX64(vtype, VTYPE, VSEW);
>> +    int8_t lmul =3D sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, =
3) < 0 ?
>> +                  0 : sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, =
3);
>> +    return cpu->cfg.vlen >> (sew + 3 - lmul);
>> +}
>> +
>> +
>>  static inline target_ulong adjust_addr(CPURISCVState *env, =
target_ulong addr)
>>  {
>>      return (addr & env->cur_pmmask) | env->cur_pmbase;
>> @@ -172,6 +191,32 @@ static void probe_pages(CPURISCVState *env, =
target_ulong addr,
>>      }
>>  }
>>  +static void vext_set_elems_1s(void *base, uint32_t is_agnostic, =
uint32_t cnt,
>> +                              uint32_t tot)
>> +{
>> +    if (is_agnostic =3D=3D 0) {
>> +        /* policy undisturbed */
>> +        return;
>> +    }
>> +    if (tot - cnt =3D=3D 0) {
>> +        return ;
>> +    }
>> +    memset(base, -1, tot - cnt);
>> +}
>> +
>> +/* Set agnostic elements to 1s */
>> +#define GEN_SET_ELEMS_1S(SET_ELEMS_1S_FN, ETYPE, H)                  =
          \
>> +static void SET_ELEMS_1S_FN(void *vd, uint32_t is_agnostic, uint32_t =
idx,      \
>> +                            uint32_t cnt, uint32_t tot)              =
          \
>> +{                                                                    =
          \
>> +    ETYPE *cur =3D ((ETYPE *)vd + H(idx));                           =
            \
>> +    vext_set_elems_1s(cur, is_agnostic, cnt, tot);                   =
          \
>> +}
>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_b, int8_t, H1)
>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_h, int16_t, H2)
>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_w, int32_t, H4)
>> +GEN_SET_ELEMS_1S(vext_set_elems_1s_d, int64_t, H8)
>> +
>>  static inline void vext_set_elem_mask(void *v0, int index,
>>                                        uint8_t value)
>>  {
>> @@ -197,6 +242,14 @@ static inline int vext_elem_mask(void *v0, int =
index)
>>  typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong =
addr,
>>                                 uint32_t idx, void *vd, uintptr_t =
retaddr);
>>  +/* set bytes to all 1s for agnostic elements */
>> +typedef void vext_set_elems_1s_fn(void *vd, uint32_t vta, uint32_t =
idx,
>> +                                  uint32_t cnt, uint32_t tot);
>> +static vext_set_elems_1s_fn *vext_set_elems_1s_fns[4] =3D {
>> +    vext_set_elems_1s_b, vext_set_elems_1s_h,
>> +    vext_set_elems_1s_w, vext_set_elems_1s_d
>> +};
>> +
>>  #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
>>  static void NAME(CPURISCVState *env, abi_ptr addr,         \
>>                   uint32_t idx, void *vd, uintptr_t retaddr)\
>> @@ -710,10 +763,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, =
H8, DO_SUB)
>>    static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>>                         CPURISCVState *env, uint32_t desc,
>> -                       opivv2_fn *fn)
>> +                       opivv2_fn *fn, uint32_t esz)
>>  {
>>      uint32_t vm =3D vext_vm(desc);
>>      uint32_t vl =3D env->vl;
>> +    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), =
env->vtype);
>=20
> 'vlmax' seems a bit confusing here. Maybe can use 'total' or 'max' ...
>=20
> Regards,
>=20
> Weiwei Li


--Apple-Mail=_E2CBCCD7-A232-4A03-BCC3-B22EC6845A52
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">How =
about =E2=80=98total_elem'?<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">Weiwei Li &lt;<a =
href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC 2022=E5=B9=B43=E6=9C=882=
3=E6=97=A5 =E4=B8=8B=E5=8D=883:28 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">=E5=9C=A8 2022/3/1 =E4=B8=8B=E5=8D=885:07, ~eopxd =
=E5=86=99=E9=81=93:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">From: eopXD &lt;<a =
href=3D"mailto:eop.chen@sifive.com" =
class=3D"">eop.chen@sifive.com</a>&gt;<br class=3D""><br class=3D"">This =
is the first commit regarding the tail agnostic behavior.<br =
class=3D"">Added option 'rvv_ta_all_1s' to enable the behavior, the =
option<br class=3D"">is default to false.<br class=3D""><br =
class=3D"">Signed-off-by: eop Chen &lt;<a =
href=3D"mailto:eop.chen@sifive.com" =
class=3D"">eop.chen@sifive.com</a>&gt;<br class=3D"">Reviewed-by: Frank =
Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" =
class=3D"">frank.chang@sifive.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;target/riscv/cpu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;1 +<br =
class=3D"">&nbsp;target/riscv/cpu.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;2 +<br =
class=3D"">&nbsp;target/riscv/cpu_helper.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;&nbsp;2 +<br =
class=3D"">&nbsp;target/riscv/insn_trans/trans_rvv.c.inc | &nbsp;&nbsp;1 =
+<br class=3D"">&nbsp;target/riscv/internals.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;&nbsp;5 +-<br =
class=3D"">&nbsp;target/riscv/translate.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;&nbsp;2 +<br =
class=3D"">&nbsp;target/riscv/vector_helper.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 315 =
++++++++++++++----------<br class=3D"">&nbsp;7 files changed, 197 =
insertions(+), 131 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/target/riscv/cpu.c b/target/riscv/cpu.c<br class=3D"">index =
ddda4906ff..cd4cf4b41e 100644<br class=3D"">--- a/target/riscv/cpu.c<br =
class=3D"">+++ b/target/riscv/cpu.c<br class=3D"">@@ -810,6 +810,7 @@ =
static Property riscv_cpu_properties[] =3D {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DEFINE_PROP_BOOL("x-aia", =
RISCVCPU, cfg.aia, false),<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DEFINE_PROP_UINT64("r=
esetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, =
cfg.rvv_ta_all_1s, false),<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DEFINE_PROP_END_OF_LIST(),<br =
class=3D"">&nbsp;};<br class=3D"">&nbsp;diff --git a/target/riscv/cpu.h =
b/target/riscv/cpu.h<br class=3D"">index c069fe85fa..8c4a79b5a0 =
100644<br class=3D"">--- a/target/riscv/cpu.h<br class=3D"">+++ =
b/target/riscv/cpu.h<br class=3D"">@@ -369,6 +369,7 @@ struct =
RISCVCPUConfig {<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool =
ext_zhinxmin;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool =
ext_zve32f;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool =
ext_zve64f;<br class=3D"">+ &nbsp;&nbsp;&nbsp;bool rvv_ta_all_1s;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Vendor-specific =
custom extensions */<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool =
ext_XVentanaCondOps;<br class=3D"">@@ -516,6 +517,7 @@ FIELD(TB_FLAGS, =
XL, 20, 2)<br class=3D"">&nbsp;/* If PointerMasking should be applied =
*/<br class=3D"">&nbsp;FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)<br =
class=3D"">&nbsp;FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)<br =
class=3D"">+FIELD(TB_FLAGS, VTA, 24, 1)<br =
class=3D"">&nbsp;&nbsp;&nbsp;#ifdef TARGET_RISCV32<br =
class=3D"">&nbsp;#define riscv_cpu_mxl(env) &nbsp;((void)(env), =
MXL_RV32)<br class=3D"">diff --git a/target/riscv/cpu_helper.c =
b/target/riscv/cpu_helper.c<br class=3D"">index 1c60fb2e80..2941c88c31 =
100644<br class=3D"">--- a/target/riscv/cpu_helper.c<br class=3D"">+++ =
b/target/riscv/cpu_helper.c<br class=3D"">@@ -65,6 +65,8 @@ void =
cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags =3D=
 FIELD_DP32(flags, TB_FLAGS, LMUL,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_EX64(=
env-&gt;vtype, VTYPE, VLMUL));<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags =3D=
 FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags =3D FIELD_DP32(flags, =
TB_FLAGS, VTA,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_EX64(env-&gt;vtype, VTYPE, =
VTA));<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags =3D=
 FIELD_DP32(flags, TB_FLAGS, VILL, 1);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">diff --git =
a/target/riscv/insn_trans/trans_rvv.c.inc =
b/target/riscv/insn_trans/trans_rvv.c.inc<br class=3D"">index =
1e51a3e79c..603abe0e9f 100644<br class=3D"">--- =
a/target/riscv/insn_trans/trans_rvv.c.inc<br class=3D"">+++ =
b/target/riscv/insn_trans/trans_rvv.c.inc<br class=3D"">@@ -1231,6 =
+1231,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn =
*gvec_fn,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;data =3D FIELD_DP32(data, VDATA, VM, a-&gt;vm);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VTA, s-&gt;vta);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tcg_gen_g=
vec_4_ptr(vreg_ofs(s, a-&gt;rd), vreg_ofs(s, 0),<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vreg_ofs(s, a-&gt;rs1), vreg_ofs(s, =
a-&gt;rs2),<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpu_env, s-&gt;cfg_ptr-&gt;vlen / 8,<br =
class=3D"">diff --git a/target/riscv/internals.h =
b/target/riscv/internals.h<br class=3D"">index dbb322bfa7..512c6c30cf =
100644<br class=3D"">--- a/target/riscv/internals.h<br class=3D"">+++ =
b/target/riscv/internals.h<br class=3D"">@@ -24,8 +24,9 @@<br =
class=3D"">&nbsp;/* share data between vector helpers and decode code =
*/<br class=3D"">&nbsp;FIELD(VDATA, VM, 0, 1)<br =
class=3D"">&nbsp;FIELD(VDATA, LMUL, 1, 3)<br class=3D"">-FIELD(VDATA, =
NF, 4, 4)<br class=3D"">-FIELD(VDATA, WD, 4, 1)<br =
class=3D"">+FIELD(VDATA, VTA, 4, 1)<br class=3D"">+FIELD(VDATA, NF, 5, =
4)<br class=3D"">+FIELD(VDATA, WD, 5, 1)<br =
class=3D"">&nbsp;&nbsp;&nbsp;/* float point classify helpers */<br =
class=3D"">&nbsp;target_ulong fclass_h(uint64_t frs1);<br class=3D"">diff =
--git a/target/riscv/translate.c b/target/riscv/translate.c<br =
class=3D"">index fac998a6b5..7775dade26 100644<br class=3D"">--- =
a/target/riscv/translate.c<br class=3D"">+++ =
b/target/riscv/translate.c<br class=3D"">@@ -94,6 +94,7 @@ typedef =
struct DisasContext {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int8_t lmul;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t sew;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint8_t vta;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;target_ulong vstart;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool vl_eq_vlmax;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t ntemp;<br class=3D"">@@ =
-1083,6 +1084,7 @@ static void =
riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;vill =3D =
FIELD_EX32(tb_flags, TB_FLAGS, VILL);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;sew =3D =
FIELD_EX32(tb_flags, TB_FLAGS, SEW);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;lmul =3D =
sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;ctx-&gt;vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) =
&amp;&amp; cpu-&gt;cfg.rvv_ta_all_1s;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;vstart =3D =
env-&gt;vstart;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;vl_eq_vlmax =3D =
FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;misa_mxl_max =3D =
env-&gt;misa_mxl_max;<br class=3D"">diff --git =
a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br =
class=3D"">index d0452a7756..6c47d39251 100644<br class=3D"">--- =
a/target/riscv/vector_helper.c<br class=3D"">+++ =
b/target/riscv/vector_helper.c<br class=3D"">@@ -122,6 +122,11 @@ static =
inline int32_t vext_lmul(uint32_t desc)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);<br =
class=3D"">&nbsp;}<br class=3D"">&nbsp;+static inline uint32_t =
vext_vta(uint32_t desc)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;return FIELD_EX32(simd_data(desc), VDATA, VTA);<br =
class=3D"">+}<br class=3D"">+<br class=3D"">&nbsp;/*<br =
class=3D"">&nbsp;&nbsp;* Get the maximum number of elements can be =
operated.<br class=3D"">&nbsp;&nbsp;*<br class=3D"">@@ -140,6 +145,20 @@ =
static inline uint32_t vext_max_elems(uint32_t desc, uint32_t =
log2_esz)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return scale &lt; =
0 ? vlenb &gt;&gt; -scale : vlenb &lt;&lt; scale;<br class=3D"">&nbsp;}<br=
 class=3D"">&nbsp;+/*<br class=3D"">+ * Get number of total elements, =
including prestart, body and tail elements.<br class=3D"">+ * Note that =
when LMUL &lt; 1, the tail includes the elements past VLMAX that<br =
class=3D"">+ * are held in the same vector register.<br class=3D"">+ =
*/<br class=3D"">+static inline uint32_t vext_get_total_elem(RISCVCPU =
*cpu, target_ulong vtype)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint8_t sew =3D FIELD_EX64(vtype, VTYPE, VSEW);<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;int8_t lmul =3D =
sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3) &lt; 0 ?<br class=3D"">+=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 : sextract32(FIELD_EX64(vtype, VTYPE, =
VLMUL), 0, 3);<br class=3D"">+ &nbsp;&nbsp;&nbsp;return cpu-&gt;cfg.vlen =
&gt;&gt; (sew + 3 - lmul);<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+<br class=3D"">&nbsp;static inline target_ulong =
adjust_addr(CPURISCVState *env, target_ulong addr)<br =
class=3D"">&nbsp;{<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
(addr &amp; env-&gt;cur_pmmask) | env-&gt;cur_pmbase;<br class=3D"">@@ =
-172,6 +191,32 @@ static void probe_pages(CPURISCVState *env, =
target_ulong addr,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;}<br class=3D"">&nbsp;+static void =
vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t tot)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;if (is_agnostic =3D=3D 0) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* policy undisturbed */<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;}<br class=3D"">+ &nbsp;&nbsp;&nbsp;if =
(tot - cnt =3D=3D 0) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D"">+ &nbsp;&nbsp;&nbsp;memset(base, -1, =
tot - cnt);<br class=3D"">+}<br class=3D"">+<br class=3D"">+/* Set =
agnostic elements to 1s */<br class=3D"">+#define =
GEN_SET_ELEMS_1S(SET_ELEMS_1S_FN, ETYPE, H) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;\<br class=3D"">+static void SET_ELEMS_1S_FN(void *vd, =
uint32_t is_agnostic, uint32_t idx, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;uint32_t cnt, uint32_t tot) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br =
class=3D"">+{ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;\<br class=3D"">+ &nbsp;&nbsp;&nbsp;ETYPE *cur =3D =
((ETYPE *)vd + H(idx)); =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;\<br class=3D"">+ &nbsp;&nbsp;&nbsp;vext_set_elems_1s(cur, =
is_agnostic, cnt, tot); =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;\<br class=3D"">+}<br =
class=3D"">+GEN_SET_ELEMS_1S(vext_set_elems_1s_b, int8_t, H1)<br =
class=3D"">+GEN_SET_ELEMS_1S(vext_set_elems_1s_h, int16_t, H2)<br =
class=3D"">+GEN_SET_ELEMS_1S(vext_set_elems_1s_w, int32_t, H4)<br =
class=3D"">+GEN_SET_ELEMS_1S(vext_set_elems_1s_d, int64_t, H8)<br =
class=3D"">+<br class=3D"">&nbsp;static inline void =
vext_set_elem_mask(void *v0, int index,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;uint8_t value)<br class=3D"">&nbsp;{<br =
class=3D"">@@ -197,6 +242,14 @@ static inline int vext_elem_mask(void =
*v0, int index)<br class=3D"">&nbsp;typedef void =
vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t idx, =
void *vd, uintptr_t retaddr);<br class=3D"">&nbsp;+/* set bytes to all =
1s for agnostic elements */<br class=3D"">+typedef void =
vext_set_elems_1s_fn(void *vd, uint32_t vta, uint32_t idx,<br class=3D"">+=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t cnt, uint32_t =
tot);<br class=3D"">+static vext_set_elems_1s_fn =
*vext_set_elems_1s_fns[4] =3D {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;vext_set_elems_1s_b, vext_set_elems_1s_h,<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;vext_set_elems_1s_w, =
vext_set_elems_1s_d<br class=3D"">+};<br class=3D"">+<br =
class=3D"">&nbsp;#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br =
class=3D"">&nbsp;static void NAME(CPURISCVState *env, abi_ptr addr, =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t idx, void *vd, =
uintptr_t retaddr)\<br class=3D"">@@ -710,10 +763,12 @@ RVVCALL(OPIVV2, =
vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)<br =
class=3D"">&nbsp;&nbsp;&nbsp;static void do_vext_vv(void *vd, void *v0, =
void *vs1, void *vs2,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;CPURISCVState *env, uint32_t desc,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opivv2_fn =
*fn)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opivv2_fn *fn, =
uint32_t esz)<br class=3D"">&nbsp;{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t vm =3D =
vext_vm(desc);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t vl =3D=
 env-&gt;vl;<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint32_t vlmax =3D =
vext_get_total_elem(env_archcpu(env), env-&gt;vtype);<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">'vlmax' seems a bit confusing here. Maybe can use 'total' or =
'max' ...</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Regards,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Weiwei Li</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_E2CBCCD7-A232-4A03-BCC3-B22EC6845A52--

