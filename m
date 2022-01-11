Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n751P-0000z5-SS
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 19:28:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n751O-0000xi-7t; Mon, 10 Jan 2022 19:28:18 -0500
Received: from [2607:f8b0:4864:20::d33] (port=37645
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n751M-00086m-MX; Mon, 10 Jan 2022 19:28:17 -0500
Received: by mail-io1-xd33.google.com with SMTP id 19so20101508ioz.4;
 Mon, 10 Jan 2022 16:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E9QwF6qfbbBsLwk0HIc1LhZmmT0WD4pHRqAeINZ/i8Q=;
 b=fjCh7TrZx16ZiypyHHodVJVPsJ2jgD8/mvaV5e8oBpD6/Wa7JjEOE0SLaWm9/zpcfZ
 R8EoyBVkmSHVlgG+BqN/4ie0bLFzTrkCMnypPHLnNSXJjPCn6q3LwGO0YU0+77La+m3B
 pYk3L3N7ULgCl4jlVfe6bgSxljoel7Nu1Ivbbqv0YCRZrR6AGuvtzLeHK/lupstjnp7S
 r4mkB3I/iytZI728xXO2qoG5qI/Uag1BY4FK5QXRhVq86nNvMYyFg0Ir8/2iss0j6Sph
 eMVgh+gzBKUG193fzHPuVi1b0zkGSa4PmxAbF8no3hh6fuhUdHDSmOGys7tsE/2D8f8c
 5/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E9QwF6qfbbBsLwk0HIc1LhZmmT0WD4pHRqAeINZ/i8Q=;
 b=3zzkp9ju0Byrd68pMNLkAtt9vXCej32GXq5eKHJi4kSu/gDLCMK4eml1krVdCeHSkO
 Z7ToDSje07+eJpPTMTVy1I2fLz78oDAfBlJMfo03P3ynEPPI1NHu7HGD4MVZ+p1mZFGw
 R7ouo16WOS6NWW7I8Q/9ogzR51PH0JMc8vcP45DjftQhW+eLog8732ioRtNnmILxHh4e
 M0mf5mjjARkiOrwnK84mO4fy/qr7cAvOBuUNYf3zw+m9sLSb2jsOtAFJ7+z4c+NuReCc
 Vo1F2zvopy3JlR0lNlRb7dMD2Sp52bkVhhQTA42u5+I1OukisKnx2zoY7vt3nbAJ52dV
 k0uQ==
X-Gm-Message-State: AOAM532atkDuyy+qPBtNYE1M+/M/vmeL7ObpsFLa05CbMZYRuedgGARK
 +I7NFJNwLcq/rPdenChjssGdA75uSob95wIO0MU=
X-Google-Smtp-Source: ABdhPJx8xGI8yzoRmTjSqW1KfvFV4tyMFckEePCJm0jc9I5pVLgcl0vg9ZTbhMlYk7Q0E/q65AB4BTyV7XQhx2e9I8Q=
X-Received: by 2002:a5d:8f88:: with SMTP id l8mr1026913iol.91.1641860895091;
 Mon, 10 Jan 2022 16:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-7-jiangyifei@huawei.com>
In-Reply-To: <20220110013831.1594-7-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 10:27:48 +1000
Message-ID: <CAKmqyKPNLSiLP_FGgod=1fa=kUnnkagYBOQD0Bx5O=96AAkhmQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] target/riscv: Support start kernel directly by
 KVM
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Jan 2022 00:28:18 -0000

On Mon, Jan 10, 2022 at 11:52 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Get kernel and fdt start address in virt.c, and pass them to KVM
> when cpu reset. Add kvm_riscv.h to place riscv specific interface.
>
> In addition, PLIC is created without M-mode PLIC contexts when KVM
> is enabled.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c    | 21 +++++++---
>  hw/riscv/boot.c          | 16 +++++++-
>  hw/riscv/virt.c          | 83 ++++++++++++++++++++++++++++------------
>  include/hw/riscv/boot.h  |  1 +
>  target/riscv/cpu.c       |  8 ++++
>  target/riscv/cpu.h       |  3 ++
>  target/riscv/kvm-stub.c  | 25 ++++++++++++
>  target/riscv/kvm.c       | 14 +++++++
>  target/riscv/kvm_riscv.h | 24 ++++++++++++
>  target/riscv/meson.build |  2 +-
>  10 files changed, 164 insertions(+), 33 deletions(-)
>  create mode 100644 target/riscv/kvm-stub.c
>  create mode 100644 target/riscv/kvm_riscv.h
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 877e76877c..58c16881cb 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -30,6 +30,7 @@
>  #include "target/riscv/cpu.h"
>  #include "migration/vmstate.h"
>  #include "hw/irq.h"
> +#include "sysemu/kvm.h"
>
>  #define RISCV_DEBUG_PLIC 0
>
> @@ -533,6 +534,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>  {
>      DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
>      int i;
> +    SiFivePLICState *plic;
> +    int s_count = 0, m_count = 0;
>
>      assert(enable_stride == (enable_stride & -enable_stride));
>      assert(context_stride == (context_stride & -context_stride));
> @@ -550,13 +553,19 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>
> -    for (i = 0; i < num_harts; i++) {
> -        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +    plic = SIFIVE_PLIC(dev);
> +    for (i = 0; i < plic->num_addrs; i++) {
> +        CPUState *cpu = qemu_get_cpu(plic->addr_config[i].hartid);
>
> -        qdev_connect_gpio_out(dev, i,
> -                              qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
> -        qdev_connect_gpio_out(dev, num_harts + i,
> -                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
> +        if (plic->addr_config[i].mode == PLICMode_S) {
> +            qdev_connect_gpio_out(dev, s_count++,
> +                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
> +        }
> +
> +        if (plic->addr_config[i].mode == PLICMode_M) {
> +            qdev_connect_gpio_out(dev, num_harts + m_count++,
> +                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
> +        }
>      }

This PLIC change breaks my 5.11.0 buildroot test case on the SiFive U board

The boot process just hangs at:

[    0.542798] usbcore: registered new interface driver usbhid
[    0.543021] usbhid: USB HID core driver
[    0.544584] NET: Registered protocol family 10
[    4.054768] Segment Routing with IPv6
[    4.055325] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    4.057956] NET: Registered protocol family 17
[    4.059327] 9pnet: Installing 9P2000 support
[    4.059787] Key type dns_resolver registered
[    4.060515] debug_vm_pgtable: [debug_vm_pgtable         ]:
Validating architecture page table helpers
[    4.078710] macb 10090000.ethernet eth0: PHY
[10090000.ethernet-ffffffff:00] driver [Generic PHY] (irq=POLL)
[    4.079454] macb 10090000.ethernet eth0: configuring for phy/gmii link mode
[    4.087031] macb 10090000.ethernet eth0: Link is Up - 1Gbps/Full -
flow control tx
[    4.094634] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

Alistair

