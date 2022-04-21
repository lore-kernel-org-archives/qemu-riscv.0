Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhSMK-0003pL-Vo
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 04:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhSMB-0003n5-FH; Thu, 21 Apr 2022 04:40:10 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhSM9-0001JZ-Th; Thu, 21 Apr 2022 04:40:07 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec0bb4b715so44465127b3.5; 
 Thu, 21 Apr 2022 01:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=47Ib1xWX/TCvQeM3XHtReRrKD0dbpdi2DrIQEdhGhD8=;
 b=FRXpN0sh8I8b2bIY7IJ4nkBUzhYsDCOYOzrxiy528qF8PYUgtk8iCCJlOXQzO/Ildi
 27jfxOjYNv8skBi8Aq8nUoE8XDrzFIqLJdwvFZcwaJ7sNLakLNdZ6enB1OanGyLXiU+0
 iqGKMjvOvxMehH/zyw1GMrFLUKa38hZqZzkoVoJ0kJs4WUfMVTWAOLlcvf2dC/Y1IBMI
 fXWMlOKxZ3zoPolkxNSkzj78Freto3JwnfBs1cmRtzk+O5KRv55NFn80Vv7zMYz3IjCE
 1BW3QS80hclW3BZKOL81SjCJmf76K7ZyI2H+/cmVPp6+hXqKe9HbQEUYwHjLF9U/OFdK
 K8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=47Ib1xWX/TCvQeM3XHtReRrKD0dbpdi2DrIQEdhGhD8=;
 b=yXstSoA2TBr7+guW0odk3u3o//wzhGMRkN7c2YndvjijdWPfmJXpLL3H0Q/KECRnrS
 JCTnIYWDCumWVr6SL3rbUgrhCEFDfFzePXZSmlR1wnxoTDeK6ip5oSSYq2+dJPLz+phy
 ewwC/ugCSvrzrGaHQ7R29i1NzyMPWMM2UM0LN69H0rVE3+vS0qf5I3O4Zy4+q0f/4vMD
 mCJG/KDT3hiq1lHokbx9VNvRj3frPlVyphsDXTb//O3DlAawO4q3wr0V7n3d3vB9OAJB
 hrZ49lgY7InP9mVygGGmyhPZDeB25FOfBHup4/zl4VdwRqxnLI9O83bFNVAKRD0Ey/KQ
 OjjQ==
X-Gm-Message-State: AOAM5332y+foZOdB3UIQF3/aN9O0hPMCHe1GvBX5JFFAraO2hn10cexA
 8LJLkAadOKqSr2nwAe9zKaDs4TTNko4UM6Lkd2M=
X-Google-Smtp-Source: ABdhPJxW2So8oXpEHWsDROjyaq9vz/PN71gqU7wYNMEXaq0eZ0nsI7UAymzVYY0lLLDIXZK1oAN8QLAzDSNn1S3uQ8w=
X-Received: by 2002:a0d:f103:0:b0:2eb:488:f0e1 with SMTP id
 a3-20020a0df103000000b002eb0488f0e1mr24824761ywf.487.1650530404018; Thu, 21
 Apr 2022 01:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-3-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-3-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 16:39:53 +0800
Message-ID: <CAEUhbmXjYMXKm3cZzkedro208ny+0wFKjyZE=8mtomfdvkD65w@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/core: Move the ARM sysbus-fdt to core
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 08:40:11 -0000

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The ARM virt machine currently uses sysbus-fdt to create device tree
> entries for dynamically created MMIO devices.
>
> The RISC-V virt machine can also benefit from this, so move the code to
> the core directory.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  include/hw/{arm => core}/sysbus-fdt.h | 0
>  hw/arm/virt.c                         | 2 +-
>  hw/arm/xlnx-versal-virt.c             | 1 -
>  hw/{arm => core}/sysbus-fdt.c         | 2 +-
>  hw/arm/meson.build                    | 1 -
>  hw/core/meson.build                   | 1 +
>  6 files changed, 3 insertions(+), 4 deletions(-)
>  rename include/hw/{arm => core}/sysbus-fdt.h (100%)
>  rename hw/{arm => core}/sysbus-fdt.c (99%)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

I believe you can do some refactor to let hw/ppc/e500.c to use this
platform bus too.

Regards,
Bin

