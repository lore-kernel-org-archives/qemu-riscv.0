Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mk17Q-0008UH-Ne
	for mharc-qemu-riscv@gnu.org; Mon, 08 Nov 2021 04:39:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mk17O-0008RN-Sp; Mon, 08 Nov 2021 04:39:10 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mk17K-0000LP-4s; Mon, 08 Nov 2021 04:39:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436297|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00779985-7.29053e-05-0.992127;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LpN18GC_1636364339; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LpN18GC_1636364339)
 by smtp.aliyun-inc.com(10.147.40.44); Mon, 08 Nov 2021 17:38:59 +0800
Subject: Re: [PATCH 10/13] target/riscv: Adjust scalar reg in vector with ol
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-11-zhiwei_liu@c-sky.com>
 <3c57a3d2-f47d-a0d8-c209-48f002b3c91e@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <df327c75-f6b2-f3ea-4263-b9a874654672@c-sky.com>
Date: Mon, 8 Nov 2021 17:38:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3c57a3d2-f47d-a0d8-c209-48f002b3c91e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Nov 2021 09:39:11 -0000


On 2021/11/2 上午12:33, Richard Henderson wrote:
> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>> @@ -2677,6 +2677,7 @@ static bool trans_vmv_s_x(DisasContext *s, 
>> arg_vmv_s_x *a)
>>           /* This instruction ignores LMUL and vector register groups */
>>           int maxsz = s->vlen >> 3;
>>           TCGv_i64 t1;
>> +        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
>>           TCGLabel *over = gen_new_label();
>>             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>> @@ -2686,7 +2687,7 @@ static bool trans_vmv_s_x(DisasContext *s, 
>> arg_vmv_s_x *a)
>>           }
>>             t1 = tcg_temp_new_i64();
>> -        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
>> +        tcg_gen_extu_tl_i64(t1, src1);
>>           vec_element_storei(s, a->rd, 0, t1);
>>           tcg_temp_free_i64(t1);
>>       done:
>
> This isn't actually correct.  Or, may have been correct for the 0.7.1 
> revision,
Yes.
> but the rvv 1.0 revision has a sign-extend here.
>
> This probably shouldn't be touched until the rvv 1.0 patch set comes in.

I try to make all sub extensions upstream are right.

Or we have to make an assert that the uxl32 is not ready for RVV.

>
>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index 451688c328..5bdbbf7c71 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -4763,6 +4763,7 @@ void HELPER(NAME)(void *vd, void *v0, 
>> target_ulong s1, void *vs2,         \
>>       uint32_t mlen = 
>> vext_mlen(desc);                                      \
>>       uint32_t vlmax = env_archcpu(env)->cfg.vlen / 
>> mlen;                   \
>>       uint32_t vm = 
>> vext_vm(desc);                                          \
>> +    uint32_t olen = 16 << 
>> vext_ol(desc);                                  \
>>       uint32_t vl = 
>> env->vl;                                                \
>>       uint32_t 
>> i;                                                           \
>> \
>> @@ -4771,7 +4772,7 @@ void HELPER(NAME)(void *vd, void *v0, 
>> target_ulong s1, void *vs2,         \
>> continue;                                                     \
>> } \
>>           if (i == 0) 
>> {                                                     \
>> -            *((ETYPE *)vd + H(i)) = 
>> s1;                                   \
>> +            *((ETYPE *)vd + H(i)) = adjust_addr(s1, 
>> olen);                \
>>           } else 
>> {                                                          \
>>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 
>> 1));           \
>> } \
>> @@ -4792,6 +4793,7 @@ void HELPER(NAME)(void *vd, void *v0, 
>> target_ulong s1, void *vs2,         \
>>       uint32_t mlen = 
>> vext_mlen(desc);                                      \
>>       uint32_t vlmax = env_archcpu(env)->cfg.vlen / 
>> mlen;                   \
>>       uint32_t vm = 
>> vext_vm(desc);                                          \
>> +    uint32_t olen = 16 << 
>> vext_ol(desc);                                  \
>>       uint32_t vl = 
>> env->vl;                                                \
>>       uint32_t 
>> i;                                                           \
>> \
>> @@ -4800,7 +4802,7 @@ void HELPER(NAME)(void *vd, void *v0, 
>> target_ulong s1, void *vs2,         \
>> continue;                                                     \
>> } \
>>           if (i == vl - 1) 
>> {                                                \
>> -            *((ETYPE *)vd + H(i)) = 
>> s1;                                   \
>> +            *((ETYPE *)vd + H(i)) = adjust_addr(s1, 
>> olen);                \
>>           } else 
>> {                                                          \
>>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 
>> 1));           \
>> } \
>
> What in the world is this?  S1 is not an address, it's just a value 
> from X[RS1].

It's name is bad. Maybe I should just s1 & UINT32_MAX.

Zhiwei

>
>
>
> r~

