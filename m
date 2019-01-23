Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmN4Q-0001zH-7Y
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 13:16:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmL7x-0008Ki-2W
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 11:11:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmL7w-0004G0-72
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 11:11:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmL7r-00045z-Oq; Wed, 23 Jan 2019 11:11:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18F03C0A2843;
	Wed, 23 Jan 2019 16:11:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-107.ams2.redhat.com [10.36.116.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C51C67148;
	Wed, 23 Jan 2019 16:11:26 +0000 (UTC)
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, pbonzini@redhat.com,
	sameo@linux.intel.com, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
References: <20190123065618.3520-1-yang.zhong@intel.com>
	<20190123065618.3520-15-yang.zhong@intel.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <dcd4155e-0278-4fed-6808-84ed89bed65a@redhat.com>
Date: Wed, 23 Jan 2019 17:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190123065618.3520-15-yang.zhong@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 16:11:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 23 Jan 2019 13:16:12 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC PATCH v4 14/44]
 hw/riscv/Makefile.objs: Create CONFIG_* for riscv boards
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
X-List-Received-Date: Wed, 23 Jan 2019 16:11:46 -0000

On 2019-01-23 07:55, Yang Zhong wrote:
> Add the new configs to default-configs/riscv*-sofmmu.mak.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  default-configs/riscv32-softmmu.mak |  7 +++++++
>  default-configs/riscv64-softmmu.mak |  7 +++++++
>  hw/riscv/Makefile.objs              | 22 +++++++++++-----------
>  3 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> index fbfd1d4e4b..65337166e1 100644
> --- a/default-configs/riscv32-softmmu.mak
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -12,3 +12,10 @@ CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
>  
>  CONFIG_VGA=y
>  CONFIG_VGA_PCI=y
> +
> +CONFIG_SPIKE=y
> +CONFIG_HART=y
> +CONFIG_SIFIVE_E=y
> +CONFIG_SIFIVE=y
> +CONFIG_SIFIVE_U=y
> +CONFIG_RISCV_VIRT=y
> diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> index fbfd1d4e4b..65337166e1 100644
> --- a/default-configs/riscv64-softmmu.mak
> +++ b/default-configs/riscv64-softmmu.mak
> @@ -12,3 +12,10 @@ CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
>  
>  CONFIG_VGA=y
>  CONFIG_VGA_PCI=y
> +
> +CONFIG_SPIKE=y
> +CONFIG_HART=y
> +CONFIG_SIFIVE_E=y
> +CONFIG_SIFIVE=y
> +CONFIG_SIFIVE_U=y
> +CONFIG_RISCV_VIRT=y
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index 1dde01d39d..79bfb3abf9 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -1,11 +1,11 @@
> -obj-y += riscv_htif.o
> -obj-y += riscv_hart.o
> -obj-y += sifive_e.o
> -obj-y += sifive_clint.o
> -obj-y += sifive_prci.o
> -obj-y += sifive_plic.o
> -obj-y += sifive_test.o
> -obj-y += sifive_u.o
> -obj-y += sifive_uart.o
> -obj-y += spike.o
> -obj-y += virt.o
> +obj-$(CONFIG_SPIKE) += riscv_htif.o
> +obj-$(CONFIG_HART) += riscv_hart.o
> +obj-$(CONFIG_SIFIVE_E) += sifive_e.o
> +obj-$(CONFIG_SIFIVE) += sifive_clint.o
> +obj-$(CONFIG_SIFIVE) += sifive_prci.o
> +obj-$(CONFIG_SIFIVE) += sifive_plic.o
> +obj-$(CONFIG_SIFIVE) += sifive_test.o
> +obj-$(CONFIG_SIFIVE_U) += sifive_u.o
> +obj-$(CONFIG_SIFIVE) += sifive_uart.o
> +obj-$(CONFIG_SPIKE) += spike.o
> +obj-$(CONFIG_RISCV_VIRT) += virt.o

Looks reasonable to me, so I dare to say:

Reviewed-by: Thomas Huth <thuth@redhat.com>

... but I'm not an expert here, I hope some of the RISC-V maintainers
could chime in?

