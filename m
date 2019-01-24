Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmn3N-0004VG-Gw
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 17:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gmn3K-0004Rm-Qu
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 17:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gmn0A-0006Y8-6M
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 16:57:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gmn0A-0006Rl-0f
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 16:57:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so4824066wmj.1
	for <qemu-riscv@nongnu.org>; Thu, 24 Jan 2019 13:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Wr3J7uWXVzpeMHbHJaUL7WdG6Gx1teZuU4vls5ZqYVw=;
	b=fE/ue6gli6fL7EwSv+EWgA4Ps14lWzXs9V2lOO0we4/UoV8nyaamF98tDDC1FHhj+v
	Sv3NMH67FurKJCAGVhCG2+EI2vnXfhwmwbmG0ug4fRVkAJFhq6n5z+XyBRK5q2/nwsvW
	8MUOTR1c/4eLZR01XSX0E9gcVCQET14HY1kW1rpWtOK6wFyUkuXyzEm+5uudY2S4aL11
	cotPTa6BS+xtLOB0suYO7RMUBW8kLYCQ7iFLevS5qNgB9kCYEosGu8IfdHN2dlVqko7+
	UaW0VUcD46h9gBrx4Pzts5ScCXmlisyjLJsvVLwpfwQRHrWQEq1OgxwlJiC7G1m07i25
	EkLg==
X-Gm-Message-State: AJcUukeyUtW98GLhc/euKC0+Xt3qI8jb5vfO9XADr63ZCFEBFpi10TDK
	PJRdB2MgPQytua3lr8FBY7STsw==
X-Google-Smtp-Source: ALg8bN7HeLCFsKxJlvJPmP268mOwlTMdJ3TRVHrid90h+b5EB3NkInfmCJcxZcKXT9NMh4dZPrGN+A==
X-Received: by 2002:a1c:f605:: with SMTP id w5mr4548274wmc.116.1548367040804; 
	Thu, 24 Jan 2019 13:57:20 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	v1sm140856769wrw.90.2019.01.24.13.57.19
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 13:57:20 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <2b9ba958f8b317df83c37b348ad543fef2113528.1548351450.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fd5f51bd-92a6-f653-40aa-02956a2f921e@redhat.com>
Date: Thu, 24 Jan 2019 22:57:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2b9ba958f8b317df83c37b348ad543fef2113528.1548351450.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 1/1] riscv: Ensure the
 kernel start address is correctly cast
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
X-List-Received-Date: Thu, 24 Jan 2019 22:00:52 -0000

On 1/24/19 6:37 PM, Alistair Francis wrote:
> Cast the kernel start address to the target bit length.
> 
> This ensures that we calculate the initrd offset to a valid address for
> the architecture.
> 
> Steps to reproduce the original problem (reported by Alex):
>   Build U-Boot for the virt machine for riscv32. Then run it with
> 
>     $ qemu-system-riscv32 -M virt -kernel u-boot -nographic -initrd <a file>
> 
>   You can find the initrd address with
> 
>     U-Boot# fdt addr $fdtcontroladdr
>     U-Boot# fdt ls /chosen
> 
>   Then take a peek at that address:
> 
>     U-Boot# md.b <addr>
> 
>   and you will see that there is nothing there without this patch. The
>   reason is that the binary was loaded to a negative address.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Alexander Graf <agraf@suse.de>
> Reported-by: Alexander Graf <agraf@suse.de>
> ---
> v3:
>  - Add steps to reproduce

Thanks, this is useful to write an acceptance test.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> v2:
>  - Remove old comment
>  hw/riscv/sifive_e.c | 2 +-
>  hw/riscv/sifive_u.c | 2 +-
>  hw/riscv/spike.c    | 2 +-
>  hw/riscv/virt.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 5d9d65ff29..e5d7fc548e 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -74,7 +74,7 @@ static const struct MemmapEntry {
>      [SIFIVE_E_DTIM] =     { 0x80000000,     0x4000 }
>  };
>  
> -static uint64_t load_kernel(const char *kernel_filename)
> +static target_ulong load_kernel(const char *kernel_filename)
>  {
>      uint64_t kernel_entry, kernel_high;
>  
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 3bd3b67507..3b3acec377 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -65,7 +65,7 @@ static const struct MemmapEntry {
>  
>  #define GEM_REVISION        0x10070109
>  
> -static uint64_t load_kernel(const char *kernel_filename)
> +static target_ulong load_kernel(const char *kernel_filename)
>  {
>      uint64_t kernel_entry, kernel_high;
>  
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 268df04c3c..79cb4c1282 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -53,7 +53,7 @@ static const struct MemmapEntry {
>      [SPIKE_DRAM] =     { 0x80000000,        0x0 },
>  };
>  
> -static uint64_t load_kernel(const char *kernel_filename)
> +static target_ulong load_kernel(const char *kernel_filename)
>  {
>      uint64_t kernel_entry, kernel_high;
>  
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e7f0716fb6..648462b18c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -62,7 +62,7 @@ static const struct MemmapEntry {
>      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
>  };
>  
> -static uint64_t load_kernel(const char *kernel_filename)
> +static target_ulong load_kernel(const char *kernel_filename)
>  {
>      uint64_t kernel_entry, kernel_high;
>  
> 

