Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mk0xi-0001hh-49
	for mharc-qemu-riscv@gnu.org; Mon, 08 Nov 2021 04:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mk0xf-0001e9-Sg; Mon, 08 Nov 2021 04:29:07 -0500
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:34253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mk0xS-0004dy-2L; Mon, 08 Nov 2021 04:29:07 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436326|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0173972-0.000499226-0.982104;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LpO54no_1636363723; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LpO54no_1636363723)
 by smtp.aliyun-inc.com(10.147.42.22); Mon, 08 Nov 2021 17:28:44 +0800
Subject: Re: [PATCH 09/13] target/riscv: Adjust vector address with ol
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-10-zhiwei_liu@c-sky.com>
 <851481b9-e973-b3e1-1722-73db47edb772@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <f84e607c-e16e-ec3f-a7b3-e779b344fcb6@c-sky.com>
Date: Mon, 8 Nov 2021 17:28:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <851481b9-e973-b3e1-1722-73db47edb772@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.101; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-101.mail.aliyun.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Nov 2021 09:29:08 -0000

On 2021/11/1 下午7:35, Richard Henderson wrote:

> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++
>>   target/riscv/internals.h                |  1 +
>>   target/riscv/vector_helper.c            | 54 +++++++++++++++++--------
>>   3 files changed, 46 insertions(+), 17 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>> b/target/riscv/insn_trans/trans_rvv.c.inc
>> index ed042f7bb9..5cd9b802df 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -233,6 +233,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm 
>> *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>>   }
>>   @@ -286,6 +287,7 @@ static bool st_us_op(DisasContext *s, 
>> arg_r2nfvm *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>>   }
>>   @@ -365,6 +367,7 @@ static bool ld_stride_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>   }
>>   @@ -404,6 +407,7 @@ static bool st_stride_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       fn =  fns[seq][s->sew];
>>       if (fn == NULL) {
>>           return false;
>> @@ -490,6 +494,7 @@ static bool ld_index_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>   }
>>   @@ -542,6 +547,7 @@ static bool st_index_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>   }
>>   @@ -617,6 +623,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm 
>> *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>>   }
>>   @@ -724,6 +731,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm 
>> *a, uint8_t seq)
>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>       data = FIELD_DP32(data, VDATA, WD, a->wd);
>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>       return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>   }
>>   /*
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index b15ad394bb..f74b8291e4 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
>>   FIELD(VDATA, LMUL, 9, 2)
>>   FIELD(VDATA, NF, 11, 4)
>>   FIELD(VDATA, WD, 11, 1)
>> +FIELD(VDATA, OL, 15, 2)
>>     /* float point classify helpers */
>>   target_ulong fclass_h(uint64_t frs1);
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index 535420ee66..451688c328 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t desc)
>>       return (simd_data(desc) >> 11) & 0x1;
>>   }
>>   +static inline uint32_t vext_ol(uint32_t desc)
>> +{
>> +    return FIELD_EX32(simd_data(desc), VDATA, OL);
>> +}
>
> XLEN not OLEN.
OK.
>
>> @@ -123,6 +128,14 @@ static inline uint32_t vext_maxsz(uint32_t desc)
>>       return simd_maxsz(desc) << vext_lmul(desc);
>>   }
>>   +static inline target_ulong adjust_addr(target_ulong addr, uint32_t 
>> olen)
>> +{
>> +    if (olen < TARGET_LONG_BITS) {
>> +        addr &= UINT32_MAX;
>> +    }
>> +    return addr;
>> +}
>
> Here's where I'm unsure.  This looks a lot like the changes that are 
> required to support pointer-masking in vectors, which Alexey said he 
> was going to look at.
>
> (1) Do we need to pass anything in VEXT at all?
>     We do have CPURISCVState, so we could just use cpu_get_ml,
Yes, we should use cpu_get_xl.
> which we would also need for env->mmte etc for pointer masking.

Do you mean env->mpmmask and env->mpmbase? I think yes, we should also 
adjust these register behaviors with xlen.

>
> (2) Do we try to streamline the "normal" case with a simple bit in VEXT
>     that indicates if the address needs modification at all?  I.e. the
>     bit is set if UXLEN < TARGET_LONG_BITS or if PM_ENABLED?
>
> (3) Do we try to streamline the computation by passing down composite
>     mask and base parameters.  This way we don't need to do complex
>     examination of ENV to determine execution mode, and instead always
>     compute
>
>        addr = (addr & mask) | base;
>
>     where mask = -1, base = 0 for "normal" addressing, and when
>     UXLEN == 32, mask <= UINT32_MAX.

Do you mean add env->pmmask and env->pmbase?

I can initialize themin riscv_tr_init_disas_context, such as by 
env->xpmmask & UINT32_MAX .

>
> (4) Do we in fact want to pre-compute these into known slots on ENV,
>     so that we don't have to pass these around as separate parameters?
>     We would adjust these values during PM CSR changes and when
>     changing privilege levels.
>
>
> r~

