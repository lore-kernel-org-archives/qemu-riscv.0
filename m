Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSHly-00009k-DL
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlx-00004t-8C
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:24:33 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlu-0005fN-Ak
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:24:32 -0500
Received: by mail-wr1-x436.google.com with SMTP id s13so1416104wrw.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+8G33dE5kjr/4fB8GUe3JsgHX9jljk5aLDoqp3BrSCc=;
 b=h6Gjq8lQFGuoRDLodNyvPT/3g6ouoPjYcO1g6H/bqod7uwvVNGCakyxCz6RYDtVYSf
 hhN8JEPzSHbXqr9lTZUuqUGQRn1mV3vkbAM0TpgmbVJ7fdMBA+1ZijLZ5pdZE8JtrQVW
 B0lXt6UbD9Asl5SBQjXFEqZxvXOHQg1AZOgHvO0bQnthJk4TgG1fZ93E4EKJ6mchxiEm
 msnXr9rsGrR/El1Z0BDOt+B/+kVWBrqKnMzD5JuZ5DWmT2w8UE1b3UMZmjcVEFPeDg2S
 wYNCLm1qO/LHPj1xSIPg0PMyHB9CCDMHxbUOAmfWET2zuvmrXuNEiEMZEHBGxrpGmNgc
 ehKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8G33dE5kjr/4fB8GUe3JsgHX9jljk5aLDoqp3BrSCc=;
 b=pNkXxnhB6Nzj9xpJ+pri8jVOjXV0mu+LOtbiNSAi3/gi0vYDQ/6ASO7Ql11rT8m+k5
 FCnKv1wNg+ADmAn/sLs9Braa/y3EEvLinXE/MOfFrIB2RrRzQ/erGA9/+5yBZ1kbuDki
 HMW4cc6UEHe25u5nqjT00wLBb+qf/FMSPBQa3teOQ2Td7/f/9YyLM/TOfvAhcRYR6jVD
 TEO/t1gZhqgfpgFhRqRd5tjWmLIGONhBth7O6ytLqHD8PcLGf4BrN86vxYA4QBHxhh//
 g9BDDNeYdGi4rxqYrRcYLcE4PeuaVGgOQBlZb3flYNtYo4Yf+tJhbLsDW8xmyVjT8j8L
 rAfQ==
X-Gm-Message-State: AO0yUKVvSWxmXZ38oanD6TdRIBCRuIGMPI1EG8h/eP8LmdOvyytypXYe
 FeHpm8EimDt1COnNujNc+ibZ+39Aod7UttUY
X-Google-Smtp-Source: AK7set9VRyvOxtdI0wCGOrpyagu2jxaV8dtmJzDj59r7gPDkaUcYlZpqtQQ44K8hPO9DYS9DtZpmbw==
X-Received: by 2002:a5d:5082:0:b0:2c5:4d68:5511 with SMTP id
 a2-20020a5d5082000000b002c54d685511mr1623760wrt.48.1676467465656; 
 Wed, 15 Feb 2023 05:24:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6102000000b002be5bdbe40csm15540835wrt.27.2023.02.15.05.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:24:25 -0800 (PST)
Date: Wed, 15 Feb 2023 14:24:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 08/10] hw/riscv/Kconfig: virt: Enable ACPI config option
Message-ID: <20230215132424.e4vtxjkq2bpffbw2@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-9-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 13:24:33 -0000

On Mon, Feb 13, 2023 at 08:10:36PM +0530, Sunil V L wrote:
> Enable ACPI related config option to build ACPI subsystem
> for virt machine.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 4550b3b938..6528ebfa3a 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -44,6 +44,7 @@ config RISCV_VIRT
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
>      select PLATFORM_BUS
> +    select ACPI
>  
>  config SHAKTI_C
>      bool
> -- 
> 2.34.1
>

This could probably squashed together with the previous patch.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

