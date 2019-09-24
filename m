Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iClRe-0000li-En
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 10:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iClRa-0000cQ-HF
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 10:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iClRY-0003qk-5v
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 10:05:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29958
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iClRY-0003pn-1w
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 10:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569333927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=qsZFkBCjAg4NRJpBDgNBqwAYIrBs9cL8UQCX2si23RE=;
 b=YQpSYbtLALT2reRAOTfU3RduiEu/GdPLP44YxspEX9pX1Zdy36m4aSt5gCclEJJSQb0cB9
 da9FuPFDxFvPp3D9/UFHTDmhTzzTzGn0VEKW2ZNIvxDqB5Fj5Tx6GvX6EoqxbfQFTND9La
 zzqklAuEUkY8BoBadEaDL5Y1/pdKjCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-ChkJZeYVMFGlUkwGVXu-yQ-1; Tue, 24 Sep 2019 10:05:26 -0400
Received: by mail-wr1-f70.google.com with SMTP id m14so611945wru.17
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 07:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SPLJnRLkroiJLQOvFWvOrYF8z/53F+MgKQSL9d4wxPk=;
 b=QcZuJdCf8weqkB2wFzw+PJhBRqs3Xdgef+i7kyHDiecljnekWBJF5VmvKtOAS50bbr
 wJxylaUmNlpKqNCmHDaXlV3fmGphakiLzD1k0GDIVdomRFh4BI0jd8emI0sfNRStXMJN
 mvDn5zaMBNlsXsKcPGbghwReNJitPs8pRs9PnpBvkwEgNvJQatysScd/oh/RdKxiIs1r
 qeKQZG435BCNR75muj2ahhyrRv1/O1J3xtuM0mvNt+kLDWT1eH+V6M6gyA5vrLYBWAiX
 hVzK7JkCgNUNG83t3NT5ujc7aEwGu9P+U9wKPH4y6xi95TuEo99Ou3KX9U83Hs/zEv+0
 2ZFA==
X-Gm-Message-State: APjAAAX8OzbP6NBd8WpAIcq8/phOMuFoIlRhDxNssLkGdxGxoBppVQ9s
 jTQXFYwGAn/NTnjttsVl0Gz+qQ0X4AIVj8KzztVjtFAAI24Zq+19+//OgdYbTm/JP4zRxONne8H
 GFT/8Ze1bmPvDapk=
X-Received: by 2002:a5d:694e:: with SMTP id r14mr2458784wrw.34.1569333924782; 
 Tue, 24 Sep 2019 07:05:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBwOmY8pOjEwJTG0GQU8tmcP9XUiJI3dCpuqjsVJH32z5rx2evgf7PoHPI0D1O73fzBbepjg==
X-Received: by 2002:a5d:694e:: with SMTP id r14mr2458751wrw.34.1569333924579; 
 Tue, 24 Sep 2019 07:05:24 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id f186sm126612wmg.21.2019.09.24.07.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2019 07:05:23 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] RTC support for QEMU RISC-V virt machine
To: Anup Patel <Anup.Patel@wdc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
References: <20190924131131.118155-1-anup.patel@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <735d696e-f0dc-cad3-acc3-056cf152cc22@redhat.com>
Date: Tue, 24 Sep 2019 16:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924131131.118155-1-anup.patel@wdc.com>
Content-Language: en-US
X-MC-Unique: ChkJZeYVMFGlUkwGVXu-yQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Tue, 24 Sep 2019 14:05:32 -0000

Hi Anup,

On 9/24/19 3:11 PM, Anup Patel wrote:
> This series adds RTC device to QEMU RISC-V virt machine. We have
> selected Goldfish RTC device model for this. It's a pretty simple
> synthetic device with few MMIO registers and no dependency external
> clock. The driver for Goldfish RTC is already available in Linux so
> we just need to enable it in Kconfig for RISCV and also update Linux
> defconfigs.
>=20
> We have tested this series with Linux-5.3 plus defconfig changes
> available in 'goldfish_rtc_v1' branch of:
> https://github.com/avpatel/linux.git
>=20
> Changes since v1:
>  - Removed redundant object properties from Goldfish RTC emulation
>  - Added vmstate for Goldfish RTC
>=20
> Anup Patel (2):
>   hw: timer: Add Goldfish RTC device
>   riscv: virt: Use Goldfish RTC device
>=20
>  hw/riscv/Kconfig                |   1 +
>  hw/riscv/virt.c                 |  15 ++
>  hw/timer/Kconfig                |   3 +
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/goldfish_rtc.c         | 278 ++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h         |   2 +
>  include/hw/timer/goldfish_rtc.h |  46 ++++++

Minor comment, if my ongoing series "Split RTC devices from hw/timer/ to
hw/rtc/" is accepted, you'd have to rebase this in hw/rtc/goldfish_rtc:
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03334.html
(no logical change involved).

Regards,

Phil.


