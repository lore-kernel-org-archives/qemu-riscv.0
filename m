Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CC6C77B7E
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 01:31:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4tdd-000323-FG; Thu, 01 Jun 2023 21:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q4tdb-00031m-4V; Thu, 01 Jun 2023 21:31:32 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q4tdX-00035i-IK; Thu, 01 Jun 2023 21:31:30 -0400
Received: from [192.168.194.181] (unknown [61.242.130.78])
 by APP-01 (Coremail) with SMTP id qwCowABXXPBjRnlk+HDBCQ--.19064S2;
 Fri, 02 Jun 2023 09:31:16 +0800 (CST)
Message-ID: <be90143f-1c8b-eb31-3c75-ae9846f00a22@iscas.ac.cn>
Date: Fri, 2 Jun 2023 09:31:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 2/4] target/riscv: Remove check on mode for MPRV
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-3-liweiwei@iscas.ac.cn>
 <CAKmqyKPmXXoVdSndTF+aF7A-3PqVrnw-NFG26sQQicxybwWpQA@mail.gmail.com>
 <18e4da39-cbd4-aa60-7628-7105a788b6e8@iscas.ac.cn>
 <CAKmqyKMP0aX=_3ffQXSNQ0pWCjeXEF+h=QgPbL80=0J8v_gOrA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKMP0aX=_3ffQXSNQ0pWCjeXEF+h=QgPbL80=0J8v_gOrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXXPBjRnlk+HDBCQ--.19064S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWkurykCr4UJF4fGFW5Awb_yoW8KFW5pF
 WrGayxKrZ8GrZ7Ga4Igr4Yga17trZ8KF1DWw1kWr17Xrs8trZ3uFsxAw45Wr9rCF1xKrWj
 vF1jyF93ZF1UZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbLiSPUUUUU==
X-Originating-IP: [61.242.130.78]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/6/2 07:03, Alistair Francis wrote:
> On Thu, Jun 1, 2023 at 4:43 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> On 2023/6/1 13:27, Alistair Francis wrote:
>>> On Mon, May 29, 2023 at 10:19 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>> Normally, MPRV can be set to 1 only in M mode (It will be cleared
>>>> when returning to lower-privilege mode by MRET/SRET).
>>>>
>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>> ---
>>>>    target/riscv/cpu_helper.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index bd892c05d4..45baf95c77 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -44,7 +44,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>>>>        if (!ifetch) {
>>>>            uint64_t status = env->mstatus;
>>>>
>>>> -        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
>>>> +        if (get_field(status, MSTATUS_MPRV)) {
>>> The original check is correct though, why remove it?
>> Yeah. As described in the commit message, I think MPRV can only be set
>> to 1 in M mode normally
> That's true. I do feel that keeping the check makes the code easier to
> follow. Otherwise future developers need to check to see how MPRV can
> be set. The current code is explicit and obviously follows the spec.
>
> For a performance gain I think it's worth making the trade off, but it
> doesn't sound like we really get any gain here.

Yeah. It's acceptable to me.

Just another question: whether MPRV is truly limited to work on M mode?

I can only find following description in the note:

"The MPRV and MXR mechanisms *were* conceived to improve the efficiency 
of M-mode routines
that emulate missing hardware features, e.g., misaligned loads and stores."

To some degree, It seems not limit them to work on other mode.

Even though MPRV normally can be set to 1 in M mode, it seems possible 
to set it to 1 in other mode by gdbstub.

Regards,

Weiwei Li

> Alistair
>
>> which means check on MPRV is enough in this case. So I remove the check
>> on mode here.
>>
>> Regards,
>>
>> Weiwei Li
>>
>>> Alistair
>>>
>>>>                mode = get_field(env->mstatus, MSTATUS_MPP);
>>>>                virt = get_field(env->mstatus, MSTATUS_MPV) &&
>>>>                       (mode != PRV_M);
>>>> --
>>>> 2.25.1
>>>>
>>>>


