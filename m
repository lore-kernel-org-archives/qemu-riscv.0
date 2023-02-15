Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSI6Y-0006oH-0K
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 08:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSI6V-0006nz-TF
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:45:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSI6S-0005JR-Jl
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 08:45:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id k3so11570551wrv.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n/ThfzrDgUjYqaRx1XhiYCOiTgFfI1QiyNBakl4gOMQ=;
 b=A+OKPdvlTaw5XRL8fbYPKH3bMorBDFlYSLRqkDrwR5QK3BLUnK/1QAUWdJoNxIWGq7
 KnUdmWLQoaoe6nfYjUTbud4h4y9+/YCqdKv/bmZb1lb2Kco8Ie7ommTifjkw/Uv+Q3RA
 ahJbxF/lIb+eD8V0ON6Ss76/byMkqwOeSKXKwZLcgS8zz7eyp5E5hYufYPLnAWehCFum
 st14UK5boX94rNg97KkiNXvjiUSbh9SPSzPc0Ystxodd7FApXpLCVVAGhBV+YTeREGj4
 ijnVVZ92ALzfD8JQ7B6Glq9Vq16/CiV+yyyB7wHOJr5n8Qe7fLfwQCkEjzm3VZeJ5ish
 SH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/ThfzrDgUjYqaRx1XhiYCOiTgFfI1QiyNBakl4gOMQ=;
 b=PPul+KFs7tFIzhyjZD8JYQs+GyNXPNhZBVsUieP3g6pby0cBT4sBZ/91uGD07qkMwj
 mUlPdwBKik7J0ZPeroY/HXmUenoPQlCvLSqPJRHaIOjsozLr2Pkvv7i8VtBrzOPuiSWv
 kjIkNyGygW6bFBr5EReVnzdv7SWvaS2CvW9Aet5E6wpGo0ibQccOTML4h9swuhRRSOxH
 hqB+iDXFIHk+YlyfmsdGy5y8EQmDgYaKAnSdYu7McnjIgSk5VgNF4mj/B4KBxiofohkw
 9S32ux6Qv92w6+kH4AQSTZch2cc9+skRnfHa+E3dZgClAJjFC2+cnn4kUkNQr+14NRaP
 duJw==
X-Gm-Message-State: AO0yUKWD6AY97vVg5eWOuFMXg4d2lYEahTlFmapzbdUDSnP0s2dXeVgg
 lHdGZqlVsgrMy5jlAXypwoeF2Q==
X-Google-Smtp-Source: AK7set9CT59qWEZX1lbfuv2qYv/kiZGz7DX2mfh25u4pB2SXC0NtsuV8aOA5466GHAXinbui3xRQKg==
X-Received: by 2002:adf:dd0a:0:b0:2bf:d937:3589 with SMTP id
 a10-20020adfdd0a000000b002bfd9373589mr2099936wrm.14.1676468742742; 
 Wed, 15 Feb 2023 05:45:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4d84000000b002c5621263e3sm4584083wru.19.2023.02.15.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:45:42 -0800 (PST)
Date: Wed, 15 Feb 2023 14:45:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 00/11] enable write_misa() and RISCV_FEATURE_* cleanups
Message-ID: <20230215134541.hxaspacyttcytod5@orel>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 13:45:49 -0000

On Tue, Feb 14, 2023 at 04:23:45PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> This new version contains suggestions made by Weiwei Li in v1. Most
> notable change is patch 4 from v1, moving up to patch 2 now,  to allow
> the riscv_cpu_cfg() helper to be used in the MISA CSR patch.
> 
> 
> Changes in v2:
> - former patch 4 moved to patch 2
> - patch 3 (former 2):
>   - use riscv_cpu_cfg()
> - patch 9:
>   - remove the uneeded RISCVCPUConfig and access mmu via
>     cpu_cfg->cfg.mmu
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02780.html
> 
> Daniel Henrique Barboza (11):
>   target/riscv: do not mask unsupported QEMU extensions in write_misa()
>   target/riscv: introduce riscv_cpu_cfg()
>   target/riscv: allow users to actually write the MISA CSR
>   target/riscv: remove RISCV_FEATURE_MISA
>   target/riscv: remove RISCV_FEATURE_DEBUG
>   target/riscv/cpu.c: error out if EPMP is enabled without PMP
>   target/riscv: remove RISCV_FEATURE_EPMP
>   target/riscv: remove RISCV_FEATURE_PMP
>   hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
>     create_fdt_socket_cpus()
>   target/riscv: remove RISCV_FEATURE_MMU
>   target/riscv/cpu: remove CPUArchState::features and friends
> 
>  hw/riscv/virt.c           |  7 ++++---
>  target/riscv/cpu.c        | 20 +++++---------------
>  target/riscv/cpu.h        | 29 ++++++-----------------------
>  target/riscv/cpu_helper.c |  6 +++---
>  target/riscv/csr.c        | 15 ++++++---------
>  target/riscv/machine.c    | 11 ++++-------
>  target/riscv/monitor.c    |  2 +-
>  target/riscv/op_helper.c  |  2 +-
>  target/riscv/pmp.c        |  8 ++++----
>  9 files changed, 34 insertions(+), 66 deletions(-)
> 
> -- 
> 2.39.1
> 
>

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

