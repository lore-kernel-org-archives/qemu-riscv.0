Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMgTu-0006Jz-Qe
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 21:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMgTr-0006Ir-04; Mon, 30 Jan 2023 21:34:43 -0500
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMgTn-00085Q-6S; Mon, 30 Jan 2023 21:34:42 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VaUqnBz_1675132462; 
Received: from 30.221.97.63(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VaUqnBz_1675132462) by smtp.aliyun-inc.com;
 Tue, 31 Jan 2023 10:34:23 +0800
Message-ID: <f6bb455e-00c6-0d78-5712-e1adf72a753b@linux.alibaba.com>
Date: Tue, 31 Jan 2023 10:34:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
 <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
 <8385d954-678e-d78d-c3ae-d74a4a902907@linux.alibaba.com>
 <7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org>
 <82e49515-512f-9439-ceab-6c5df3bb20e4@linux.alibaba.com>
 <41e5c5bd-9328-c99e-e37b-aadd2b7d308b@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <41e5c5bd-9328-c99e-e37b-aadd2b7d308b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 02:34:44 -0000


On 2023/1/31 3:03, Richard Henderson wrote:
> On 1/29/23 22:41, LIU Zhiwei wrote:
>>
>> On 2023/1/30 13:43, Richard Henderson wrote:
>>> On 1/29/23 16:03, LIU Zhiwei wrote:
>>>> Thanks. It's a bug. We should load all memory addresses to  local 
>>>> TCG temps first.
>>>>
>>>> Do you think we should probe all the memory addresses for the store 
>>>> pair instructions? If so, can we avoid the use of a helper function?
>>>
>>> Depends on what the hardware does.  Even with a trap in the middle 
>>> the stores are restartable, since no register state changes.
>>
>> I refer to the specification of LDP and STP on AARCH64. The 
>> specification allows
>>
>> "any access performed before the exception was taken is repeated".
>>
>> In detailed,
>>
>> "If, according to these rules, an instruction is executed as a 
>> sequence of accesses, exceptions, including interrupts,
>> can be taken during that sequence, regardless of the memory type 
>> being accessed. If any of these exceptions are
>> returned from using their preferred return address, the instruction 
>> that generated the sequence of accesses is
>> re-executed, and so any access performed before the exception was 
>> taken is repeated. See also Taking an interrupt
>> during a multi-access load or store on page D1-4664."
>>
>> However I see the implementation of LDP and STP on QEMU are in 
>> different ways. LDP will only load the first register when it ensures 
>> no trap in the second access.
>>
>> So I have two questions here.
>>
>> 1) One for the QEMU implementation about LDP. Can we implement the 
>> LDP as two directly loads to cpu registers instead of local TCG temps?
>
> For the Thead specification, where rd1 != rs1 (and you enforce it), 
> then yes, I suppose you could load directly to the cpu registers, 
> because on restart rs1 would be unmodified.
>
> For AArch64, which you quote above, there is no constraint that the 
> destinations do not overlap the address register, so we must implement 
> "LDP r0, r1, [r0]" as a load into temps.
>
Got it. Thanks.
>
>> 2) One for the comment. Why register state changes cause 
>> non-restartable? Do you mean if the first register changes, it may 
>> influence the calculation of address after the trap?
>
> Yes, that's what I mean about non-restartable -- if any of the input 
> registers are changed before the trap is recognized.
>
>
Thanks for the clarification.

Once I thought the reason of non-restartable is the side effects of 
repeat execution, which may cause watchpoint matches twice or access 
MMIO device twice.

>>> Yes.  Conciser what happens when the insn is encoded with .long. 
>>> Does the hardware trap an illegal instruction?  Is the behavior 
>>> simply unspecified?  The manual could be improved to specify, akin 
>>> to the Arm terms: UNDEFINED, CONSTRAINED UNPREDICTABLE, 
>>> IMPLEMENTATION DEFINED, etc.
>>>
>>>
>> Thanks, I will fix the manual.

The manual has been fixed  by Christopher.  Thanks.

Best Regards,
Zhiwei

>
> Excellent, thanks.
>
>
> r~

