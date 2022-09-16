Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ4jt-0007vA-QV
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 02:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ4jZ-0007rQ-5h; Fri, 16 Sep 2022 02:22:06 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:36951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ4jP-0003t7-Fn; Fri, 16 Sep 2022 02:21:46 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VPw-Y6i_1663309292; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPw-Y6i_1663309292) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 14:21:33 +0800
Message-ID: <663f1782-d752-bcea-1244-f3e86649fd45@linux.alibaba.com>
Date: Fri, 16 Sep 2022 14:21:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 01/11] riscv: Add privilege level to DisasContext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-2-christoph.muellner@vrull.eu>
 <bfff6a65-f0f7-8659-2b58-582345018868@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <bfff6a65-f0f7-8659-2b58-582345018868@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -116
X-Spam_score: -11.7
X-Spam_bar: -----------
X-Spam_report: (-11.7 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.816, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Sep 2022 06:22:10 -0000


On 2022/9/16 14:00, Richard Henderson wrote:
> On 9/6/22 14:22, Christoph Muellner wrote:
>> From: Christoph Müllner <christoph.muellner@vrull.eu>
>>
>> This allows privileged instructions to check the required
>> privilege level in the translation without calling a helper.
>>
>> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
>> ---
>>   target/riscv/translate.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 63b04e8a94..fd241ff667 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -59,6 +59,9 @@ typedef struct DisasContext {
>>       /* pc_succ_insn points to the instruction following 
>> base.pc_next */
>>       target_ulong pc_succ_insn;
>>       target_ulong priv_ver;
>> +#ifndef CONFIG_USER_ONLY
>> +    target_ulong priv;
>> +#endif
>>       RISCVMXL misa_mxl_max;
>>       RISCVMXL xl;
>>       uint32_t misa_ext;
>> @@ -1079,6 +1082,7 @@ static void 
>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>       ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
>>       ctx->priv_ver = env->priv_ver;
>>   #if !defined(CONFIG_USER_ONLY)
>> +    ctx->priv = env->priv;
>
> Reading directly from env here is, in general, wrong.  Items that are 
> constant, like priv_ver, are ok.  But otherwise these values must be 
> recorded by cpu_get_tb_cpu_state().
>
> This instance will happen to work, because the execution context is 
> already constrained. 

Exactly. Thanks for pointing it out.

> In this case because env->priv == ctx->mem_idx (see cpu_mmu_index) so, 
> really, you don't need this new field at all.  Or, keep the field, 
> because it's usage will be more self-documentary, but copy the value 
> from ctx->mmu_idx and add a comment.
>
>
>>       if (riscv_has_ext(env, RVH)) {
>>           ctx->virt_enabled = riscv_cpu_virt_enabled(env);
>>       } else {
>
> Incidentally, this (existing) usage appears to be a bug.  I can see 
> nothing in cpu_get_tb_cpu_state that corresponds directly to this value.

Agree.

Zhiwei

>
>
> r~

