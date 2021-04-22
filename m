Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZN6l-0006kL-Ux
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 20:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZN6f-0006jA-W7; Wed, 21 Apr 2021 20:22:13 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:41669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZN6a-0005r1-G0; Wed, 21 Apr 2021 20:22:09 -0400
Received: by mail-il1-x131.google.com with SMTP id v13so20345406ilj.8;
 Wed, 21 Apr 2021 17:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HM7WLCi5EWgFMW4fQDix+UqNVw4ZSRzXwA8sa5W0WOM=;
 b=aNdYvyzXbTZLccRmjaeE00DOoqG81VNzv6wgSU+raEXwC5f2KKTuuA/2q/KAw3TI3q
 VMe7K+T9ytvegv2LOp3MV042FfKhgIDLwmEsQ8sVFp39z8ZSZlbIkF46IbDoll2KQ3w1
 Vzrl+3fvlGQaf8wTBPGTLc5F9bHu8B7vrt3auKUbSGUAkK4FWYFi828p92NucZvKahN8
 OtQorq1xB3xr06nuReVDYv+6orILkQa4VhoUklL2PfHWc7xx6d+iqo6VgdwDee9kPRAJ
 naHMKfiHWnIporMcZS8itiP9/yT5a0YvlnySDHce2ycH3/hwoghLHuHpvWhiKJK3exl0
 pvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HM7WLCi5EWgFMW4fQDix+UqNVw4ZSRzXwA8sa5W0WOM=;
 b=eOU1hDpMQwJ2C4kKie2Elx/zL3Jy5ruAMhWu/hM2aAjVK1cUO7ydN04paILUdmZ0wG
 wBn0ws9zDetRu64yg3DoKLUuKRRkBh+c411rjtlrkzWqlccvKPiH/Ti3BWOVAae6e5ql
 Ovxz+4+u5QqHGWOy4RhxAJrnOwoZ4xYRRTVqe3yOjhCQQlWR0kaLKu+MTY4RMTsDDPw1
 EvdD/9K3Pd8XB/iWfgfqJMkhHOHTWaeREvhl5n5QZQJX/G/BpI/UsRbGbiz/Butvo6uw
 mZsW3vB8U/y80zW8rKSGCw8lzrxzfe2kjzn+DOnAhptMwSeN9qBvYQ1VyQ5R3GNBsne/
 R4SA==
X-Gm-Message-State: AOAM5325D2Sr2DXZrNLka+C5kM4kMwgWa02vn4bJtwnUhtbRcGwnjw+x
 cKNdM9BGNQ0s8SWbuBIK7Ug8Y+HxDUGRvmJWsvI=
X-Google-Smtp-Source: ABdhPJxfVJMb+EKjDcLBnHTMggFOqPKwSBA60VZGRP8GdEyHjphFI4el2ntG1Bdj1gbsgb+OYK5TFw9HPpqxVcLD5sk=
X-Received: by 2002:a05:6e02:671:: with SMTP id
 l17mr495928ilt.267.1619050922699; 
 Wed, 21 Apr 2021 17:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <CAKmqyKPtV0PFdEfO0B5YFGC2i21OAmvBsY0ovUVdQwn3ttpcQA@mail.gmail.com>
 <beb2e320-60fb-db42-e4d6-3b4d5cb82a95@c-sky.com>
 <CAKmqyKN2JNRygh5aScLwQZYgmQF7-bpj=aCq=gx2TxxLpCgCrQ@mail.gmail.com>
 <89137bb9-4312-ac27-5c63-c0bab0f4c139@c-sky.com>
In-Reply-To: <89137bb9-4312-ac27-5c63-c0bab0f4c139@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Apr 2021 10:21:36 +1000
Message-ID: <CAKmqyKNEEBv4AQAhb-vNxz-DoEp3K3M+eJ2dbsbU_zjkECh=4Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] RISC-V: support clic v0.9 specification
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: michaeljclark@mac.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Apr 2021 00:22:14 -0000

On Tue, Apr 20, 2021 at 5:20 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/4/20 =E4=B8=8B=E5=8D=882:26, Alistair Francis wrote:
> > On Tue, Apr 20, 2021 at 11:45 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrot=
e:
> >>
> >> On 2021/4/20 =E4=B8=8A=E5=8D=887:30, Alistair Francis wrote:
> >>> On Fri, Apr 9, 2021 at 5:56 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrot=
e:
> >>>> This patch set gives an implementation of "RISC-V Core-Local Interru=
pt
> >>>> Controller(CLIC) Version 0.9-draft-20210217". It comes from [1], whe=
re
> >>>> you can find the pdf format or the source code.
> >>>>
> >>>> I take over the job from Michael Clark, who gave the first implement=
ation
> >>>> of clic-v0.7 specification. If there is any copyright question, plea=
se
> >>>> let me know.
> >>> You need to make sure you leave all original copyright notices and So=
B in place.
> >> OK.
> >>
> >> Is it OK that keep the original copyright notices for new files and
> >> your SoB in every patch,  Michael?
> >>
> >>>> Features:
> >>>> 1. support four kinds of trigger types.
> >>>> 2. Preserve the CSR WARL/WPRI semantics.
> >>>> 3. Option to select different modes, such as M/S/U or M/U.
> >>>> 4. At most 4096 interrupts.
> >>>> 5. At most 1024 apertures.
> >>>>
> >>>> Todo:
> >>>> 1. Encode the interrupt trigger information to exccode.
> >>>> 2. Support complete CSR mclicbase when its number is fixed.
> >>>> 3. Gave each aperture an independend address.
> >>>>
> >>>> It have passed my qtest case and freertos test. Welcome to have a tr=
y
> >>>> for your hardware.
> >>> It doesn't seem to be connected to any machine. How are you testing t=
his?
> >> There is a machine called SMARTL in my repository[1].  The qtest case
> >> is  tests/qtest/test-riscv32-clic.c. If it's better, I can upstream th=
e
> >> machine together next version.
> > I don't really want to add a new hardware device when it isn't
> > connected to a machine. It would be great if we could connect it to a
> > machine. If not SMARTL maybe we could add it as an option to the virt
> > machine?
> Currently it is good to  connect CLIC to virt machine.  I can fix it in
> the next version if it is OK for you.

The CLIC seems to be gaining traction so I think it makes sense to
start to think about connecting it up.

We don't want to break backwards compatibility though so make sure
it's an option, for example -machine virt,clic=3Dtrue

> > What is SMARTL? Is that a publically available board?
>
> SMARTL is a fpga evaluation board.  We usually use it  to debug programs
> for XuanTie CPU serials.
> It has a 32bit CPU, 1 UART,  4 timers, and the CLIC interrupt
> controller. I will give  a detailed documentation
> when I upstream it.
>
> There are still many other  RISC-V boards, but more complex. I plan to
> upstream the XuanTie CPU
> and  some widely used boards after the P extension and CLIC.

I would prefer to add boards that are publicly available, so if there
are some that would be great!

Alistair

>
> Zhiwei
>
> >
> > Alistair
> >
> >> Zhiwei
> >>
> >> [1]https://github.com/romanheros/qemu, branch: riscv-clic-upstream-rfc
> >>
> >>
> >>> Alistair
> >>>
> >>>> Any advice is welcomed. Thanks very much.
> >>>>
> >>>> Zhiwei
> >>>>
> >>>> [1] specification website: https://github.com/riscv/riscv-fast-inter=
rupt.
> >>>> [2] Michael Clark origin work: https://github.com/sifive/riscv-qemu/=
tree/sifive-clic.
> >>>>
> >>>>
> >>>> LIU Zhiwei (11):
> >>>>     target/riscv: Add CLIC CSR mintstatus
> >>>>     target/riscv: Update CSR xintthresh in CLIC mode
> >>>>     hw/intc: Add CLIC device
> >>>>     target/riscv: Update CSR xie in CLIC mode
> >>>>     target/riscv: Update CSR xip in CLIC mode
> >>>>     target/riscv: Update CSR xtvec in CLIC mode
> >>>>     target/riscv: Update CSR xtvt in CLIC mode
> >>>>     target/riscv: Update CSR xnxti in CLIC mode
> >>>>     target/riscv: Update CSR mclicbase in CLIC mode
> >>>>     target/riscv: Update interrupt handling in CLIC mode
> >>>>     target/riscv: Update interrupt return in CLIC mode
> >>>>
> >>>>    default-configs/devices/riscv32-softmmu.mak |   1 +
> >>>>    default-configs/devices/riscv64-softmmu.mak |   1 +
> >>>>    hw/intc/Kconfig                             |   3 +
> >>>>    hw/intc/meson.build                         |   1 +
> >>>>    hw/intc/riscv_clic.c                        | 836 +++++++++++++++=
+++++
> >>>>    include/hw/intc/riscv_clic.h                | 103 +++
> >>>>    target/riscv/cpu.h                          |   9 +
> >>>>    target/riscv/cpu_bits.h                     |  32 +
> >>>>    target/riscv/cpu_helper.c                   | 117 ++-
> >>>>    target/riscv/csr.c                          | 247 +++++-
> >>>>    target/riscv/op_helper.c                    |  25 +
> >>>>    11 files changed, 1363 insertions(+), 12 deletions(-)
> >>>>    create mode 100644 hw/intc/riscv_clic.c
> >>>>    create mode 100644 include/hw/intc/riscv_clic.h
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>>

