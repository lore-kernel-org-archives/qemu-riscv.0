Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iiIOc-0003PR-7b
	for mharc-qemu-riscv@gnu.org; Fri, 20 Dec 2019 08:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iiIOR-0003Kt-Kb
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2019 08:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iiIOM-0005Xq-N7
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2019 08:32:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47975
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iiIOK-0005Um-OC
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2019 08:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576848745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fLQEqhGLRF+qLVy+VmGtZowBiX6uE7sCge73L4Z+Gk=;
 b=JsAxQZ17VaSuoadLUKvrc9KpZA6SJya6m4WVdQS7Y1/Iba57FE13xu73NF13zcez4T+0Rk
 s5u9ShCZTziquBeb8v+DSznP4UJpdIBDEezgwh+v/FdGg0GG6P03XN88g9hEuFlt0jLwKE
 f6jm6tvaWDVQNp6CPdl8n5i0yIuISC0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-eVi-RrXWMW2KHUUBx5PF6A-1; Fri, 20 Dec 2019 08:32:24 -0500
Received: by mail-oi1-f198.google.com with SMTP id b5so4441042oii.8
 for <qemu-riscv@nongnu.org>; Fri, 20 Dec 2019 05:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0fLQEqhGLRF+qLVy+VmGtZowBiX6uE7sCge73L4Z+Gk=;
 b=pQy7tXvOQeu6KVxJz3bkK4vZ3rGzkmk2kG12k9C/iWfUu0ySXGenEIcHxsHZByPo+7
 PL/pjaZ5GUchgjhTR8PXRPXmPI20C7bjYXMQM+CZvafiFCyM1ZcDimUIkU9nAWlDQxZR
 D/+OU6rBDFXOUBnuTgmQmJxUpVXaLg5NNQ5q2fskeQiVZ94ihTOSX7SgGinWEQFRLV0a
 bJ2Qo2crB9y3LyyXzAjiyeglFNjHxV3C/D7q5SZP1twIY7ed1CRaKBX9ktyRbJs/6yku
 91MQkp6d5HDo6JBzyDqgN6nXTapb4o2cg2B/zG28xyf0fe5b4vxZ4mzrQ4y3gwyOvZrD
 9X4g==
X-Gm-Message-State: APjAAAWLd3MvPewWCwWFJAE82Yu+Pmh0nBoJRsM9V72JUAaZNgzX19Mi
 RgMOQZW8PqbjLnSqs2vG3VUIV4ylQQWgp/z9z2nvKIUkeu+t5ZbCfS8cIxOcAxTab7uWD/pr1A4
 E6Du39lKS9lyQu9TWVvR68PVqhhSD7+w=
X-Received: by 2002:a9d:730e:: with SMTP id e14mr14225403otk.62.1576848743580; 
 Fri, 20 Dec 2019 05:32:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzNNKy3nwyIyaRG68ex95G+yRBCxBbFtkyPOP+yD/WrT3Ctc5S07fpiFH6Itusz2nOMfpdiy2YiQvieMeAdbs=
X-Received: by 2002:a9d:730e:: with SMTP id e14mr14225352otk.62.1576848743262; 
 Fri, 20 Dec 2019 05:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20191218172009.8868-1-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 20 Dec 2019 17:32:11 +0400
Message-ID: <CAMxuvayWibPU6_mEcYEqsWUhSRra33MvwPrbAYr254ZYaYKBgg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler
 typedef
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, 
 Peter Chubb <peter.chubb@nicta.com.au>, Alberto Garcia <berto@igalia.com>, 
 Michael Walle <michael@walle.cc>, Thomas Huth <huth@tuxfamily.org>,
 Joel Stanley <joel@jms.id.au>, 
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 Corey Minyard <minyard@acm.org>, Paul Burton <pburton@wavecomp.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-block <qemu-block@nongnu.org>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
X-MC-Unique: eVi-RrXWMW2KHUUBx5PF6A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 20 Dec 2019 13:32:40 -0000

On Wed, Dec 18, 2019 at 9:20 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi,
>
> After this chat on #qemu IRC:
> 13:20 <stsquad> so what is the difference between a IOReadHandler and IOE=
ventHandler?
> 13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
> 13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
> 13:27 <f4bug> see QEMUChrEvent for IOEventHandler
>
> I thought it might be a good opportunity to make the IOEventHandler
> typedef meaning more obvious, by using the QEMUChrEvent enum.
>
> To be able to build I had to explicit all enums ignored in the
> switch(event) statement by these frontends.
>
> Then I used a coccinelle spatch to change the various IOEventHandler.
> I don't think the last patch can be split, but suggestions are welcome!
>
> Regards,
>
> Phil.
>
> v2:
> - do blindly ignore all events using a 'default' case.
>
> Philippe Mathieu-Daud=C3=A9 (14):
>   hw/ipmi: Remove unnecessary declarations
>   hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
>   hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
>   hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandle=
r
>   hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
>   vhost-user-crypto: Explicit we ignore some QEMUChrEvent in IOEventHandl=
er
>   vhost-user-net: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
>   monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
>   chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
>   chardev: Use QEMUChrEvent enum in IOEventHandler typedef

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

(I guess Paolo will take the series for next PR?)

>
>  include/chardev/char-fe.h       |  2 +-
>  include/chardev/char-mux.h      |  2 +-
>  include/chardev/char.h          |  4 ++--
>  backends/cryptodev-vhost-user.c |  7 ++++++-
>  chardev/char-mux.c              |  8 ++++----
>  chardev/char.c                  |  9 +++++++--
>  gdbstub.c                       |  2 +-
>  hw/arm/pxa2xx.c                 |  2 +-
>  hw/arm/strongarm.c              |  2 +-
>  hw/block/vhost-user-blk.c       |  7 ++++++-
>  hw/char/cadence_uart.c          |  2 +-
>  hw/char/digic-uart.c            |  2 +-
>  hw/char/escc.c                  |  2 +-
>  hw/char/etraxfs_ser.c           |  2 +-
>  hw/char/exynos4210_uart.c       |  2 +-
>  hw/char/grlib_apbuart.c         |  2 +-
>  hw/char/imx_serial.c            |  2 +-
>  hw/char/ipoctal232.c            |  2 +-
>  hw/char/lm32_juart.c            |  2 +-
>  hw/char/lm32_uart.c             |  2 +-
>  hw/char/mcf_uart.c              |  2 +-
>  hw/char/milkymist-uart.c        |  2 +-
>  hw/char/nrf51_uart.c            |  2 +-
>  hw/char/pl011.c                 |  2 +-
>  hw/char/serial.c                |  2 +-
>  hw/char/sh_serial.c             |  2 +-
>  hw/char/terminal3270.c          |  7 ++++++-
>  hw/char/virtio-console.c        |  7 ++++++-
>  hw/char/xilinx_uartlite.c       |  2 +-
>  hw/ipmi/ipmi_bmc_extern.c       | 12 +++++++-----
>  hw/mips/boston.c                |  2 +-
>  hw/mips/mips_malta.c            |  2 +-
>  hw/riscv/riscv_htif.c           |  2 +-
>  hw/riscv/sifive_uart.c          |  2 +-
>  hw/usb/ccid-card-passthru.c     |  7 ++++++-
>  hw/usb/dev-serial.c             |  6 +++++-
>  hw/usb/redirect.c               |  7 ++++++-
>  monitor/hmp.c                   |  6 +++++-
>  monitor/qmp.c                   |  7 ++++++-
>  net/filter-mirror.c             |  2 +-
>  net/vhost-user.c                |  9 +++++++--
>  qtest.c                         |  2 +-
>  tests/test-char.c               |  6 +++---
>  tests/vhost-user-test.c         |  2 +-
>  44 files changed, 111 insertions(+), 56 deletions(-)
>
> Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Fabien Chouteau <chouteau@adacore.com>
> Cc: KONRAD Frederic <frederic.konrad@adacore.com>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Alberto Garcia <berto@igalia.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Paul Burton <pburton@wavecomp.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Zhang Chen <chen.zhang@intel.com>
> Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-riscv@nongnu.org
>
> --
> 2.21.0
>


