Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p404n-0005UP-7v
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 08:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p404e-0005SS-1w
 for qemu-riscv@nongnu.org; Sat, 10 Dec 2022 08:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p404b-0005lr-PH
 for qemu-riscv@nongnu.org; Sat, 10 Dec 2022 08:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670679564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TU7eJccUUt/l14We8LmySPSQAyLTydiJfTGGkgJuGAU=;
 b=Hvsf+s7B20V1mehm7DHK8pNu9tB8u0Lo8glIZuvIyUCwa8OYNfBvyzCJQMy8xTqCfJO56f
 rDoF9+20SF9zPF93hnJTMS1HyLjgU0zYadf2+XBFfqfAiKNJUdK2mhWyoS0Jv6uvDB3xKA
 5CMLO5uEBMEh0LV78P/UdokFSq2n/HM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-cpwdbstzNn2N00YNc_oK5g-1; Sat, 10 Dec 2022 08:39:21 -0500
X-MC-Unique: cpwdbstzNn2N00YNc_oK5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 519D2802A61;
 Sat, 10 Dec 2022 13:39:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5AB840C2065;
 Sat, 10 Dec 2022 13:39:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9262621E6921; Sat, 10 Dec 2022 14:39:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu, edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: [PATCH 0/2] Clean up includes
Date: Sat, 10 Dec 2022 14:39:13 +0100
Message-Id: <20221210133915.4104305-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Sat, 10 Dec 2022 13:39:29 -0000

Back in 2016, we discussed[1] rules for headers, and these were
generally liked:

1. Have a carefully curated header that's included everywhere first.  We
   got that already thanks to Peter: osdep.h.

2. Headers should normally include everything they need beyond osdep.h.
   If exceptions are needed for some reason, they must be documented in
   the header.  If all that's needed from a header is typedefs, put
   those into qemu/typedefs.h instead of including the header.

3. Cyclic inclusion is forbidden.

This series fixes a number of rule violations.

It is based on

    [PATCH 0/4] hw/ppc: Clean up includes
    [PATCH 0/5] include/hw/pci include/hw/cxl: Clean up includes
    [PATCH 0/3] block: Clean up includes
    [PATCH 0/4] coroutine: Clean up includes

With all of these applied, just three inclusion loops remain reachable
from include/:

    target/microblaze/cpu.h target/microblaze/mmu.h

    target/nios2/cpu.h target/nios2/mmu.h

    target/riscv/cpu.h target/riscv/pmp.h

Breaking them would be nice, but I'm out of steam.

[1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Based-on: <20221210112140.4057731-1-armbru@redhat.com>

Markus Armbruster (2):
  include/hw/virtio: Break inclusion loop
  include: Include headers where needed

 include/exec/plugin-gen.h                   | 1 +
 include/hw/acpi/erst.h                      | 3 +++
 include/hw/char/cmsdk-apb-uart.h            | 1 +
 include/hw/char/goldfish_tty.h              | 1 +
 include/hw/char/xilinx_uartlite.h           | 1 +
 include/hw/cris/etraxfs.h                   | 1 +
 include/hw/display/macfb.h                  | 3 ++-
 include/hw/dma/sifive_pdma.h                | 2 ++
 include/hw/i386/ioapic_internal.h           | 1 +
 include/hw/i386/sgx-epc.h                   | 1 +
 include/hw/intc/goldfish_pic.h              | 2 ++
 include/hw/intc/loongarch_pch_msi.h         | 2 ++
 include/hw/intc/loongarch_pch_pic.h         | 2 ++
 include/hw/intc/nios2_vic.h                 | 2 ++
 include/hw/misc/mchp_pfsoc_dmc.h            | 2 ++
 include/hw/misc/mchp_pfsoc_ioscb.h          | 2 ++
 include/hw/misc/mchp_pfsoc_sysreg.h         | 2 ++
 include/hw/misc/pvpanic.h                   | 1 +
 include/hw/misc/sifive_e_prci.h             | 3 ++-
 include/hw/misc/sifive_u_otp.h              | 3 ++-
 include/hw/misc/sifive_u_prci.h             | 3 ++-
 include/hw/misc/virt_ctrl.h                 | 2 ++
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 1 +
 include/hw/net/lasi_82596.h                 | 2 +-
 include/hw/net/xlnx-zynqmp-can.h            | 1 +
 include/hw/ppc/pnv_psi.h                    | 2 +-
 include/hw/riscv/boot_opensbi.h             | 2 ++
 include/hw/riscv/microchip_pfsoc.h          | 3 +++
 include/hw/riscv/numa.h                     | 1 +
 include/hw/riscv/sifive_u.h                 | 2 ++
 include/hw/riscv/spike.h                    | 2 +-
 include/hw/riscv/virt.h                     | 2 +-
 include/hw/ssi/sifive_spi.h                 | 3 +++
 include/hw/timer/sse-timer.h                | 1 +
 include/hw/usb/hcd-dwc3.h                   | 1 +
 include/hw/usb/hcd-musb.h                   | 2 ++
 include/hw/usb/xlnx-usb-subsystem.h         | 2 ++
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 3 +++
 include/hw/virtio/virtio-mmio.h             | 2 +-
 include/hw/virtio/virtio.h                  | 1 -
 include/qemu/plugin-memory.h                | 3 +++
 include/sysemu/dirtyrate.h                  | 2 ++
 include/sysemu/dump.h                       | 1 +
 include/user/syscall-trace.h                | 1 +
 hw/virtio/virtio.c                          | 1 +
 45 files changed, 72 insertions(+), 10 deletions(-)

-- 
2.37.3


