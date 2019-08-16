Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyZ5v-0006Xs-H7
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 06:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyZ5s-0006WH-MN
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:04:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyZ5r-0002Gn-BK
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:04:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36845)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyZ5r-0002G7-53
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:04:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so3603573wme.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2019 03:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aT2ZNqO8zTsrWM08AT1iJSt0ruEVkb9Rhd643qEZv5I=;
 b=ciHib01sor2867U7CMA8U+vtL/BYPdcvA0aSXYtKCo/tmGRECGyaAdG1WLFXTRNcGl
 PkM/S2+hkeetPcXCV366aoquznv04TMM8kfNdiO2vKsVFrpcWJbg61x2cvOrfHJAcY+r
 HZ1UL+1BS661czebsH7xAeKXrKmbFO8KHjSH3kmqiLlo9EqWh9JCpjGP9cIttZHV7B08
 UUvkBDJx9Zgm8wX9eDLgrhCGBfBMRiarsaHBzmxFBdI/Y1VEFUU9hccChlAXJSRCesNS
 K0GAr46oXIl465/Ce0oq/v3m4jyV8gR/QJXOHXyBsF1aYFjP/WmKIXt4yf7+cw2jYai5
 cUFA==
X-Gm-Message-State: APjAAAXQp/yUFBawrWw1KScMolQd6ABOL/B59yz5sBdZ+BHziAG/40q/
 tWJjBsPzJxJc/m1Qx8S5fiw4qA==
X-Google-Smtp-Source: APXvYqz9FADqlGfQPhtp/alJQ2mzQsnVjtWV9tZBB1zOh/6/Xv4Sb2y94Nz96D17mVSCds+06pXYRw==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr6684861wme.98.1565949861986;
 Fri, 16 Aug 2019 03:04:21 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id r190sm5336299wmf.0.2019.08.16.03.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:04:21 -0700 (PDT)
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
 <1565940884636.2215@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
Date: Fri, 16 Aug 2019 12:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940884636.2215@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare
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
X-List-Received-Date: Fri, 16 Aug 2019 10:04:26 -0000

On 8/16/19 9:34 AM, tony.nguyen@bt.com wrote:
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
>  hw/misc/a9scu.c    | 2 +-
>  hw/misc/applesmc.c | 6 +++---
>  hw/misc/arm11scu.c | 2 +-
>  hw/misc/arm_l2x0.c | 2 +-
>  hw/misc/puv3_pm.c  | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
> index 4307f00..3de8cd3 100644
> --- a/hw/misc/a9scu.c
> +++ b/hw/misc/a9scu.c
> @@ -94,7 +94,7 @@ static void a9_scu_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps a9_scu_ops = {
>      .read = a9_scu_read,
>      .write = a9_scu_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

Uh, I doubt that.

>  };
>  
>  static void a9_scu_reset(DeviceState *dev)
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 2d7eb3c..6c91f29 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -285,7 +285,7 @@ static void qdev_applesmc_isa_reset(DeviceState *dev)
>  static const MemoryRegionOps applesmc_data_io_ops = {
>      .write = applesmc_io_data_write,
>      .read = applesmc_io_data_read,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .impl = {
>          .min_access_size = 1,
>          .max_access_size = 1,
> @@ -295,7 +295,7 @@ static const MemoryRegionOps applesmc_data_io_ops = {
>  static const MemoryRegionOps applesmc_cmd_io_ops = {
>      .write = applesmc_io_cmd_write,
>      .read = applesmc_io_cmd_read,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .impl = {
>          .min_access_size = 1,
>          .max_access_size = 1,
> @@ -305,7 +305,7 @@ static const MemoryRegionOps applesmc_cmd_io_ops = {
>  static const MemoryRegionOps applesmc_err_io_ops = {
>      .write = applesmc_io_err_write,
>      .read = applesmc_io_err_read,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .impl = {
>          .min_access_size = 1,
>          .max_access_size = 1,

Being ioport, this one might be OK.

> diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
> index 84275df..59fd7c0 100644
> --- a/hw/misc/arm11scu.c
> +++ b/hw/misc/arm11scu.c
> @@ -57,7 +57,7 @@ static void mpcore_scu_write(void *opaque, hwaddr offset,
>  static const MemoryRegionOps mpcore_scu_ops = {
>      .read = mpcore_scu_read,
>      .write = mpcore_scu_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

I don't think so,

>  };
>  
>  static void arm11_scu_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
> index b88f40a..72ecf46 100644
> --- a/hw/misc/arm_l2x0.c
> +++ b/hw/misc/arm_l2x0.c
> @@ -157,7 +157,7 @@ static void l2x0_priv_reset(DeviceState *dev)
>  static const MemoryRegionOps l2x0_mem_ops = {
>      .read = l2x0_priv_read,
>      .write = l2x0_priv_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

neither here, but Peter will confirm.

>   };
>  
>  static void l2x0_priv_init(Object *obj)
> diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
> index b538b4a..cd82b69 100644
> --- a/hw/misc/puv3_pm.c
> +++ b/hw/misc/puv3_pm.c
> @@ -118,7 +118,7 @@ static const MemoryRegionOps puv3_pm_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

This one I can't tell.

>  };
>  
>  static void puv3_pm_realize(DeviceState *dev, Error **errp)
> -- 
> 1.8.3.1
> 
> ​
> 

