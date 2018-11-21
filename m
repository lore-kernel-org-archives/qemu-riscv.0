Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPapo-0006np-5b
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:19:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPapl-0006lR-OR
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:18:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPaph-0008IQ-Nv
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:18:57 -0500
Received: from ale.deltatee.com ([207.54.116.67]:43894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPaph-0008Hc-Hd; Wed, 21 Nov 2018 17:18:53 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPape-0001Ad-1G; Wed, 21 Nov 2018 15:18:51 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
	<0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
	<CAKmqyKNitWerbpVzQrNye3KiPj=5DVFXan4SpiN-+br_P-RG+Q@mail.gmail.com>
	<0fac09ca-12d5-1462-4456-66646f168ab5@deltatee.com>
	<CAKmqyKMTxgk41cBz=hW-meCUAi-_20vguqN40f_ThRU-rsaJXA@mail.gmail.com>
	<17256c59-cf5e-2247-985a-84c26f9d64a9@deltatee.com>
	<CAKmqyKMij-hfwFn8snBni0D7puJMwb1bHXiJP939QEPGznENEQ@mail.gmail.com>
	<CAKmqyKPcoouWEC9KqP2z5n0tg-Zf_4FpJD9mDPWbm=z6QXwcJQ@mail.gmail.com>
	<1aeba982-3db9-4f29-aa79-be98ff0e363b@deltatee.com>
Message-ID: <492a9506-68d5-7784-4089-5ea1ddb2a413@deltatee.com>
Date: Wed, 21 Nov 2018 15:18:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1aeba982-3db9-4f29-aa79-be98ff0e363b@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: abologna@redhat.com, linux@roeck-us.net,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair.Francis@wdc.com, alistair23@gmail.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 207.54.116.67
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 6/6] hw/riscv/virt: Connect a
 VirtIO net PCIe device
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
X-List-Received-Date: Wed, 21 Nov 2018 22:18:58 -0000



On 2018-11-21 3:16 p.m., Logan Gunthorpe wrote:
> 
> 
> On 2018-11-21 3:14 p.m., Alistair Francis wrote:
>>> and networking works?
>>
>> Yep, it should. This is for the -nic option [1]. I misunderstood when
>> I was going through it.
>>
>> We can drop this patch then.
>>
>> 1: https://github.com/qemu/qemu/commit/fea9b3ca9cc4685f89e0b929a61e51098fbb4f49
> 
> Ah, ok, that clears it up. You can drop it or keep it, but if you keep
> it you should have a similar commit message.

Though, if you choose to keep the patch, falling back to virtio as the
default NIC may not be the correct choice seeing the machine does not
have any virtio bus...

Logan

