Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDFPJ-0005Um-Qy
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 20:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDFPI-0005TV-CO
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 20:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDFPG-0007R6-2o
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 20:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672883457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ae+m06scc8CQpVkRRjrujC7NB/xoSDz1xg6pdBHfsII=;
 b=X3jfdhYi3yqVwrt6azpfWV68eb8irBDZ9RlKTuzHjo7fdwLVEVjMSfJQTwXul8hSjOS+m8
 eilxMY4QBLBWSWbktaftBd7J62/6NkfHwchyE9+LB88bDNMV0WySEV7qTN/SP0EvMG13NR
 Dhr4dLz3+Mx5/Jqh/3DUlv0DbTgZNhk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-0vBOvuq4OK-e0l53qo9UXg-1; Wed, 04 Jan 2023 20:50:56 -0500
X-MC-Unique: 0vBOvuq4OK-e0l53qo9UXg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso22697111edd.14
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 17:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ae+m06scc8CQpVkRRjrujC7NB/xoSDz1xg6pdBHfsII=;
 b=dCobXaDHyovBi0dRfllmAbe8cqZ6w85HvJkgPhH+0pVTvRKvm3LP43ZGxN0eI4uTq6
 dWR8XtUUmtIxJi9uV7NIlhdW6E+p0Uw59+6rNegwm8Syl5jjueBDaF8NbZ/NTZxSIRcJ
 FKkeswg/0JpWqIUuVXmB6AwEohui8f8Mc6iWQsB+Lnj/FxIlASukVNzd1uFKQ8JemaDh
 eH/YTgGQAm3ZxZmiNe4toWD00IdT06TKM1QG5kfU4KazqWymInDkoIzD0lnzJCWGeZWg
 H8/g2FqDUosjwCynirkoIZ17i2G97Vj/H1dIEBq2pfde7Vp0VumlArgTgV4yPbsW7qbo
 rI3A==
X-Gm-Message-State: AFqh2krMGJ4Ixfdip2CwhU1rKMjlgIn3xbJfn6Q1YR2slmSWdCY7j3FZ
 EDmtoAexoVhhcYqPDEaUy8/Fmc3/lpno8m7E1/MTi7Q7CTQw66QOd9mx75ickU3pIJn1lZNvyj6
 WBKMj2OVYtcbPbS8=
X-Received: by 2002:a17:907:8b09:b0:7c1:6e82:35fc with SMTP id
 sz9-20020a1709078b0900b007c16e8235fcmr57205434ejc.40.1672883454883; 
 Wed, 04 Jan 2023 17:50:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXueyh6LVIX2H0De8l4raSwRjPZDj2ljWKpMzf9ntNnW9w/EA7lfiCrGcIkI5XJE48p2Ru0cvA==
X-Received: by 2002:a17:907:8b09:b0:7c1:6e82:35fc with SMTP id
 sz9-20020a1709078b0900b007c16e8235fcmr57205412ejc.40.1672883454600; 
 Wed, 04 Jan 2023 17:50:54 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g26-20020a170906539a00b0073ae9ba9ba8sm15982484ejo.3.2023.01.04.17.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 17:50:53 -0800 (PST)
Date: Wed, 4 Jan 2023 20:50:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH v2 0/4] Clean up includes
Message-ID: <20230104205022-mutt-send-email-mst@kernel.org>
References: <20221222120813.727830-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Jan 2023 01:51:00 -0000

On Thu, Dec 22, 2022 at 01:08:09PM +0100, Markus Armbruster wrote:
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> This series fixes a number of rule violations.


Conflicted with some patches I'm merging so I queued this up too.
Thanks!

> It is based on
> 
>     [PATCH v2 0/4] hw/ppc: Clean up includes
>     [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
>     [PATCH v2 0/3] block: Clean up includes
>     [PATCH v3 0/5] coroutine: Clean up includes
> 
> With all of these applied, just three inclusion loops remain reachable
> from include/:
> 
>     target/microblaze/cpu.h target/microblaze/mmu.h
> 
>     target/nios2/cpu.h target/nios2/mmu.h
> 
>     target/riscv/cpu.h target/riscv/pmp.h
> 
> Breaking them would be nice, but I'm out of steam.
> 
> v2:
> * Rebased
> * PATCH 3: v1 posted separately
> * PATCH 4: New
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Based-on: <20221222104628.659681-1-armbru@redhat.com>
> 
> Markus Armbruster (4):
>   include/hw/virtio: Break inclusion loop
>   include: Include headers where needed
>   include: Don't include qemu/osdep.h
>   docs/devel: Rules on #include in headers
> 
>  docs/devel/style.rst                        | 7 +++++++
>  bsd-user/qemu.h                             | 1 -
>  crypto/block-luks-priv.h                    | 1 -
>  include/exec/plugin-gen.h                   | 1 +
>  include/hw/acpi/erst.h                      | 3 +++
>  include/hw/char/cmsdk-apb-uart.h            | 1 +
>  include/hw/char/goldfish_tty.h              | 1 +
>  include/hw/char/xilinx_uartlite.h           | 1 +
>  include/hw/cris/etraxfs.h                   | 1 +
>  include/hw/cxl/cxl_host.h                   | 1 -
>  include/hw/display/macfb.h                  | 3 ++-
>  include/hw/dma/sifive_pdma.h                | 2 ++
>  include/hw/i386/ioapic_internal.h           | 1 +
>  include/hw/i386/sgx-epc.h                   | 1 +
>  include/hw/input/pl050.h                    | 1 -
>  include/hw/intc/goldfish_pic.h              | 2 ++
>  include/hw/intc/loongarch_pch_msi.h         | 2 ++
>  include/hw/intc/loongarch_pch_pic.h         | 2 ++
>  include/hw/intc/nios2_vic.h                 | 2 ++
>  include/hw/misc/mchp_pfsoc_dmc.h            | 2 ++
>  include/hw/misc/mchp_pfsoc_ioscb.h          | 2 ++
>  include/hw/misc/mchp_pfsoc_sysreg.h         | 2 ++
>  include/hw/misc/pvpanic.h                   | 1 +
>  include/hw/misc/sifive_e_prci.h             | 3 ++-
>  include/hw/misc/sifive_u_otp.h              | 3 ++-
>  include/hw/misc/sifive_u_prci.h             | 3 ++-
>  include/hw/misc/virt_ctrl.h                 | 2 ++
>  include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 1 +
>  include/hw/net/lasi_82596.h                 | 2 +-
>  include/hw/net/xlnx-zynqmp-can.h            | 1 +
>  include/hw/ppc/pnv_psi.h                    | 2 +-
>  include/hw/riscv/boot_opensbi.h             | 2 ++
>  include/hw/riscv/microchip_pfsoc.h          | 3 +++
>  include/hw/riscv/numa.h                     | 1 +
>  include/hw/riscv/sifive_u.h                 | 2 ++
>  include/hw/riscv/spike.h                    | 2 +-
>  include/hw/riscv/virt.h                     | 2 +-
>  include/hw/ssi/sifive_spi.h                 | 3 +++
>  include/hw/timer/sse-timer.h                | 1 +
>  include/hw/tricore/triboard.h               | 1 -
>  include/hw/usb/hcd-dwc3.h                   | 1 +
>  include/hw/usb/hcd-musb.h                   | 2 ++
>  include/hw/usb/xlnx-usb-subsystem.h         | 2 ++
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 3 +++
>  include/hw/virtio/virtio-mmio.h             | 2 +-
>  include/hw/virtio/virtio.h                  | 1 -
>  include/qemu/plugin-memory.h                | 3 +++
>  include/qemu/userfaultfd.h                  | 1 -
>  include/sysemu/dirtyrate.h                  | 2 ++
>  include/sysemu/dump.h                       | 1 +
>  include/user/syscall-trace.h                | 1 +
>  net/vmnet_int.h                             | 1 -
>  qga/cutils.h                                | 1 -
>  target/hexagon/hex_arch_types.h             | 1 -
>  target/hexagon/mmvec/macros.h               | 1 -
>  target/riscv/pmu.h                          | 1 -
>  hw/virtio/virtio-qmp.c                      | 1 +
>  hw/virtio/virtio.c                          | 1 +
>  qga/cutils.c                                | 3 ++-
>  59 files changed, 82 insertions(+), 22 deletions(-)
> 
> -- 
> 2.38.1


