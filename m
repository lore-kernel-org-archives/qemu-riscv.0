Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPY7a-0001Jf-TX
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:25:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPY7Y-0001J5-FR
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:25:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPY7U-0000Ef-Ct
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:25:08 -0500
Received: from ale.deltatee.com ([207.54.116.67]:42726)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPY7T-0000C6-Hr; Wed, 21 Nov 2018 14:25:04 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPY7N-0007Vp-3Q; Wed, 21 Nov 2018 12:24:57 -0700
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
	<CAKmqyKMhpAPXFF5cQkqKYcNjD5aciDW7Ek53+W=1XNp3RGFLmw@mail.gmail.com>
	<33646fef-adb7-26b4-ba01-79f9a0f5bdae@deltatee.com>
	<CAKmqyKMJvTb=JebfA1N-40-MqgHkAj98JOH51t6K--zjYLXSnA@mail.gmail.com>
	<d316a936-c726-dd4c-f90a-9690b4e3fc3d@deltatee.com>
	<CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <6480496b-dbb5-37bb-57e2-7a4819c61511@deltatee.com>
Date: Wed, 21 Nov 2018 12:24:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 19:25:10 -0000



On 2018-11-21 12:21 p.m., Alistair Francis wrote:
> On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>> Well, I also have a kernel (one I've built myself) without microsemi
>> support, but with Xilinx support and it also doesn't work (see my dmesg
>> logs I sent).
> 
> So this one should work.

It does not, see the dmesgs I sent a few emails ago.

>>
>>> For people who have modified the standard bbl to edit the device tree
>>> before passing it to Linux to add the MicroSemi PCIe node, it won't
>>> work. That's a very small number of people who have modified the
>>> standard boot loader. I don't think we need to document how those
>>> people get back to the default set-up.
>>
>> I have not done that. And it's not working for me.
> 
> If you haven't done this then how can Linux know to probe the
> MicroSemi PCIe root complex?

Oh, well actually, in this case I was using the bbl/kernel you sent us,
so I'm not actually sure what's in it. The stuff I built myself doesn't
have any of the microsemi stuff, so it sounds like all that was a red
herring.

Logan

