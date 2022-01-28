Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDLpi-0004rt-NP
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 02:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nDLpG-0004of-5D; Fri, 28 Jan 2022 02:37:45 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:38378 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nDLpE-0007xM-6S; Fri, 28 Jan 2022 02:37:41 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAD3lsQ8nfNhNSIZAA--.10324S2;
 Fri, 28 Jan 2022 15:37:33 +0800 (CST)
Subject: Re: [PATCH v6 2/5] target/riscv: add PTE_A/PTE_D/PTE_U bits check for
 inner PTE
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>, Guo Ren <ren_guo@c-sky.com>
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
 <20220125064536.7869-3-liweiwei@iscas.ac.cn>
 <CAKmqyKMSWxhzSPw3de23J7+-WNS+gszu+LW22JeqmmFX6hp6tw@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <35a48d02-d946-6448-988c-bbd0c235568a@iscas.ac.cn>
Date: Fri, 28 Jan 2022 15:37:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMSWxhzSPw3de23J7+-WNS+gszu+LW22JeqmmFX6hp6tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3lsQ8nfNhNSIZAA--.10324S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy5tFWfCr47Cr1furykKrg_yoWDCrX_CF
 W8GFn2vw1Duan2kFsYyr90gFyYg34kG3yFkw47GF43WFyjgryfAw1xK39Ykw15CF1fGrsI
 yr97Ary3Cr1Y9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbS8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTOJ5UUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 28 Jan 2022 07:38:00 -0000


在 2022/1/28 下午1:40, Alistair Francis 写道:
> On Tue, Jan 25, 2022 at 5:47 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
> Could you please add a commit message to this patch?
>
> Alistair

OK. I'll add it.

Regards,

Weiwei Li

>> ---
>>   target/riscv/cpu_helper.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 2a921bedfd..a5bf07ccb6 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -641,6 +641,9 @@ restart:
>>               return TRANSLATE_FAIL;
>>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>>               /* Inner PTE, continue walking */
>> +            if (pte & (PTE_D | PTE_A | PTE_U)) {
>> +                return TRANSLATE_FAIL;
>> +            }
>>               base = ppn << PGSHIFT;
>>           } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>>               /* Reserved leaf PTE flags: PTE_W */
>> --
>> 2.17.1
>>
>>


