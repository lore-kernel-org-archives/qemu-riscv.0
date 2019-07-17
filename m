Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnlUO-0006PV-U0
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jul 2019 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hnlUL-0006Ex-UT
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 11:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hnlUI-0006UA-OQ
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 11:05:01 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hnlUI-0006Se-HW
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 11:04:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id y4so25228612wrm.2
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2019 08:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VwrimCKZzMkOjKNaXoxJLyzC8mk1qj7TpfAu8V+pbD8=;
 b=Re7SXPMETHQyl/20mN52ZFqxaTb2EXDj9wSxfQ791uG6v/K2pscx9qMwozPAal8mA/
 np25qArMIlddtU7m3dg7zZxzn1izzEP0WU8WWSLA8R1WIGOV4oLi7nSOoqHU8ZNDUpu8
 JpFsqtOovBOpY0Y8rJtbsOadzpmUYlOhvRkFINjxwmlye4szvS+XtISvqqM+LC5M/3st
 LzkQBa+PYVfbZcGMgTXgbVYgKQio57L7r7frCXt8TBZG/1engfjGjS+LOC0aw0yPH0g2
 PyVbidrPrN+TZxkm3wH1FvvSBx9z9hREgkyzTPK9H6eCwC3tnKnCbtJr/8oXnE4S2XDQ
 3/OA==
X-Gm-Message-State: APjAAAXW49QN6U8Zhzb4L3pCEWuUPiFlR/rvzyhjx+9wF4jBjMIEE9S9
 C5Cz3k/1aC1bl2r8LCpJ1t8amw==
X-Google-Smtp-Source: APXvYqwzwNe8iI+HiHflxgrwI18m02Cx+kmbTEl/WdHhlQp55RsTWvU9sSgumuPeoovN5VveDRx8dg==
X-Received: by 2002:adf:f883:: with SMTP id u3mr43259593wrp.0.1563375896647;
 Wed, 17 Jul 2019 08:04:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e427:3beb:1110:dda2?
 ([2001:b07:6468:f312:e427:3beb:1110:dda2])
 by smtp.gmail.com with ESMTPSA id b5sm20503921wru.69.2019.07.17.08.04.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 08:04:56 -0700 (PDT)
To: Collin Walling <walling@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "open list:S390"
 <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
 <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
 <633cc3f7-eb20-1bfe-03d2-e481be188eb1@redhat.com>
 <87f07cd0-ebbc-3569-9070-5700e47d4af8@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a88a7f65-60c2-22a8-5523-faedabc06b44@redhat.com>
Date: Wed, 17 Jul 2019 17:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87f07cd0-ebbc-3569-9070-5700e47d4af8@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
X-List-Received-Date: Wed, 17 Jul 2019 15:05:02 -0000

On 17/07/19 16:54, Collin Walling wrote:
> PCI host plugging will check for the MSI-X capability on the
> PCI device. If the MSI-X cap is missing, we fail device plugging.
> We do not check for MSI. Only MSI-X.
> 
> Specifically, the capability is represented by PCI_CAP_ID_MSIX
> in pci_regs.h

The code in Linux says that single MSIs are supported too:

       if (type == PCI_CAP_ID_MSI && nvec > 1)
               return 1;

Paolo

