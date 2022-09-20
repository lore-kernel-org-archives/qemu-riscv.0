Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaVvw-0003eF-PO
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 01:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVvg-0003Th-4e; Tue, 20 Sep 2022 01:36:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVvd-0006xb-PY; Tue, 20 Sep 2022 01:36:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so2374925wrp.11;
 Mon, 19 Sep 2022 22:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=IZ5Zv4/7hTO/6wXmRF3z+PXEnTdcge7XTl0lYv1HpKI=;
 b=b0lsnmuCPz8cDwBFaPfL1ExlL6hZoGBvsAo90EdbWfbIty8yoFPD3+pM+wCc6r61jh
 02HNF8QWjamjJ/5XkxHcwZWxllIZeCL3Ej0ajT59Sui+41jMg10A8+RqC1gMCPSMNtsr
 Ynq/WHREdM5adnH2c34ZUcVa02IKeDn0yv7w2JXYtOXYSOzmC9i4UAlhnWs8IdBRdaKj
 +EoC2mIXhoHnXN/nP7wSPWSC/fSlPbfxoLGWA4NiqceL28aaTcdr66NmRjIBw+kyTQ0O
 3ODJqwU5La/Ozm1eqms4cfz6/VM9dp4JBRM4j1m070bia2cnFcYGHu8fJFoQ3iRtxQbn
 S8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=IZ5Zv4/7hTO/6wXmRF3z+PXEnTdcge7XTl0lYv1HpKI=;
 b=Bosc7haT4piJNm/z8H8RV0IOuLSPyDWybk2VKhUMCYhdGw9Lo5YLTcl1FaVEb0G53N
 9f6WBJ0NiVqQkZPAAKW+fSTEe5/1x+ItXvW3+hG2mfNGSH79+SPS1fVt7UQoOQWqYErK
 Zcp9WFY+WOKgBvZnO9Dn3pEYILZqhY6U243qAXokFHihRP2NEHsB3Lnp+RgfF3F+Tjb5
 UQigWqKZFCyGnbGYDzsx07V1joc8bAeZcrk1X8uHMwcF6uY8fUnkSIALRseHWpkqFFPP
 5G2Q/XvysshsOz2Torkx/yJMeoNW++kWNe5xrvvViFSpUZQzkT7dLus9y7QGlcgOmEMz
 rMQQ==
X-Gm-Message-State: ACrzQf36rmkZbGPJumd/O+hqIvrbct55z7IAdtr6DuWIImU0goJ8+tMv
 kCEI/ZiVBLjvZW2GhzXlThA=
X-Google-Smtp-Source: AMsMyM41BnChgmCmf9YfgCAJVBq1U7Xim3pjrtlZIlh9K+YaFBQ0IHYFPx6NutQTrNaAkhNW/vMGlg==
X-Received: by 2002:a5d:69ca:0:b0:228:dd17:9534 with SMTP id
 s10-20020a5d69ca000000b00228dd179534mr13398301wrw.652.1663652172930; 
 Mon, 19 Sep 2022 22:36:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c035000b003b492753826sm804412wmd.43.2022.09.19.22.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 22:36:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <38bd4756-dacd-9862-3999-60d609d52f46@amsat.org>
Date: Tue, 20 Sep 2022 07:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 5/9] exec/address-spaces: Wrap address space singletons
 into functions
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220919231720.163121-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.952,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Sep 2022 05:36:32 -0000

On 20/9/22 01:17, Bernhard Beschow wrote:
> In the next steps, these singletons will be resolved by turning them
> into attributes of the system bus. The system bus is already accessible
> via the global current_machine variable which will be made use of later
> in the wrapper functions.
> 
> All changes have been performed with search-and-replace:
> * s/&address_space_memory/get_address_space_memory()/
> * s/&address_space_io/get_address_space_io()/
> The only exceptions were exec/address-spaces.h and softmmu/physmem.c
> which have been manually changed.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   accel/hvf/hvf-accel-ops.c            |  2 +-
>   accel/kvm/kvm-all.c                  | 12 ++++++------
>   hw/alpha/dp264.c                     |  4 ++--
>   hw/alpha/typhoon.c                   |  4 ++--
>   hw/arm/smmu-common.c                 |  4 ++--
>   hw/arm/smmuv3.c                      | 14 +++++++-------
>   hw/arm/virt.c                        |  2 +-
>   hw/char/goldfish_tty.c               |  4 ++--
>   hw/core/loader.c                     |  2 +-
>   hw/dma/pl330.c                       |  2 +-
>   hw/dma/rc4030.c                      |  2 +-
>   hw/dma/xlnx-zynq-devcfg.c            |  4 ++--
>   hw/dma/xlnx_dpdma.c                  |  8 ++++----
>   hw/hppa/machine.c                    |  4 ++--
>   hw/hyperv/hyperv.c                   |  2 +-
>   hw/hyperv/vmbus.c                    |  2 +-
>   hw/i386/amd_iommu.c                  | 18 +++++++++---------
>   hw/i386/fw_cfg.c                     |  2 +-
>   hw/i386/intel_iommu.c                | 24 ++++++++++++------------
>   hw/i386/microvm.c                    |  4 ++--
>   hw/i386/pc.c                         |  2 +-
>   hw/i386/xen/xen-hvm.c                |  4 ++--
>   hw/ide/ahci.c                        |  2 +-
>   hw/ide/macio.c                       | 10 +++++-----
>   hw/intc/apic.c                       |  2 +-
>   hw/intc/openpic_kvm.c                |  2 +-
>   hw/intc/pnv_xive.c                   |  6 +++---
>   hw/intc/pnv_xive2.c                  |  6 +++---
>   hw/intc/riscv_aplic.c                |  2 +-
>   hw/intc/spapr_xive.c                 |  2 +-
>   hw/intc/xive.c                       |  4 ++--
>   hw/intc/xive2.c                      |  4 ++--
>   hw/mips/jazz.c                       |  4 ++--
>   hw/misc/lasi.c                       |  2 +-
>   hw/misc/macio/mac_dbdma.c            |  8 ++++----
>   hw/net/ftgmac100.c                   | 16 ++++++++--------
>   hw/net/i82596.c                      | 24 ++++++++++++------------
>   hw/net/imx_fec.c                     | 22 +++++++++++-----------
>   hw/net/lasi_i82596.c                 |  2 +-
>   hw/net/npcm7xx_emc.c                 | 14 +++++++-------
>   hw/openrisc/boot.c                   |  2 +-
>   hw/pci-host/dino.c                   |  6 +++---
>   hw/pci-host/pnv_phb3.c               |  6 +++---
>   hw/pci-host/pnv_phb3_msi.c           |  6 +++---
>   hw/pci-host/pnv_phb4.c               | 10 +++++-----
>   hw/pci/pci.c                         |  2 +-
>   hw/ppc/pnv_psi.c                     |  2 +-
>   hw/ppc/spapr.c                       |  4 ++--
>   hw/ppc/spapr_events.c                |  2 +-
>   hw/ppc/spapr_hcall.c                 |  4 ++--
>   hw/ppc/spapr_iommu.c                 |  4 ++--
>   hw/ppc/spapr_ovec.c                  |  8 ++++----
>   hw/ppc/spapr_rtas.c                  |  2 +-
>   hw/remote/iommu.c                    |  2 +-
>   hw/remote/message.c                  |  4 ++--
>   hw/remote/proxy-memory-listener.c    |  2 +-
>   hw/riscv/boot.c                      |  6 +++---
>   hw/riscv/sifive_e.c                  |  2 +-
>   hw/riscv/sifive_u.c                  |  2 +-
>   hw/riscv/virt.c                      |  2 +-
>   hw/s390x/css.c                       | 16 ++++++++--------
>   hw/s390x/ipl.h                       |  2 +-
>   hw/s390x/s390-pci-bus.c              |  4 ++--
>   hw/s390x/s390-pci-inst.c             | 10 +++++-----
>   hw/s390x/s390-skeys.c                |  2 +-
>   hw/s390x/virtio-ccw.c                | 10 +++++-----
>   hw/sd/sdhci.c                        |  2 +-
>   hw/sh4/r2d.c                         |  4 ++--
>   hw/sparc/sun4m.c                     |  2 +-
>   hw/sparc/sun4m_iommu.c               |  4 ++--
>   hw/sparc64/sun4u_iommu.c             |  4 ++--
>   hw/timer/hpet.c                      |  2 +-
>   hw/usb/hcd-ehci-pci.c                |  2 +-
>   hw/usb/hcd-ehci-sysbus.c             |  2 +-
>   hw/usb/hcd-ohci.c                    |  2 +-
>   hw/usb/hcd-xhci-sysbus.c             |  2 +-
>   hw/vfio/ap.c                         |  2 +-
>   hw/vfio/ccw.c                        |  2 +-
>   hw/vfio/common.c                     |  8 ++++----
>   hw/vfio/platform.c                   |  2 +-
>   hw/virtio/vhost-vdpa.c               |  2 +-
>   hw/virtio/vhost.c                    |  2 +-
>   hw/virtio/virtio-bus.c               |  4 ++--
>   hw/virtio/virtio-iommu.c             |  6 +++---
>   hw/virtio/virtio-pci.c               |  2 +-
>   hw/xen/xen_pt.c                      |  4 ++--
>   include/exec/address-spaces.h        |  4 ++--
>   include/hw/elf_ops.h                 |  4 ++--
>   include/hw/ppc/spapr.h               |  5 +++--
>   include/hw/ppc/vof.h                 |  4 ++--
>   monitor/misc.c                       |  4 ++--
>   softmmu/ioport.c                     | 12 ++++++------
>   softmmu/memory_mapping.c             |  2 +-
>   softmmu/physmem.c                    | 17 ++++++++++++++---
>   target/arm/hvf/hvf.c                 |  4 ++--
>   target/arm/kvm.c                     |  4 ++--
>   target/avr/helper.c                  |  8 ++++----
>   target/i386/hax/hax-all.c            |  2 +-
>   target/i386/hax/hax-mem.c            |  2 +-
>   target/i386/hvf/hvf.c                |  2 +-
>   target/i386/hvf/vmx.h                |  2 +-
>   target/i386/hvf/x86_mmu.c            |  6 +++---
>   target/i386/nvmm/nvmm-all.c          |  4 ++--
>   target/i386/sev.c                    |  4 ++--
>   target/i386/tcg/sysemu/misc_helper.c | 12 ++++++------
>   target/i386/whpx/whpx-all.c          |  4 ++--
>   target/s390x/diag.c                  |  2 +-
>   target/s390x/mmu_helper.c            |  2 +-
>   target/s390x/sigp.c                  |  2 +-
>   target/xtensa/dbg_helper.c           |  2 +-
>   tests/qtest/fuzz/generic_fuzz.c      |  4 ++--
>   111 files changed, 285 insertions(+), 273 deletions(-)

Please consider using scripts/git.orderfile for tree-wide refactors,
it helps reviewers.

> diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
> index db8bfa9a92..d5c8cbd718 100644
> --- a/include/exec/address-spaces.h
> +++ b/include/exec/address-spaces.h
> @@ -33,8 +33,8 @@ MemoryRegion *get_system_memory(void);
>    */
>   MemoryRegion *get_system_io(void);
>   
> -extern AddressSpace address_space_memory;
> -extern AddressSpace address_space_io;
> +AddressSpace *get_address_space_memory(void);
> +AddressSpace *get_address_space_io(void);
>   
>   #endif

> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 56e03e07b5..0ac920d446 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -89,8 +89,8 @@ RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
>   static MemoryRegion *system_memory;
>   static MemoryRegion *system_io;
>   
> -AddressSpace address_space_io;
> -AddressSpace address_space_memory;
> +static AddressSpace address_space_io;
> +static AddressSpace address_space_memory;
>   
>   static MemoryRegion io_mem_unassigned;
>   
> @@ -2690,6 +2690,16 @@ MemoryRegion *get_system_io(void)
>       return system_io;
>   }
>   
> +AddressSpace *get_address_space_memory(void)
> +{
> +    return &address_space_memory;
> +}
> +
> +AddressSpace *get_address_space_io(void)
> +{
> +    return &address_space_io;
> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

