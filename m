Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9EBC7EE23
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 May 2023 00:28:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q49gx-0006Im-BN; Tue, 30 May 2023 20:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q49gw-0006I6-1Q; Tue, 30 May 2023 20:27:54 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q49gt-0004fw-50; Tue, 30 May 2023 20:27:53 -0400
Received: from [192.168.0.120] (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowADHzHB2lHZk0sNiCA--.10358S2;
 Wed, 31 May 2023 08:27:35 +0800 (CST)
Message-ID: <a669092a-8ef1-a70b-9896-5e7b6c78bb4a@iscas.ac.cn>
Date: Wed, 31 May 2023 08:27:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] target/riscv: Make MPV only work when MPP != PRV_M
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-2-liweiwei@iscas.ac.cn>
 <d0a208a3-9973-b7e4-8fcf-d71ec0eab9b1@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <d0a208a3-9973-b7e4-8fcf-d71ec0eab9b1@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHzHB2lHZk0sNiCA--.10358S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryDGw1ktF1rtryUCFykZrb_yoW5Gry5pr
 1kGrW7KFWDCrWkG3Wftr1UGry5Jr1UGw1UJr1kAF1UJr45Jr4q9F4UXr1jgr1UJr48Jr1j
 vF1UZryDZF47XF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVWDMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUn5rcUUUUU
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/5/31 04:23, Daniel Henrique Barboza wrote:
>
>
> On 5/29/23 09:17, Weiwei Li wrote:
>> Upon MRET or explicit memory access with MPRV=1, MPV should be ignored
>> when MPP=PRV_M.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_helper.c | 3 ++-
>>   target/riscv/op_helper.c  | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 09ea227ceb..bd892c05d4 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -46,7 +46,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool 
>> ifetch)
>>             if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
>>               mode = get_field(env->mstatus, MSTATUS_MPP);
>> -            virt = get_field(env->mstatus, MSTATUS_MPV);
>> +            virt = get_field(env->mstatus, MSTATUS_MPV) &&
>> +                   (mode != PRV_M);
>
> This change makes more sense in patch 2 where you also removed the 'mode'
> check for MPRV. As it is now I read the code above and thought "but mode
> is guaranteed to be == PRV_M, so (mode !=  PRV_M) is guaranteed to be
> false every time".

No, this 'mode' (get from MPP) is not the previous 'mode'(the current 
privilege mode).

Regards,

Weiwei Li

>
> The change in helper_mret() below is fine.
>
> Thanks,
>
> Daniel
>
>>               if (virt) {
>>                   status = env->vsstatus;
>>               }
>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>> index f563dc3981..9cdb9cdd06 100644
>> --- a/target/riscv/op_helper.c
>> +++ b/target/riscv/op_helper.c
>> @@ -335,7 +335,8 @@ target_ulong helper_mret(CPURISCVState *env)
>>           riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, 
>> GETPC());
>>       }
>>   -    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
>> +    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV) &&
>> +                             (prev_priv != PRV_M);
>>       mstatus = set_field(mstatus, MSTATUS_MIE,
>>                           get_field(mstatus, MSTATUS_MPIE));
>>       mstatus = set_field(mstatus, MSTATUS_MPIE, 1);


