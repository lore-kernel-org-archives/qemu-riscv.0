Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8mdj-0006tb-9U
	for mharc-qemu-riscv@gnu.org; Fri, 13 Sep 2019 10:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i8mdg-0006tE-Ki
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 10:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i8mdf-0000TY-CC
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 10:33:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i8mdf-0000Sz-63
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 10:33:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id bd8so13311433plb.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Sep 2019 07:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZcgtA7DUzweE6P+F0iSw5YWH7DE6YUf2lnvzah0tYC0=;
 b=DmxsVeXnoFpN2uvZ87qPSmgPDYtgrlB9wpuSMMFZtZWc4PYgMrLK+/OHDTdH67I5OW
 MiXGhgQDhFrirVHMi8eMn1dQ+MJct+eWq1ojaA+QY39eIekZJ0j3xFeA3pUp6KdgsexC
 thTKaec+MmCRSJoWk8RO8iPDWXYMN6MLBucZ8ipf7raoEXQ4D8QeJz2znkdFffnEr8jm
 5mFMWRzf7F/0n7mzO2gw22GaAAkAY07KIjS82+K6cKoXmgqO/NFunoK55gbqo0KWaCAe
 0nsThv3dV/9ZRpV2HNRcaqy0TdZ0lA30mzhcTiy+rJ+8AR/3+R6Fxiyj28Sajje+LxKL
 gSiw==
X-Gm-Message-State: APjAAAUP0DXcRxwmixNcJ4LkvDomGMtlwcTA5dVNHDh1QarpO/lVSz+v
 EuCZeaGWWZa56J1qa9GlN7Q55g==
X-Google-Smtp-Source: APXvYqxtRY6ZXLmxssxB9Qa/E8e+bwcaMuq4LjXP+IYn0wnPdtxHjNg4Crku65r3921zyOqd/4rgHg==
X-Received: by 2002:a17:902:7685:: with SMTP id
 m5mr50039821pll.218.1568385209712; 
 Fri, 13 Sep 2019 07:33:29 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id g202sm38389325pfb.155.2019.09.13.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 07:33:29 -0700 (PDT)
Date: Fri, 13 Sep 2019 07:33:29 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Sep 2019 07:33:20 PDT (-0700)
In-Reply-To: <1567786819-22142-19-git-send-email-bmeng.cn@gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-81295c42-a2f8-4f95-a54f-f9a319e10a36@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
Subject: Re: [Qemu-riscv] [PATCH v8 18/32] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Fri, 13 Sep 2019 14:33:33 -0000

On Fri, 06 Sep 2019 09:20:05 PDT (-0700), bmeng.cn@gmail.com wrote:
> It is not useful if we only have one management CPU.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> ---
>
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
> - use management cpu count + 1 for the min_cpus
>
> Changes in v2:
> - update the file header to indicate at least 2 harts are created
>
>  hw/riscv/sifive_u.c         | 4 +++-
>  include/hw/riscv/sifive_u.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 2947e06..2023b71 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -10,7 +10,8 @@
>   * 1) CLINT (Core Level Interruptor)
>   * 2) PLIC (Platform Level Interrupt Controller)
>   *
> - * This board currently uses a hardcoded devicetree that indicates one hart.
> + * This board currently generates devicetree dynamically that indicates at least
> + * two harts.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -433,6 +434,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
>       * management CPU.
>       */
>      mc->max_cpus = 4;
> +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>  }
>
>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index f25bad8..6d22741 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -69,6 +69,8 @@ enum {
>      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
>  };
>
> +#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
> +
>  #define SIFIVE_U_PLIC_HART_CONFIG "MS"
>  #define SIFIVE_U_PLIC_NUM_SOURCES 54
>  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7

This fails "make check", so I'm going to squash in this

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ca9f7fea41..adecbf1dd9 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -528,6 +528,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
     mc->init = riscv_sifive_u_init;
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
+    mc->default_cpus = mc->max_cpus;
 }

 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)

