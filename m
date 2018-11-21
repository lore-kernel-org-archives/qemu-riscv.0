Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPWrs-0006NM-JT
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:04:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPWn2-0004LQ-Jp
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:59:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPWmy-00072r-LA
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:59:52 -0500
Received: from ale.deltatee.com ([207.54.116.67]:41934)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPWmx-00071O-V0; Wed, 21 Nov 2018 12:59:48 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPWmt-0006JQ-4u; Wed, 21 Nov 2018 10:59:43 -0700
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<005f96f5dbffd4c2e370f8b0ee102d3b477e19b0.1542819633.git.alistair.francis@wdc.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <e49bd19c-ebac-f6c7-d861-2465a5705662@deltatee.com>
Date: Wed, 21 Nov 2018 10:59:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <005f96f5dbffd4c2e370f8b0ee102d3b477e19b0.1542819633.git.alistair.francis@wdc.com>
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
X-Mailman-Approved-At: Wed, 21 Nov 2018 13:04:51 -0500
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 2/6] hw/riscv/virt: Adjust
 memory layout spacing
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
X-List-Received-Date: Wed, 21 Nov 2018 17:59:53 -0000



On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

> ---
>  hw/riscv/virt.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2b38f89070..6b6fa39aaa 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -47,14 +47,14 @@ static const struct MemmapEntry {
>      hwaddr base;
>      hwaddr size;
>  } virt_memmap[] = {
> -    [VIRT_DEBUG] =    {        0x0,      0x100 },
> -    [VIRT_MROM] =     {     0x1000,    0x11000 },
> -    [VIRT_TEST] =     {   0x100000,     0x1000 },
> -    [VIRT_CLINT] =    {  0x2000000,    0x10000 },
> -    [VIRT_PLIC] =     {  0xc000000,  0x4000000 },
> -    [VIRT_UART0] =    { 0x10000000,      0x100 },
> -    [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
> -    [VIRT_DRAM] =     { 0x80000000,        0x0 },
> +    [VIRT_DEBUG] =       {        0x0,         0x100 },
> +    [VIRT_MROM] =        {     0x1000,       0x11000 },
> +    [VIRT_TEST] =        {   0x100000,        0x1000 },
> +    [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> +    [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
> +    [VIRT_UART0] =       { 0x10000000,         0x100 },
> +    [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
> +    [VIRT_DRAM] =        { 0x80000000,           0x0 },
>  };
>  
>  static uint64_t load_kernel(const char *kernel_filename)
> 

