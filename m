Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPbst-00064V-Bf
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 18:26:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPbsr-00061C-9p
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:26:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPbsq-0002UK-HV
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:26:13 -0500
Received: from ale.deltatee.com ([207.54.116.67]:44360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPbsl-00026s-Re; Wed, 21 Nov 2018 18:26:08 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPbsh-0001wm-3e; Wed, 21 Nov 2018 16:26:03 -0700
To: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@sifive.com>
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	abologna@redhat.com
References: <CAKmqyKNpSWpaUVzJobNPvB=_T+tXhGdiWPTkWmQxdKQf8SHbig@mail.gmail.com>
	<mhng-dc5c5bfa-47d8-41c6-8240-fdb97d24555e@palmer-si-x1c4>
	<20181121231005.GB1421@roeck-us.net>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <9ee74477-105f-db2e-b69c-e67d485b9c2f@deltatee.com>
Date: Wed, 21 Nov 2018 16:26:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181121231005.GB1421@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: abologna@redhat.com, qemu-devel@nongnu.org,
	Alistair.Francis@wdc.com, qemu-riscv@nongnu.org,
	alistair23@gmail.com, palmer@sifive.com, linux@roeck-us.net
X-SA-Exim-Mail-From: logang@deltatee.com
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 207.54.116.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 5/6]
 hw/riscv/sifive_u: Connect the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 23:26:14 -0000



On 2018-11-21 4:10 p.m., Guenter Roeck wrote:
> FWIW, I absoutely agree. If the board can only be used to boot an initrd,
> it is quite pointless to have it around. Actually it is worse than pointless,
> since it will result in people wasting their time trying to get it to work.

As someone who has wasted their time on it, I second this sentiment.

Logan

