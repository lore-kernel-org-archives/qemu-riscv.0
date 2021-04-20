Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYpTA-0006dc-Vv
	for mharc-qemu-riscv@gnu.org; Tue, 20 Apr 2021 08:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1lYpT8-0006b0-Ug; Tue, 20 Apr 2021 08:27:07 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1lYpSx-0000hx-MH; Tue, 20 Apr 2021 08:27:05 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MoNyA-1lsX6a1Gxs-00omXw; Tue, 20 Apr 2021 14:26:44 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso10100419wmq.2; 
 Tue, 20 Apr 2021 05:26:44 -0700 (PDT)
X-Gm-Message-State: AOAM5319zJ97QzqnE5bPMz5hvlW+wZZmb8ik4F1Kx6vtCBTbEvgXfcws
 g97F8cIX/GyJ4OG7SjQAkdzK3XrkcZ0913wkYUE=
X-Google-Smtp-Source: ABdhPJzzH/3t3TG94dZXiQdv4zy0WWlqYsKIrKmJ4UDLYfPin+YjtDuGo7NZV7y/wmB5Cl4ZKkTZhmQwPLoJu82qEgk=
X-Received: by 2002:a1c:6382:: with SMTP id x124mr4257008wmb.142.1618921603890; 
 Tue, 20 Apr 2021 05:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210325163315.27724-1-peter.maydell@linaro.org>
 <1df78911-9858-b747-b22b-7e5254cd3cac@amsat.org>
 <CAFEAcA_TuKCJ31xsv_j49oQfOFuEipmMnsNb2czPZRMPTN=wxg@mail.gmail.com>
 <bb3cc932-5111-c388-2770-3c1110dbc89f@amsat.org>
In-Reply-To: <bb3cc932-5111-c388-2770-3c1110dbc89f@amsat.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 14:26:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3zeYC0wiT2Or3RicPbVBY4TJCOTa6ZN3rT=e4XGR-eCA@mail.gmail.com>
Message-ID: <CAK8P3a3zeYC0wiT2Or3RicPbVBY4TJCOTa6ZN3rT=e4XGR-eCA@mail.gmail.com>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w3zfaopnzGc6TlSPbWcxcOzN1AvR0c0ZRp0tG6M7CugebnJmTNI
 TpSVEOv9QVLBjQryMKL5rQBRXKb+N8xL3V4gwkfOhJRH40+R5F0jMbvfjwBE2mnbej+twz3
 fBkwb2evNUB6hstnnEmqTDHMOwm1ekI/MqnLfqJK1utAFaj8mrimtC6ibEgSQSwzZDdlTVh
 kPn2OGdIIDuhaUj1kajTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sJyoyYzSyMU=:qH9ALZbYpNQyIC9y1HVMDK
 fxbESdtOeE1Om9GhQ8gKvZvYGOKrCfyInf6mq0cI7uH9bqwvZdIhAlvnj9zg9hYF3VvklFlGz
 Z6oj4BJPVAdiwhdHkrS5time8QchCAehWNTeNJ2VtnmzXQ5vJwOJGYroz3j88jPc1Wfxhwuxq
 iyEbOglmhzNPtbv2FAWPfKi4b/W1ym2D4kqB6keYF2P5SISy1GX/PNcysHprAqLhybMjBt/5c
 kHY96oJmyKviJr6GJLLteCg/OtYKX7VQlyDMNDpVixJv+lkPHXs+DTdzbK0So3G16nUNrhOE6
 H+cq6ahjeGm4eWdlG88mZrmvfiflC2W0OKrHM7ANqZQSAZ4yc7o6ilSOkvFS+o5WDOsNUM8sI
 dzxwBbOJQm/ZBKBYszP6G18iB56xOm5gVMxK/oOdOXSAft9Imtb9lDwYpwL6hllOIvAUvA5wQ
 ndwRTFOlmJk8HmYSDHXBvJeQesRVtJDnMJo025r2eBp5kZ8mDVCWKFOa2DnCOWifZ3Mzn9zSJ
 stNO9JVkRZ33XusOuHpa8w=
Received-SPF: none client-ip=217.72.192.73; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Apr 2021 12:27:07 -0000

On Tue, Apr 20, 2021 at 1:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 4/19/21 3:42 PM, Peter Maydell wrote:
> >>
> >> I suspect PCI-ISA bridges to provide an EISA bus.
> >
> > I'm not sure what you mean here -- there isn't an ISA bridge
> > or an EISA bus involved here. This is purely about the behaviour
> > of the memory window the PCI host controller exposes to the CPU
> > (and in particular the window for when a PCI device's BAR is
> > set to "IO" rather than "MMIO"), though we change both here.
>
> I guess I always interpreted the IO BAR were here to address ISA
> backward compatibility. I don't know well PCI so I'll study it
> more. Sorry for my confused comment.

It is mostly for compatibility, but there are many layers of it:

- PCI supports actual ISA/EISA/VLB/PCMCIA/LPC/PC104/... style
  devices behind a bridge, using I/O ports at their native address.

- PCI devices themselves can have fixed I/O ports at well-known
  addresses, e.g. VGA or IDE/ATA adapters

- PCI devices can behave like legacy devices using port I/O
  but use PCI resource assignment to pick an arbitrary port
  number outside of the legacy range

- PCIe can support all of the above by virtue of being backwards
  compatible with PCI and allowing PCI buses behind bridges,
  though port I/O is deprecated here and often not supported at all

The first two are very rare these days, but Linux still support them
in order to run on old hardware, and any driver for these that
assumes a hardcoded port number can crash the kernel if the
PCI host bridge causes an asynchronous external abort or
similar.

       Arnd

