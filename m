Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSHq8-00050U-Fq
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHq5-0004hS-UI
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:28:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHq4-0001oA-2k
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:28:49 -0500
Received: by mail-wr1-x432.google.com with SMTP id k3so11518304wrv.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RgjdNrGN20/tF99YpbNi+PvCmEt0lTWDvcRUmNlZGYU=;
 b=Q37uAPat4nXwBevtO622bC2lbdq+2kig5av+s1xEfvrluvvehEzW0lJlgLRjSU/gVS
 0g0nbXE453KWchLxocoZtsx6jDxV+6m4XTn/yTNnNOQyDhcofr6S2XDw8m0Z/LUjCfVx
 /mEaoHRxJq9qggtqyMijHRZBSiUl3v7fzDn0NSUO+ldy6MuxhWBG2cuv/2OApgYJ3vY2
 PK0N40Ta55bnMhBH4Au+qRTKSa+5NswpZGNAHNaAYZo4fHkKRDIHdxKIF5auDJMNz6Tt
 Sqbv4LU8Z25Q8SrK2NuPq3bNxR458dY5Vz1VHA0UX1vXOzTHFbIhAGFY3mDkFw3b2KAu
 b7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgjdNrGN20/tF99YpbNi+PvCmEt0lTWDvcRUmNlZGYU=;
 b=LTWlbrGmxsGMXGqYUPgEmBdtD97W9bkNwmEkR4PTBMZnaVmFmCEzvutXSlJMW38Crd
 UUokA9wXABPCjPfme8OYc6gdhgAXW4rhgLNxD23KpuG9SIh32iaEeOSISpmBNyRax9ST
 pXNVEgqY0GCnWW6CX4nkKj+TpbdlZMe5NlHD2r9eVDWv5NTB8bVwFAppwsDDz3DMmIgE
 K7ClEALjJz1QmoIo4nK9Lf474o8qz/N63/j+hZlN8ml/OnYMAENzq+1UFKHVLDSQ0ySl
 qA0V5N2JenqDJy2qzK8O/hsCKyA3+JKAvf3TbXYQ+alqbdwYLq3VsRYmKL11VnBb3XaX
 IamA==
X-Gm-Message-State: AO0yUKWmF4Vn0AAte3bdkxLExIFEcru9mLgbEDa5l90WbBaC0eWyck1L
 NC0xvGZBG/kGmqu2GKrTMqZMuQ==
X-Google-Smtp-Source: AK7set8QUbUj/nE6L8WnjHe6NgZjzWNh6KmAjlizx8NpM/S8mP8kaQW3lK+sLBWIak4qSUqkTIF34Q==
X-Received: by 2002:adf:e452:0:b0:2c5:594a:a4f0 with SMTP id
 t18-20020adfe452000000b002c5594aa4f0mr1772668wrm.58.1676467726453; 
 Wed, 15 Feb 2023 05:28:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm15807943wrv.18.2023.02.15.05.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:28:46 -0800 (PST)
Date: Wed, 15 Feb 2023 14:28:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 10/10] MAINTAINERS: Add entry for RISC-V ACPI
Message-ID: <20230215132845.nv7km7z7vfm5jqzg@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-11-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-11-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 15 Feb 2023 13:28:50 -0000

On Mon, Feb 13, 2023 at 08:10:38PM +0530, Sunil V L wrote:
> RISC-V ACPI related functionality for virt machine is added in
> virt-acpi-build.c. Add the maintainer entry.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 847bc7f131..7fb0f1052d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1003,6 +1003,12 @@ L: qemu-arm@nongnu.org
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
> 2.34.1
>

Please move the ARM ACPI entry down under the main ACPI entry and then
add the RISC-V one there too.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

