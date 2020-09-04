Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kEFu8-0003Lx-Gf
	for mharc-qemu-riscv@gnu.org; Fri, 04 Sep 2020 13:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFu6-0003IK-HM; Fri, 04 Sep 2020 13:53:38 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:38481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFu4-0008UP-TI; Fri, 04 Sep 2020 13:53:38 -0400
Received: by mail-qk1-x743.google.com with SMTP id d20so7129422qka.5;
 Fri, 04 Sep 2020 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wBrp3TnUSMyLp9o5msShmUSefqGRodLAR/NbpDDlF7Q=;
 b=VUe3dYOQensytIuDt0aCPB2PZTGFb4GaJjGXXibq9ZOCpfEOs58BTYI91QUJgoJJlp
 AGDoPUWOHJIX28uVis9hf8UJDZYk4slKtFzJZhjohlFyxYz+GDHjOBFQpaTmpgDd6vKb
 0x8iv/IIVSFz04ycEefyCbNsjBeJHfFKmIKmh9tfv4DVD0jt3edk+WK/8dzubJ35rEoY
 qrdlY8EdzDzv8PF172dplN/Sb1W0M2ik7J/Ojz+LlY3gV4pcTq8S8PIPxzx60tqSloWN
 Nq/3YLuj0t+BP+CStr/QMXbpNBv6gpyhHnLdD4bS54kqIFOJ3JVMZX8r/OzV3aj4BRtE
 7Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBrp3TnUSMyLp9o5msShmUSefqGRodLAR/NbpDDlF7Q=;
 b=SoHH7cYVWtFgL0gm58OsIVFyKfB/Q3JIaRDZgk3myQEubx+Fy9k29Jc9hD0bkIKmA9
 Kf3bffiLigaoDSPl8GrsFfWXNZm+uWaQT+AHCI0FBXibRzKSkNpjt9SUkpTNW3jTdomI
 UY4ZB+hyoMWOWWW/39vsLx4VixCkSDc7b4trg+v/VFkTeQb1iWlXtkdQxZmvyaz9nXlG
 faIonT5Lsa9JcGLJ8IxHdnU0VztTzCwYeMoA72QrIUxbsi03sTAifDhfrPPrWIelhFxb
 nGYy/1b02pd3AnAJnePDOd4Sg4ZBNPn0yP4Lgh7pjq3x5LMAae6AoLQMIjb5mtvsfTqg
 IM0g==
X-Gm-Message-State: AOAM533I+gm2RLhj5rWMTD7pwJ4IMYxBGFv6iz1QuEluuE3R9WVlWV1B
 NBqZUMi/kdVBC+kq5iyJSXIwam1/Ljy5df9DpNw=
X-Google-Smtp-Source: ABdhPJy3+/ZUv+eRxqdpCZIJnc6ogidl2EJZrt+87ohc9RvTFWLMYDRfSJrvhUyD5vTxbfdsJpxB04rXYrudGV93NGE=
X-Received: by 2002:a37:a5ca:: with SMTP id o193mr9064865qke.126.1599242015740; 
 Fri, 04 Sep 2020 10:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
 <1599129623-68957-12-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1599129623-68957-12-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Sep 2020 10:42:40 -0700
Message-ID: <CAKmqyKOQfB8c5xhCpuNC_8oVjuEsdg55qXDuNA+gcEpPodpXTw@mail.gmail.com>
Subject: Re: [PATCH 11/12] hw/riscv: Drop CONFIG_SIFIVE
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x743.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 04 Sep 2020 17:53:38 -0000

On Thu, Sep 3, 2020 at 3:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The name SIFIVE is too vague to convey the required component of
> MSI_NONBROKEN. Let's drop the option, and select MSI_NONBROKEN in
> each machine instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/Kconfig | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 7d017bc..e152fdc 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -1,13 +1,9 @@
>  config IBEX
>      bool
>
> -config SIFIVE
> -    bool
> -    select MSI_NONBROKEN
> -
>  config SIFIVE_E
>      bool
> -    select SIFIVE
> +    select MSI_NONBROKEN
>      select SIFIVE_CLINT
>      select SIFIVE_GPIO
>      select SIFIVE_PLIC
> @@ -18,7 +14,7 @@ config SIFIVE_E
>  config SIFIVE_U
>      bool
>      select CADENCE
> -    select SIFIVE
> +    select MSI_NONBROKEN
>      select SIFIVE_CLINT
>      select SIFIVE_GPIO
>      select SIFIVE_PDMA
> @@ -31,7 +27,7 @@ config SIFIVE_U
>  config SPIKE
>      bool
>      select HTIF
> -    select SIFIVE
> +    select MSI_NONBROKEN
>      select SIFIVE_CLINT
>      select SIFIVE_PLIC
>
> @@ -44,20 +40,20 @@ config RISCV_VIRT
>      bool
>      imply PCI_DEVICES
>      imply TEST_DEVICES
> +    select MSI_NONBROKEN
>      select PCI
>      select SERIAL
>      select GOLDFISH_RTC
>      select VIRTIO_MMIO
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select PFLASH_CFI01
> -    select SIFIVE
>      select SIFIVE_CLINT
>      select SIFIVE_PLIC
>      select SIFIVE_TEST
>
>  config MICROCHIP_PFSOC
>      bool
> -    select SIFIVE
> +    select MSI_NONBROKEN
>      select SIFIVE_CLINT
>      select UNIMP
>      select MCHP_PFSOC_MMUART
> --
> 2.7.4
>
>

