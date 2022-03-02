Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPDJ0-0000k1-9d
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 19:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nPDIy-0000gv-CR; Tue, 01 Mar 2022 19:57:24 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:35798 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nPDIu-0007MM-Ed; Tue, 01 Mar 2022 19:57:23 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAD3YuThwB5iFi7_AQ--.14416S2;
 Wed, 02 Mar 2022 08:57:07 +0800 (CST)
Subject: Re: [PATCH v7 12/14] target/riscv: rvk: add CSR support for Zkr
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-13-liweiwei@iscas.ac.cn>
 <0879f52c-165b-75f2-82e1-761013816f03@linaro.org>
 <72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn>
 <07c003f8-b34b-0da0-2298-ff3be5fd7655@iscas.ac.cn>
 <8b6ff05f-7246-940e-be90-44ede1a6a3ba@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <13cb8412-c237-bd1b-29c3-a1a35397c8ab@iscas.ac.cn>
Date: Wed, 2 Mar 2022 08:57:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8b6ff05f-7246-940e-be90-44ede1a6a3ba@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3YuThwB5iFi7_AQ--.14416S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyxGrW5KFy5KFWUWF4fuFg_yoW8uF4fpa
 48JF4jyFWDJr1kCwnFkF4UXFy5tr1UJa13Jw1kX3WfJr90qr9YqF18Zrs09F1qgr4fKr1j
 vF4Dtr97Zr45ZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
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
X-List-Received-Date: Wed, 02 Mar 2022 00:57:24 -0000


在 2022/3/1 下午11:59, Richard Henderson 写道:
> On 2/28/22 16:27, Weiwei Li wrote:
>>
>> 在 2022/3/1 上午9:44, Weiwei Li 写道:
>>>
>>> 在 2022/3/1 上午4:11, Richard Henderson 写道:
>>>> On 2/28/22 04:48, Weiwei Li wrote:
>>>>> +/* Crypto Extension */
>>>>> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>>>>> +                              target_ulong *ret_value,
>>>>> +                              target_ulong new_value, 
>>>>> target_ulong write_mask)
>>>>> +{
>>>>> +    if (!write_mask) {
>>>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>>>> +    }
>>>>
>>>> This is incorrect.  The error should only be with a write-mask of 
>>>> the actual x0 register, not another register which happens to 
>>>> contain 0.  There is in fact no way to diagnose exactly what you 
>>>> want here, which IIRC has an existing fixme comment somewhere.
>>> Yeah. write_mask is also used in riscv_csrrw_check to check whether 
>>> the read-only csr is written. We cannot distinguish x0 and reg which 
>>> contains 0  here without changing total progress of csr read/write.
>>>>
>> I seems misunderstand the code for csr read/write:  write_mask will 
>> be set zero only for read-only operation (CSRRS/CSRRC with rs1=x0 or 
>> CSRRSI/CSRRCI with uimm=0) via do_csrr --> helper_csrr -> riscv_csrrw 
>> call-chain.
>>
>> The write_mask for do_csrw and do_csrrw will not be zero.
>>
>> As said in the spec :
>>
>> "TheseedCSR must be accessed with a read-write instruction. A 
>> read-only instruction such asCSRRS/CSRRC
>> withrs1=x0orCSRRSI/CSRRCIwithuimm=0will raise an illegal instruction 
>> exception. "
>>
>> So it's suitable to check write_mask here.
>
> Consider CSRRS with rs1=x31.  In that case mask will be the value in 
> x31.  Even if the value is 0, this is still considered a read-write 
> instruction.
Yeah. I lost this kind of case . So this is a bug. Maybe we can add a 
new parameter like  'write' to helper_csrrw to indicate that write 
operation should be done.
>
>
> r~


