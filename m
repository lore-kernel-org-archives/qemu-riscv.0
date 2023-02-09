Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPujW-0003eI-3u
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 19:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPujU-0003e1-AJ; Wed, 08 Feb 2023 19:24:12 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPujS-0006Ys-R3; Wed, 08 Feb 2023 19:24:12 -0500
Received: by mail-vs1-xe31.google.com with SMTP id g8so463606vso.3;
 Wed, 08 Feb 2023 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=smAv6BxC5HSCMuLcoVpCPWQ6PYBGX6F8Qsvu4jo3WHI=;
 b=cCAiEs5dwV2QLwnwnfXmCATCEkE4eNf+bMKZEjTIvprf36dW+folK9/c4yTbpWkmUR
 Ze1Q3BshfhBRRYfTCV+ptHq6X1ZFkiKjv/tqoXl+VU0o2avEYoHs7Vx0IJjsACKGEcs2
 nEJZf1ZM3XkubHRaZzDKtgolDJb27IW2RXcDM8FTC3FS3dtlOu0UVSmapcDObLJ9uUoh
 OhBNEY+6dOhRTdi/SlNmgA89sBohLEkXcVx0vcajSCCCNazZ/+nC/EiHgLjkDF4jRulN
 A+5CrrydXDUDbkT7Ukfj7cMwrz7F278D6QY91LzpuwizI8qUOm5PvBYkxBOa8X5zsBG6
 wQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=smAv6BxC5HSCMuLcoVpCPWQ6PYBGX6F8Qsvu4jo3WHI=;
 b=lNW/oYQmoeCR2nipm/u7PRtNy9x6RaUUk8H+bjxyYcFAcOEZ/cYSiKumO99IqIZabG
 ct1WNnMiY4Wa67Wrcn8itkEG1fMhGVng05NT9q5x15hy6CzlL9lcxg6ZUuNt0hVpKkWl
 zfbL6xCmo08C7rVOudJY75+IXPGukpDHP9P45rzTj21yb/htNx94QPS2RYWzN8d0Lq7A
 usuyxKvzIwN6sRog2N5z9JngJcvcvX/DSuCU09S95ka/l17QjDPxd+8cGJ3orPY2jmJ4
 dwDqy1cc4DAOSB0cWyWF1J1Jz2Yi8H4frrD0R7RlXFagG1aCWdrsvXAUXZyXI9rXjNk9
 XoWA==
X-Gm-Message-State: AO0yUKUhoqFgOqCVgEM5r9oZL9b6yYUnwfINGE3qdOQHkoJHgI8iANip
 hg6zjovcxYc3kK3KQ0htutrPeY9UYa4R4p/0MA0=
X-Google-Smtp-Source: AK7set+Ar89QrjOGo4vzcl0NGcuiUDw8Q6ZQToJobQ3EsQ03slJADYtnF5Pn+ibrrpdO9rVmX3O3D73wEJfkcCz5OtE=
X-Received: by 2002:a67:c297:0:b0:3fe:5a64:f8ea with SMTP id
 k23-20020a67c297000000b003fe5a64f8eamr1941612vsj.54.1675902249336; Wed, 08
 Feb 2023 16:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-11-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-11-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:23:43 +1000
Message-ID: <CAKmqyKM19dmHsjZuqUKES+b2UyjWPshboF+1b=TayxNPKzHvAA@mail.gmail.com>
Subject: Re: [PATCH 10/10] MAINTAINERS: Add entry for RISC-V ACPI
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 00:24:12 -0000

On Thu, Feb 2, 2023 at 2:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> RISC-V ACPI related functionality for virt machine is added in
> virt-acpi-build.c. Add the maintainer entry.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c581c11a64..23fcaaf54a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -995,6 +995,12 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt-acpi-build.c
>
> +RISC-V ACPI Subsystem
> +M: Sunil V L <sunilvl@ventanamicro.com>
> +L: qemu-riscv@nongnu.org
> +S: Maintained
> +F: hw/riscv/virt-acpi-build.c
> +
>  STM32F100
>  M: Alexandre Iooss <erdnaxe@crans.org>
>  L: qemu-arm@nongnu.org
> --
> 2.38.0
>
>

