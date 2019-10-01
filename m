Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFMyO-0008O1-Mp
	for mharc-qemu-riscv@gnu.org; Tue, 01 Oct 2019 14:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iFMyL-0008KS-SZ
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iFMyK-0002j8-Rh
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42844)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iFMyK-0002il-MH
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:04 -0400
Received: by mail-pf1-x444.google.com with SMTP id q12so8654259pff.9
 for <qemu-riscv@nongnu.org>; Tue, 01 Oct 2019 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pz0D2/ekdx2L9LGzzrxsNOaKJHXNmStYb+seabNgP4U=;
 b=guw706AaJmsMfXFv3V0/dkcEGkRJV8Zpo6DD6r+I4Wco1GUg+8GC1fItDK1oOn+RrY
 wKBZFTLoEz1hDKtzgGqw42oDqaqlPsSneVjWANDxL7SpLEH6HOVtaSuQzFi7BlYrMgLO
 TWlaZ5wCM5p6lD+gbIokIkdsuh6bEShVBfPHTAsEoFGJX8kHkvGlONtiQ752/4Z1FCWa
 RBFuH4eDrGG6daCfrMdWpSt8medpbhr64NXwSp2LZRqXwJTow3My/kbpohQKd12Gte7U
 7R+ekfmjccO05nlkzV2yWgD8bBMJbv7i3OOv0iza/7FDZVbi5cqPIXY5mSNaXDkxoxiH
 sxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pz0D2/ekdx2L9LGzzrxsNOaKJHXNmStYb+seabNgP4U=;
 b=o846UaGsKHITD80k2xGg0vtvhz4v6UsBvaVcoFVBQifok0qTo9bY7JoaokDjDjOS7p
 SfGG3VIEZgtG/a8+rp6mN5gw04xNMpzds6BTyIKMdTipHdfk3vQ+BIQVlyoAppRoFkYp
 jwJWRqxwOvq/W7vlwocETkUxFdZTt2VMYlJZ2yJuXODayNk/2vMa3hlmLFy6ZmrlBBF/
 d4/rDRCIex/bZYmD7up38e+a7wcRvm3uPat/hhi+vCZ6Mqy3WDf3fwtadXR1oa+zLD03
 4xpN+7kWhgRUcz88ixRg9IldTUpg5I49qVTWmrLrg9etpwmJbHL8JQdKrv/LRM6M/ehQ
 v/Kw==
X-Gm-Message-State: APjAAAVQwT4hfQIu2USXVDlULwkLZuRKYHL9vf2hSneTCl0PZWlzySYk
 nxVV2DyK9lC2O+8SYrw8l4S1tA==
X-Google-Smtp-Source: APXvYqwV2fJBmWzaXEmemHqqxag+iUPHQUA/uYzzIQqSbah6Jk4gGnuZgAt+ECX4o0NC2I51lJA15g==
X-Received: by 2002:a63:ed10:: with SMTP id d16mr32422317pgi.307.1569954843724; 
 Tue, 01 Oct 2019 11:34:03 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r30sm19308133pfl.42.2019.10.01.11.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 11:34:03 -0700 (PDT)
Date: Tue, 01 Oct 2019 11:34:03 -0700 (PDT)
X-Google-Original-Date: Tue, 01 Oct 2019 11:32:24 PDT (-0700)
Subject: Re: [PATCH v1 19/28] target/riscv: Disable guest FP support based on
 virtual status
In-Reply-To: <4f1ff6ef5fb2baa3c461d16b5669d3bd829733a0.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-caebff54-201e-4407-a992-d99a8a33817c@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Tue, 01 Oct 2019 18:34:07 -0000

On Fri, 23 Aug 2019 16:38:39 PDT (-0700), Alistair Francis wrote:
> When the Hypervisor extension is in use we only enable floating point
> support when both status and vsstatus have enabled floating point
> support.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 17eec6217b..098873c83e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -90,6 +90,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  bool riscv_cpu_fp_enabled(CPURISCVState *env)
>  {
>      if (*env->mstatus & MSTATUS_FS) {
> +        if (riscv_cpu_virt_enabled(env) && !(env->vsstatus & MSTATUS_FS)) {
> +            return false;
> +        }
>          return true;
>      }

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

