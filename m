Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogTd-0005OI-0p
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pogTb-0005Nq-Ka; Tue, 18 Apr 2023 04:14:11 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pogTV-0004Wl-Pc; Tue, 18 Apr 2023 04:14:10 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowADn759CUT5kwgrXBQ--.56754S2;
 Tue, 18 Apr 2023 16:13:54 +0800 (CST)
Message-ID: <e0583278-5bc2-ac4a-1bfe-85bed1014954@iscas.ac.cn>
Date: Tue, 18 Apr 2023 16:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 3/6] target/riscv: flush tlb when pmpaddr is updated
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-4-liweiwei@iscas.ac.cn>
 <de40eeea-6ddf-264c-2cfb-94b5d55093d8@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <de40eeea-6ddf-264c-2cfb-94b5d55093d8@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn759CUT5kwgrXBQ--.56754S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43WF4rGF13AF1rtF4UXFb_yoW8Jw1xpr
 10kFy8GrW5GrykWa1UJF1UXryUJr15G3Wvq3y2yF1UCF45Xr1jvr1DXryjgr1UXF4fJr1j
 kFyUZr1UZF18XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.284,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 18 Apr 2023 08:14:11 -0000


On 2023/4/18 15:11, LIU Zhiwei wrote:
>
> On 2023/4/13 17:01, Weiwei Li wrote:
>> TLB should be flushed not only for pmpcfg csr changes, but also for
>> pmpaddr csr changes.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/pmp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 4f9389e73c..6d4813806b 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -537,6 +537,7 @@ void pmpaddr_csr_write(CPURISCVState *env, 
>> uint32_t addr_index,
>>           if (!pmp_is_locked(env, addr_index)) {
>>               env->pmp_state.pmp[addr_index].addr_reg = val;
>>               pmp_update_rule(env, addr_index);
>> +            tlb_flush(env_cpu(env));
>
> Can we always flush tlb in pmp_update_rule?

I considered this way, However  this may lead to tlb being flushed 
several times when we update pmpcfg csrs.

Regards,

Weiwei Li

>
> Zhiwei
>
>>           } else {
>>               qemu_log_mask(LOG_GUEST_ERROR,
>>                             "ignoring pmpaddr write - locked\n");


