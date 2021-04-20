Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYjqp-0005rE-Kk
	for mharc-qemu-riscv@gnu.org; Tue, 20 Apr 2021 02:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYjqm-0005qx-UV; Tue, 20 Apr 2021 02:27:09 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYjqj-0008Tq-SY; Tue, 20 Apr 2021 02:27:08 -0400
Received: by mail-il1-x12b.google.com with SMTP id j12so17270684ils.4;
 Mon, 19 Apr 2021 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rhP9r90/gQEc/nvGZ3taOiYT974pv63qDQj4cfC2s/U=;
 b=sskJg7TddiCrl3s8ngWWRr1s2gFtZcMBsQe8di6pfRPm1D+qWEMabGc1TPsdNpB5ma
 OgVizwnwM9htws9UpIZcCbY17b1N2ln6gi+YBzK+mii68E68bwJzlIWqfRPzgPmsQPJS
 GDyjT4+p1QPdnaUC6jwRA6UxKsgDQZRF02aiRwrrKO+avQM9XrYxPzpvuWsHbQ911xV2
 S92Ng7xk24u3rDYuiydzZTNLyvTXgk6vSA4xGHpWvKw9bho8Krn7lxn4DthrtAQPxO2B
 uqWUu7AvonKgTABApdk0mJxhN6GZSVIpgyJUoOIHRFOknV5UTmeI0TJE8G6jIy7YjK40
 SjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rhP9r90/gQEc/nvGZ3taOiYT974pv63qDQj4cfC2s/U=;
 b=Ty+NCyI47OlFAUVaGb404Mzfo1aVNMFFcbD4OX0RxZ/XkAkvePuLp6NMfMCp28wi+D
 iivmDIglYB8JGl21NrrWSadNo0c3tLpZFIPwr0+v9ErZ2Ex+sOXsZFH2Sh7qxkFujCe1
 njl6JHrp+1KgF8pkaZPDcCvw+28WoekzTKgGtGbgy1FZyA/rM3NMQvdpVM2b4H51hMg1
 qhGu/P+S21CQE1TwHDyV+n9+n3k5NuWpV/SAmYFAS4rKwg40zFFCjySi2fJSJwFO4jhp
 andn6WkOWg3Pp/KN2IpiyZeZSJF4IPi67zvRWK5TBR6+xbrWEHyyUWBEO0Rr/Fb0m7Wv
 9kJQ==
X-Gm-Message-State: AOAM532rixBpPuhYNiRtgHADp85dcq73fTaxhd/U7fSg93Qo5md5PAWI
 jO14XQq+BF2+0zb5752o/OhO1waoUnauhWL18AA=
X-Google-Smtp-Source: ABdhPJyA1BdPvTocfwoTxiQ8DG3NIeUFMGaMkXnLaHykUqRub0nN6uuyoZB8ZqlLsx0/JXeSy/TCHmn3Dn4AXZOzcg0=
X-Received: by 2002:a92:d68a:: with SMTP id p10mr20500547iln.40.1618900023752; 
 Mon, 19 Apr 2021 23:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <CAKmqyKPtV0PFdEfO0B5YFGC2i21OAmvBsY0ovUVdQwn3ttpcQA@mail.gmail.com>
 <beb2e320-60fb-db42-e4d6-3b4d5cb82a95@c-sky.com>
In-Reply-To: <beb2e320-60fb-db42-e4d6-3b4d5cb82a95@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 16:26:37 +1000
Message-ID: <CAKmqyKN2JNRygh5aScLwQZYgmQF7-bpj=aCq=gx2TxxLpCgCrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] RISC-V: support clic v0.9 specification
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: michaeljclark@mac.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Tue, 20 Apr 2021 06:27:10 -0000

On Tue, Apr 20, 2021 at 11:45 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/4/20 =E4=B8=8A=E5=8D=887:30, Alistair Francis wrote:
> > On Fri, Apr 9, 2021 at 5:56 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >> This patch set gives an implementation of "RISC-V Core-Local Interrupt
> >> Controller(CLIC) Version 0.9-draft-20210217". It comes from [1], where
> >> you can find the pdf format or the source code.
> >>
> >> I take over the job from Michael Clark, who gave the first implementat=
ion
> >> of clic-v0.7 specification. If there is any copyright question, please
> >> let me know.
> > You need to make sure you leave all original copyright notices and SoB =
in place.
>
> OK.
>
> Is it OK that keep the original copyright notices for new files and
> your SoB in every patch,  Michael?
>
> >
> >> Features:
> >> 1. support four kinds of trigger types.
> >> 2. Preserve the CSR WARL/WPRI semantics.
> >> 3. Option to select different modes, such as M/S/U or M/U.
> >> 4. At most 4096 interrupts.
> >> 5. At most 1024 apertures.
> >>
> >> Todo:
> >> 1. Encode the interrupt trigger information to exccode.
> >> 2. Support complete CSR mclicbase when its number is fixed.
> >> 3. Gave each aperture an independend address.
> >>
> >> It have passed my qtest case and freertos test. Welcome to have a try
> >> for your hardware.
> > It doesn't seem to be connected to any machine. How are you testing thi=
s?
>
> There is a machine called SMARTL in my repository[1].  The qtest case
> is  tests/qtest/test-riscv32-clic.c. If it's better, I can upstream the
> machine together next version.

I don't really want to add a new hardware device when it isn't
connected to a machine. It would be great if we could connect it to a
machine. If not SMARTL maybe we could add it as an option to the virt
machine?

What is SMARTL? Is that a publically available board?

Alistair

>
> Zhiwei
>
> [1]https://github.com/romanheros/qemu, branch: riscv-clic-upstream-rfc
>
>
> >
> > Alistair
> >
> >> Any advice is welcomed. Thanks very much.
> >>
> >> Zhiwei
> >>
> >> [1] specification website: https://github.com/riscv/riscv-fast-interru=
pt.
> >> [2] Michael Clark origin work: https://github.com/sifive/riscv-qemu/tr=
ee/sifive-clic.
> >>
> >>
> >> LIU Zhiwei (11):
> >>    target/riscv: Add CLIC CSR mintstatus
> >>    target/riscv: Update CSR xintthresh in CLIC mode
> >>    hw/intc: Add CLIC device
> >>    target/riscv: Update CSR xie in CLIC mode
> >>    target/riscv: Update CSR xip in CLIC mode
> >>    target/riscv: Update CSR xtvec in CLIC mode
> >>    target/riscv: Update CSR xtvt in CLIC mode
> >>    target/riscv: Update CSR xnxti in CLIC mode
> >>    target/riscv: Update CSR mclicbase in CLIC mode
> >>    target/riscv: Update interrupt handling in CLIC mode
> >>    target/riscv: Update interrupt return in CLIC mode
> >>
> >>   default-configs/devices/riscv32-softmmu.mak |   1 +
> >>   default-configs/devices/riscv64-softmmu.mak |   1 +
> >>   hw/intc/Kconfig                             |   3 +
> >>   hw/intc/meson.build                         |   1 +
> >>   hw/intc/riscv_clic.c                        | 836 ++++++++++++++++++=
++
> >>   include/hw/intc/riscv_clic.h                | 103 +++
> >>   target/riscv/cpu.h                          |   9 +
> >>   target/riscv/cpu_bits.h                     |  32 +
> >>   target/riscv/cpu_helper.c                   | 117 ++-
> >>   target/riscv/csr.c                          | 247 +++++-
> >>   target/riscv/op_helper.c                    |  25 +
> >>   11 files changed, 1363 insertions(+), 12 deletions(-)
> >>   create mode 100644 hw/intc/riscv_clic.c
> >>   create mode 100644 include/hw/intc/riscv_clic.h
> >>
> >> --
> >> 2.25.1
> >>
> >>

