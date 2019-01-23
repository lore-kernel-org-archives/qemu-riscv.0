Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmEd3-0006qS-Tz
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 04:15:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEd1-0006mI-CV
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:15:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEd0-0002fb-96
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:15:23 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:56176)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gmEct-0002ZE-6L; Wed, 23 Jan 2019 04:15:15 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gmEcq-00051e-4n; Wed, 23 Jan 2019 10:15:12 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3097550-3;
	Wed, 23 Jan 2019 09:15:11 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<2153eec6-f25f-4e34-6423-01d76a14815c@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <66fd9695-c511-b068-7cf1-b529d9f44d9d@mail.uni-paderborn.de>
Date: Wed, 23 Jan 2019 10:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2153eec6-f25f-4e34-6423-01d76a14815c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.23.90616, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 00/35] target/riscv:
 Convert to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2019 09:15:24 -0000


On 1/22/19 10:38 PM, Richard Henderson wrote:
> On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
>> Hi,
>>
>> this patchset converts the RISC-V decoder to decodetree in four major steps:
>>
>> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
>>      Many of the gen_* functions are called by the decode functions for 16-bit
>>      and 32-bit functions. If we move translation code from the gen_*
>>      functions to the generated trans_* functions of decode-tree, we get a lot of
>>      duplication. Therefore, we mostly generate calls to the old gen_* function
>>      which are properly replaced after step 2).
>>
>>      Each of the trans_ functions are grouped into files corresponding to their
>>      ISA extension, e.g. addi which is in RV32I is translated in the file
>>      'trans_rvi.inc.c'.
>>
>> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
>>      All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>>      we convert the arguments in the 16 bit trans_ function to the arguments of
>>      the corresponding 32 bit instruction and call the 32 bit trans_ function.
>>
>> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
>>      this move all manual translation code into the trans_* instructions of
>>      decode tree, such that we can remove the old decode_* functions.
>>
>> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>>     by Richard. [Patch 31-35]
>>
>> full tree available at
>> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
>>
>> Cheers,
>> Bastian
>>
>> v4 -> v5:
>>      - fixed rebase error
>>      - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
>>      - removed extra sign extension of sraiw
>>      - removed rs2 == 0 special cases in sraw/srlw
> All looks good to me now.  Thanks for persevering.


Thanks for your great reviews. I'll do a final respin to fix the funky 
indentations. Alistair do you want to pick up the series?

Cheers,

Bastian


