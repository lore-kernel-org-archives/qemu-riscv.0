Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmz2H-0002Py-V7
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 07:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2F-0002L1-Cm
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2E-00054V-Ev
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:20:47 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:37348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hmz2E-000543-7M
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:20:46 -0400
Received: by mail-wr1-f47.google.com with SMTP id n9so16676101wrr.4
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2019 04:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xuZ17Wl+Vo820DgCe+PNldumzhl2p89ckdeUukJIQlA=;
 b=bztbmM5n2XnDAwu3Elhlbf6DNVRXyenZXcTFRgPAZeI1oGzrGwN2VgsACfUzvidyC2
 DHeGhJ1tYZP2mNu/EWHR42NrhlNcuGwDNPeNvFS6EHFyNkQ7wGu+sd//DD6WZEndHLkO
 koKe9FrT73H7BedKtctPgMEwXiD78BwmxygxHtHXUVAhhcz2XikO+zjfbebMPQGr0V5O
 B1cxjTqGQKWywu/4GaT5xl5E6zdEOd78vetmhGWxG1CU71BogFfDbZSSP54K6O4XPQEL
 fEY04VMs+/RhiRVUr2+FbqrDQSBMMXzuiKsFkx/M5lIbIh32p0DEbV5hgxPSRB8twdQ/
 N/Zw==
X-Gm-Message-State: APjAAAUpPWQb8c9WXAxfcH3wWbeRZHniTskiB60SvBtMtMVOEvDCi2dn
 NJqNliuvVt3pxGNvZOJxZlWe+Q==
X-Google-Smtp-Source: APXvYqwG3fsh2EUG+5QE0EJdg8fft9YdExPlRK00uAXYEFkshpt0CtFWD6+HvL5EQX1Y79zhRBzbMw==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr16037835wrp.258.1563189645214; 
 Mon, 15 Jul 2019 04:20:45 -0700 (PDT)
Received: from [192.168.178.40] ([151.20.129.151])
 by smtp.gmail.com with ESMTPSA id t13sm18616243wrr.0.2019.07.15.04.20.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 04:20:44 -0700 (PDT)
To: BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-3-philmd@redhat.com>
 <alpine.BSF.2.21.9999.1907151251210.6546@zero.eik.bme.hu>
 <64dd9cd5-8599-b157-3ba2-0ec565cee709@redhat.com>
 <alpine.BSF.2.21.9999.1907151309190.6546@zero.eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8a6e23a6-2101-3aaa-21b2-a724fea160ac@redhat.com>
Date: Mon, 15 Jul 2019 13:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.21.9999.1907151309190.6546@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.47
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
X-List-Received-Date: Mon, 15 Jul 2019 11:20:48 -0000

On 15/07/19 13:10, BALATON Zoltan wrote:
>>
>> If you want to compile without USB_EHCI_PCI and without USB_EHCI_SYSBUS,
>> but with USB (e.g. due to XHCI), I think we should not include
>> hcd-ehci.o file in the build. So I think it's fine that we have a
>> separate config switch for this file.
> 
> So shouldn't build depend on either USB_EHCI_PCI or USB_EHCI_SYSBUS
> selected then?

No, USB_EHCI is never selected by the user.  The board or default-config
file selects either USB_EHCI_PCI or USB_EHCI_SYSBUS, which brings in
USB_EHCI, which brings in USB, which (optionally) brings in the USB devices.

Paolo

