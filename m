Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peoyJ-00039b-MY
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 23:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peoyI-00039G-D1; Tue, 21 Mar 2023 23:17:06 -0400
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peoyF-0004D2-Tt; Tue, 21 Mar 2023 23:17:06 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeOuhIE_1679455009; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeOuhIE_1679455009) by smtp.aliyun-inc.com;
 Wed, 22 Mar 2023 11:16:50 +0800
Message-ID: <a8692302-c2e7-f909-5c25-f21ea38f2071@linux.alibaba.com>
Date: Wed, 22 Mar 2023 11:16:48 +0800
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
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
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
X-List-Received-Date: Wed, 22 Mar 2023 03:17:06 -0000


On 2023/3/22 10:47, Wu, Fei wrote:
> On 3/22/2023 9:58 AM, LIU Zhiwei wrote:
>> On 2023/3/22 0:10, Richard Henderson wrote:
>>> On 3/20/23 23:37, fei2.wu@intel.com wrote:
>>>> From: Fei Wu <fei2.wu@intel.com>
>>>>
>>>> Kernel needs to access user mode memory e.g. during syscalls, the window
>>>> is usually opened up for a very limited time through MSTATUS.SUM, the
>>>> overhead is too much if tlb_flush() gets called for every SUM change.
>>>> This patch saves addresses accessed when SUM=1, and flushs only these
>>>> pages when SUM changes to 0. If the buffer is not large enough to save
>>>> all the pages during SUM=1, it will fall back to tlb_flush when
>>>> necessary.
>>>>
>>>> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
>>>> most of the time kernel accesses 1 or 2 pages, it's very rare to see
>>>> more than 4 pages accessed.
>>>>
>>>> It's not necessary to save/restore these new added status, as
>>>> tlb_flush() is always called after restore.
>>>>
>>>> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
>>>> other syscalls benefit a lot from this one too.
>>> This is not the correct approach.
>>>
>>> You should be making use of different softmmu indexes, similar to how
>>> ARM uses a separate index for PAN (privileged access never) mode.  If
>>> I read the manual properly, PAN == !SUM.
>>>
>>> When you do this, you need no additional flushing.
>> Hi Fei,
>>
>> Let's follow Richard's advice.
>> Yes, I'm thinking about how to do it, and thank Richard for the advice.
> My question is:
> * If we ensure this separate index (S+SUM) has no overlapping tlb
> entries with S-mode (ignore M-mode so far), during SUM=1,
Yes, every mmu index will have their own cache.
> we have to
> look into both (S+SUM) and S index for kernel address translation, that
> should be not desired.
No, we  have to choose one, because each access will be constrained with 
a mmu idex.
>
> * If all the tlb operations are against (S+SUM) during SUM=1, then
> (S+SUM) could contain some duplicated tlb entries of kernel address in S
> index, the duplication means extra tlb lookup and fill. Also if we want
> to flush tlb entry of specific addr0, we have to flush both index.

This is not the case.

Zhiwei

>
> I will take a look at how arm handles this.
>
> Thanks,
> Fei.
>
>> Zhiwei
>>
>>>
>>> r~

