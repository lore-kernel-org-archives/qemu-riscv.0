Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXZr-0005Lz-Rx
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:50:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPXZo-0005LV-Gv
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:50:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPXZl-00081t-B8
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:50:16 -0500
Received: from ale.deltatee.com ([207.54.116.67]:42370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPXZk-0007wi-Lv; Wed, 21 Nov 2018 13:50:13 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPXZf-0006z0-Uf; Wed, 21 Nov 2018 11:50:08 -0700
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
Date: Wed, 21 Nov 2018 11:50:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 18:50:18 -0000



On 2018-11-21 11:32 a.m., Alistair Francis wrote:
> That seems like either a kernel or bbl issue.
> 
> You need to make sure that bbl doesn't edit the device tree (to add
> the Microsemi device or remove the Xilinx one) and ensure your kernel
> supports the Xilinx one.

Ok, how do I stop bbl from editing the device tree? I have a kernel with
Xilinx PCI support but it fails initializing on that machine (see below).

>> In any case, it would be nice if the Microsemi/Xilinx confusion was at
>> least explained in the commit message.
> 
> What should we say? The QEMU machine accurately models the real
> hardware which reports a Xilinx PCIe. The confusion generally appears
> above QEMU where people are used to using the MicroSemi one.

Maybe describing the bbl issue and what to do to overcome it would be
sufficient.

Logan





[    0.312000] xilinx-pcie 2000000000.pci: PCIe Link is UP
[    0.316000] xilinx-pcie 2000000000.pci: host bridge /pci@2000000000
ranges:
[    0.316000] xilinx-pcie 2000000000.pci:   No bus range found for
/pci@2000000000, using [bus 00-ff]
[    0.320000] xilinx-pcie 2000000000.pci:   MEM 0x40000000..0x5fffffff
-> 0x40000000
[    0.320000] xilinx-pcie 2000000000.pci: PCI host bridge to bus 0000:00
[    0.324000] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.324000] pci_bus 0000:00: root bus resource [mem
0x40000000-0x5fffffff]
[    0.332000] pci 0000:00:00.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[    0.336000] pci_bus 0000:01: extended config space not accessible
[    0.340000] pci 0000:00:00.0: PCI bridge to [bus 01]

