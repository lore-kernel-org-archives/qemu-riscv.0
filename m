Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gucNR-0004ah-Rj
	for mharc-qemu-riscv@gnu.org; Fri, 15 Feb 2019 07:13:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucNP-0004a3-Ei
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:13:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucNO-0007ME-QV
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:13:55 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:49084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gucNN-0007J0-6a; Fri, 15 Feb 2019 07:13:54 -0500
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 nylar)
	id 1gucNK-0003pE-Od; Fri, 15 Feb 2019 13:13:50 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 3122223-4;
	Fri, 15 Feb 2019 12:13:49 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: Peer Adelt <peer.adelt@hni.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
	<20190213155414.22285-17-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <64f366dc-b2f1-020e-30e2-8a657398d369@mail.uni-paderborn.de>
Date: Fri, 15 Feb 2019 13:13:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-17-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.15.120916, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 16/35] target/riscv:
 Convert RV priv insns to decodetree
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
X-List-Received-Date: Fri, 15 Feb 2019 12:13:56 -0000


On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
> +}
> +
> +static bool trans_sret(DisasContext *ctx, arg_sret *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +
> +    if (riscv_has_ext(ctx->env, RVS)) {


This should use has_ext()

Cheers,

Bastian


