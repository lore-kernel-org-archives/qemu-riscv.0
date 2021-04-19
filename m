Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYdMY-0004Lz-8F
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 19:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYdMW-0004Lo-La; Mon, 19 Apr 2021 19:31:29 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYdMT-0003QJ-0l; Mon, 19 Apr 2021 19:31:28 -0400
Received: by mail-io1-xd29.google.com with SMTP id q25so5290405iog.5;
 Mon, 19 Apr 2021 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trUsWNj+gyGIQUC8VvMvlz7Pbmnt0Gqedmh1I8HUnFU=;
 b=We5MKJC660IK2ai+Qz3mijUS3tv1vYIncS/OCS8zq9FqaxxtS5tjJ4S7kpO7CfsPGG
 qB6JgI+WOmnnFybYNrdnxduEYiDqgBQsNEnlSk1/ab4WhiuwNRETmWnV+XR0p3QkLvf9
 7IJwjLtXWmRp25AC0MzC2wK0dN92clf008T4dhJVszd4wbMR/uZhcMLCmP/0s5MGceR6
 RBeXujY7hMWGQbB45UKGDK5NOyx6OnEZSGeAE+CfSUkZBdNCfKYUHRW4j9Fb2ZIR0Cct
 VPIJLh6096TQ13D5HVnHIysdgEECq+k/kADEuWVdTYzyKhwV8TOa3P4ndzwm509UQzWv
 b3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trUsWNj+gyGIQUC8VvMvlz7Pbmnt0Gqedmh1I8HUnFU=;
 b=PfiYhUT7y47KqBeMBeYxE9R3ArFVw597u2YLhm5YpwA2oulmfK15Oy3DQe4oOTmNKq
 Zgiwqi/xBcqeegZT9C1bxVgGjO/ft7IQ0bVB55emmlWRMz/AvMmhP/LHsnTy7O8cZ4F5
 tPD0G+Rs4GuTNifUjQC8sJ661W8wy4R7RQrxjKVGLITvsgY8n5RGLsC2lNFQoFortzfn
 6RTmmgflCXqB7okd4jORpLrA6Yr9CX+rkuk1GzHzTmh0WikcYUaK8UAXa9uKeeWGpcgk
 pEesB/DdGU7TY1h95zBDmPkgkBFzIAFu9JmHXfNC5LwiX2bRTgvTEnT9/1Aj7tj1j6OZ
 Dtjg==
X-Gm-Message-State: AOAM532SDAoXsF8BSp9PKYuCWhtZU1H5LSgAj/5eP2VWnkZJ9vDcxn7+
 /Coc/Bp5jdDW29KH2qUKZ7Q5+l7+a/yZ8CWTdgY=
X-Google-Smtp-Source: ABdhPJzxXIYITlKM/P6SPf/O8ivH8uhEkTSVFwJPH9kQT4HxQiLX9nZgje9ATBtOOt9hB0Xy64H9tEMCQsl9s4s1i3A=
X-Received: by 2002:a05:6638:41:: with SMTP id a1mr18995402jap.8.1618875083315; 
 Mon, 19 Apr 2021 16:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 09:30:56 +1000
Message-ID: <CAKmqyKPtV0PFdEfO0B5YFGC2i21OAmvBsY0ovUVdQwn3ttpcQA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] RISC-V: support clic v0.9 specification
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Mon, 19 Apr 2021 23:31:29 -0000

On Fri, Apr 9, 2021 at 5:56 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> This patch set gives an implementation of "RISC-V Core-Local Interrupt
> Controller(CLIC) Version 0.9-draft-20210217". It comes from [1], where
> you can find the pdf format or the source code.
>
> I take over the job from Michael Clark, who gave the first implementation
> of clic-v0.7 specification. If there is any copyright question, please
> let me know.

You need to make sure you leave all original copyright notices and SoB in place.

>
> Features:
> 1. support four kinds of trigger types.
> 2. Preserve the CSR WARL/WPRI semantics.
> 3. Option to select different modes, such as M/S/U or M/U.
> 4. At most 4096 interrupts.
> 5. At most 1024 apertures.
>
> Todo:
> 1. Encode the interrupt trigger information to exccode.
> 2. Support complete CSR mclicbase when its number is fixed.
> 3. Gave each aperture an independend address.
>
> It have passed my qtest case and freertos test. Welcome to have a try
> for your hardware.

It doesn't seem to be connected to any machine. How are you testing this?

Alistair

>
> Any advice is welcomed. Thanks very much.
>
> Zhiwei
>
> [1] specification website: https://github.com/riscv/riscv-fast-interrupt.
> [2] Michael Clark origin work: https://github.com/sifive/riscv-qemu/tree/sifive-clic.
>
>
> LIU Zhiwei (11):
>   target/riscv: Add CLIC CSR mintstatus
>   target/riscv: Update CSR xintthresh in CLIC mode
>   hw/intc: Add CLIC device
>   target/riscv: Update CSR xie in CLIC mode
>   target/riscv: Update CSR xip in CLIC mode
>   target/riscv: Update CSR xtvec in CLIC mode
>   target/riscv: Update CSR xtvt in CLIC mode
>   target/riscv: Update CSR xnxti in CLIC mode
>   target/riscv: Update CSR mclicbase in CLIC mode
>   target/riscv: Update interrupt handling in CLIC mode
>   target/riscv: Update interrupt return in CLIC mode
>
>  default-configs/devices/riscv32-softmmu.mak |   1 +
>  default-configs/devices/riscv64-softmmu.mak |   1 +
>  hw/intc/Kconfig                             |   3 +
>  hw/intc/meson.build                         |   1 +
>  hw/intc/riscv_clic.c                        | 836 ++++++++++++++++++++
>  include/hw/intc/riscv_clic.h                | 103 +++
>  target/riscv/cpu.h                          |   9 +
>  target/riscv/cpu_bits.h                     |  32 +
>  target/riscv/cpu_helper.c                   | 117 ++-
>  target/riscv/csr.c                          | 247 +++++-
>  target/riscv/op_helper.c                    |  25 +
>  11 files changed, 1363 insertions(+), 12 deletions(-)
>  create mode 100644 hw/intc/riscv_clic.c
>  create mode 100644 include/hw/intc/riscv_clic.h
>
> --
> 2.25.1
>
>

