Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPX3s-0000f6-Gm
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:17:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPX3p-0008Vd-T3
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:17:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPWoN-0000rl-Qa
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:01:20 -0500
Received: from ale.deltatee.com ([207.54.116.67]:41964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPWoN-0000qF-Hj; Wed, 21 Nov 2018 13:01:15 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPWoI-0006KM-R0; Wed, 21 Nov 2018 11:01:11 -0700
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<86e2120f18412152ed2994b72bd874120b86d749.1542819633.git.alistair.francis@wdc.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <b49b54bf-2548-5a6b-1808-511b57cd33ad@deltatee.com>
Date: Wed, 21 Nov 2018 11:01:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <86e2120f18412152ed2994b72bd874120b86d749.1542819633.git.alistair.francis@wdc.com>
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
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 3/6] hw/riscv/virt: Connect the
 gpex PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 18:17:15 -0000



On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>


> diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> index 7937c69e22..3e3d195f37 100644
> --- a/default-configs/riscv32-softmmu.mak
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -1,7 +1,11 @@
>  # Default configuration for riscv-softmmu
>  
> +include pci.mak
> +
>  CONFIG_SERIAL=y
>  CONFIG_VIRTIO_MMIO=y
> -include virtio.mak
>  
>  CONFIG_CADENCE=y
> +
> +CONFIG_PCI_GENERIC=y
> +CONFIG_PCI_XILINX=y

Nit: should PCI_XILINX not be in patch 5? It's not used in this patch
and was a bit confusing when reviewing.

Logan

