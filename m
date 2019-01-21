Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glVbS-0002s0-6Y
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jan 2019 04:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVbO-0002qa-5n
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:10:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVbM-000879-6O
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:10:41 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:50460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1glVbL-0007yX-Rk; Mon, 21 Jan 2019 04:10:40 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 hoth)
	id 1glVb3-0003AE-Pt; Mon, 21 Jan 2019 10:10:21 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3092492-3;
	Mon, 21 Jan 2019 09:10:19 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-27-kbastian@mail.uni-paderborn.de>
	<235a7ee4-8f5e-1b2a-09fd-e4809c674065@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <5ad14b08-7db1-279a-a702-9ce2e981397e@mail.uni-paderborn.de>
Date: Mon, 21 Jan 2019 10:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <235a7ee4-8f5e-1b2a-09fd-e4809c674065@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.21.90016, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 26/35] target/riscv: Remove
 shift and slt insn manual decoding
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
X-List-Received-Date: Mon, 21 Jan 2019 09:10:44 -0000


On 1/20/19 2:43 AM, Richard Henderson wrote:
> On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>> ---
>> v3 -> v4:
>>      - refactor tcg_gen_set_cond_tl(TCG_COND_LT,..) into gen_slt function
>>        and reuse gen_arith(..., &gen_slt) for all trans_slt functions.
>>      - Add missing sign extension to trans_srlw/sllw
>>      - Made rs2 == 0 a special case of srlw/sllw
> Why?  It's not like it is a likely case, and it works without.


Because you suggested it :) (see 
https://patchwork.kernel.org/patch/10662699/). Maybe I misunderstood 
your comment. If you like I can remove it in the respin.


Cheers,

Bastian


