Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgz7u-00079a-Rm
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 22:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgz7t-00079A-0K; Mon, 27 Mar 2023 22:31:57 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgz7q-0007f9-M3; Mon, 27 Mar 2023 22:31:56 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VerC4FG_1679970703; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VerC4FG_1679970703) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 10:31:44 +0800
Message-ID: <4593f151-8622-7c4e-9e32-1748917a9347@linux.alibaba.com>
Date: Tue, 28 Mar 2023 10:31:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
 <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
 <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 02:31:57 -0000


On 2023/3/28 9:55, liweiwei wrote:
>
> On 2023/3/28 02:04, Richard Henderson wrote:
>> On 3/27/23 03:00, Weiwei Li wrote:
>>> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>>> address, int size,
>>>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d 
>>> mmu_idx %d\n",
>>>                     __func__, address, access_type, mmu_idx);
>>>   +    if (access_type == MMU_INST_FETCH) {
>>> +        address = adjust_pc_address(env, address);
>>> +    }
>>
>> Why do you want to do this so late, as opposed to earlier in 
>> cpu_get_tb_cpu_state?
>
> In this way, the pc for tb may be different from the reg pc. 
I don't understand.
> Then the pc register will be wrong if sync from tb.

I think you should give an explain here why it is wrong.

Zhiwei

>
> Regards,
>
> Weiwei Li
>
>>
>>
>> r~

