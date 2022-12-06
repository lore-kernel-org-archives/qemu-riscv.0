Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2RuE-0004KC-VE
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 01:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2Ru5-0004JW-2t; Tue, 06 Dec 2022 01:58:11 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2Rty-0007HC-QR; Tue, 06 Dec 2022 01:58:05 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id m4so13337753vsc.6;
 Mon, 05 Dec 2022 22:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KFhvCmtT7gE2DKmZYKqCs4608DBrXGp70qTHAwZGXQ8=;
 b=av3F5gzEg6aSjYrQmthL5dK7BQhIVklpGXLjWzMMSrXcQtLz8FVX80LMrUlEEebf5B
 SK90DSQPjn6oOOrTRgNFYpW3fpJjjHClDz6jHMiTJ1SM1bumJ3FzTX+K+AlndvDQpjbq
 4C4arX6HaRCed7aK3PchScvlbVSfCregTfUk+9oVpJKNIUumj2PCJh7vCP2hFUJ/thLR
 +sVO3xT42RCT8imVdE0M4PrWJjbl5Qo26V47BITzAxEa45o0SsiN5ySO2OJo431h17n2
 nbp9K8PMLKnDVp5UwKQp8Np763NhJsH81vBgkokrOxn5vk/XDYwBzmx+AER4d3fG/DuD
 j26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KFhvCmtT7gE2DKmZYKqCs4608DBrXGp70qTHAwZGXQ8=;
 b=m1kHwX02Si7sOBu3yxA14Dgm9Zj6X09M1b6yEFm4jnen6W+fo07UaHVUWQj+7LrAXq
 9nsmS5LrIjAyaIlGQkBoY+1jvdK+oi2oy7PnX8yxiLjJ8VRTwKHmlkHQK79hNcYU89k6
 hmg6TKFcAbnhWdpNrNlHilalFwyuwOwGSKxUjCGdPmkrTb1TQGORm/JH7QJulR+7iIK7
 qlcVRZwxuDiEhswO6Eg70umYXXOPz3oEXhWezRowl5uHSTgL92ipBxtulm7Ey1RpGvwH
 hW7AAMznYmgqIOGz197+ufTlAuf4ndqSjb1gdQXfR1Gwoe+z6qiCnOOFmDfM5Lzwgcy2
 PbXg==
X-Gm-Message-State: ANoB5pkTbz8++yX1oKax6yy7PS3D0o0S8zt1stL4mkVQm3Djy6/FhuxQ
 2ru44YUp0vwIyqQDtoYS5r7EQCF5exEe3VqpAP4=
X-Google-Smtp-Source: AA0mqf6r/Hf9wtYPetJ5J6gXP+zJhvxW2pNeHCpls9x76wMfUna8xSwe4GrvpIQhpSO26kbdM/O5zuUva0bNueik3Os=
X-Received: by 2002:a67:d009:0:b0:3b1:4aad:9c47 with SMTP id
 r9-20020a67d009000000b003b14aad9c47mr2915916vsi.73.1670309878190; Mon, 05 Dec
 2022 22:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20221117225518.4102575-1-conor@kernel.org>
In-Reply-To: <20221117225518.4102575-1-conor@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 6 Dec 2022 16:57:31 +1000
Message-ID: <CAKmqyKPySsh_h4LhmNihDNwZmCmh6yryhp-qnhsCH1BfeAC2Yw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add (more) missing PolarFire SoC io regions
To: Conor Dooley <conor@kernel.org>
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2022 06:58:14 -0000

On Fri, Nov 18, 2022 at 8:57 AM Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey all,
> Apart from DDR (see [1]), these should be the last bits needed to get
> recent Linux kernels booting again for Icicle/PolarFire SoC. Previously,
> I had been disabling the hwrng and PCI but I keep forgetting that is
> required and decided to fix that.
>
> I'm not entirely sure if I have done some sort of no-no thing by
> registering the same interrupt with both the IOSCB and SYSREG regions.
> The interrupt is raised after the system controller handles a service
> via the mailbox. The mailbox's status, control and mailbox registers
> are all part of the IOSCB region. It's cleared by a write to a register
> in the SYSREG region.
> Since my goal here is to add the regions/peripherals without actually
> implementing them so that Linux etc, I'm just raising an interrupt
> once a guest requests a service & reporting a status indicating that the
> service request failed.
>
> Thanks,
> Conor.
>
> 1 - https://lore.kernel.org/all/Y2+dUCpd8OP52%2FDJ@spud/
>
> Changes since v2:
> - fix the actual bits in the register used for the service return
>   status
> - remove a duplicate irq_lower() in the sysreg bits of patch 3
> - move the irq raise to a write function, raising it in the read one was
>   causing the irq to get raised twice by the linux driver that works
>   properly with the actual hardware. oops.
>
> Conor Dooley (3):
>   hw/misc: pfsoc: add fabric clocks to ioscb
>   hw/riscv: pfsoc: add missing FICs as unimplemented
>   hw/{misc,riscv}: pfsoc: add system controller as unimplemented

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/misc/mchp_pfsoc_ioscb.c          |  78 +++++++++++++++++-
>  hw/misc/mchp_pfsoc_sysreg.c         |  18 ++++-
>  hw/riscv/microchip_pfsoc.c          | 121 ++++++++++++++++------------
>  include/hw/misc/mchp_pfsoc_ioscb.h  |   4 +
>  include/hw/misc/mchp_pfsoc_sysreg.h |   1 +
>  include/hw/riscv/microchip_pfsoc.h  |   3 +
>  6 files changed, 167 insertions(+), 58 deletions(-)
>
> --
> 2.37.2
>
>

