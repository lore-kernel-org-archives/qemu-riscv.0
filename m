Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8szs-0005W9-Lz
	for mharc-qemu-riscv@gnu.org; Fri, 13 Sep 2019 17:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i8szp-0005Vg-O4
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 17:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i8szo-0005LD-Cd
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 17:20:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i8szo-0005Ku-6p
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 17:20:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id bd8so13771377plb.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Sep 2019 14:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/Fq7QcmmLLwNTeanlUU4aXQDyzZiHPkisBlI1lGIvVk=;
 b=nz1qMsXJzdkMM5GDJnq5LJ0U7Yg7rK1jKT0YHTnPjR1dJ2sXFXIeuSdk9v+k9Dxf0F
 P+Q8AnxL1H5fp/9HfKugw2OgQhN3mUkkOqobm6f327PeWKWCUw4dC+iQoMiLQ3fY+M8m
 BOrDkbeVqxTOXVS2nUu0RNXK0zRXSN40nw6IoS2NBuID6AkSlhmnicY875wrSYiZ+UEo
 9IQfvL2Lzxu9/QKmltPGWAeqHjYUV5U0iuQUsFtExu3BZWXLfHc1ku+b1sottJFq8DWl
 K4kKXtca3HtVXq80TWMSz4gUwPgnIWQiklLzEsnkhVinrULlcqiL7t5AH4bel+bGnWf7
 vYeA==
X-Gm-Message-State: APjAAAV6Av7mv2Kt/Lzhh9KrYE13l1hxUD/S2tbAbVwdpfQrFgxWf8ez
 i+5xSt7b11VPLwUzk2wZOnbZ/g==
X-Google-Smtp-Source: APXvYqw9AQJVJaHANAMOmw71j87KMC/B3mNgFPIfMnjY8PaWTUJ4nKnov6uId2tqccPYZqEMYp5Y6Q==
X-Received: by 2002:a17:902:8d81:: with SMTP id
 v1mr34370902plo.23.1568409646480; 
 Fri, 13 Sep 2019 14:20:46 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id x8sm28754237pfm.35.2019.09.13.14.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 14:20:45 -0700 (PDT)
Date: Fri, 13 Sep 2019 14:20:45 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Sep 2019 14:14:14 PDT (-0700)
In-Reply-To: <1568103341-28636-1-git-send-email-frederic.konrad@adacore.com>
CC: qemu-devel@nongnu.org, frederic.konrad@adacore.com,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
From: Palmer Dabbelt <palmer@sifive.com>
To: frederic.konrad@adacore.com
Message-ID: <mhng-b33d5ee5-58d7-402f-ad7f-e79f58ed84f7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
Subject: Re: [Qemu-riscv] [PATCH v1] gdbstub: riscv: fix the fflags registers
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
X-List-Received-Date: Fri, 13 Sep 2019 21:20:50 -0000

On Tue, 10 Sep 2019 01:15:41 PDT (-0700), frederic.konrad@adacore.com wrote:
> While debugging an application with GDB the following might happen:
>
> (gdb) return
> Make xxx return now? (y or n) y
> Could not fetch register "fflags"; remote failure reply 'E14'
>
> This is because riscv_gdb_get_fpu calls riscv_csrrw_debug with a wrong csr
> number (8). It should use the csr_register_map in order to reach the
> riscv_cpu_get_fflags callback.
>
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>  target/riscv/gdbstub.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 27be932..ded140e 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -313,7 +313,8 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>           * register 33, so we recalculate the map index.
>           * This also works for CSR_FRM and CSR_FCSR.
>           */
> -        result = riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
> +        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], &val,
> +                                   0, 0);
>          if (result == 0) {
>              return gdb_get_regl(mem_buf, val);
>          }
> @@ -335,7 +336,8 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>           * register 33, so we recalculate the map index.
>           * This also works for CSR_FRM and CSR_FCSR.
>           */
> -        result = riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
> +        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], NULL,
> +                                   val, -1);
>          if (result == 0) {
>              return sizeof(target_ulong);
>          }

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

I just tagged a fixed version of my PR, but I'll include this in the next one.

