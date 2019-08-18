Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzKEF-0001Yf-PK
	for mharc-qemu-riscv@gnu.org; Sun, 18 Aug 2019 08:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKEC-0001Xx-Ep
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKEA-0008MW-66
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:24:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54356)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzKE9-0008Lp-Rh
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:24:06 -0400
Received: by mail-wm1-x342.google.com with SMTP id p74so700105wme.4
 for <qemu-riscv@nongnu.org>; Sun, 18 Aug 2019 05:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D88a8W06INu19cNWYxug5p2ysrxXtUZWkqIkcqsefv8=;
 b=mojYUlMT4azbWPsKYXXDXuk09brAnLHcWrbjS6RHsuzWb2rfBYEvG3fz2/ytNS7pQC
 PfI+SSKY/D0Gn1syZHzex0N2eiTPO88ZAqWaUp2tPQOwLH/vlr9MUoVJqnfVw/NJkZUA
 Qy/bsq3it3QsNYmFuWfxiqv6vicwQ4raRR5S16ZDfhByoeQel9qvyMr7Vz5MIYhELjzN
 9z0M9s/gQFV+7A5we0lTQRkBZdo8LbMNsCEsN8zmJsd0i/QyUDw+s+4OSRvdwD/i8Lyp
 GEl0OSkH3HehiQNzTE9eIoPlP+BFWOo/InOjkiJb0gpjw0Ia5E7MpLy/axI27ZBEQVOj
 LeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D88a8W06INu19cNWYxug5p2ysrxXtUZWkqIkcqsefv8=;
 b=JBhjLqBL8DGB91Eo7/29xKNHpXqX30E+1d2gs9AL5z/uF2KVvFmHj/bbWOsmeubm10
 b151dwW8GNTyZa5cuxCXCVGvB6kpSb6VkAzTa7CgdnzeB6HlJnP8BdkFdks7kkWpMxVz
 0VFU3EK5llyRBc5vAkTcyqy80QAz9IbOZStDjzB55E1wAMrPnBlsiiHJc1FKBzeuTPuV
 kuvQ79cAyEhblZWOU9kwoHZyYUu+V5T5t7k8ZcrJoVEU7eQjNmuJZXSorraXq6s12PkW
 W+UXfO0I+L2ZVcmCmQjbl0cNJmxBcM5jzio8wNDXIS01oZa/LUvk+c+kTy0Qghij70xY
 6P+A==
X-Gm-Message-State: APjAAAUsnRVMaBqSbNJH4p77nsRmgECqkNrD4NoEV6UbLHKjh/34IekT
 4NQ3sGAIWkVw0G2aR4jbXSYAPA==
X-Google-Smtp-Source: APXvYqwXt0ZNzV0sh12UAMDGhE0cMT35JnXyXU00S0KwjNcZbZTQbdQ4OeRJXxofZYsH0uxMbw494Q==
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr16534844wmf.92.1566131044309; 
 Sun, 18 Aug 2019 05:24:04 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id f10sm10695388wrm.31.2019.08.18.05.24.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:24:03 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 lersek@redhat.com, jasowang@redhat.com, jiri@resnulli.us,
 ehabkost@redhat.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de,
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org,
 i.mitsyanko@gmail.com, cohuck@redhat.com, philmd@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz,
 marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com,
 david@gibson.dropbear.id.au, xiaoguangrong.eric@gmail.com,
 huth@tuxfamily.org, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941083234.39909@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <401b8f28-9df2-7272-582d-a52890a50d6c@linaro.org>
Date: Sun, 18 Aug 2019 13:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941083234.39909@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 36/42] memory: Access
 MemoryRegion with endianness
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
X-List-Received-Date: Sun, 18 Aug 2019 12:24:10 -0000

On 8/16/19 8:38 AM, tony.nguyen@bt.com wrote:
> Preparation for collapsing the two byte swaps adjust_endianness and
> handle_bswap into the former.
> 
> Call memory_region_dispatch_{read|write} with endianness encoded into
> the "MemOp op" operand.
> 
> This patch does not change any behaviour as
> memory_region_dispatch_{read|write} is yet to handle the endianness.
> 
> Once it does handle endianness, callers with byte swaps can collapse
> them into adjust_endianness.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c       |  6 ++++--
>  exec.c                   |  5 +++--
>  hw/intc/armv7m_nvic.c    | 15 ++++++++-------
>  hw/s390x/s390-pci-inst.c |  6 ++++--
>  hw/vfio/pci-quirks.c     |  5 +++--
>  hw/virtio/virtio-pci.c   |  6 ++++--
>  memory_ldst.inc.c        | 18 ++++++++++++------
>  7 files changed, 38 insertions(+), 23 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 6c83878..0aff6a3 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -906,7 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_read(mr, mr_offset, &val, size_memop(size),
> +    r = memory_region_dispatch_read(mr, mr_offset, &val,
> +                                    size_memop(size) | MO_TE,
>                                      iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
> @@ -947,7 +948,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_write(mr, mr_offset, val, size_memop(size),
> +    r = memory_region_dispatch_write(mr, mr_offset, val,
> +                                     size_memop(size) | MO_TE,
>                                       iotlbentry->attrs);

Ok.  Conversion to target-endian via handle_bswap() in the callers.

> diff --git a/exec.c b/exec.c
> index 303f9a7..562fb5b 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3335,7 +3335,8 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>                 potential bugs */
>              val = ldn_p(buf, l);
>              result |= memory_region_dispatch_write(mr, addr1, val,
> -                                                   size_memop(l), attrs);
> +                                                   size_memop(l) | MO_TE,
> +                                                   attrs);
>          } else {
>              /* RAM case */
>              ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
> @@ -3397,7 +3398,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>              release_lock |= prepare_mmio_access(mr);
>              l = memory_access_size(mr, l, addr1);
>              result |= memory_region_dispatch_read(mr, addr1, &val,
> -                                                  size_memop(l), attrs);
> +                                                  size_memop(l) | MO_TE, attrs);
>              stn_p(buf, l, val);

Ok.  Please add comments:

    /*
     * TODO: Merge bswap from ldn_p into memory_region_dispatch_write
     * by using ldn_he_p and dropping MO_TE to get a host-endian value.
     */

and similar for the store.

This must be delayed until after patch 38, when the MO_BSWAP component of the
MemOp is operated on by memory_region_dispatch_*.

> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2346,8 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return memory_region_dispatch_write(mr, addr, value, size_memop(size),
> -                                            attrs);
> +        return memory_region_dispatch_write(mr, addr, value,
> +                                            size_memop(size) | MO_TE, attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2366,8 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return memory_region_dispatch_read(mr, addr, data, size_memop(size),
> -                                           attrs);
> +        return memory_region_dispatch_read(mr, addr, data,
> +                                           size_memop(size) | MO_TE, attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2393,8 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
> 
>      /* Direct the access to the correct systick */
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_write(mr, addr, value, size_memop(size),
> -                                        attrs);
> +    return memory_region_dispatch_write(mr, addr, value,
> +                                        size_memop(size) | MO_TE, attrs);
>  }
> 
>  static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> @@ -2406,7 +2406,8 @@ static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> 
>      /* Direct the access to the correct systick */
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_read(mr, addr, data, size_memop(size), attrs);
> +    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
> +                                       attrs);
>  }

Ok.

> 
>  static const MemoryRegionOps nvic_systick_ops = {
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 0e92a37..272cb28 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -373,7 +373,8 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
>      mr = pbdev->pdev->io_regions[pcias].memory;
>      mr = s390_get_subregion(mr, offset, len);
>      offset -= mr->addr;
> -    return memory_region_dispatch_read(mr, offset, data, size_memop(len),
> +    return memory_region_dispatch_read(mr, offset, data,
> +                                       size_memop(len) | MO_LE,
>                                         MEMTXATTRS_UNSPECIFIED);
>  }
> 
> @@ -472,7 +473,8 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
>      mr = pbdev->pdev->io_regions[pcias].memory;
>      mr = s390_get_subregion(mr, offset, len);
>      offset -= mr->addr;
> -    return memory_region_dispatch_write(mr, offset, data, size_memop(len),
> +    return memory_region_dispatch_write(mr, offset, data,
> +                                        size_memop(len) | MO_LE,
>                                          MEMTXATTRS_UNSPECIFIED);
>  }

How did you derive MO_LE here?

I realize that pci tends to imply LE, but this is called from
pcilg_service_call, which is an s390 instruction, Which normally implies BE.


> 
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index d5c0268..53db1c3 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1072,7 +1072,8 @@ static void vfio_rtl8168_quirk_address_write(void *opaque, hwaddr addr,
> 
>                  /* Write to the proper guest MSI-X table instead */
>                  memory_region_dispatch_write(&vdev->pdev.msix_table_mmio,
> -                                             offset, val, size_memop(size),
> +                                             offset, val,
> +                                             size_memop(size) | MO_LE,
>                                               MEMTXATTRS_UNSPECIFIED);
>              }
>              return; /* Do not write guest MSI-X data to hardware */
> @@ -1103,7 +1104,7 @@ static uint64_t vfio_rtl8168_quirk_data_read(void *opaque,
>      if (rtl->enabled && (vdev->pdev.cap_present & QEMU_PCI_CAP_MSIX)) {
>          hwaddr offset = rtl->addr & 0xfff;
>          memory_region_dispatch_read(&vdev->pdev.msix_table_mmio, offset,
> -                                    &data, size_memop(size),
> +                                    &data, size_memop(size) | MO_LE,
>                                      MEMTXATTRS_UNSPECIFIED);
>          trace_vfio_quirk_rtl8168_msix_read(vdev->vbasedev.name, offset, data);
>      }


Hmm.  We have .endianness = DEVICE_LITTLE_ENDIAN, so we probably already did
any bswap on input to this function.  Surely any further swapping should be
suppressed.  I assume MSI-X rtl8168 is only used by x86 guests, and we would
not notice a problem testing this on an x86 host.


> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index b929e44..ad06c12 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -551,7 +551,8 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>          /* As length is under guest control, handle illegal values. */
>          return;
>      }
> -    memory_region_dispatch_write(mr, addr, val, size_memop(len),
> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
> +    memory_region_dispatch_write(mr, addr, val, size_memop(len) | MO_LE,
>                                   MEMTXATTRS_UNSPECIFIED);
>  }
> 
> @@ -575,7 +576,8 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr addr,
>      /* Make sure caller aligned buf properly */
>      assert(!(((uintptr_t)buf) & (len - 1)));
> 
> -    memory_region_dispatch_read(mr, addr, &val, size_memop(len),
> +    /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
> +    memory_region_dispatch_read(mr, addr, &val, size_memop(len) | MO_LE,
>                                  MEMTXATTRS_UNSPECIFIED);
>      switch (len) {
>      case 1:

Ok, cpu_to_le32 etc above.

> diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
> index d08fc79..482e4b3 100644
> --- a/memory_ldst.inc.c
> +++ b/memory_ldst.inc.c
> @@ -37,7 +37,8 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, MO_32, attrs);
> +        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
> +        r = memory_region_dispatch_read(mr, addr1, &val, MO_32 | endian, attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == MO_LE) {
>              val = bswap32(val);
> @@ -112,7 +113,8 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, MO_64, attrs);
> +        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
> +        r = memory_region_dispatch_read(mr, addr1, &val, MO_64 | endian, attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == MO_LE) {
>              val = bswap64(val);
> @@ -221,7 +223,8 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, MO_16, attrs);
> +        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
> +        r = memory_region_dispatch_read(mr, addr1, &val, MO_16 | endian, attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == MO_LE) {
>              val = bswap16(val);
> @@ -342,7 +345,8 @@ static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
>              val = bswap32(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, MO_32, attrs);
> +        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
> +        r = memory_region_dispatch_write(mr, addr1, val, MO_32 | endian, attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -447,7 +451,8 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
>              val = bswap16(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, MO_16, attrs);
> +        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
> +        r = memory_region_dispatch_write(mr, addr1, val, MO_16 | endian, attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -520,7 +525,8 @@ static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
>              val = bswap64(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, MO_64, attrs);
> +        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
> +        r = memory_region_dispatch_write(mr, addr1, val, MO_64 | endian, attrs);

Ok.  Since you're splitting out the device changes, you'll need a conversion
function for now:

MemOp devend_memop(enum device_endian end)
{
    static MemOp conv[] = {
        [DEVICE_LITTLE_ENDIAN] = MO_LE,
        [DEVICE_BIG_ENDIAN] = MO_BE,
        [DEVICE_NATIVE_ENDIAN] = MO_TE,
        [DEVICE_HOST_ENDIAN] = 0,
    };
    switch (end) {
    case DEVICE_LITTLE_ENDIAN:
    case DEVICE_BIG_ENDIAN:
    case DEVICE_NATIVE_ENDIAN:
    case DEVICE_HOST_ENDIAN:
        return conv[end];
    default:
        g_assert_not_reached();
    }
}

Probably declared in include/exec/memory.h and implemented in memory.c.


r~

