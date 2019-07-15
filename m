Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmz2x-0003RY-Af
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 07:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48671)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2u-0003Ov-U0
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2t-0005LG-Tw
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:21:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hmz2t-0005Kw-NJ
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:21:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so16636954wrl.7
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2019 04:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XpM7q5nGE5in8iatsiRuS3mXGEMtUeDV4D74czZCweE=;
 b=Uru4tC0vPH15xb8QC6LQJmUlfKOZMb37Fx8dz1DvYdTbF7em7WK4cnxlONLUBBK4De
 aS6bXHJAR4aHoSq3o0MejhJFgB+ADCJbaW0JefhYsEJ7vEDUjsG7feJwu7MwOiOsfLKm
 4iNk+vZb43SdQJF/OgeaHKYxYiUfkJ6NRptmb85d398XSHVEIB2hOsf+QHJraFKopsKB
 wNrFB8sOfR4YGR5vOrEMt1U/bWF8UHKe33hagRgTu3Srqk4U6XpWpE+QmyofLkm2ASSY
 txCdreryt7FNGQLzjPlnp3dB99NuWe7wflLyhNZZf18M00OOPG/BCKtbf9GHAAvR6ULV
 YksQ==
X-Gm-Message-State: APjAAAVGLVETEB4rygvL5tC+RYpx1vv0MWPHqkhyR6cYrq8QjPZ61T7W
 1vAf0BK1LcOoM81l8vu9BVIt9w==
X-Google-Smtp-Source: APXvYqySZXCkGKs4fJgtxWADvWLAaNT5g2s/8nxplP7Tc6HcE8N/DWpshk2KIhdbIiREWdcuot/JXw==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr27681990wrr.252.1563189686712; 
 Mon, 15 Jul 2019 04:21:26 -0700 (PDT)
Received: from [192.168.178.40] ([151.20.129.151])
 by smtp.gmail.com with ESMTPSA id p26sm23977275wrp.58.2019.07.15.04.21.25
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 04:21:26 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b6d8e256-b6bf-6270-b2db-9d15403f6233@redhat.com>
Date: Mon, 15 Jul 2019 13:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715095545.28545-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [PATCH 0/3] hw/Kconfig: PCI & USB fixes
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
X-List-Received-Date: Mon, 15 Jul 2019 11:21:29 -0000

On 15/07/19 11:55, Philippe Mathieu-Daudé wrote:
> I actually wanted to clean the USB devices (i.e. to not have
> USB3 devices appear on OHCI buses) but this is too late for
> the next release, so let's post the patches accumulated.
> 
> Philippe Mathieu-Daudé (3):
>   hw/Kconfig: PCI bus implies PCI_DEVICES
>   hw/usb/Kconfig: Add CONFIG_USB_EHCI_PCI
>   hw/usb/Kconfig: USB_XHCI_NEC requires USB_XHCI
> 
>  docs/devel/kconfig.rst |  1 -
>  hw/alpha/Kconfig       |  1 -
>  hw/arm/Kconfig         |  4 ----
>  hw/hppa/Kconfig        |  1 -
>  hw/i386/Kconfig        |  1 -
>  hw/pci/Kconfig         |  1 +
>  hw/ppc/Kconfig         |  6 ------
>  hw/riscv/Kconfig       |  1 -
>  hw/sh4/Kconfig         |  1 -
>  hw/sparc64/Kconfig     |  1 -
>  hw/usb/Kconfig         | 11 +++++++----
>  hw/usb/Makefile.objs   |  5 +++--
>  12 files changed, 11 insertions(+), 23 deletions(-)
> 

ACK for 2 and 3.  Gerd is on vacation so I'm picking them up.

Paolo

