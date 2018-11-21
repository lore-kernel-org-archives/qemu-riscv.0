Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPX3k-0000Uh-2i
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:17:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPX3h-0008W6-PR
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPWsR-00052a-Pi
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:05:30 -0500
Received: from ale.deltatee.com ([207.54.116.67]:42010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPWsQ-0004yP-0q; Wed, 21 Nov 2018 13:05:27 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPWsM-0006cv-2y; Wed, 21 Nov 2018 11:05:22 -0700
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
Date: Wed, 21 Nov 2018 11:05:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: abologna@redhat.com, linux@roeck-us.net,
	alistair23@gmail.com, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org, Alistair.Francis@wdc.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 207.54.116.67
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect
 the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 18:17:06 -0000



On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> Connect the Xilinx PCIe device based on the information in the device
> tree stored in the ROM of the HiFish Unleashed board.

I only briefly tested this patch but could not get any PCI devices to
come up with the sifive_u machine. Depending on the kernel I tried, it
either failed to initialize a Xilinx PCIe (likely due to a mismatch with
the DT) or it appears to successfully initialize a Microsemi device but
did not enumerate any devices underneath.

In any case, it would be nice if the Microsemi/Xilinx confusion was at
least explained in the commit message.

Thanks,

Logan

