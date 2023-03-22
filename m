Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pesJC-0002Q6-Sr
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 02:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pesJB-0002Pk-1d; Wed, 22 Mar 2023 02:50:53 -0400
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pesJ8-00054n-K5; Wed, 22 Mar 2023 02:50:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VePmsM4_1679467839; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VePmsM4_1679467839) by smtp.aliyun-inc.com;
 Wed, 22 Mar 2023 14:50:40 +0800
Message-ID: <2a0ad699-f5fa-e007-70db-4891caaacd36@linux.alibaba.com>
Date: Wed, 22 Mar 2023 14:50:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
 <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
 <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
 <b48b2cb9-bf2c-f527-435d-df497ea4df76@linaro.org>
 <38598c82-f625-b84b-0f91-30b1fe98e8c6@intel.com>
 <fcac17c1-0a7e-4e84-9fce-904037e52b29@intel.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <fcac17c1-0a7e-4e84-9fce-904037e52b29@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.113;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-113.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 06:50:53 -0000


On 2023/3/22 14:40, Wu, Fei wrote:
> On 3/22/2023 11:36 AM, Wu, Fei wrote:
>> On 3/22/2023 11:31 AM, Richard Henderson wrote:
>>> On 3/21/23 19:47, Wu, Fei wrote:
>>>>>> You should be making use of different softmmu indexes, similar to how
>>>>>> ARM uses a separate index for PAN (privileged access never) mode.  If
>>>>>> I read the manual properly, PAN == !SUM.
>>>>>>
>>>>>> When you do this, you need no additional flushing.
>>>>> Hi Fei,
>>>>>
>>>>> Let's follow Richard's advice.
>>>>> Yes, I'm thinking about how to do it, and thank Richard for the advice.
>>>> My question is:
>>>> * If we ensure this separate index (S+SUM) has no overlapping tlb
>>>> entries with S-mode (ignore M-mode so far), during SUM=1, we have to
>>>> look into both (S+SUM) and S index for kernel address translation, that
>>>> should be not desired.
>>> This is an incorrect assumption.  S+SUM may very well have overlapping
>>> tlb entries with S.
>>> With SUM=1, you *only* look in S+SUM index; with SUM=0, you *only* look
>>> in S index.
>>>
>>> The only difference is a check in get_physical_address is no longer
>>> against MSTATUS_SUM directly, but against the mmu_index.
>>>
>>>> * If all the tlb operations are against (S+SUM) during SUM=1, then
>>>> (S+SUM) could contain some duplicated tlb entries of kernel address in S
>>>> index, the duplication means extra tlb lookup and fill.
>>> Yes, if the same address is probed via S and S+SUM, there is a
>>> duplicated lookup.  But this is harmless.
>>>
>>>
>>>> Also if we want
>>>> to flush tlb entry of specific addr0, we have to flush both index.
>>> Yes, this is also true.  But so far target/riscv is making no use of
>>> per-mmuidx flushing. At the moment you're *only* using tlb_flush(cpu),
>>> which flushes every mmuidx.  Nor are you making use of per-page flushing.
>>>
>>> So, really, no change required at all there.
>>>
>> Got it, let me try this method.
>>
> There seems no room in flags for this extra index, all 3 bits for
> mem_idx have been used in target/riscv/cpu.h. We need some trick.
>
> #define TB_FLAGS_PRIV_MMU_MASK                3
> #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)

#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)

Renumber the new mmu index to 5 (Probably by extending the function riscv_cpu_mmu_index)

Zhiwei

> FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> FIELD(TB_FLAGS, LMUL, 3, 3)
>
> Thanks,
> Fei.
>
>> Thanks,
>> Fei.
>>
>>> r~

