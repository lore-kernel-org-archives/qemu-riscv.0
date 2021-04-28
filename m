Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbnIl-0001qw-Bi
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 12:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbnIh-0001qE-Rg
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbnId-0005CY-00
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619628268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJEZXICncaqh/Go404E1SX+UKYu0fdxoo0vPvlvBCJs=;
 b=E7DMY82Ehr0ObWiIBEhIStLAP8ioXby+ULJBrP2nHmykAemGzTDvCpjHXsMqt8t72oZrBj
 6PC7VIWInYGAH+rBX+w02TxgNStREY5/IfLbiaUR1BIrNUozmft8hnXoQSviM4BzU1+Oik
 Gc6BCLmvcdooQyWaOeK4vZaYuikoo3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-PbmDhwr4P9CjY-oZTgkERg-1; Wed, 28 Apr 2021 12:44:26 -0400
X-MC-Unique: PbmDhwr4P9CjY-oZTgkERg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42458801B1A;
 Wed, 28 Apr 2021 16:44:25 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-188.ams2.redhat.com
 [10.36.114.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E21E19C45;
 Wed, 28 Apr 2021 16:44:18 +0000 (UTC)
Subject: Re: [PATCH 6/7] hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-7-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8b8be0b8-1f1a-d0fe-7fd3-682f34043df6@redhat.com>
Date: Wed, 28 Apr 2021 18:44:17 +0200
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-7-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 28 Apr 2021 16:44:37 -0000

On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
> The ARM, HPPA and RISC-V architectures don't declare any fw_cfg
> specific key. To simplify the buildsys machinery and allow building
> QEMU without the fw_cfg device (in the next commit), first add a
> per-architecture empty stub defining the fw_cfg_arch_key_name().
> 
> Update the MAINTAINERS section to cover the various target-specific
> fw_cfg.c files.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/fw_cfg.c      | 19 +++++++++++++++++++
>  hw/hppa/fw_cfg.c     | 19 +++++++++++++++++++
>  hw/riscv/fw_cfg.c    | 19 +++++++++++++++++++
>  MAINTAINERS          |  2 +-
>  hw/arm/meson.build   |  1 +
>  hw/hppa/meson.build  |  1 +
>  hw/riscv/meson.build |  1 +
>  7 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/fw_cfg.c
>  create mode 100644 hw/hppa/fw_cfg.c
>  create mode 100644 hw/riscv/fw_cfg.c

So, I haven't commented on the Kconfig symbol wrangling yet (my comment
would be a blanket "Acked-by" anyway... sorry, not really my cup of
tea), but at this point:

I don't understand why we need to add *more code* (stubs / boilerplate)
if our goal is (apparently) to build QEMU with *fewer* devices.

Sorry for being dense. My total knowledge about stubs in QEMU is this:
for some QMP methods (and for some QGA methods, dependent on OS), we
need stubs. When they are invoked, they report "sorry, not implemented".
That's it: all I know about stubs.

So... the commit message here says "simplify the buildsys", and the next
commit message says, paraphrased, "don't build fw_cfg unless we need it"
-- but why does that require more C-language code? It seems like we have
some function *calls* that shouldn't exist in an fw-cfg-less machine, in
the first place.

Again, sorry, I'm totally dense on this.

Thanks
Laszlo

> 
> diff --git a/hw/arm/fw_cfg.c b/hw/arm/fw_cfg.c
> new file mode 100644
> index 00000000000..de2bca9c76c
> --- /dev/null
> +++ b/hw/arm/fw_cfg.c
> @@ -0,0 +1,19 @@
> +/*
> + * QEMU fw_cfg helpers (ARM specific)
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * Author:
> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/mips/fw_cfg.h"
> +#include "hw/nvram/fw_cfg.h"
> +
> +const char *fw_cfg_arch_key_name(uint16_t key)
> +{
> +    return NULL;
> +}
> diff --git a/hw/hppa/fw_cfg.c b/hw/hppa/fw_cfg.c
> new file mode 100644
> index 00000000000..322b03068c7
> --- /dev/null
> +++ b/hw/hppa/fw_cfg.c
> @@ -0,0 +1,19 @@
> +/*
> + * QEMU fw_cfg helpers (HPPA specific)
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * Author:
> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/mips/fw_cfg.h"
> +#include "hw/nvram/fw_cfg.h"
> +
> +const char *fw_cfg_arch_key_name(uint16_t key)
> +{
> +    return NULL;
> +}
> diff --git a/hw/riscv/fw_cfg.c b/hw/riscv/fw_cfg.c
> new file mode 100644
> index 00000000000..8e3d2a8bdea
> --- /dev/null
> +++ b/hw/riscv/fw_cfg.c
> @@ -0,0 +1,19 @@
> +/*
> + * QEMU fw_cfg helpers (RISC-V specific)
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * Author:
> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/mips/fw_cfg.h"
> +#include "hw/nvram/fw_cfg.h"
> +
> +const char *fw_cfg_arch_key_name(uint16_t key)
> +{
> +    return NULL;
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..ab8f030d4c0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2162,7 +2162,7 @@ R: Laszlo Ersek <lersek@redhat.com>
>  R: Gerd Hoffmann <kraxel@redhat.com>
>  S: Supported
>  F: docs/specs/fw_cfg.txt
> -F: hw/nvram/fw_cfg*.c
> +F: hw/*/fw_cfg*.c
>  F: stubs/fw_cfg.c
>  F: include/hw/nvram/fw_cfg.h
>  F: include/standard-headers/linux/qemu_fw_cfg.h
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index be39117b9b6..fd278de916f 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -1,6 +1,7 @@
>  arm_ss = ss.source_set()
>  arm_ss.add(files('boot.c'), fdt)
>  arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
> +arm_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
>  arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
>  arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
>  arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
> diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
> index 1deae83aee8..10494cc24b7 100644
> --- a/hw/hppa/meson.build
> +++ b/hw/hppa/meson.build
> @@ -1,4 +1,5 @@
>  hppa_ss = ss.source_set()
>  hppa_ss.add(when: 'CONFIG_DINO', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
> +hppa_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
>  
>  hw_arch += {'hppa': hppa_ss}
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 275c0f7eb7c..ab4d3adb924 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -8,5 +8,6 @@
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
> +riscv_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
>  
>  hw_arch += {'riscv': riscv_ss}
> 


