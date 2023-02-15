Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSHlX-0008RW-0y
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlV-0008R3-8E
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:24:05 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlT-0005di-IO
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:24:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bu23so19120166wrb.8
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mqPc8AytlXNsKR7etzLKAjM93QRl+g6WGs1zRmxWT5c=;
 b=LzALQyReD7dlO8MfOKsyCzpBGIr92KiG6l4QHsBiej3aT3mjzifBqsSVFXvOq8e2Ag
 NoMsAiRl+JUVbTrK+2vI2urXqPwu9i2QXTjL0dbhhRy+DeU+IdjM+mOzvY6StzNfLVlS
 GE+l4e5nNwbBqijuDD4gKA1APvFXcxuB7AZd5QTAa5E6Hu1YEL7pJnDmsi2PheezP8en
 3CQtf+qtZSBdvphkIZ6JYao04lcbq6NlQ/w3aX5NJtTvebN4wTMTtHuRHGwx1ebdqXDq
 o5OD9ofi19apNpoge68E9CliPRO5Kq3Q0Z2KM4Iw8x13B9iXhuQKLCUG5lOgxwWk/ut2
 c7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqPc8AytlXNsKR7etzLKAjM93QRl+g6WGs1zRmxWT5c=;
 b=Xc3zKXH5tUuLy282uoXNCZcdfb7yFgI4FoYi4ICePGyxXj4017EoU2rplCLCg0oBjs
 S4bpLwgczfH4TmKC4sZicFa8aD9brDkLxI0P4t8T9z2hyRFDOVBPG6ophOkdkzCHz7g6
 y8HqxD74L6yobUXzu2l3q2LY8ezSHDSGvYVUABFufi82ABO7nx5Ur0xXkDHKWspjH19H
 n7apF43BmRZeJBgRNN8JkIb2wGPKyIzseQPUAnn+cilVcOrn2+md8OLajR7U1ugyhLzW
 eJi3ZDhpMsIZFrp9JP2g3tWhWAn+kKty1CFrBDOj9+EP1OYPko7yOQZpTz2KbSvKow7V
 pvCA==
X-Gm-Message-State: AO0yUKW0Y880Feo8Mkmm8gHL1WJkxEM9RlhC4QauAxiFIy2DJnCkmfQb
 FdBPrSuZx1uhMGA3zZRKKW0sig==
X-Google-Smtp-Source: AK7set9DH/deerxOzeSvl5a8jh+Z+LCerW8KPasMFC5XzuCCApykGrXbxZ6kn7hpI4ohoL2CnmsxPA==
X-Received: by 2002:adf:e651:0:b0:2c5:5b0e:6ee9 with SMTP id
 b17-20020adfe651000000b002c55b0e6ee9mr1825279wrn.39.1676467441964; 
 Wed, 15 Feb 2023 05:24:01 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a056000100900b002c5598c14acsm7069838wrx.6.2023.02.15.05.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:24:01 -0800 (PST)
Date: Wed, 15 Feb 2023 14:24:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 07/10] hw/riscv: meson.build: Build virt-acpi-build.c
Message-ID: <20230215132400.p4dcrjzwxi6mlljz@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-8-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 13:24:05 -0000

On Mon, Feb 13, 2023 at 08:10:35PM +0530, Sunil V L wrote:
> ACPI functions are defined in new file virt-acpi-build.c. Enable
> it to be built as part of virt machine if CONFIG_ACPI is set.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  hw/riscv/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index ab6cae57ea..2f7ee81be3 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
> +riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
>  
>  hw_arch += {'riscv': riscv_ss}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

