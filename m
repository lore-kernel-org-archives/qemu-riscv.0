Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPX3X-0000Jz-Da
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:16:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPX3T-0000Ib-2h
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:16:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPWu5-0006sN-R8
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:07:12 -0500
Received: from ale.deltatee.com ([207.54.116.67]:42022)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPWu5-0006q3-6X; Wed, 21 Nov 2018 13:07:09 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPWu1-0006dQ-GN; Wed, 21 Nov 2018 11:07:06 -0700
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
Date: Wed, 21 Nov 2018 11:07:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 18:16:52 -0000


On 2018-11-21 10:03 a.m., Alistair Francis wrote:
> +    pci_bus = PCI_HOST_BRIDGE(dev)->bus;
> +
> +    for (i = 0; i < nb_nics; i++) {
> +        NICInfo *nd = &nd_table[i];
> +
> +        if (!nd->model) {
> +            nd->model = g_strdup("virtio");
> +        }
> +
> +        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
> +    }

I don't understand what this patch actually accomplishes. It doesn't
seem to affect my network devices when running QEMU. Can you provide a
commit message explaining this?

Thanks,

Logan

