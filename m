Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtqVQ-0007SP-Jp
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 04:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gtqVL-0007QM-8n
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 04:06:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gtqVH-0000qF-Ko
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 04:06:55 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:49140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gtqVF-0000mz-Nu; Wed, 13 Feb 2019 04:06:49 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gtqV9-0002TY-3g; Wed, 13 Feb 2019 10:06:43 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3142729-3;
	Wed, 13 Feb 2019 09:06:41 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<mhng-0fc7cd00-deda-4e41-abb3-c78657c4f0f1@palmer-si-x1c4>
	<CANs6eMkMKGKVdnWh2CmEz1sOtXEZh6eMUN5NkCwGjna7zEhh9Q@mail.gmail.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <7a7b5675-3d66-6c87-8830-74c60f8a7471@mail.uni-paderborn.de>
Date: Wed, 13 Feb 2019 10:06:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CANs6eMkMKGKVdnWh2CmEz1sOtXEZh6eMUN5NkCwGjna7zEhh9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.13.85716, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 00/35] target/riscv:
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
X-List-Received-Date: Wed, 13 Feb 2019 09:06:58 -0000


On 2/13/19 3:15 AM, Palmer Dabbelt wrote:
> On Tue, Feb 12, 2019 at 3:21 PM Palmer Dabbelt <palmer@sifive.com> wrote:
[snip]
>>
>> Do you, by any chance, have a v7?  It looks like there's quite a few merge
>> conflicts here, and while I'm OK fixing them I don't want to do it if you
>> already have.
>>
> I made it through my rebase, so unless you want to send out a v7 I will.
> There were some meaningful changes so I'd like to get a round of review
> just so everyone is on the same page.


Thanks for doing this work. I don't have a v7 yet, since I was waiting 
on your current pull-request to get merged. So please do send a v7, I'm 
happy to review/test it.

Cheers,

Bastian


