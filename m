Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkMfe-0000JP-JR
	for mharc-qemu-riscv@gnu.org; Tue, 09 Nov 2021 03:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkMfa-0000Ha-LA; Tue, 09 Nov 2021 03:39:54 -0500
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:47822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkMfV-0002vL-Gp; Tue, 09 Nov 2021 03:39:54 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608247|-1; CH=green;
 DM=|CONTINUE|false|; DS=||; FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.Lpxb2vl_1636447180; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lpxb2vl_1636447180)
 by smtp.aliyun-inc.com(10.147.42.135);
 Tue, 09 Nov 2021 16:39:40 +0800
Subject: Re: [PATCH 09/13] target/riscv: Adjust vector address with ol
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-10-zhiwei_liu@c-sky.com>
 <851481b9-e973-b3e1-1722-73db47edb772@linaro.org>
 <f84e607c-e16e-ec3f-a7b3-e779b344fcb6@c-sky.com>
 <52357320-6098-c3da-b9de-89b131b85ffb@linaro.org>
 <e045fba1-8361-dd33-8e9b-c22b8e389cf5@c-sky.com>
 <1bd3a3ff-8ca8-ed78-1bc7-c4668965f448@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <08078788-dd46-7e7a-14eb-7eb95c2c9c89@c-sky.com>
Date: Tue, 9 Nov 2021 16:39:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1bd3a3ff-8ca8-ed78-1bc7-c4668965f448@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------0FD829F452B75CDC6955A9EA"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.73; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-73.mail.aliyun.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 08:39:55 -0000

This is a multi-part message in MIME format.
--------------0FD829F452B75CDC6955A9EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/11/9 下午4:18, Richard Henderson wrote:
> On 11/9/21 9:04 AM, LIU Zhiwei wrote:
>> On 2021/11/9 下午2:37, Richard Henderson wrote:
>>
>>> On 11/8/21 10:28 AM, LIU Zhiwei wrote:
>>>> On 2021/11/1 下午7:35, Richard Henderson wrote:
>>>>
>>>>> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>>>>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>>>>> ---
>>>>>>   target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++
>>>>>>   target/riscv/internals.h                |  1 +
>>>>>>   target/riscv/vector_helper.c            | 54 
>>>>>> +++++++++++++++++--------
>>>>>>   3 files changed, 46 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>>>>>> b/target/riscv/insn_trans/trans_rvv.c.inc
>>>>>> index ed042f7bb9..5cd9b802df 100644
>>>>>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>>>>>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>>>>>> @@ -233,6 +233,7 @@ static bool ld_us_op(DisasContext *s, 
>>>>>> arg_r2nfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>>>>>>   }
>>>>>>   @@ -286,6 +287,7 @@ static bool st_us_op(DisasContext *s, 
>>>>>> arg_r2nfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>>>>>>   }
>>>>>>   @@ -365,6 +367,7 @@ static bool ld_stride_op(DisasContext *s, 
>>>>>> arg_rnfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>>>>   }
>>>>>>   @@ -404,6 +407,7 @@ static bool st_stride_op(DisasContext *s, 
>>>>>> arg_rnfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       fn =  fns[seq][s->sew];
>>>>>>       if (fn == NULL) {
>>>>>>           return false;
>>>>>> @@ -490,6 +494,7 @@ static bool ld_index_op(DisasContext *s, 
>>>>>> arg_rnfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>>>>   }
>>>>>>   @@ -542,6 +547,7 @@ static bool st_index_op(DisasContext *s, 
>>>>>> arg_rnfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>>>>   }
>>>>>>   @@ -617,6 +623,7 @@ static bool ldff_op(DisasContext *s, 
>>>>>> arg_r2nfvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>>>>>>   }
>>>>>>   @@ -724,6 +731,7 @@ static bool amo_op(DisasContext *s, 
>>>>>> arg_rwdvm *a, uint8_t seq)
>>>>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>>>>       data = FIELD_DP32(data, VDATA, WD, a->wd);
>>>>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>>>>       return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>>>>   }
>>>>>>   /*
>>>>>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>>>>>> index b15ad394bb..f74b8291e4 100644
>>>>>> --- a/target/riscv/internals.h
>>>>>> +++ b/target/riscv/internals.h
>>>>>> @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
>>>>>>   FIELD(VDATA, LMUL, 9, 2)
>>>>>>   FIELD(VDATA, NF, 11, 4)
>>>>>>   FIELD(VDATA, WD, 11, 1)
>>>>>> +FIELD(VDATA, OL, 15, 2)
>>>>>>     /* float point classify helpers */
>>>>>>   target_ulong fclass_h(uint64_t frs1);
>>>>>> diff --git a/target/riscv/vector_helper.c 
>>>>>> b/target/riscv/vector_helper.c
>>>>>> index 535420ee66..451688c328 100644
>>>>>> --- a/target/riscv/vector_helper.c
>>>>>> +++ b/target/riscv/vector_helper.c
>>>>>> @@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t desc)
>>>>>>       return (simd_data(desc) >> 11) & 0x1;
>>>>>>   }
>>>>>>   +static inline uint32_t vext_ol(uint32_t desc)
>>>>>> +{
>>>>>> +    return FIELD_EX32(simd_data(desc), VDATA, OL);
>>>>>> +}
>>>>>
>>>>> XLEN not OLEN.
>>>> OK.
>>>>>
>>>>>> @@ -123,6 +128,14 @@ static inline uint32_t vext_maxsz(uint32_t 
>>>>>> desc)
>>>>>>       return simd_maxsz(desc) << vext_lmul(desc);
>>>>>>   }
>>>>>>   +static inline target_ulong adjust_addr(target_ulong addr, 
>>>>>> uint32_t olen)
>>>>>> +{
>>>>>> +    if (olen < TARGET_LONG_BITS) {
>>>>>> +        addr &= UINT32_MAX;
>>>>>> +    }
>>>>>> +    return addr;
>>>>>> +}
>>>>>
>>>>> Here's where I'm unsure.  This looks a lot like the changes that 
>>>>> are required to support pointer-masking in vectors, which Alexey 
>>>>> said he was going to look at.
>>>>>
>>>>> (1) Do we need to pass anything in VEXT at all?
>>>>>     We do have CPURISCVState, so we could just use cpu_get_ml,
>>>> Yes, we should use cpu_get_xl.
>>>>> which we would also need for env->mmte etc for pointer masking.
>>>>
>>>> Do you mean env->mpmmask and env->mpmbase? I think yes, we should 
>>>> also adjust these register behaviors with xlen.
>>>
>>> I mean the set of [msu]pmmask and [msu]pmbase, selected as 
>>> appropriate for the current execution mode.
>>>
>>>>> (3) Do we try to streamline the computation by passing down composite
>>>>>     mask and base parameters.  This way we don't need to do complex
>>>>>     examination of ENV to determine execution mode, and instead 
>>>>> always
>>>>>     compute
>>>>>
>>>>>        addr = (addr & mask) | base;
>>>>>
>>>>>     where mask = -1, base = 0 for "normal" addressing, and when
>>>>>     UXLEN == 32, mask <= UINT32_MAX.
>>>>
>>>> Do you mean add env->pmmask and env->pmbase?
>>>>
>>>> I can initialize them in riscv_tr_init_disas_context, such as by 
>>>> env->xpmmask & UINT32_MAX .
>>>>
>>>>>
>>>>> (4) Do we in fact want to pre-compute these into known slots on ENV,
>>>>>     so that we don't have to pass these around as separate 
>>>>> parameters?
>>>>>     We would adjust these values during PM CSR changes and when
>>>>>     changing privilege levels.
>>> For option (3), I was suggesting a mask + base pair passed down from 
>>> TCG-generated code.
>>>
>>> For option (4), I was suggesting embedding a mask + base pair in 
>>> env, which would be re-computed at every privilege level change, 
>>> plus reset and vmload.
>>>
>>> In both cases, the mask would be a combination of [msu]pmmask & 
>>> (RV32 ? UINT32_MAX : UINT64_MAX), as you say.
>>
>> We will calculate [msu]pmmask by  csrrw , and we have ignored high 
>> bits there.
>>
>> Can we just use the [msu]pmmmask?
>
> We could.  However:
>
> In order to select [msu]pmmask, we have to look up the current cpu 
> state.  In order to mask the high bits, we have to look up the current 
> xl, which requires that we look up the current cpu state then extract 
> the xl from misa  and mstatus.
>
> All of which means that we're doing repeated lookups for every memory 
> access.  I am suggesting that we either (3) compile those lookups into 
> the generated code or (4) cache those lookups when state changes (csr 
> writes and priv changes).


Do you mean we should add this code to riscv_tr_init_disas_context

     if (ctx->pm_enabled) {
          switch (priv) {
          case PRV_M:
              env->mask = env->mpmmask;
              env->base = env->mpmbase;
              break;
          case PRV_S:
              env->mask = env->spmmask;
              env->base = env->spmbase;
              break;
          case PRV_U:
              env->mask = env->upmmask;
              env->base = env->upmbase;
              break;
          default:
              g_assert_not_reached();
          }
          ctx->pm_mask = pm_mask[priv];
          ctx->pm_base = pm_base[priv];
          ctx->need_mask = true; /* new flag for mask */

      } else if (get_xlen(ctx)  < TARGET_LONG_BITS) {
          env->mask = UINT32_MAX;
          env->base = 0;
          ctx->pm_mask = tcg_constant_tl(UINT32_MAX);
          ctx->pm_base = tcg_constant_tl(0);

         ctx->need_mask = true;

      } else {
	 env->mask = UINT64_MAX;
          env->base = 0;
      }

Thanks,
Zhiwei

>
>
> r~

--------------0FD829F452B75CDC6955A9EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/11/9 下午4:18, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1bd3a3ff-8ca8-ed78-1bc7-c4668965f448@linaro.org">On
      11/9/21 9:04 AM, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">On 2021/11/9 下午2:37, Richard Henderson
        wrote:
        <br>
        <br>
        <blockquote type="cite">On 11/8/21 10:28 AM, LIU Zhiwei wrote:
          <br>
          <blockquote type="cite">On 2021/11/1 下午7:35, Richard Henderson
            wrote:
            <br>
            <br>
            <blockquote type="cite">On 11/1/21 6:01 AM, LIU Zhiwei
              wrote:
              <br>
              <blockquote type="cite">Signed-off-by: LIU Zhiwei
                <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a>
                <br>
                ---
                <br>
                  target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++
                <br>
                  target/riscv/internals.h                |  1 +
                <br>
                  target/riscv/vector_helper.c            | 54
                +++++++++++++++++--------
                <br>
                  3 files changed, 46 insertions(+), 17 deletions(-)
                <br>
                <br>
                diff --git a/target/riscv/insn_trans/trans_rvv.c.inc
                b/target/riscv/insn_trans/trans_rvv.c.inc
                <br>
                index ed042f7bb9..5cd9b802df 100644
                <br>
                --- a/target/riscv/insn_trans/trans_rvv.c.inc
                <br>
                +++ b/target/riscv/insn_trans/trans_rvv.c.inc
                <br>
                @@ -233,6 +233,7 @@ static bool ld_us_op(DisasContext
                *s, arg_r2nfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return ldst_us_trans(a-&gt;rd, a-&gt;rs1, data,
                fn, s);
                <br>
                  }
                <br>
                  @@ -286,6 +287,7 @@ static bool st_us_op(DisasContext
                *s, arg_r2nfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return ldst_us_trans(a-&gt;rd, a-&gt;rs1, data,
                fn, s);
                <br>
                  }
                <br>
                  @@ -365,6 +367,7 @@ static bool
                ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return ldst_stride_trans(a-&gt;rd, a-&gt;rs1,
                a-&gt;rs2, data, fn, s);
                <br>
                  }
                <br>
                  @@ -404,6 +407,7 @@ static bool
                st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      fn =  fns[seq][s-&gt;sew];
                <br>
                      if (fn == NULL) {
                <br>
                          return false;
                <br>
                @@ -490,6 +494,7 @@ static bool ld_index_op(DisasContext
                *s, arg_rnfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return ldst_index_trans(a-&gt;rd, a-&gt;rs1,
                a-&gt;rs2, data, fn, s);
                <br>
                  }
                <br>
                  @@ -542,6 +547,7 @@ static bool
                st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return ldst_index_trans(a-&gt;rd, a-&gt;rs1,
                a-&gt;rs2, data, fn, s);
                <br>
                  }
                <br>
                  @@ -617,6 +623,7 @@ static bool ldff_op(DisasContext
                *s, arg_r2nfvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, NF, a-&gt;nf);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return ldff_trans(a-&gt;rd, a-&gt;rs1, data, fn,
                s);
                <br>
                  }
                <br>
                  @@ -724,6 +731,7 @@ static bool amo_op(DisasContext
                *s, arg_rwdvm *a, uint8_t seq)
                <br>
                      data = FIELD_DP32(data, VDATA, VM, a-&gt;vm);
                <br>
                      data = FIELD_DP32(data, VDATA, LMUL, s-&gt;lmul);
                <br>
                      data = FIELD_DP32(data, VDATA, WD, a-&gt;wd);
                <br>
                +    data = FIELD_DP32(data, VDATA, OL, s-&gt;ol);
                <br>
                      return amo_trans(a-&gt;rd, a-&gt;rs1, a-&gt;rs2,
                data, fn, s);
                <br>
                  }
                <br>
                  /*
                <br>
                diff --git a/target/riscv/internals.h
                b/target/riscv/internals.h
                <br>
                index b15ad394bb..f74b8291e4 100644
                <br>
                --- a/target/riscv/internals.h
                <br>
                +++ b/target/riscv/internals.h
                <br>
                @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
                <br>
                  FIELD(VDATA, LMUL, 9, 2)
                <br>
                  FIELD(VDATA, NF, 11, 4)
                <br>
                  FIELD(VDATA, WD, 11, 1)
                <br>
                +FIELD(VDATA, OL, 15, 2)
                <br>
                    /* float point classify helpers */
                <br>
                  target_ulong fclass_h(uint64_t frs1);
                <br>
                diff --git a/target/riscv/vector_helper.c
                b/target/riscv/vector_helper.c
                <br>
                index 535420ee66..451688c328 100644
                <br>
                --- a/target/riscv/vector_helper.c
                <br>
                +++ b/target/riscv/vector_helper.c
                <br>
                @@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t
                desc)
                <br>
                      return (simd_data(desc) &gt;&gt; 11) &amp; 0x1;
                <br>
                  }
                <br>
                  +static inline uint32_t vext_ol(uint32_t desc)
                <br>
                +{
                <br>
                +    return FIELD_EX32(simd_data(desc), VDATA, OL);
                <br>
                +}
                <br>
              </blockquote>
              <br>
              XLEN not OLEN.
              <br>
            </blockquote>
            OK.
            <br>
            <blockquote type="cite">
              <br>
              <blockquote type="cite">@@ -123,6 +128,14 @@ static inline
                uint32_t vext_maxsz(uint32_t desc)
                <br>
                      return simd_maxsz(desc) &lt;&lt; vext_lmul(desc);
                <br>
                  }
                <br>
                  +static inline target_ulong adjust_addr(target_ulong
                addr, uint32_t olen)
                <br>
                +{
                <br>
                +    if (olen &lt; TARGET_LONG_BITS) {
                <br>
                +        addr &amp;= UINT32_MAX;
                <br>
                +    }
                <br>
                +    return addr;
                <br>
                +}
                <br>
              </blockquote>
              <br>
              Here's where I'm unsure.  This looks a lot like the
              changes that are required to support pointer-masking in
              vectors, which Alexey said he was going to look at.
              <br>
              <br>
              (1) Do we need to pass anything in VEXT at all?
              <br>
                  We do have CPURISCVState, so we could just use
              cpu_get_ml,
              <br>
            </blockquote>
            Yes, we should use cpu_get_xl.
            <br>
            <blockquote type="cite">which we would also need for
              env-&gt;mmte etc for pointer masking.
              <br>
            </blockquote>
            <br>
            Do you mean env-&gt;mpmmask and env-&gt;mpmbase? I think
            yes, we should also adjust these register behaviors with
            xlen.
            <br>
          </blockquote>
          <br>
          I mean the set of [msu]pmmask and [msu]pmbase, selected as
          appropriate for the current execution mode.
          <br>
          <br>
          <blockquote type="cite">
            <blockquote type="cite">(3) Do we try to streamline the
              computation by passing down composite
              <br>
                  mask and base parameters.  This way we don't need to
              do complex
              <br>
                  examination of ENV to determine execution mode, and
              instead always
              <br>
                  compute
              <br>
              <br>
                     addr = (addr &amp; mask) | base;
              <br>
              <br>
                  where mask = -1, base = 0 for "normal" addressing, and
              when
              <br>
                  UXLEN == 32, mask &lt;= UINT32_MAX.
              <br>
            </blockquote>
            <br>
            Do you mean add env-&gt;pmmask and env-&gt;pmbase?
            <br>
            <br>
            I can initialize them in riscv_tr_init_disas_context, such
            as by env-&gt;xpmmask &amp; UINT32_MAX .
            <br>
            <br>
            <blockquote type="cite">
              <br>
              (4) Do we in fact want to pre-compute these into known
              slots on ENV,
              <br>
                  so that we don't have to pass these around as separate
              parameters?
              <br>
                  We would adjust these values during PM CSR changes and
              when
              <br>
                  changing privilege levels.
              <br>
            </blockquote>
          </blockquote>
          For option (3), I was suggesting a mask + base pair passed
          down from TCG-generated code.
          <br>
          <br>
          For option (4), I was suggesting embedding a mask + base pair
          in env, which would be re-computed at every privilege level
          change, plus reset and vmload.
          <br>
          <br>
          In both cases, the mask would be a combination of [msu]pmmask
          &amp; (RV32 ? UINT32_MAX : UINT64_MAX), as you say.
          <br>
        </blockquote>
        <br>
        We will calculate [msu]pmmask by  csrrw , and we have ignored
        high bits there.
        <br>
        <br>
        Can we just use the [msu]pmmmask?
        <br>
      </blockquote>
      <br>
      We could.  However:
      <br>
      <br>
      In order to select [msu]pmmask, we have to look up the current cpu
      state.  In order to mask the high bits, we have to look up the
      current xl, which requires that we look up the current cpu state
      then extract the xl from misa  and mstatus.
      <br>
      <br>
      All of which means that we're doing repeated lookups for every
      memory access.  I am suggesting that we either (3) compile those
      lookups into the generated code or (4) cache those lookups when
      state changes (csr writes and priv changes).
      <br>
    </blockquote>
    <p><br>
      Do you mean we should add this code to riscv_tr_init_disas_context</p>
    <pre>    if (ctx-&gt;pm_enabled) {
         switch (priv) {
         case PRV_M:
             env-&gt;mask = env-&gt;mpmmask;
             env-&gt;base = env-&gt;mpmbase;
             break;
         case PRV_S:
             env-&gt;mask = env-&gt;spmmask;
             env-&gt;base = env-&gt;spmbase;
             break;
         case PRV_U:
             env-&gt;mask = env-&gt;upmmask;
             env-&gt;base = env-&gt;upmbase;
             break;
         default:
             g_assert_not_reached();
         }
         ctx-&gt;pm_mask = pm_mask[priv];
         ctx-&gt;pm_base = pm_base[priv];
         ctx-&gt;need_mask = true; /* new flag for mask */</pre>
    <pre>     } else if (get_xlen(ctx)  &lt; TARGET_LONG_BITS) {
         env-&gt;mask = UINT32_MAX;
         env-&gt;base = 0;
         ctx-&gt;pm_mask = tcg_constant_tl(UINT32_MAX);
         ctx-&gt;pm_base = tcg_constant_tl(0);</pre>
    <pre>        ctx-&gt;need_mask = true;</pre>
    <pre>     } else {
	 env-&gt;mask = UINT64_MAX;
         env-&gt;base = 0;
     }

Thanks,
Zhiwei
</pre>
    <blockquote type="cite"
      cite="mid:1bd3a3ff-8ca8-ed78-1bc7-c4668965f448@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------0FD829F452B75CDC6955A9EA--

