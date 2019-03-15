Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4inG-0003U9-C0
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 05:06:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h4inA-0003Qs-BN
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 05:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h4in8-0006OD-Uw
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 05:06:16 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:52872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1h4in8-0006M2-Ge; Fri, 15 Mar 2019 05:06:14 -0400
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1h4in3-00088z-L7; Fri, 15 Mar 2019 10:06:09 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 3180353-4;
	Fri, 15 Mar 2019 09:06:08 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20190313143705.29129-1-palmer@sifive.com>
	<20190313143705.29129-18-palmer@sifive.com>
	<CAKmqyKPAFOBfppfozwNfJ=TS6kC=+x1VPDB2OxQ7SHYkpT1kvQ@mail.gmail.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <2d60f4a8-66ae-12e0-6de4-2440eab2459a@mail.uni-paderborn.de>
Date: Fri, 15 Mar 2019 10:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPAFOBfppfozwNfJ=TS6kC=+x1VPDB2OxQ7SHYkpT1kvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.3.15.85716, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.22.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 17/29] target/riscv: Convert
 quadrant 1 of RVXC insns to decodetree
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
X-List-Received-Date: Fri, 15 Mar 2019 09:06:19 -0000

Hi Alistair

On 3/14/19 9:28 PM, Alistair Francis wrote:
> On Wed, Mar 13, 2019 at 7:53 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> This commit is the first bad commit in breaking 32-bit boot.
>
> It looks like the jal doesn't jump to the correct address:
>
> ----------------
> IN:
> 0x80000022:  00050433          add             s0,a0,zero
> 0x80000026:  000584b3          add             s1,a1,zero
> 0x8000002a:  2c79              jal             ra,670          # 0x800002c8
>
> ----------------
> IN:
> 0x800002c8:  00000533          add             a0,zero,zero
> 0x800002cc:  8082              ret


Oops! Can you point me to the binary to reproduce this?

Cheers,

Bastian



