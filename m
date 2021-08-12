Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mE2sB-0000Km-91
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 01:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mE2s9-0000KV-AH; Thu, 12 Aug 2021 01:03:17 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:43462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mE2s6-00026b-Jp; Thu, 12 Aug 2021 01:03:16 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1044306|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0188776-0.000819167-0.980303;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KypKntx_1628744587; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KypKntx_1628744587)
 by smtp.aliyun-inc.com(10.147.42.16); Thu, 12 Aug 2021 13:03:07 +0800
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
 <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
 <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
 <6cbece33-7f92-0247-7efc-41b34b0b4d7d@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <d24feab8-1ce9-fef7-6b43-b11377faec04@c-sky.com>
Date: Thu, 12 Aug 2021 13:03:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6cbece33-7f92-0247-7efc-41b34b0b4d7d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Aug 2021 05:03:17 -0000


On 2021/8/12 下午12:42, Richard Henderson wrote:
> On 8/11/21 12:40 PM, LIU Zhiwei wrote:
>> If the software doesn't use the high part, who cares the really value 
>> in high part? Do you know the benefit?  Thanks again.
>
> I do not.
>
> I simply presume that they already have the hardware, in the form of 
> the addw instruction, etc.
>
> The mistake, I think, was changing the definition of "add" in the 
> first place, which required the addition of a different opcode "addw", 
> which is then undefined for RV32. 

Sorry, I don't get "the mistake" here. Do you think the specification is 
not right.
Or the QEMU implementation of this patch set is not right?
Currently I don't know there is  a 64-bit hardware which has done with 
UXL32.

> They should simply have had "addw" and "addq" as different opcodes 
> that didn't change behaviour.  Etc.

I don't get  this statement. Is it related to UXL32?

Best Regards,
Zhiwei

>
> But what's done is done.
>
>
> r~

