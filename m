Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnJgt-0008Pf-W9
	for mharc-qemu-riscv@gnu.org; Sat, 26 Jan 2019 03:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gnJgo-0008PV-Tt
	for qemu-riscv@nongnu.org; Sat, 26 Jan 2019 03:51:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gnJga-00057L-O3
	for qemu-riscv@nongnu.org; Sat, 26 Jan 2019 03:51:45 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:39126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gnJgZ-0004m8-NL; Sat, 26 Jan 2019 03:51:32 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gnJgT-0002kG-45; Sat, 26 Jan 2019 09:51:25 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3107071-5;
	Sat, 26 Jan 2019 08:51:23 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>, richard.henderson@linaro.org
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org, sagark@eecs.berkeley.edu
References: <mhng-a089b75c-29ca-4a50-b64c-e86349ac6190@palmer-si-x1c4>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Openpgp: preference=signencrypt
Autocrypt: addr=kbastian@mail.uni-paderborn.de; prefer-encrypt=mutual; keydata=
	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
	veSNyIMDUzDMrgk=
Message-ID: <69b40819-748e-d555-316a-6ce90e944bde@mail.uni-paderborn.de>
Date: Sat, 26 Jan 2019 09:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <mhng-a089b75c-29ca-4a50-b64c-e86349ac6190@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.26.84516, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
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
X-List-Received-Date: Sat, 26 Jan 2019 08:51:50 -0000

On 1/26/19 12:54 AM, Palmer Dabbelt wrote:
> On Tue, 22 Jan 2019 13:38:52 PST (-0800), richard.henderson@linaro.org wrote:
>> On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
>>> Hi,
>>>
>>> this patchset converts the RISC-V decoder to decodetree in four major steps:
>>>
>>> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
>>>     Many of the gen_* functions are called by the decode functions for 16-bit
>>>     and 32-bit functions. If we move translation code from the gen_*
>>>     functions to the generated trans_* functions of decode-tree, we get a lot of
>>>     duplication. Therefore, we mostly generate calls to the old gen_* function
>>>     which are properly replaced after step 2).
>>>
>>>     Each of the trans_ functions are grouped into files corresponding to their
>>>     ISA extension, e.g. addi which is in RV32I is translated in the file
>>>     'trans_rvi.inc.c'.
>>>
>>> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
>>>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>>>     we convert the arguments in the 16 bit trans_ function to the arguments of
>>>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
>>>
>>> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
>>>     this move all manual translation code into the trans_* instructions of
>>>     decode tree, such that we can remove the old decode_* functions.
>>>
>>> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>>>    by Richard. [Patch 31-35]
>>>
>>> full tree available at
>>> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
>>>
>>> Cheers,
>>> Bastian
>>>
>>> v4 -> v5:
>>>     - fixed rebase error
>>>     - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
>>>     - removed extra sign extension of sraiw
>>>     - removed rs2 == 0 special cases in sraw/srlw
>>
>> All looks good to me now.  Thanks for persevering.
> 
> Thanks for reviewing this.
> 
> Bastian: what sort of testing have you done here?  This is a pretty big change,
> and while it's been fairly extensively reviewed I'm just generally paranoid.
> 

I ran riscv-test as well as booting the newest fedora.

Cheers,
Bastian

