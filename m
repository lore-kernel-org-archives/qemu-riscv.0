Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hn0li-0006vc-Um
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 09:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hmydV-00054K-3q
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 06:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hmydU-00078R-7I
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 06:55:13 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:56909)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1hmydI-0006rd-V5; Mon, 15 Jul 2019 06:55:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1A1387456CC;
 Mon, 15 Jul 2019 12:54:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EF6987456B4; Mon, 15 Jul 2019 12:54:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EB19674569D;
 Mon, 15 Jul 2019 12:54:51 +0200 (CEST)
Date: Mon, 15 Jul 2019 12:54:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, 
 Eduardo Habkost <ehabkost@redhat.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Richard Henderson <rth@twiddle.net>
In-Reply-To: <20190715095545.28545-3-philmd@redhat.com>
Message-ID: <alpine.BSF.2.21.9999.1907151251210.6546@zero.eik.bme.hu>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-3-philmd@redhat.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-295164879-1563188091=:6546"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
X-Mailman-Approved-At: Mon, 15 Jul 2019 09:11:50 -0400
Subject: Re: [Qemu-riscv] [Qemu-ppc] [PATCH-for-4.2 2/3] hw/usb/Kconfig: Add
 CONFIG_USB_EHCI_PCI
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
X-List-Received-Date: Mon, 15 Jul 2019 10:55:15 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-295164879-1563188091=:6546
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jul 2019, Philippe Mathieu-Daud=C3=A9 wrote:
> The USB_EHCI entry currently include PCI code. Since the EHCI
> implementation is already split in sysbus/PCI, add a new
> USB_EHCI_PCI. There are no logical changes, but the Kconfig
> dependencies tree is cleaner.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/usb/Kconfig       | 9 ++++++---
> hw/usb/Makefile.objs | 5 +++--
> 2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index 564305e283..495c6f2d48 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -19,13 +19,16 @@ config USB_OHCI_PCI
>
> config USB_EHCI
>     bool
> -    default y if PCI_DEVICES
> -    depends on PCI
>     select USB
>
> +config USB_EHCI_PCI
> +    bool
> +    default y if PCI_DEVICES
> +    select USB_EHCI
> +
> config USB_EHCI_SYSBUS
>     bool
> -    select USB
> +    select USB_EHCI

Isn't this making USB_EHCI effectively the same as USB so maybe you don't=
=20
need to keep that around any more. Can you just add select USB to=20
USB_EHCI_PCI and USB_EHCI_SYSBUS and delete USB_EHCI?

Regards,
BALATON Zoltan
--3866299591-295164879-1563188091=:6546--

