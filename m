Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnkMG-0003Lj-6K
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jul 2019 09:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58315)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hnkMC-00034M-A6
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 09:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hnkMB-0002Me-65
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 09:52:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hnkMA-0002Le-VV
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 09:52:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so22262353wmj.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2019 06:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lcPKlikHVw0UKOu5w7sujRIctLFD92nRZ7VhRKeyegM=;
 b=KVzDfOYNtz23U19GieBvadlP3YMAXeMSeE6oDAUUgDK8bkM5TbrVc+fyKD91hXDq3+
 dnyjN36uXfhtdSaDkWnOWDzSO+jwZr8KRkuadxpm+7i+z8sR/UryiWXFcaQ98lHQFAcT
 2hSzQQo/A8+5ShoSjeim0B2izsl9XOUvoAIbMwGLv98VAuMhY/it0iY699daEATMDPrC
 7PNerkDykzkBNjC+29IvgW8EFfV5QVt1HnFWs/3LxFB5AEbo7u0kFt71v2sCaCLjvBGj
 Jgp3Y8i6FhT6pe5/LTV+xp17G6PMHzRCm7Rtf89BH/E8XYTN1fQrcwP2/xKfe9sQYVVl
 oxNQ==
X-Gm-Message-State: APjAAAUIdjpGtMkOGsdt0uR10k5AFnhnPBpuUyG8gXWJpbQHz7j/GcEJ
 W1FDV7kak7kpMe4+7zsIq1EkxvlTPsZboA==
X-Google-Smtp-Source: APXvYqziNvMjIbDvojBWsg3svqTFETmwdKblqqmdyZ7n+h7uLvEKvMQxIpRMQJAodFwJVcZlcBVJWA==
X-Received: by 2002:a05:600c:2388:: with SMTP id
 m8mr35524465wma.23.1563371549409; 
 Wed, 17 Jul 2019 06:52:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e427:3beb:1110:dda2?
 ([2001:b07:6468:f312:e427:3beb:1110:dda2])
 by smtp.gmail.com with ESMTPSA id h133sm24905915wme.28.2019.07.17.06.52.28
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 06:52:28 -0700 (PDT)
To: Collin Walling <walling@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
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
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <633cc3f7-eb20-1bfe-03d2-e481be188eb1@redhat.com>
Date: Wed, 17 Jul 2019 15:52:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
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
X-List-Received-Date: Wed, 17 Jul 2019 13:52:34 -0000

On 17/07/19 14:59, Collin Walling wrote:
> On 7/16/19 11:04 AM, Thomas Huth wrote:
>> On 16/07/2019 15.06, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 15/07/19 18:12, Cornelia Huck wrote:
>>>>>> Is it INTx vs. MSI vs. MSI-X?
>>>>>
>>>>> I think for s390x we need (INTx || MSI) vs MSI-X...
>>>>
>>>> I think MSI vs MSI-X is just how it's configured, not the actual
>>>> behavior, so it should be irrelevant.
>>>
>>> My best guesses from confusing information, please correct
>>> misunderstandings:
>>>
>>> 1. PCI devices need to support MSI or MSI-X to work with s390x.
>>
>> I think Cornelia mentioned that we might even require MSI-X there ...
>> Collin (being listed as "S390 PCI" maintainer), can you confirm?
> 
> MSI-X is mandatory for PCI devices in the s390 architecture.

How are MSI and MSI-X distinguished?

Paolo

