Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyZ7c-0008Bh-H9
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 06:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyZ7Z-0008Aq-Un
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyZ7Y-0003C7-En
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:06:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyZ7Y-0003BG-7Z
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:06:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id t16so1004439wra.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2019 03:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4nmllPcEhYaEJs68tgHuQ5qqmn++ZDafoOXvJZcokHk=;
 b=pBfWCEc3PrwjsBzZPrEPDbYOVOOlxoYd9fapIA6f7LlbRjIeBXnlU4nVbmg94XFhJZ
 vWvWJJMPUe7yzNJX2PTwf2VacR8CjvuOzrxXG+rzdaPkF/cGZlZJYYg3IAVezuFLpy00
 8tKb9cjyoaN3z1dVHSrv5DmAyOXBlwRfupmOxhOGt4pGdA+QezEuvc4GHCrGlRHubDDd
 I+7G+3BpcHZkY6b+6Vw1rzC46ziRm50HZfMtEKrBgJGiRBNT7FDjrKPOGNHqQF2s+xps
 u+NDNIE75CFTZ2zS+N3twF7XK3BUT5sIMfTgy388iztqV+1gp2cyBG/WC4xTsG0RyVn2
 LQNA==
X-Gm-Message-State: APjAAAVsspe6JqBFNt1KYSolbyQvX187Nup9UyupyeaJic1r2CinhG8z
 jHUqtaMxr1o1xbestebYv5ykXA==
X-Google-Smtp-Source: APXvYqz+oIj1oEb5S9Wcb1SdPyATJ1ItG3ZInp8JTtTW+nFG+aYKAl8f6PS/MrJCfAiBLINYgwP9ow==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr9597279wrm.12.1565949967319;
 Fri, 16 Aug 2019 03:06:07 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id u130sm8566224wmg.28.2019.08.16.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:06:06 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: rth@twiddle.net, pbonzini@redhat.com, mst@redhat.com,
 imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 xiaoguangrong.eric@gmail.com, alistair@alistair23.me,
 peter.maydell@linaro.org, b.galvani@gmail.com, clg@kaod.org,
 andrew@aj.id.au, joel@jms.id.au, i.mitsyanko@gmail.com, robh@kernel.org,
 peter.chubb@nicta.com.au, sundeep.lkml@gmail.com, jan.kiszka@web.de,
 balrogg@gmail.com, eric.auger@redhat.com, kraxel@redhat.com,
 michael@walle.cc, kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 keith.busch@intel.com, marcandre.lureau@redhat.com,
 Andrew.Baumann@microsoft.com, edgar.iglesias@gmail.com,
 antonynpavlov@gmail.com, chouteau@adacore.com, frederic.konrad@adacore.com,
 huth@tuxfamily.org, mark.cave-ayland@ilande.co.uk, hpoussin@reactos.org,
 arikalo@wavecomp.com, balaton@eik.bme.hu, gxt@mprc.pku.edu.cn,
 david@gibson.dropbear.id.au, deller@gmx.de, ehabkost@redhat.com,
 sstabellini@kernel.org, anthony.perard@citrix.com, paul.durrant@citrix.com,
 aurelien@aurel32.net, amarkovic@wavecomp.com, magnus.damm@gmail.com,
 berto@igalia.com, minyard@acm.org, pburton@wavecomp.com, jslaby@suse.cz,
 jcd@tribudubois.net, andrew.smirnov@gmail.com, green@moxielogic.com,
 jasowang@redhat.com, dmitry.fleytman@gmail.com, sw@weilnetz.de,
 jiri@resnulli.us, crwulff@gmail.com, marex@denx.de, lersek@redhat.com,
 proljc@gmail.com, shorne@gmail.com, yuval.shaia@oracle.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 walling@linux.ibm.com, cohuck@redhat.com, david@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, fam@euphon.net, hare@suse.com,
 atar4qemu@gmail.com, stefanb@linux.ibm.com, alex.williamson@redhat.com,
 jcmvbkbc@gmail.com, laurent@vivier.eu, claudio.fontana@suse.com,
 stefanha@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940916012.8169@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <22d6f51c-c734-3976-2fc1-34c9c74a075e@redhat.com>
Date: Fri, 16 Aug 2019 12:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940916012.8169@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 27/42] hw/pci-host: Declare
 device little or big endian
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 10:06:11 -0000

On 8/16/19 9:35 AM, tony.nguyen@bt.com wrote:
> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> targets from the set of target/hw/*/device.o.
> 
> If the set of targets are all little or all big endian, re-declare
> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> respectively.
> 
> This *naive* deduction may result in genuinely native endian devices
> being incorrectly declared as little or big endian, but should not
> introduce regressions for current targets.
> 
> These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
> has a new target with an opposite endian or 2) someone informed knows
> better =)
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 0a010be..fd20f72 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -288,7 +288,7 @@ static void tseg_blackhole_write(void *opaque,
> hwaddr addr, uint64_t val,
>  static const MemoryRegionOps tseg_blackhole_ops = {
>      .read = tseg_blackhole_read,
>      .write = tseg_blackhole_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

OK.

>      .valid.min_access_size = 1,
>      .valid.max_access_size = 4,
>      .impl.min_access_size = 4,
> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
> index 791b321..e7017f3 100644
> --- a/hw/pci-host/versatile.c
> +++ b/hw/pci-host/versatile.c
> @@ -240,7 +240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque,
> hwaddr addr,
>  static const MemoryRegionOps pci_vpb_reg_ops = {
>      .read = pci_vpb_reg_read,
>      .write = pci_vpb_reg_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
>          .min_access_size = 4,
>          .max_access_size = 4,
> @@ -306,7 +306,7 @@ static uint64_t pci_vpb_config_read(void *opaque,
> hwaddr addr,
>  static const MemoryRegionOps pci_vpb_config_ops = {
>      .read = pci_vpb_config_read,
>      .write = pci_vpb_config_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

Eh hard to say, PCI is not clear about endianess...

>  };
>  
>  static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
> -- 
> 1.8.3.1
> 
> ​
> 
> 

