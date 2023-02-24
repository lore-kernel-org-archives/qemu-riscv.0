Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVVL1-0003Cg-Fd
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 05:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVVKx-0003AO-CU
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 05:29:59 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVVKu-0000Vh-IY
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 05:29:59 -0500
Received: by mail-wr1-x434.google.com with SMTP id l1so13124334wry.10
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 02:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vKgQc0/EZAT1XYIagdNmajXSgAxQKth+AtuqcB6U/o4=;
 b=W96250amGqkXSG9GdYonwNCHvo6Sqg+C5pI3lUOEkJihysNBDPxOpEjgwkWfptd3y+
 ob9+TQv77pdDkDUAhA9DztjCwQXfYtbVtEAASNO/+bZmIDpKyDmBVl2Jm52YxR86wxye
 KSvxwtlcKJKuU9QgGpNu92eRgvn/bwItFkGzQGLPtQcwKfEPbstMkMIOxXrEnoiYDLIq
 TZKc3xiyx0Pv6TDnPy6NJekgmdUwq+GRza8k7XwRFwN8XbN+XWq5+g8OI5XVSKGIBgsC
 vK9ms8Q5bafXHEdLztl4Aa6LJ97Y+OXRtcZRAy7v+CMKIloX6yPgdu3ZDfoUzAdoZDDW
 UkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKgQc0/EZAT1XYIagdNmajXSgAxQKth+AtuqcB6U/o4=;
 b=sgNuMaP9/ZItWt57oAZrfK276lffR+ZkYK31hky+7r5hjK8htPWSGyT2u53CCdjL7T
 CzmV7nClSDPE1eQvB5nF22x2QWgu6Ib1mttjB0dHlM3guiz/V1ivk/BJHZiqhNsMOREY
 dVbQZUe+jojXOdQRgLxke/yG4aeZcs4I+DqM9OHzw7kPV6/Nbpp9nZT5LwIVJiptT9ZK
 jqe0klrdZ8qbOP8lgqCWAjPqghA4VE7aw1A0WEkViZew+Szjqjyhhya4bDxPoXfdLVe3
 DRKRSEc3kVs6RWpkmTE3gPBEABJga15Q5jBLpT3iPuCCkG4c2x8kUIJtjgWd1eP6qiAV
 WF2w==
X-Gm-Message-State: AO0yUKWLlIAtPH/TC3xW8kfQi5kC0A/sk2Kj+UWjiRpIAj1lKe2h15T5
 r4HxplUMhY6cNJbWb4fB9w5MSw==
X-Google-Smtp-Source: AK7set+KmOWTLlQ0oNvpIJmvXFayH6T5HUDtJLDHJPnJDEXxO233eLTF8X25uo2yp9wiRhFM/HW2Gw==
X-Received: by 2002:a5d:67cc:0:b0:2c5:6016:496 with SMTP id
 n12-20020a5d67cc000000b002c560160496mr13534855wrw.27.1677234593178; 
 Fri, 24 Feb 2023 02:29:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003e896d953a8sm2336462wmj.17.2023.02.24.02.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 02:29:52 -0800 (PST)
Date: Fri, 24 Feb 2023 11:29:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V4 8/8] MAINTAINERS: Add entry for RISC-V ACPI
Message-ID: <20230224102951.dxb6kzw42lkhbibh@orel>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224083701.2657063-9-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 10:30:00 -0000

On Fri, Feb 24, 2023 at 02:07:01PM +0530, Sunil V L wrote:
> RISC-V ACPI related functionality for virt machine is added in
> virt-acpi-build.c. Add the maintainer entry after moving the
> ARM ACPI entry under the main ACPI entry.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  MAINTAINERS | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9adb628627..7a47c2c724 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -994,12 +994,6 @@ S: Maintained
>  F: hw/ssi/xlnx-versal-ospi.c
>  F: include/hw/ssi/xlnx-versal-ospi.h
>  
> -ARM ACPI Subsystem
> -M: Shannon Zhao <shannon.zhaosl@gmail.com>
> -L: qemu-arm@nongnu.org
> -S: Maintained
> -F: hw/arm/virt-acpi-build.c
> -
>  STM32F100
>  M: Alexandre Iooss <erdnaxe@crans.org>
>  L: qemu-arm@nongnu.org
> @@ -1907,6 +1901,18 @@ F: hw/acpi/ghes.c
>  F: include/hw/acpi/ghes.h
>  F: docs/specs/acpi_hest_ghes.rst
>  
> +ARM ACPI Subsystem
> +M: Shannon Zhao <shannon.zhaosl@gmail.com>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/virt-acpi-build.c
> +
> +RISC-V ACPI Subsystem
> +M: Sunil V L <sunilvl@ventanamicro.com>
> +L: qemu-riscv@nongnu.org
> +S: Maintained
> +F: hw/riscv/virt-acpi-build.c
> +
>  ppc4xx
>  L: qemu-ppc@nongnu.org
>  S: Orphan
> -- 
> 2.34.1
>

I probably would have put these sections directly under the main ACPI
section, "ACPI/SMBIOS", as these are "main" arch-specific sections,
but I wouldn't respin the series for that.

Maybe whichever maintainer picks up the patches can put the sections in
their preferred location.

Thanks,
drew

