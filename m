Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ps8y9-00054X-VA
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 17:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1ps8xw-0004zl-6W
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 17:15:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1ps8xp-0006DU-2C
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 17:15:47 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so70207975ad.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Apr 2023 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682630138; x=1685222138; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=NBOvjaSfMSuca94VtLHfDH3Fo8fcsNM4lEw6ArweVuk=;
 b=ajXomIBDCrFEVZHl0rSdsp98rzc675FaSfvcLBhMIUsw8r/f2jD0RZvWtLl5dO9TkJ
 XUkUklj/694dQPfI4rLDvSjrbaxm0e6b8Kww/vHDa5jxFMN5w/MWR7fOFtmtZIzDyMNB
 Q0EW+6aqSaVFsLSyhf9sm0Q0sG/lkbOjbuOhwu0ec8GFpXjQq73G5nc8Ge61H/p/IAui
 738i8C5QbHNCpmldpD5EdwQEnVkgiU1b1R2Ay1GD1iV3D2cOOG6bbJ1fOZZInPMccIgG
 npiTBM4AUev/wco2jvK+ja3H15Tkz0qal++qKG2oipq1FHlnC/7CWYDJ/j+AvOthAG1j
 4tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682630138; x=1685222138;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBOvjaSfMSuca94VtLHfDH3Fo8fcsNM4lEw6ArweVuk=;
 b=U/FSAt2p4bXwOHvEr+JY+6xoxi5CTKYof6fiiw87i+8pq8oQUUYac80+xeekWGCkR9
 XXf/Z8rN5FtH50qfCn651Bn4SbM1FdPViuNmA0IPypMJSErrLRo6seyZjFCZKUsgRpzY
 vXm8zduWKJXjmhZNz6Lizgrs1eNhTufsr0q8s5fzKBi1woKrD0V/XkWCOtbN4RL7eTzN
 tM2ZD20LPWw98+gUWfS25viTG1fX2pieNce3zej1sXyIHFZrqjjO3EBnCgtx7JeTJdfV
 kyubFFT6iHTMGbkN27lyICY8XoQcf3Ms/LaXijuVgKG05e6WiHPLyPcJrXVdKPdLeE2X
 K0mA==
X-Gm-Message-State: AC+VfDxK80fx9q1btEJyZHGvZ2Kmq4xlkvexdSL052bKmKqa5zxuKpEX
 POwNuJcKDB/3aEB3d7BspkMw9Q==
X-Google-Smtp-Source: ACHHUZ4hk4AGEqiSUaU7++X+Hf8oXKZIyFiTgZFYXnDtTdK2YDvF1ZDb3OEsQkg5OZ8UmDy19DQxrA==
X-Received: by 2002:a17:903:32c1:b0:1a6:a375:cb44 with SMTP id
 i1-20020a17090332c100b001a6a375cb44mr3097821plr.39.1682630138571; 
 Thu, 27 Apr 2023 14:15:38 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170902759100b001a6e3e3dbc3sm11992359pll.22.2023.04.27.14.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:15:37 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:15:37 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Apr 2023 14:15:22 PDT (-0700)
Subject: Re: [PATCH 0/2] target/riscv: RVV 1-fill tail element changes
In-Reply-To: <20230427205708.246679-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-ca247fea-c6c6-4ad3-bb6d-2c85e93d15d1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Apr 2023 21:15:51 -0000

On Thu, 27 Apr 2023 13:57:06 PDT (-0700), dbarboza@ventanamicro.com wrote:
> Hi,
>
> This series makes changes in vext_set_tail_elements_1s() to be a little
> nicer to the emulation.
>
> First patch makes the function a no-op when vta == 0. Aside from the
> logic simplification we also have a little performance boost.
>
> Second patch makes the function debug only. The logic is explained in
> the commit message, but long story short: we don't have to implement any
> tail-agnostic policy at all to be spec compliant, but this function has
> its uses for debug purposes, so keeping it as a debug option allow users
> to disable it on demand.
>
> Patches are based on top of Alistair's riscv-to-apply.next.
>
> Daniel Henrique Barboza (2):
>   target/riscv/vector_helper.c: skip set tail when vta is zero
>   target/riscv/vector_helper.c: make vext_set_tail_elems_1s() debug only
>
>  target/riscv/vector_helper.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Though this made me think: it'd be nice to have some sort of 
"aggressively do odd things for VTA/VMA" mode in QEMU, as that could 
help shake out bugs in software.

