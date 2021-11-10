Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkokk-0001CZ-DA
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 09:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkoki-0001BV-3x; Wed, 10 Nov 2021 09:39:04 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:35778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkoke-00060U-RN; Wed, 10 Nov 2021 09:39:03 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07603913|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00661971-0.000157315-0.993223;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LqiYFXk_1636555134; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqiYFXk_1636555134)
 by smtp.aliyun-inc.com(10.147.41.121);
 Wed, 10 Nov 2021 22:38:54 +0800
Subject: Re: [PATCH v2 14/14] target/riscv: Enable uxl field write
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-15-zhiwei_liu@c-sky.com>
 <59e04faf-3832-bec9-52f3-d5a91d20b893@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <b76662ce-7026-196a-7718-e0e825322e9d@c-sky.com>
Date: Wed, 10 Nov 2021 22:38:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <59e04faf-3832-bec9-52f3-d5a91d20b893@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
X-List-Received-Date: Wed, 10 Nov 2021 14:39:04 -0000


On 2021/11/10 下午7:27, Richard Henderson wrote:
> On 11/10/21 8:04 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/csr.c                      | 5 ++---
>>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>   target/riscv/op_helper.c                | 3 ++-
>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 33e342f529..e07cd522ef 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -555,15 +555,14 @@ static RISCVException 
>> write_mstatus(CPURISCVState *env, int csrno,
>>            * RV32: MPV and GVA are not in mstatus. The current plan 
>> is to
>>            * add them to mstatush. For now, we just don't support it.
>>            */
>> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
>> +        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
>>       }
>>         mstatus = (mstatus & ~mask) | (val & mask);
>>         if (riscv_cpu_mxl(env) == MXL_RV64) {
>> -        /* SXL and UXL fields are for now read only */
>> +        /* SXL fields are for now read only */
>>           mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
>> -        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>>       }
>>       env->mstatus = mstatus;
>
> Why do you not allow writes to SXL?

That means we still don't support the change of SXLEN.
I didn't check the S-mode CSRs behavior when XLEN changes in this patch 
set.

For example, the behavior of satp when trap into M-mode from S-mode if 
SXLEN=32 and MXLEN=64.

>
> You're missing a change to write_sstatus to allow S-mode to write to UXL.
Yes.
>
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index 7a0b037594..cb73a2f1ee 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -472,7 +472,7 @@ static bool trans_csrrw(DisasContext *ctx, 
>> arg_csrrw *a)
>>           return do_csrw(ctx, a->csr, src);
>>       }
>>   -    TCGv mask = tcg_constant_tl(-1);
>> +    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX 
>> : -1);
>>       return do_csrrw(ctx, a->rd, a->csr, src, mask);
>>   }
>>   @@ -523,7 +523,7 @@ static bool trans_csrrwi(DisasContext *ctx, 
>> arg_csrrwi *a)
>>           return do_csrw(ctx, a->csr, src);
>>       }
>>   -    TCGv mask = tcg_constant_tl(-1);
>> +    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX 
>> : -1);
>>       return do_csrrw(ctx, a->rd, a->csr, src, mask);
>>   }
>>   diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>> index 095d39671b..561e156bec 100644
>> --- a/target/riscv/op_helper.c
>> +++ b/target/riscv/op_helper.c
>> @@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
>>     void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
>>   {
>> -    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
>> +    target_ulong mask = cpu_get_xl(env) == MXL_RV32 ? UINT32_MAX : -1;
>> +    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
>>         if (ret != RISCV_EXCP_NONE) {
>>           riscv_raise_exception(env, ret, GETPC());
>>
>
> The rest of this should be a separate patch.
>
>
> r~

