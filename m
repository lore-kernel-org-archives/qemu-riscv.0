Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gizxR-0001yy-EG
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 05:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizxP-0001wp-5G
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 05:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizxL-0003LD-UF
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 05:59:01 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gizxJ-00037y-Ac
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 05:58:57 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so22288314wrt.7
	for <qemu-riscv@nongnu.org>; Mon, 14 Jan 2019 02:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TGmZbHY1fXlmUNKvucZs23ko+mC/5YQ3EoU4SP81ndU=;
	b=LKMYIYZtDX70EEV2k0IZ5mueFK2oCfGdW3xubula/ICtptPw+vSYNuCRNZsy+hT57w
	wxldd00w3HOEjR9WjjS50VUwxv+IjYHRnEg2LqmBzSxzXOpoU22dE17ZWsBapgBmhid8
	53qwew0aFKWk/6tF52HLFWuahsfxikga9Q6DwIpkZdzqimGSd4l0W5OBzydFporVoP2p
	52p9mrEAJPwSS/6ytLdCzCJTXX1xJmgXKRCpOhsSCoE1aJDhDBrcOwq8PDQUYLzcimCN
	xayRhFmN5CyDuDSACeUNySUd50ehDNI61kCMuwZ8TR7QT5gTr3nifwaHsDnpB6h4kFEO
	T9rA==
X-Gm-Message-State: AJcUukcBpkT/gSvTLf1g0k94DUTUS1LhPMp4xYLnADHxqW0xahQA3AF6
	kovgny6sPrB8CN8PgxYC8wT6Hw==
X-Google-Smtp-Source: ALg8bN5nKZXWlIiWAO292esSuSdi43IQHzEybpzKmi18T2gKF0lt9fHx4WPXsZdUz4LXIzPssf/oQw==
X-Received: by 2002:adf:e247:: with SMTP id n7mr22573984wri.205.1547463534581; 
	Mon, 14 Jan 2019 02:58:54 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	g129sm26437598wmf.39.2019.01.14.02.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 02:58:54 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"agraf@suse.de" <agraf@suse.de>
References: <d2ae859d3d73ec1897d78131e05a6cf6ba6c94b0.1547255794.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <56d71bbd-e86b-db1c-8d45-7dd229b87081@redhat.com>
Date: Mon, 14 Jan 2019 11:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <d2ae859d3d73ec1897d78131e05a6cf6ba6c94b0.1547255794.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 1/1] riscv: Ensure the
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
X-List-Received-Date: Mon, 14 Jan 2019 10:59:04 -0000

Hi Alistair,

On 1/12/19 2:17 AM, Alistair Francis wrote:
> Cast the kernel start address to the target bit length.
> 
> This ensures that we calculate the initrd offset to a valid address for
> the architecture.

Can you add an example of the failure symptoms?

> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Alexander Graf <agraf@suse.de>
> Reported-by: Alexander Graf <agraf@suse.de>
> ---
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

Shouldn't you update load_elf() and co now to take target_ulong
arguments? This would fix this error generically for all archs.

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

