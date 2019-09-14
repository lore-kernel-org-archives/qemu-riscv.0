Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9Egx-0004CK-43
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 16:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i9Egt-00049K-TM
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i9Egs-0007ah-Ti
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43142)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i9Egs-0007aN-Oe
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id u72so17057350pgb.10
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 13:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=b/9+bahG3N9D/2k7ndZAoMR9759cz5ClkCwbT90cmbI=;
 b=qtpybJC4NdVOLpgkODuJ14SrHqUlceVwKJDKY011S+sr+uv/A+hgRJYiUF778bTdus
 ojXJEAkqRoOqjYNz8zunLUL/pVHkttBC+plt9k5RnlgyyQYsITKH84egJNaY7JS1fjEY
 vlBdlnl05GGQ/QXtO7aiFL9rZ2rAxLbYwTEysltQScGdLrzp8dPDkiF6yeFzQbffKIWN
 dcruLO+2O5cMjiaO5knYK8dUNE9xcG7YximOkJ/6pwySKNAtxMeCp2tTyOe+qn9OX1yA
 WserWcOYw0F4ZSqxmjzPwPffvMLomAqkND21I50uWmXE2i1pKa39UkAV/QB09BkRlCY/
 j75A==
X-Gm-Message-State: APjAAAVdNpw60hhwTzSCB1gHTyFoiO3yu3YkoJ8chXveNLR3Ke+ppbjE
 UPAJL4w7ekCLBBxknUd8Z1Rjtg==
X-Google-Smtp-Source: APXvYqwRXDcc5HCgHV3Ovrp4zkAwxXK0qCm5fyA4Z+kpiKtsWRTQIS2lv2wGuvZuhiXEoboaOb9zDg==
X-Received: by 2002:a65:63c4:: with SMTP id n4mr32741816pgv.44.1568493041441; 
 Sat, 14 Sep 2019 13:30:41 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id n66sm52784343pfn.90.2019.09.14.13.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 13:30:40 -0700 (PDT)
Date: Sat, 14 Sep 2019 13:30:40 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 13:24:23 PDT (-0700)
In-Reply-To: <964f729f0c7010cac733b88545f0356a668c9bed.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-cd966099-fb3f-436b-83d9-55d96bac5fb4@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: Re: [Qemu-riscv] [PATCH v1 13/28] target/ricsv: Flush the TLB on
 virtulisation mode changes
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
X-List-Received-Date: Sat, 14 Sep 2019 20:30:45 -0000

On Fri, 23 Aug 2019 16:38:23 PDT (-0700), Alistair Francis wrote:
> To ensure our TLB isn't out-of-date we flush it on all virt mode
> changes. Unlike priv mode this isn't saved in the mmu_idx as all
> guests share V=1. The easiest option is just to flush on all changes.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index afb3e8579e..8e8b156fc0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -203,6 +203,11 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>          return;
>      }
>
> +    /* Flush the TLB on all virt mode changes. */
> +    if (((env->virt & VIRT_MODE_MASK) >> VIRT_MODE_SHIFT) != enable) {
> +        tlb_flush(env_cpu(env));
> +    }
> +
>      env->virt &= ~VIRT_MODE_MASK;
>      env->virt |= enable << VIRT_MODE_SHIFT;
>  }

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

