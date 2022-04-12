Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1neKej-0000vK-2Y
	for mharc-qemu-riscv@gnu.org; Tue, 12 Apr 2022 13:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1neIwG-0004cP-7r; Tue, 12 Apr 2022 12:00:23 -0400
Received: from sin.source.kernel.org ([145.40.73.55]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1neIw9-0001DF-TL; Tue, 12 Apr 2022 12:00:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63FEFCE1F65;
 Tue, 12 Apr 2022 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDFBC385A5;
 Tue, 12 Apr 2022 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649779196;
 bh=x2U/qJnrsLfTLMHfTB0Cj0Pia5pGKfHf0qEDVfrCRAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LmEWX8tWnaUxlMDkqtvZH5v+O3+Iv0NcPnPFC8ckjz28jnwNTMRNmku60dWjo3Rhr
 VfS/3RtXDpT3RiNmd4iWrDkwjn4+1OyYIKOMSI8s4cEKcTNxUETMtjfMIUI1OjdC9A
 nF2RlhCLJtIy5mi5A59wJHpat61x/GZG93RFRlPHsQrxCdewYRTffL1uyemhXtlx4v
 wM/syBuhDUBt0YsxRGtYJ5qzpfoUsBwNxwrB/6dBBBRj6QNZzZbAVdCSCabm9ZvcoB
 qHRnUnhwDQnIu89M1tYa3/WwZg57C+iNWAhWAsSGPRc2zIie7um3IyOye2HVO8RqSv
 TyzoOHFsd5Txw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1neIvq-003pME-Ee; Tue, 12 Apr 2022 16:59:54 +0100
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 16:59:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, "Michael S. Tsirkin"
 <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, Alistair Francis
 <alistair.francis@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 1/3] serial: Enable MSI capablity and option
In-Reply-To: <20220412021009.582424-2-atishp@rivosinc.com>
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <20220412021009.582424-2-atishp@rivosinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0d89f3ca4532f2afe59860e20acb4118@misterjones.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: atishp@rivosinc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, mst@redhat.com, bin.meng@windriver.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, palmer@dabbelt.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=145.40.73.55; envelope-from=maz@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Apr 2022 13:50:11 -0400
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
X-List-Received-Date: Tue, 12 Apr 2022 16:00:35 -0000

On 2022-04-12 03:10, Atish Patra wrote:
> The seria-pci device doesn't support MSI. Enable the device to provide
> MSI so that any platform with MSI support only can also use
> this serial device. MSI can be enabled by enabling the newly introduced
> device property. This will be disabled by default preserving the 
> current
> behavior of the seria-pci device.

This seems really odd. Switching to MSI implies that you now have
an edge signalling. This means that the guest will not be interrupted
again if it acks the MSI and doesn't service the device, as you'd
expect for a level interrupt (which is what the device generates today).

 From what I understand of the patch, you signal a MSI on each
transition of the device state, which is equally odd (you get
an interrupt even where the device goes idle?).

While this may work for some guests, this completely changes the
semantics of the device. You may want to at least document the new
behaviour.

Thanks,

         M.

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  hw/char/serial-pci.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 93d6f9924425..ca93c2ce2776 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -31,6 +31,7 @@
>  #include "hw/char/serial.h"
>  #include "hw/irq.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/msi.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qom/object.h"
> @@ -39,26 +40,54 @@ struct PCISerialState {
>      PCIDevice dev;
>      SerialState state;
>      uint8_t prog_if;
> +    bool msi_enabled;
>  };
> 
>  #define TYPE_PCI_SERIAL "pci-serial"
>  OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
> 
> +
> +static void msi_irq_handler(void *opaque, int irq_num, int level)
> +{
> +    PCIDevice *pci_dev = opaque;
> +
> +    assert(level == 0 || level == 1);
> +
> +    if (msi_enabled(pci_dev)) {
> +        msi_notify(pci_dev, 0);
> +    }
> +}
> +
>  static void serial_pci_realize(PCIDevice *dev, Error **errp)
>  {
>      PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
>      SerialState *s = &pci->state;
> +    Error *err = NULL;
> +    int ret;
> 
>      if (!qdev_realize(DEVICE(s), NULL, errp)) {
>          return;
>      }
> 
>      pci->dev.config[PCI_CLASS_PROG] = pci->prog_if;
> -    pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
> -    s->irq = pci_allocate_irq(&pci->dev);
> -
> +    if (pci->msi_enabled) {
> +        pci->dev.config[PCI_INTERRUPT_PIN] = 0x00;
> +        s->irq = qemu_allocate_irq(msi_irq_handler, &pci->dev, 100);
> +    } else {
> +        pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
> +        s->irq = pci_allocate_irq(&pci->dev);
> +    }
>      memory_region_init_io(&s->io, OBJECT(pci), &serial_io_ops, s, 
> "serial", 8);
>      pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
> +
> +    if (!pci->msi_enabled) {
> +        return;
> +    }
> +
> +    ret = msi_init(&pci->dev, 0, 1, true, false, &err);
> +    if (ret == -ENOTSUP) {
> +        fprintf(stdout, "MSIX INIT FAILED\n");
> +    }
>  }
> 
>  static void serial_pci_exit(PCIDevice *dev)
> @@ -83,6 +112,7 @@ static const VMStateDescription vmstate_pci_serial = 
> {
> 
>  static Property serial_pci_properties[] = {
>      DEFINE_PROP_UINT8("prog_if",  PCISerialState, prog_if, 0x02),
> +    DEFINE_PROP_BOOL("msi",  PCISerialState, msi_enabled, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };

-- 
Jazz is not dead. It just smells funny...

