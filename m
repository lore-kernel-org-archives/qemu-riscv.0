Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOylA-0006wJ-SG
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 05:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyl8-0006vu-Cl; Mon, 06 Feb 2023 05:30:02 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyl5-0002gb-Cs; Mon, 06 Feb 2023 05:30:00 -0500
Received: by mail-ej1-x629.google.com with SMTP id ud5so32808682ejc.4;
 Mon, 06 Feb 2023 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5JDDPtgtM6T/G5jEtaXPEP4DihC9RKy2C7dwLcRkXhg=;
 b=oz0o7sfmTHHV0L9nXPYIWmLxWLSRogWY/PdXwQWBXL8oL1GhFE3kx2eO/dk6QdHaip
 76zKrICzY/IbNZeDKUWAJdOI8H5b4fXKbPQ3brSgKwvAyI40fU5298n42fk4Z2o/BZHs
 WGv3JGqgr3Yserk60aEO83bfYBKVxeFy5yUS+3Eh6l4J0G9TH3RVu6BmKpftSSIYUwkv
 kQJ70lkRQeGnEJ5k+xh5HX4V0lRvuLxaKO+AFnnbwYVYTYng1/Fjv33BNSnNeK7H9t4z
 7P5rUdp0REiLTR2yNtLPmeN8S2QDW27HjUOyOYP94lsSaPTEUNPiVcmaTe/okkwyNq6d
 ZaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5JDDPtgtM6T/G5jEtaXPEP4DihC9RKy2C7dwLcRkXhg=;
 b=tXALB65alo2Al3j2TphqM0ewHuwCPCbGTEws1tKzY0fCwlalnfqw+3ulGODMXgZZxx
 aBQk/Its1km3053RVZy7Spl9O2QRFCcN7FOSgrhHBLG7Az7/Ouf06on+zzbORvaX4dW5
 aF2qWu912KfvIQfwOspw4MR8GR66oAmruYWKsQYfp3eoa32k9OOLcBlthoX/H1+u8jaZ
 N6qkuul0XKY8GGLiwDnn334HJLHDlmGTzsL9ia7GLBvyjqDCp7Fck6SkYyxSEotVJDZJ
 F7aMvk4vQPquS9N4zYWhjmbgh3iFC+r9ExQGzehm4bNJEA3u5R+mPyql1XZ0Mm4V9GRz
 804Q==
X-Gm-Message-State: AO0yUKXncChFQJUPy6eC1AK2OydeLfB+TwMDElEXt9l8AtqYopdLl4t/
 blqldq+2h4kjsrPDML5kaFl8m3r1o/m3xvNnmP4iJ7zbLZA=
X-Google-Smtp-Source: AK7set/V+U7Zxx+kElB/BfQz+KGHumxSmAEtqGeiRbDMm4Jaqcle/NAzGDExpNLnB1ZBFSgjm+UHXokhcfVJpk93lqA=
X-Received: by 2002:a17:906:8395:b0:888:f761:87aa with SMTP id
 p21-20020a170906839500b00888f76187aamr6190246ejx.163.1675679397554; Mon, 06
 Feb 2023 02:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-9-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-9-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 18:29:46 +0800
Message-ID: <CAEUhbmUGF3DR_XOB1fb6HbLUYM43RMHo92dewo=_94D2mFkcpA@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/riscv/Kconfig: virt: Enable ACPI config options
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 06 Feb 2023 10:30:02 -0000

On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> Enable ACPI related config options to build ACPI subsystem
> for virt machine.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 4550b3b938..92b1a9eb64 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -44,6 +44,9 @@ config RISCV_VIRT
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
>      select PLATFORM_BUS
> +    select ACPI
> +    select ACPI_HW_REDUCED

I don't see APIs in ACPI_HW_REDUCED get called by RISC-V virt codes.

> +    select ACPI_PCI

Regards,
Bin

