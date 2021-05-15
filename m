Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1li0Fb-00081i-3j
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 15:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0FX-0007wC-Fx; Sat, 15 May 2021 15:47:00 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0FT-0003cr-In; Sat, 15 May 2021 15:46:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 832F37457E7;
 Sat, 15 May 2021 21:46:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 62F11745708; Sat, 15 May 2021 21:46:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 61AFD74570E;
 Sat, 15 May 2021 21:46:53 +0200 (CEST)
Date: Sat, 15 May 2021 21:46:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency
 MV64361 -> I8259
In-Reply-To: <20210515173716.358295-10-philmd@redhat.com>
Message-ID: <e02c3aac-7b24-41cb-c63c-79382a8fb@eik.bme.hu>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-412561032-1621108013=:7809"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
X-List-Received-Date: Sat, 15 May 2021 19:47:01 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-412561032-1621108013=:7809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> Looking at the MV64340 model source, there is a dependency on the
> 8259 interrupt controller:
>
>  523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
>  524         /* FIXME: Should this be sent via the PCI bus somehow? */
>  525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
>  526             ret = pic_read_irq(isa_pic);
>  527         }
>  528         break;
>
> Add it to Kconfig to avoid the following build failure:
>
>  /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
>  hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
>  /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'
>
> Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Correct, this is a dependency that I've missed, although pegasos2 probably 
has it already and nothing else is using this chip but it's more correct 
to list it explicitely.

> ---
> hw/pci-host/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 79c20bf28bb..9dc0d761815 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -76,3 +76,4 @@ config SH_PCI
> config MV64361
>     bool
>     select PCI
> +    select I8259
>
--3866299591-412561032-1621108013=:7809--

