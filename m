Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gucJf-0002yN-6s
	for mharc-qemu-riscv@gnu.org; Fri, 15 Feb 2019 07:10:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucJc-0002wJ-Tk
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucJc-0003P1-5x
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:10:00 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:35378)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gucJa-0003Iv-0w; Fri, 15 Feb 2019 07:09:58 -0500
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gucJV-0005Z7-H0; Fri, 15 Feb 2019 13:09:53 +0100
Received: from mail.uni-paderborn.de by pova with queue id 3150947-2;
	Fri, 15 Feb 2019 12:09:52 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: Peer Adelt <peer.adelt@hni.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
	<20190213155414.22285-11-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <db2cbfcb-1087-eacb-9354-da5d78c55e8d@mail.uni-paderborn.de>
Date: Fri, 15 Feb 2019 13:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-11-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.15.120016, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 10/35] target/riscv:
 Convert RV32A insns to decodetree
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
X-List-Received-Date: Fri, 15 Feb 2019 12:10:01 -0000


On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
>   target/riscv/insn32.decode              |  17 +++
>   target/riscv/insn_trans/trans_rva.inc.c | 149 ++++++++++++++++++++++++
>   target/riscv/translate.c                |   1 +
>   3 files changed, 167 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e53944bf0e40..00b9e2d9a508 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode


All translate_foo() functions are missing 'if (!has_ext(ctx, RVA)) 
return false'

Cheers,

Bastian


