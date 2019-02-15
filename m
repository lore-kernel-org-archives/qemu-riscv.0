Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gucLF-0003mb-In
	for mharc-qemu-riscv@gnu.org; Fri, 15 Feb 2019 07:11:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucLD-0003lJ-FX
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:11:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucLC-0004gB-Sb
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:11:39 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:46084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gucL5-0004NS-3U; Fri, 15 Feb 2019 07:11:33 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gucL2-0000ow-3a; Fri, 15 Feb 2019 13:11:28 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3147829-3;
	Fri, 15 Feb 2019 12:11:26 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: Peer Adelt <peer.adelt@hni.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
	<20190213155414.22285-13-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <04988556-ea52-3859-8d86-ef7c1b50be80@mail.uni-paderborn.de>
Date: Fri, 15 Feb 2019 13:11:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-13-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.15.120616, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 12/35] target/riscv:
 Convert RV32F insns to decodetree
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
X-List-Received-Date: Fri, 15 Feb 2019 12:11:40 -0000


On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
>   target/riscv/insn32.decode              |  35 +++
>   target/riscv/insn_trans/trans_rvf.inc.c | 353 ++++++++++++++++++++++++
>   target/riscv/translate.c                |   1 +
>   3 files changed, 389 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c


All translate_foo() functions are missing 'if (!has_ext(ctx, RVF)' checks.

Cheers,

Bastian


