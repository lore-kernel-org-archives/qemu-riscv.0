Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1golrT-0008Vo-IO
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 04:08:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1golrS-0008V6-1m
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 04:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1golrR-0001fn-Au
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 04:08:46 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:49548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1golrP-0001eF-JG; Wed, 30 Jan 2019 04:08:43 -0500
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1golrI-0008Ag-GE; Wed, 30 Jan 2019 10:08:36 +0100
Received: from mail.uni-paderborn.de by pova with queue id 3114320-2;
	Wed, 30 Jan 2019 09:08:34 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org, sagark@eecs.berkeley.edu
References: <mhng-2dd4c232-3efb-4173-aae1-491b9aa2685b@palmer-si-x1c4>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <603b6279-8670-d614-e1ac-4c13bf870ec9@mail.uni-paderborn.de>
Date: Wed, 30 Jan 2019 10:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <mhng-2dd4c232-3efb-4173-aae1-491b9aa2685b@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.30.90017, AntiVirus-Engine: 5.56.1,
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
X-List-Received-Date: Wed, 30 Jan 2019 09:08:46 -0000

Hi Palmer,

On 1/29/19 8:22 PM, Palmer Dabbelt wrote:
> [..]
> Well, that pretty much exhausts my testing scheme :).  I think 
> Alistair might have a setup for booting a 32-bit Yocto-based distro in 
> QEMU.  Assuming he has the flow set up and it boots then I don't see 
> any reason not to merge it.
>
> Thanks for pulling this all together, it's really great to have a 
> cleaner decoder!
>
> Alistair: if that's true, can you give this a shot?
>
> Bastian: do you mind collecting the relevant tags (Reviwed-by, etc) 
> and putting them in a v6?


I already did (see 
http://lists.gnu.org/archive/html/qemu-riscv/2019-01/msg00147.html) :)

Cheers,

Bastian



