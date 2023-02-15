Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSHm8-0000f4-QI
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHm5-0000Vt-T0
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:24:42 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHm3-0005iV-W4
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:24:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m10so10219289wrn.4
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yiZlosEBkr+8oj6Izjo4DAcpmzxY/yeq9wPI4erWw0g=;
 b=c5uEX1j5p5cny3McXE1NNyEm5PyOo+r7DIvE0n8Rkg+Yfgj0jIWoN8XKs3FXRWrOsr
 5SNeNb5jJKeBAl0zzZ59bIwz+MsHrXYO9pu3BWy2otHFapeVQ/CW0T/XD5kHw7oYP/fj
 Y61UPZFewwWN8YwQYFlIIP/Mxuu6DW6ZvP4DKE3jsYX0XRUIWLHYMqs0nIawIH/mCQMj
 w6Xp2rRkeYqh80s2hRjI5IFZkigIBkHFiV+AXAhVEDYll+T7Pg5SbJoJeMoyOY8I8NJW
 L9oD7T2LvfD6z/iG6iJIbC7q2+r/aKVycSy7JnJcFocPqQZBQRFmrNH131GPPQsJu35a
 Ljvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiZlosEBkr+8oj6Izjo4DAcpmzxY/yeq9wPI4erWw0g=;
 b=SprHgfE1ckNH0qmLermajyVivyAXqLYJn/a2AVj8uLagsJxR0iN3u9vZgZaNd9pWe1
 9BuLVTkyq2gZeO/QuVfJQa2q+vYF1PdclhOzAb9OvCbk70inRP7e/3+4OeV75HhNYo8U
 1n8viXOdWPl+NaNFBg1OyBPFqQKgE4Ml2nJYneOtiLwgvPSYYvhBe4pQev8Zvo/MLZ5T
 CRGv/02goExBAB0YMeScQnLUiQHyYzzEtj+OlEzgXLz0ndM6v3PEq7m6hkSmYsNI9d6o
 hyiZ+rktwKvO9oz/Wq7EUrYc17o917e009bYfaW39JStUpA43t7zwzOiDOWSDphqFiOh
 hDGQ==
X-Gm-Message-State: AO0yUKV/lXyGzSvHR09EDFZsg5yg7970fbywHY6Y3FI4tQRKiZoHtxpi
 pvitLpcynYirUpRbijPp7izKqnI+Lx0XgC4/
X-Google-Smtp-Source: AK7set+5EG/W4w+oOCo0CRYE2lhq1ANLqWUvM+b4OFvo4NphI3cC5iQLqZAYDYMtGWAg3sOWd5hQiw==
X-Received: by 2002:a5d:68c8:0:b0:2c0:dcb7:91bc with SMTP id
 p8-20020a5d68c8000000b002c0dcb791bcmr1273751wrw.46.1676467478577; 
 Wed, 15 Feb 2023 05:24:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfefc2000000b002c553e061fdsm9145301wrp.112.2023.02.15.05.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:24:38 -0800 (PST)
Date: Wed, 15 Feb 2023 14:24:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 09/10] hw/riscv/virt.c: Initialize the ACPI tables
Message-ID: <20230215132437.ibksma3khjoukimg@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-10-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 13:24:42 -0000

On Mon, Feb 13, 2023 at 08:10:37PM +0530, Sunil V L wrote:
> When the "acpi=on", ACPI tables need to be added. Detect the option
> and initialize the ACPI tables.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  hw/riscv/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5017ba62ec..43c201c8cf 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1316,6 +1316,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      if (kvm_enabled()) {
>          riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
>      }
> +
> +    if (virt_is_acpi_enabled(s)) {
> +        virt_acpi_setup(s);
> +    }
>  }
>  
>  static void virt_machine_init(MachineState *machine)
> -- 
> 2.34.1
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

