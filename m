Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdg54-0006R7-67
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 17:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdg52-0006OK-FR; Thu, 21 Oct 2021 17:58:32 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdg50-0000zP-05; Thu, 21 Oct 2021 17:58:32 -0400
Received: by mail-il1-x12a.google.com with SMTP id x1so2247228ilv.4;
 Thu, 21 Oct 2021 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdbPopKIAz+jDz9hpuMA5PN50exzbWt0Pzu7/RTIP9E=;
 b=lzU2fEJig0YITXA+ILwi8uL5szUkS/JPe4znBHM09rzrgjbAJosYEs1ztWFg/OQ9Gw
 furIAeakOIGk3NhcDmeL2xP3m8PvHWgxRE1SDvMUxrXRwQtIraIYFzv7IAFX2MQUCQ5R
 5Dtt+3TgEcBP7muLrNqXRpKTxAglma9+o4ia9Aq3Xonw3+PPjrG32g1fWBWgFzfpmgDC
 Xd+65R8S+LP3MElIEwFsHBEOIFwVSE5BzHyBY9QTbrkaqIIQLZhnL9sishLDD5OhQ7DF
 hiznZDwYwbbj+n0l6XLebcNFWtcpgi7VmqAOrEVy1avyg8r2qD0Rk2XQpL+KXwoOEvhx
 66/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdbPopKIAz+jDz9hpuMA5PN50exzbWt0Pzu7/RTIP9E=;
 b=e2bzCAePL7mlL0miRdMqV+IzOmHFSxQNdfKoRX8o7kyaXLz/qpLAtGgGZ/IbhJnLZl
 dp04/VNSLkKAEfkvaphbSp1oisiOFaMZ1Ws2DsEifbHoxSJoi9xVsUwms+EMFPl1Psp3
 E9JitPpc3JFR39T2tI8O5fM4Y/wEfHRxqLrvO4adNMRoHo40z+JMEizoSvCGOt+ETsWS
 avmryG5J/vyWU4feEhe8mueNiVF7ByCV+xNpkXuzAWd8Z9xchOsFdysVEeiC13DJ6/ok
 Tnbdpev4RQjjUiadsHhkDMSwcp2JSGYNbpFXcutAFieBNQrE8FAcBBM8Js1zXxK7mCuF
 UqkQ==
X-Gm-Message-State: AOAM5311Cp2NIFOO5b7tDFcnjmJz75Gt8ce3RUH5SAcQNQX2TrtJLZrB
 i17/EMuPlIgb24R/Oo4g2bM+3Y0h5RYgq80L5Q8=
X-Google-Smtp-Source: ABdhPJwHkXmOlhm3Cvqs6MnMjUsiKr6Y8CrQH/jnQIrxv+dunJoCLrarXw7HDof3MG823wXYtAXFFdDHl5gNSbA4/TE=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr5473274ilv.290.1634853507815; 
 Thu, 21 Oct 2021 14:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 07:58:01 +1000
Message-ID: <CAKmqyKMV1SkvyCzi0Lu2UxfO7kJeyG=LY3VvtawpUsEA8YQGjQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/riscv: Use MachineState::ram and
 MachineClass::default_ram_id in all machines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 21:58:32 -0000

On Wed, Oct 20, 2021 at 11:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As of today, all RISC-V machines (except virt) are still using memory_region_init_ram()
> to initilize the sysytem RAM, which can't possibly handle vhost-user, and can't
> work as expected with '-numa node,memdev' options.
>
> Change to use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to opt in to
> memdev scheme.
>
> Changes in v2:
> - split RAM into low and high regions using aliases to machine->ram
> - rename mc->default_ram_id to "microchip.icicle.kit.ram"
> - opentitan: add RAM size check
> - opentitan: assign mc->default_ram_size
> - sifive_e: add RAM size check
> - sifive_e: assign mc->default_ram_size
>
> Bin Meng (6):
>   hw/riscv: microchip_pfsoc: Use MachineState::ram and
>     MachineClass::default_ram_id
>   hw/riscv: opentitan: Use MachineState::ram and
>     MachineClass::default_ram_id
>   hw/riscv: shakti_c: Use MachineState::ram and
>     MachineClass::default_ram_id
>   hw/riscv: sifive_e: Use MachineState::ram and
>     MachineClass::default_ram_id
>   hw/riscv: sifive_u: Use MachineState::ram and
>     MachineClass::default_ram_id
>   hw/riscv: spike: Use MachineState::ram and
>     MachineClass::default_ram_id

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/microchip_pfsoc.c | 36 ++++++++++++++++++++----------------
>  hw/riscv/opentitan.c       | 16 ++++++++++++----
>  hw/riscv/shakti_c.c        |  6 ++----
>  hw/riscv/sifive_e.c        | 16 ++++++++++++----
>  hw/riscv/sifive_u.c        |  6 ++----
>  hw/riscv/spike.c           |  6 ++----
>  6 files changed, 50 insertions(+), 36 deletions(-)
>
> --
> 2.25.1
>
>

