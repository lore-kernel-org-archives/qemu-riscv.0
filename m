Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poc9W-0005Oc-Qw
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 23:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poc9U-0005OG-Pd; Mon, 17 Apr 2023 23:37:09 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poc9R-000221-Qh; Mon, 17 Apr 2023 23:37:08 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s5VED5kRDVFFA--.26116S2;
 Tue, 18 Apr 2023 11:36:53 +0800 (CST)
Message-ID: <3ace9e9e-91cf-36e6-a18f-494fd44dffab@iscas.ac.cn>
Date: Tue, 18 Apr 2023 11:36:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] target/riscv: Fix PMP related problem
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <3038155a-6190-5aa5-7425-ad0d957fd7a6@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <3038155a-6190-5aa5-7425-ad0d957fd7a6@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s5VED5kRDVFFA--.26116S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1xJw1fAry3uw18tr4Dtwb_yoW8tr15pF
 Z3CrW3JrZ8CrZagr4fKF4DXFy5Xr4kG3W5Jr1xtF1rZanxAryYvrsYgw4FkF9rJFZ5Cr4Y
 kF1jyrn29FyUAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.284,
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
X-List-Received-Date: Tue, 18 Apr 2023 03:37:09 -0000


On 2023/4/18 11:07, LIU Zhiwei wrote:
>
> On 2023/4/13 17:01, Weiwei Li wrote:
>> This patchset tries to fix the PMP bypass problem issue 
>> https://gitlab.com/qemu-project/qemu/-/issues/1542
>
> Please add your analysis of this issue here.
>
> By the way, I think this problem is introduced by
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg939331.html

It seems have no relationship with this commit.

I think there are several problems for this issue:

1. TLB will not be cached only when the access address have matched PMP 
entry.  So the other address access  may hit the TLB(if first access of 
the page didn't hit the PMP entry)

and bypass the pmp check. This is fixed by patch 1.

2. Writing to pmpaddr  didn't trigger tlb flush. This is fixed by patch 3.

3. The tb isn't flushed when PMP permission changes, so It also may hit 
the tb and bypass the changed PMP check for instruction fetch. This is 
fixed by patch 5.

4. We set the tlb_size to 1 to make the TLB_INVALID_MASK set. However 
this flag will be cleared after fill_tlb, and this will make the host 
address be cached, and let the following instruction fetch in the same 
tb bypass the PMP check. This is fixed by patch 6.

Regards,

Weiwei Li

>
> I have commented on how to correct this patch. But by accident, it has 
> been merged.
>
> Zhiwei
>
>>
>> The port is available here:
>> https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix
>>
>> Weiwei Li (6):
>>    target/riscv: Update pmp_get_tlb_size()
>>    target/riscv: Move pmp_get_tlb_size apart from
>>      get_physical_address_pmp
>>    target/riscv: flush tlb when pmpaddr is updated
>>    target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
>>    target/riscv: flush tb when PMP entry changes
>>    accel/tcg: Remain TLB_INVALID_MASK in the address when TLB is
>>      re-filled
>>
>>   accel/tcg/cputlb.c        |  7 -----
>>   target/riscv/cpu_helper.c | 19 ++++---------
>>   target/riscv/pmp.c        | 60 ++++++++++++++++++++++++++-------------
>>   target/riscv/pmp.h        |  3 +-
>>   4 files changed, 47 insertions(+), 42 deletions(-)
>>


