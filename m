Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjike-0001z4-Tm
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 11:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjike-0001yp-0p; Tue, 04 Apr 2023 11:39:16 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjikb-0007ru-Jj; Tue, 04 Apr 2023 11:39:15 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACXnVWXRCxkXegBDg--.3461S2;
 Tue, 04 Apr 2023 23:39:04 +0800 (CST)
Message-ID: <22250714-84d7-22ef-7b34-ab9362264dd6@iscas.ac.cn>
Date: Tue, 4 Apr 2023 23:39:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
 <f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org>
 <f466aa0b-1312-d8ba-c2d6-d386038df781@iscas.ac.cn>
 <24d824ed-4018-302a-9c4b-22758ea1f64e@linaro.org>
 <f96d42c8-aa14-9315-832c-d7d2dcd05646@iscas.ac.cn>
 <473b9eb0-59e9-d117-e50c-5138b0fbe50d@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <473b9eb0-59e9-d117-e50c-5138b0fbe50d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXnVWXRCxkXegBDg--.3461S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4rZF1xXF4UGw43uw1fXrb_yoWkCwbEqr
 WfAa1DZw1DCF47Xan8KFsayFykKry8Ga45twnFgasrCasaqFnag3ykur93ur4rKF4SyF9F
 kr4vqa1Sy3s7ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 04 Apr 2023 15:39:16 -0000


On 2023/4/4 23:27, Richard Henderson wrote:
> On 4/4/23 08:14, liweiwei wrote:
>>
>> On 2023/4/4 22:57, Richard Henderson wrote:
>>> On 4/4/23 07:33, liweiwei wrote:
>>>> If we want to hide all of them in gen_pc_plus_diff,  then we need 
>>>> calculate the diff for pc_succ_insn or introduce a new API for it, 
>>>> since we need get the successor pc in many instructions.
>>>>
>>>> And the logic for gen_goto_tb or gen_set_pc_imm also need update.
>>>
>>> Yes, exactly.
>>>
>>>
>> Sorry, I didn't find benefits from this. If we do this, we'll firstly 
>> calculate the diff = pc_succ_insn - pc_next, then we add it with 
>> pc_next - pc_save to get the relative address to env->pc.
>
> It will me simpler because you'll move all of the calculations into a 
> helper function.
helper? Do you mean gen_pc_plus_diff?
>
> The trans_* functions will be supplying a immediate directly:
>
>   * for auipc, this is a->imm,
Yeah. this will be simpler in trans_, however the total calculation is 
the same. we just move a->imm + pc_next to gen_pc_plus_diff.
>   * for jalr, this is 0.

Not 0, but pc_succ_insn - pc_next. This may be the case in many place.

Regards,

Weiwei Li

>
>
> r~


