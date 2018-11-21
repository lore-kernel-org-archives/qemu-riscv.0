Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPX3e-0000P8-Su
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:17:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPX3b-0000OB-Mw
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPWom-0001K1-QD
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:01:43 -0500
Received: from ale.deltatee.com ([207.54.116.67]:41976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPWok-00017o-Un; Wed, 21 Nov 2018 13:01:39 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPWob-0006Ka-MG; Wed, 21 Nov 2018 11:01:30 -0700
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<4120d0a7e4fe6f3fd6bdd6c084a40a67a48be374.1542819633.git.alistair.francis@wdc.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <e3478876-09d1-121a-8c3c-850aa353449c@deltatee.com>
Date: Wed, 21 Nov 2018 11:01:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <4120d0a7e4fe6f3fd6bdd6c084a40a67a48be374.1542819633.git.alistair.francis@wdc.com>
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
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 4/6] riscv: Enable VGA and
 PCIE_VGA
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
X-List-Received-Date: Wed, 21 Nov 2018 18:17:02 -0000



On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> Enable compile support for VGA devices. This allows the user to conenct
> a display by adding '-device bochs-display -display sdl' to their
> command line argument.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

> ---
>  default-configs/riscv32-softmmu.mak | 3 +++
>  default-configs/riscv64-softmmu.mak | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> index 3e3d195f37..05fae82f1b 100644
> --- a/default-configs/riscv32-softmmu.mak
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -9,3 +9,6 @@ CONFIG_CADENCE=y
>  
>  CONFIG_PCI_GENERIC=y
>  CONFIG_PCI_XILINX=y
> +
> +CONFIG_VGA=y
> +CONFIG_VGA_PCI=y
> diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> index 3e3d195f37..05fae82f1b 100644
> --- a/default-configs/riscv64-softmmu.mak
> +++ b/default-configs/riscv64-softmmu.mak
> @@ -9,3 +9,6 @@ CONFIG_CADENCE=y
>  
>  CONFIG_PCI_GENERIC=y
>  CONFIG_PCI_XILINX=y
> +
> +CONFIG_VGA=y
> +CONFIG_VGA_PCI=y
> 

