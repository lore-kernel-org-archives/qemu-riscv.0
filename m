Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIS1J-00069X-IC
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 05:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIS0t-00061j-Cm
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIS0r-0007rc-A6
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674123556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tgjRai4wpSqMt/ZxvJyH7SDWMMRMfTyEqEhFXu0iGks=;
 b=d3L0Te3TGiP0jlJujHiqhrljNopwovuAYbi2tm78CATNMic6scY1k+6LjqZVGMjDjKXUMt
 5qYbnErMus6ePHj7J/ITeXbdRrgkWw3M/OVirAFRV6DJNwUYtBYMgOy6bqcQCWKSiW7tse
 4SrWwiVSPm/6uA+RO/7n/PVV4aCb0Nk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-fzi_pJH3P8qAXL6-ARbY1w-1; Thu, 19 Jan 2023 05:19:07 -0500
X-MC-Unique: fzi_pJH3P8qAXL6-ARbY1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 z22-20020a7bc7d6000000b003daf671f7b2so289856wmk.9
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 02:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgjRai4wpSqMt/ZxvJyH7SDWMMRMfTyEqEhFXu0iGks=;
 b=iloEBuKhVEXssVE2vHMmIwIyCufWizobZRlwd88zwk9eV7WyM6TULcDnIGz+WgECSO
 7VoQuMeXyO1bTiJ5YmNgx36jPIIy9oIz7BmU4P/MSMNm6WCbE6E0bkXh2ngQSUF5kSP6
 WDcOATtPEL+wwckvqTo5z+2mnKpxuMeWvVMpJh1rN5VJhFCONp09ZOrhN9RxRaEkcAYC
 8LUZ659hXyKmFIPLGW7VEgGYoAsDD9AQJLt5SkbJ+uAIjAY7dd1Ikght+KC9+Q1Q8h+2
 EBbtt4FJb4kGpyhOBK5ZssdjJd2MueZ1pF/0SBfVdnsZEv0HZn1PLZawpf4VkESs1vdy
 xXRQ==
X-Gm-Message-State: AFqh2koqBPQKsxIHf/UvjPvgtG0I3miu46grJ9PNlH/rGFDulWvfE1Ew
 wri9b5lwE+WJfsrzaIZAV8pZbU6Udc3rCOcFaoXx+ovr7YOOV4sY84XZ/cYoaP3RG5+fLjNeqLA
 62a9jCCUqhVw18p8=
X-Received: by 2002:a05:600c:5116:b0:3db:1a8:c041 with SMTP id
 o22-20020a05600c511600b003db01a8c041mr9736412wms.17.1674123546167; 
 Thu, 19 Jan 2023 02:19:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXubYGIq2Rzf9zyOzopnV8STPDL+f5JzsGXUr8VDKWIb2kVBT3m97ORLL3kNL+YeLxJMIidlmQ==
X-Received: by 2002:a05:600c:5116:b0:3db:1a8:c041 with SMTP id
 o22-20020a05600c511600b003db01a8c041mr9736378wms.17.1674123545814; 
 Thu, 19 Jan 2023 02:19:05 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c1d8400b003da286f8332sm4749548wms.18.2023.01.19.02.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 02:19:05 -0800 (PST)
Date: Thu, 19 Jan 2023 10:19:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com,
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 19/19] Drop duplicate #include
Message-ID: <Y8kZFq+tpqu/k9Gb@work-vm>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-20-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230119065959.3104012-20-armbru@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2023 10:19:32 -0000

* Markus Armbruster (armbru@redhat.com) wrote:
> Tracked down with the help of scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/hw/arm/fsl-imx6ul.h   | 1 -
>  include/hw/arm/fsl-imx7.h     | 1 -
>  backends/tpm/tpm_emulator.c   | 1 -
>  hw/acpi/piix4.c               | 1 -
>  hw/alpha/dp264.c              | 1 -
>  hw/arm/virt.c                 | 1 -
>  hw/arm/xlnx-versal.c          | 1 -
>  hw/block/pflash_cfi01.c       | 1 -
>  hw/core/machine.c             | 1 -
>  hw/hppa/machine.c             | 1 -
>  hw/i386/acpi-build.c          | 1 -
>  hw/loongarch/acpi-build.c     | 1 -
>  hw/misc/macio/cuda.c          | 1 -
>  hw/misc/macio/pmu.c           | 1 -
>  hw/net/xilinx_axienet.c       | 1 -
>  hw/ppc/ppc405_uc.c            | 2 --
>  hw/ppc/ppc440_bamboo.c        | 1 -
>  hw/ppc/spapr_drc.c            | 1 -
>  hw/rdma/vmw/pvrdma_dev_ring.c | 1 -
>  hw/remote/machine.c           | 1 -
>  hw/remote/remote-obj.c        | 1 -
>  hw/rtc/mc146818rtc.c          | 1 -
>  hw/s390x/virtio-ccw-serial.c  | 1 -
>  migration/postcopy-ram.c      | 2 --
>  softmmu/dirtylimit.c          | 1 -
>  softmmu/runstate.c            | 1 -
>  softmmu/vl.c                  | 1 -
>  target/loongarch/translate.c  | 1 -
>  target/mips/tcg/translate.c   | 1 -
>  target/nios2/translate.c      | 2 --
>  tests/unit/test-cutils.c      | 1 -
>  ui/gtk.c                      | 1 -
>  util/oslib-posix.c            | 4 ----
>  33 files changed, 39 deletions(-)
> 
> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
> index 7812e516a5..1952cb984d 100644
> --- a/include/hw/arm/fsl-imx6ul.h
> +++ b/include/hw/arm/fsl-imx6ul.h
> @@ -30,7 +30,6 @@
>  #include "hw/timer/imx_gpt.h"
>  #include "hw/timer/imx_epit.h"
>  #include "hw/i2c/imx_i2c.h"
> -#include "hw/gpio/imx_gpio.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/ssi/imx_spi.h"
>  #include "hw/net/imx_fec.h"
> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
> index 4e5e071864..355bd8ea83 100644
> --- a/include/hw/arm/fsl-imx7.h
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -32,7 +32,6 @@
>  #include "hw/timer/imx_gpt.h"
>  #include "hw/timer/imx_epit.h"
>  #include "hw/i2c/imx_i2c.h"
> -#include "hw/gpio/imx_gpio.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/ssi/imx_spi.h"
>  #include "hw/net/imx_fec.h"
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 49cc3d749d..2b440d2c9a 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -35,7 +35,6 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
> -#include "sysemu/runstate.h"
>  #include "tpm_int.h"
>  #include "tpm_ioctl.h"
>  #include "migration/blocker.h"
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 0a81f1ad93..df39f91294 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -35,7 +35,6 @@
>  #include "sysemu/xen.h"
>  #include "qapi/error.h"
>  #include "qemu/range.h"
> -#include "hw/acpi/pcihp.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/cpu.h"
>  #include "hw/hotplug.h"
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index c502c8c62a..4161f559a7 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -18,7 +18,6 @@
>  #include "net/net.h"
>  #include "qemu/cutils.h"
>  #include "qemu/datadir.h"
> -#include "net/net.h"
>  
>  static uint64_t cpu_alpha_superpage_to_phys(void *opaque, uint64_t addr)
>  {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ea2413a0ba..d3849d7233 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -33,7 +33,6 @@
>  #include "qemu/units.h"
>  #include "qemu/option.h"
>  #include "monitor/qdev.h"
> -#include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/primecell.h"
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 57276e1506..69b1b99e93 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -22,7 +22,6 @@
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/xlnx-versal.h"
>  #include "qemu/log.h"
> -#include "hw/sysbus.h"
>  
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define XLNX_VERSAL_RCPU_TYPE ARM_CPU_TYPE_NAME("cortex-r5f")
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 0cbc2fb4cb..d11406eada 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -45,7 +45,6 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/bitops.h"
> -#include "qemu/error-report.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 616f3a207c..67cf9f9dcd 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,7 +39,6 @@
>  #include "exec/confidential-guest-support.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
> -#include "qom/object_interfaces.h"
>  
>  GlobalProperty hw_compat_7_2[] = {};
>  const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index de1cc7ab71..7ac68c943f 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -28,7 +28,6 @@
>  #include "qapi/error.h"
>  #include "net/net.h"
>  #include "qemu/log.h"
> -#include "net/net.h"
>  
>  #define MIN_SEABIOS_HPPA_VERSION 6 /* require at least this fw version */
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 127c4e2d50..14f6f75454 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -76,7 +76,6 @@
>  
>  #include "hw/acpi/hmat.h"
>  #include "hw/acpi/viot.h"
> -#include "hw/acpi/cxl.h"
>  
>  #include CONFIG_DEVICES
>  
> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> index c2b237736d..f551296a0e 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -22,7 +22,6 @@
>  /* Supported chipsets: */
>  #include "hw/pci-host/ls7a.h"
>  #include "hw/loongarch/virt.h"
> -#include "hw/acpi/aml-build.h"
>  
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/pci.h"
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index 853e88bfed..29a8e5ed19 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -30,7 +30,6 @@
>  #include "hw/input/adb.h"
>  #include "hw/misc/mos6522.h"
>  #include "hw/misc/macio/cuda.h"
> -#include "qapi/error.h"
>  #include "qemu/timer.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/rtc.h"
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 97ef8c771b..5a788e595a 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -36,7 +36,6 @@
>  #include "hw/misc/mos6522.h"
>  #include "hw/misc/macio/gpio.h"
>  #include "hw/misc/macio/pmu.h"
> -#include "qapi/error.h"
>  #include "qemu/timer.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/rtc.h"
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 990ff3a1c2..673af7da26 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -31,7 +31,6 @@
>  #include "net/net.h"
>  #include "net/checksum.h"
>  
> -#include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/stream.h"
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index c973cfb04e..0cc68178ad 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -38,8 +38,6 @@
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
>  #include "hw/intc/ppc-uic.h"
> -#include "hw/qdev-properties.h"
> -#include "qapi/error.h"
>  #include "trace.h"
>  
>  /*****************************************************************************/
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 81d71adf34..2880c81cb1 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -13,7 +13,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "qemu/error-report.h"
>  #include "qemu/datadir.h"
>  #include "qemu/error-report.h"
>  #include "net/net.h"
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 4923435a8b..b5c400a94d 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -17,7 +17,6 @@
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> -#include "qapi/error.h"
>  #include "qapi/qapi-events-qdev.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index 598e6adc5e..30ce22a5be 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -14,7 +14,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/cutils.h"
>  #include "hw/pci/pci.h"
>  #include "cpu.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index 519f855ec1..fdc6c441bb 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -22,7 +22,6 @@
>  #include "hw/remote/iohub.h"
>  #include "hw/remote/iommu.h"
>  #include "hw/qdev-core.h"
> -#include "hw/remote/iommu.h"
>  #include "hw/remote/vfio-user-obj.h"
>  #include "hw/pci/msi.h"
>  
> diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
> index 333e5ac443..65b6f7cc86 100644
> --- a/hw/remote/remote-obj.c
> +++ b/hw/remote/remote-obj.c
> @@ -12,7 +12,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/notify.h"
>  #include "qom/object_interfaces.h"
> -#include "hw/qdev-core.h"
>  #include "io/channel.h"
>  #include "hw/qdev-core.h"
>  #include "hw/remote/machine.h"
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index bc1192b7ae..ba612a151d 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -43,7 +43,6 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-misc.h"
>  #include "qapi/visitor.h"
> -#include "hw/rtc/mc146818rtc_regs.h"
>  
>  //#define DEBUG_CMOS
>  //#define DEBUG_COALESCED
> diff --git a/hw/s390x/virtio-ccw-serial.c b/hw/s390x/virtio-ccw-serial.c
> index bf8057880f..8f8d2302f8 100644
> --- a/hw/s390x/virtio-ccw-serial.c
> +++ b/hw/s390x/virtio-ccw-serial.c
> @@ -15,7 +15,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/virtio-serial.h"
>  #include "virtio-ccw.h"
> -#include "hw/virtio/virtio-serial.h"
>  
>  #define TYPE_VIRTIO_SERIAL_CCW "virtio-serial-ccw"
>  OBJECT_DECLARE_SIMPLE_TYPE(VirtioSerialCcw, VIRTIO_SERIAL_CCW)
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..8b7d1af75d 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -17,7 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/rcu.h"
>  #include "qemu/madvise.h"
>  #include "exec/target_page.h"
>  #include "migration.h"
> @@ -34,7 +33,6 @@
>  #include "hw/boards.h"
>  #include "exec/ramblock.h"
>  #include "socket.h"
> -#include "qemu-file.h"
>  #include "yank_functions.h"
>  #include "tls.h"

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 12668555f2..c56f0f58c8 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -11,7 +11,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qapi/error.h"
>  #include "qemu/main-loop.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qmp/qdict.h"
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index cab9f6fc07..f9ad88e6a7 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -41,7 +41,6 @@
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-events-run-state.h"
>  #include "qemu/error-report.h"
> -#include "qemu/log.h"
>  #include "qemu/job.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 5355a7fe5a..b2ee3fee3f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -129,7 +129,6 @@
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/qapi-visit-qom.h"
>  #include "qapi/qapi-commands-ui.h"
> -#include "qapi/qmp/qdict.h"
>  #include "block/qdict.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/iothread.h"
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index 38ced69803..72a6275665 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -12,7 +12,6 @@
>  #include "exec/helper-proto.h"
>  #include "exec/helper-gen.h"
>  
> -#include "exec/translator.h"
>  #include "exec/log.h"
>  #include "qemu/qemu-print.h"
>  #include "fpu/softfloat.h"
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 624e6b7786..aa12bb708a 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -32,7 +32,6 @@
>  #include "semihosting/semihost.h"
>  
>  #include "trace.h"
> -#include "exec/translator.h"
>  #include "exec/log.h"
>  #include "qemu/qemu-print.h"
>  #include "fpu_helper.h"
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 4db8b47744..7aee65a089 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -938,8 +938,6 @@ static const char * const cr_regnames[NUM_CR_REGS] = {
>  };
>  #endif
>  
> -#include "exec/gen-icount.h"
> -
>  /* generate intermediate code for basic block 'tb'.  */
>  static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>  {
> diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
> index 2126b46391..3c4f875420 100644
> --- a/tests/unit/test-cutils.c
> +++ b/tests/unit/test-cutils.c
> @@ -26,7 +26,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/units.h"
>  #include "qemu/cutils.h"
>  #include "qemu/units.h"
>  
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 4817623c8f..7f752d8b7d 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -53,7 +53,6 @@
>  #include <math.h>
>  
>  #include "trace.h"
> -#include "qemu/cutils.h"
>  #include "ui/input.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index fd03fd32c8..77d882e681 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -59,10 +59,6 @@
>  
>  #include "qemu/mmap-alloc.h"
>  
> -#ifdef CONFIG_DEBUG_STACK_USAGE
> -#include "qemu/error-report.h"
> -#endif
> -
>  #define MAX_MEM_PREALLOC_THREAD_COUNT 16
>  
>  struct MemsetThread;
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


