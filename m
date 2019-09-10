Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7g0d-0008Vp-UO
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 09:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7g0a-0008RA-0r
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:16:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7g0Y-0006ce-QQ
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:16:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7g0Y-0006c6-K1
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:16:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so20173860wra.6
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 06:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sv6tDhPr4WFwtN9t14YkhLPoyaBEz7Va5oGN2aKOC3w=;
 b=k+jBc5D8i2qfcvrc8bO5+K9p1uMK7YrVbCK5tRmNmgkMo9vDfF1WCBcV7j+HeRUtPv
 z+EBzAvngY9aUNUb+PrV96Jvpxdx9ysrJ7FMX/mH2/ejnlkGM5wimUmUiwF7jeWLqXOt
 EcJbbNNaofu+e+vrNRRvaV5yKFDTw4xPFV7IC29KFcY9xPUqvDAHkdw96WX6Y+X92nPP
 96zm2flY2D+NsjTFLK2veQ6PZAKwxSDRPtlZldeve8LVX23GZoPViAQl5qZFiyBKr4IH
 GtVpr4gN/rO0gv0iLvELzXwUyJRQ7fvb0oGii5PVPEgHEyMiKeO7I5LsrL1zaYuRtRg4
 f8wQ==
X-Gm-Message-State: APjAAAWpPpBjMIb5sKWgPg+1W+CkJapmf6c3RHY/2F2c2G4YGIWk2sqL
 DLY/ucIBgS4Th4y7YHfr2WkkLQ==
X-Google-Smtp-Source: APXvYqyHvwc6MbUwBf+AC/8+MthAGyGldETGjW8hg11vBWN/qPaHGqgqweSZ/TjBerCiZNHTl/UmGQ==
X-Received: by 2002:adf:cc84:: with SMTP id p4mr6720977wrj.201.1568121393109; 
 Tue, 10 Sep 2019 06:16:33 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id d9sm21430637wrf.62.2019.09.10.06.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 06:16:31 -0700 (PDT)
Date: Tue, 10 Sep 2019 06:16:31 -0700 (PDT)
X-Google-Original-Date: Mon, 09 Sep 2019 10:14:10 PDT (-0700)
In-Reply-To: <066a2c520c38b0c175c052d6a3385d5661764833.1566573576.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 bmeng.cn@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-a8e09e2d-e0a4-4de5-88f6-d47db22fb1e8@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-riscv] [PATCH v4 7/7] target/riscv: Use
 TB_FLAGS_MSTATUS_FS for floating point
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
X-List-Received-Date: Tue, 10 Sep 2019 13:16:37 -0000

On Fri, 23 Aug 2019 08:21:25 PDT (-0700), Alistair Francis wrote:
> Use the TB_FLAGS_MSTATUS_FS macro when enabling floating point in the tb
> flags.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index eb7b5b0af3..0347be453b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -301,7 +301,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>  #else
>      *flags = cpu_mmu_index(env, 0);
>      if (riscv_cpu_fp_enabled(env)) {
> -        *flags |= env->mstatus & MSTATUS_FS;
> +        *flags |= TB_FLAGS_MSTATUS_FS;

I thought this was a functional change, but it's not: fp_enabled() checks 
mstatus already.

>      }
>  #endif
>  }

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

