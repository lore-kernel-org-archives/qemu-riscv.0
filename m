Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSm8o-00060g-16
	for mharc-qemu-riscv@gnu.org; Thu, 07 Nov 2019 13:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iSm8j-0005yb-4O
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iSm8h-0007g3-Hy
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:04:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40066
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iSm8h-0007fm-Ds
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573149850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cA5Nj2lSy6a+kfwgiAcW5Spxg2tRNKg1j960jZLS/c=;
 b=cMlDZAtiD+Vr2sfXTPmEpnwhlYWUkOQ3SxAAYus9gt4XqdMqt/NXcLDX379ELJ+T/dRIJD
 FVm9WdOw605xMjvwagmHO8q3IaAq7zvysbp0E6r+PkfJeLMLngFqgLOpNWXG3hXQ9Ms4Ql
 MUfTGkh6OVT22dVIadK9+/6kgRmQl78=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-ICPR9ZLcPumVKU9SBXEfBQ-1; Thu, 07 Nov 2019 13:04:09 -0500
Received: by mail-wr1-f71.google.com with SMTP id f8so1507455wrq.6
 for <qemu-riscv@nongnu.org>; Thu, 07 Nov 2019 10:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9EKh4v8U/tcnBfisjslFQQy7nTkPVB+gqAlqojhWRuA=;
 b=DqVkENrYuX/fKjFdb4+fHFww8jyDBoB/nttgi9fDnUZ8qvg4oDrxSKStKFc1zkkrsC
 9soKTsEShxGfvarGhCtfhTpDvmCzVVXLF2LPcno9kaz7j1HW4fx4qoUqYbsEVdTt7qHP
 94htn+pZXNwQvZG5YpmbUfowwXy/dHs+szo6DvrjEhZNYsB0B57krceQAoPbk7kH3KP/
 +glDrz+zODchmqpxJvWnreSpcnyfC+c14qBsugX3it/apPJv9nmpghOYx03TdfQ0/nAP
 B5EHS3hSaM5lqtO3iAuFXLB/yxRTwb0mhupOO9DS774euAeeophfDdFpFwYt37P4BrC1
 y0Tw==
X-Gm-Message-State: APjAAAXvHzNM0RAe8NFPfpL4DbD4oU3F03i1Q16Ohoezh8EKwRR6PmxM
 esjNKIBaHRSpL5gbvWQdV2sWLfbAK4PPV5TapiMhT76QKtEzCszKCS7fME62p2u1V/mGeafz4vm
 24NurknPoFTA+7sQ=
X-Received: by 2002:a1c:200f:: with SMTP id g15mr4302265wmg.96.1573149847888; 
 Thu, 07 Nov 2019 10:04:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZasOske5uA1TgXXaJKnYor89xB+6otSL4aKv4o7wbQt5FBwVdWfGIL6wQ4ZuNwPBWyrS10A==
X-Received: by 2002:a1c:200f:: with SMTP id g15mr4302247wmg.96.1573149847669; 
 Thu, 07 Nov 2019 10:04:07 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id f188sm2627625wmf.3.2019.11.07.10.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2019 10:04:07 -0800 (PST)
Subject: Re: [PATCH v8 0/3] RTC support for QEMU RISC-V virt machine
To: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <Anup.Patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, palmer@sifive.com,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 anup@brainfault.org, qemu-devel@nongnu.org, Atish Patra <Atish.Patra@wdc.com>
References: <mhng-fceb5aa2-7610-421a-b350-d939ace5fee2@palmer-si-x1c4>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac999ff0-3c47-7e79-a339-5b0cd1c2dc5c@redhat.com>
Date: Thu, 7 Nov 2019 19:04:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <mhng-fceb5aa2-7610-421a-b350-d939ace5fee2@palmer-si-x1c4>
Content-Language: en-US
X-MC-Unique: ICPR9ZLcPumVKU9SBXEfBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 07 Nov 2019 18:04:15 -0000

On 11/7/19 5:52 PM, Palmer Dabbelt wrote:
> On Wed, 06 Nov 2019 03:56:29 PST (-0800), Anup Patel wrote:
>> This series adds RTC device to QEMU RISC-V virt machine. We have
>> selected Goldfish RTC device model for this. It's a pretty simple
>> synthetic device with few MMIO registers and no dependency external
>> clock. The driver for Goldfish RTC is already available in Linux so
>> we just need to enable it in Kconfig for RISCV and also update Linux
>> defconfigs.
>>
>> We have tested this series with Linux-5.4-rc4 plus defconfig changes
>> available in 'goldfish_rtc_v2' branch of:
>> https://github.com/avpatel/linux.git
>>
>> Changes since v7:
>> =C2=A0- Fix broken "stdout-path" in "/chosen" DT node of virt machine
>>
>> Changes since v6:
>> =C2=A0- Rebased on latest QEMU master
>> =C2=A0- Addressed all nit comments from Philippe Mathieu-Daude
>>
>> Changes since v5:
>> =C2=A0- Rebased on latest QEMU master
>> =C2=A0- Added maintainer entry for Goldfish RTC
>>
>> Changes since v4:
>> =C2=A0- Fixed typo in trace event usage
>> =C2=A0- Moved goldfish_rtc.h to correct location
>>
>> Changes since v3:
>> =C2=A0- Address all nit comments from Alistair
>>
>> Changes since v2:
>> =C2=A0- Rebased on RTC code refactoring
>>
>> Changes since v1:
>> =C2=A0- Implemented VMState save/restore callbacks
>>
>> Anup Patel (3):
>> =C2=A0 hw: rtc: Add Goldfish RTC device
>> =C2=A0 riscv: virt: Use Goldfish RTC device
>> =C2=A0 MAINTAINERS: Add maintainer entry for Goldfish RTC
>>
>> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
>> =C2=A0hw/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0hw/riscv/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++
>> =C2=A0hw/rtc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
>> =C2=A0hw/rtc/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0hw/rtc/goldfish_rtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 285 ++++++++++++++++++++++++++++++++++
>> =C2=A0hw/rtc/trace-events=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>> =C2=A0include/hw/riscv/virt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
>> =C2=A0include/hw/rtc/goldfish_rtc.h |=C2=A0 46 ++++++
>> =C2=A09 files changed, 366 insertions(+)
>> =C2=A0create mode 100644 hw/rtc/goldfish_rtc.c
>> =C2=A0create mode 100644 include/hw/rtc/goldfish_rtc.h
>=20
> Thanks.=C2=A0 I've updated the patches on my queue, LMK if there are any =
more=20
> changes!

I'm happy with the series, thanks Anup for addressing all the comments.

Regards,

Phil.


