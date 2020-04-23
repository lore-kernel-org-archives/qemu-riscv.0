Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRR5R-0004gu-6I
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 21:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jRR5P-0004gT-8K
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 21:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jRR5O-0005MK-UA
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 21:55:31 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jRR5L-0004YO-OM; Wed, 22 Apr 2020 21:55:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07659078|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.122069-0.00291788-0.875013;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.HMAxgBk_1587606913; 
Received: from 30.225.208.25(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HMAxgBk_1587606913)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 23 Apr 2020 09:55:17 +0800
Subject: Re: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
To: Richard Henderson <richard.henderson@linaro.org>
Cc: laurent@vivier.eu, riku.voipio@iki.fi,
 Alistair Francis <Alistair.Francis@wdc.com>, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, wxy194768@alibaba-inc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20200412020830.607-1-zhiwei_liu@c-sky.com>
 <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
 <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <07931c1c-c7b3-510a-d3cf-5fb6bc877e87@c-sky.com>
Date: Thu, 23 Apr 2020 09:55:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 21:55:18
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Thu, 23 Apr 2020 01:55:31 -0000



On 2020/4/22 12:10, Richard Henderson wrote:
> On 4/21/20 7:34 PM, LIU Zhiwei wrote:
>> Ping.
>>
>> When I port RISU, I find this bug. I can't get the correct registers from the
>> struct ucontext_t parameter in the signal handler.
> The RISC-V Linux ABI will need to be extended to handle RVV state.
>
> There is room in your sigcontext structure:
>
>> struct __riscv_q_ext_state {
>>          __u64 f[64] __attribute__((aligned(16)));
>>          __u32 fcsr;
>>          /*
>>           * Reserved for expansion of sigcontext structure.  Currently zeroed
>>           * upon signal, and must be zero upon sigreturn.
>>           */
>>          __u32 reserved[3];
>> };
> in uc->uc_mcontext.sc_fpregs.q.
>
> That reserved field is going to have to be used in some way.
>
> My suggestion is to use some sort of extendable record list, akin to AArch64:
>
> struct _aarch64_ctx {
>          __u32 magic;
>          __u32 size;
> };
>
> One of the 3 zeros could be the total size of the extensions, so that it's easy
> to validate the size or memcpy the lot without parsing each individual record.
>   The other two zeros could be the first header of the next record.  Which in
> this case also allows the payload of that first record to be aligned mod 16,
> which could come in handy.
>
> Talk to the risc-v kernel engineers and come up with a plan that includes room
> for the next architecture extension as well.  They may have already done so,
> but I'm not monitoring the correct mailing list to know.
Hi Richard,

As far as I know, Guo Ren and Greentime are supporting RVV on Linux, 
based on the v0.7.1 QEMU implementation.
The main problem is that VLEN is not a  fixed number.

Thanks for your advice. I will communicate with them.

When the Linux kernel released with RVV, I will push a new sigcontext 
structure here.

Zhiwei
>
> r~


