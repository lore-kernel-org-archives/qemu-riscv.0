Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlBJ3-00037g-M7
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 09:44:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlBIx-00032t-JN; Thu, 11 Nov 2021 09:43:55 -0500
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:51649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlBIu-0002RJ-8A; Thu, 11 Nov 2021 09:43:55 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07508973|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.31295-0.000174706-0.686875;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LrH98nb_1636641822; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrH98nb_1636641822)
 by smtp.aliyun-inc.com(10.147.42.135);
 Thu, 11 Nov 2021 22:43:43 +0800
Subject: Re: [PATCH v3 19/20] target/riscv: Adjust scalar reg in vector with
 XLEN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-20-zhiwei_liu@c-sky.com>
 <b1d8f47a-a6fc-3d49-89dd-2ec0af867999@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <1ce98e21-0bcf-bbec-ef0a-4729b12236ac@c-sky.com>
Date: Thu, 11 Nov 2021 22:43:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b1d8f47a-a6fc-3d49-89dd-2ec0af867999@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.101; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-101.mail.aliyun.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
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
X-List-Received-Date: Thu, 11 Nov 2021 14:43:57 -0000

On 2021/11/11 下午7:46, Richard Henderson wrote:

> On 11/11/21 6:57 AM, LIU Zhiwei wrote:
>> @@ -2670,6 +2672,7 @@ static bool trans_vmv_s_x(DisasContext *s, 
>> arg_vmv_s_x *a)
>>           /* This instruction ignores LMUL and vector register groups */
>>           int maxsz = s->vlen >> 3;
>>           TCGv_i64 t1;
>> +        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
>
> A reminder that this is zero-extend for v0.7.1 and sign-extend for 
> v1.0.0.
>
>> @@ -2679,7 +2682,7 @@ static bool trans_vmv_s_x(DisasContext *s, 
>> arg_vmv_s_x *a)
>>           }
>>             t1 = tcg_temp_new_i64();
>> -        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
>> +        tcg_gen_extu_tl_i64(t1, src1);
>
> Likewise.
>
>>           vec_element_storei(s, a->rd, 0, t1);
>>           tcg_temp_free_i64(t1);
>>       done:
>> @@ -2748,12 +2751,28 @@ static bool slideup_check(DisasContext *s, 
>> arg_rmrr *a)
>>               (a->rd != a->rs2));
>>   }
>>   +/* OPIVXU without GVEC IR */
>> +#define GEN_OPIVXU_TRANS(NAME, 
>> CHECK)                                    \
>> +static bool trans_##NAME(DisasContext *s, arg_rmrr 
>> *a)                   \
>> +{ \
>> +    if (CHECK(s, a)) 
>> {                                                   \
>> +        static gen_helper_opivx * const fns[4] = 
>> {                       \
>> +            gen_helper_##NAME##_b, 
>> gen_helper_##NAME##_h,                \
>> +            gen_helper_##NAME##_w, 
>> gen_helper_##NAME##_d,                \
>> + }; \
>> + \
>> +        return opivx_trans(a->rd, a->rs1, a->rs2, 
>> a->vm,                 \
>> +                           fns[s->sew], s, 
>> EXT_ZERO);                    \
>> + } \
>> +    return 
>> false;                                                        \
>> +}
>> +
>>   GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
>> -GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
>> +GEN_OPIVXU_TRANS(vslide1up_vx, slideup_check)
>>   GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
>>     GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
>> -GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
>> +GEN_OPIVXU_TRANS(vslide1down_vx, opivx_check)
>>   GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
>
> Likewise.
>
> So if this patch set goes in after rvv 1.0, this whole patch may be 
> dropped.
>
Got it.

Thanks,
Zhiwei

>
> r~

