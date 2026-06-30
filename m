Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EF2C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weV7Z-0000t8-TX; Tue, 30 Jun 2026 05:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1weV7X-0000sL-Sn
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 05:51:11 -0400
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1weV7W-0007VP-6B
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 05:51:11 -0400
Received: by mail-dl1-x1242.google.com with SMTP id
 a92af1059eb24-139aff562e1so6291020c88.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782813068; x=1783417868; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PuwT+40p8Ncw0WSvw5XunlmB2nELyR9qPqsq5qUHSHk=;
 b=Pw9VwarlQ2szNUY3VgiQKl9UeygfXUwYjSPofoIgQ4cns10KdB9VglCbtqNSpPvJk+
 BAUq4ITY8LUTHgCXdoDF/aCwkHi3LT7+fQqRfpwy11UyWRPs37ySVa87BVuMTnrRHVIj
 47IdxkAp/kgllp+LLyk0QvNXXCnATQT40faC0SICOpw1BPCN4pnz9imlXPUIDoP+xAq6
 po8lbu4WvfFj2+rB4MyGrVdzaAOLXTmVZmCkdzr0H+SP2R6i90smBsPA9Ukz/Az0Zdso
 RW7p+R9SZaTy0fmbr2YSaYZEmmypjbVzcBQKAnxZlNKJaxoyzXWyhHkIXDW4OQCl/SiA
 ntOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782813068; x=1783417868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PuwT+40p8Ncw0WSvw5XunlmB2nELyR9qPqsq5qUHSHk=;
 b=Nj1m3DHHXkhwVOAoMpNwGJzNqqB30+hEfc/EG9DJUmBgZyXir3kxUT+QLl8EhhfrVj
 ulD/pggfyObFaIQKxxMa7cAHCz/oH9SFA0AGbSykB78cAOjDXrP0bsWuTacMyi3VMn4b
 NgW1UnkAML/0cxMI/VRwcl3qEdaao2YTBBi+bOBCkwJ1KM83495siUGuO2CeO0yD6cuD
 yT//IPwzWeNWFfJ/0SDRWkWnQtgXccvyGi+K4SsyK3RbXYCzyZ/b5J3ovEMqCDYrA/Ko
 MhIv8OFEOwkogM3VBqot9X/2zgtLf9sntsb3PRKIIB0j/Gey/fWM9kSYSM6X338YQbNX
 LITA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDMBeH5Thrzry3RoKc3IBeqTWJ9PCw/tJ9N2+ORafqVnDugSvcqQfLNYwb7xi7s/1x4si+p6x071sY@nongnu.org
X-Gm-Message-State: AOJu0YwhVUwvoFjkZyEDrFxed7hMNUaIwklA4dKZlrhJ0FgM7v5Q9Ecv
 mSzzD06qE67tUGhzfJvdFsClWeQPYT21NNxbwgusBWcqwK1QF/k0ioUb
X-Gm-Gg: AfdE7cmUlaZ76keAAn55ww+A9jSAkXHO1oSJQ6ouAX4XPEweL/ZC1QoSgx4/JdlD/TC
 I2Yfof9yshXuGfFOjYViWApEzedzbUquYrwLGQxkhANezHfZzMWQQ+jd27laGsWoT8RnukDbZeS
 GLcs9ZyKxCOGl3hVdTsWJsAm3/+jOxacFEXJoubmDHLRERMqekWJoOPMda2IDgkNdTvB4lly+Ol
 kcmFFQ6b0ZQYa4dVsjCrCu83HJVW/v07jhjxmA/a9TutkNHNOaZl4d96U9BTb9JQHxyOruSgJt/
 t5/JfZEZx9+XP8NFcehPgcH+7Wfba040Go47F3k3U3FxmQNruZrv/dkpFToCC5b1iJT7oTaurgJ
 tRSvbhmE1zKGKEfYeTSrd+jH5g0lsq9e+oenQeYrZMrGyMMQz9lzU5pLDHsOtq18t1ztud1x2Fl
 iw3NaCzuCqdJUIDFSHKiJYlhT/WJ/8DwkBNvkvpN1mAxTLd/UPTSmcycca2qI=
X-Received: by 2002:a05:7301:5f16:b0:2c7:3a7:c792 with SMTP id
 5a478bee46e88-30ee1449de8mr1890094eec.20.1782813067941; 
 Tue, 30 Jun 2026 02:51:07 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30ee300b286sm6662226eec.12.2026.06.30.02.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 02:51:07 -0700 (PDT)
Date: Tue, 30 Jun 2026 17:51:04 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 andrew.jones@oss.qualcomm.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Tao Tang <tangtao1634@phytium.com.cn>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] hw/riscv/riscv-iommu.c: fault when !PTE_U and no
 priv access
Message-ID: <akOReiE7gKpytry1@ChaodeMacBook-Pro.local>
References: <20260629121334.567587-1-daniel.barboza@oss.qualcomm.com>
 <20260629121334.567587-3-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629121334.567587-3-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1242;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dl1-x1242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jun 29, 2026 at 09:13:34AM +0800, Daniel Henrique Barboza wrote:
> All IOMMU accesses are assumed to be user mode unless told otherwise,
> i.e. we have a process_id.  In case we have a non-user mode leaf PTE
> (PTE_U isn't set) and we are running in user mode, we need to throw a
> fault.
> 
> This also reflects on qos-riscv-iommu tests: the tests always run in
> user mode so our PTEs must have PTE_U (bit 0x10) set.
> 
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3553
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  hw/riscv/riscv-iommu.c               | 8 ++++++++
>  tests/qtest/libqos/qos-riscv-iommu.h | 4 ++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 453601d7a5..e6d2ca94bc 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -297,6 +297,7 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>          G_STAGE = 1,
>      } pass;
>      MemTxResult ret;
> +    bool pv = !!ctx->process_id;
>  
>      satp = get_field(ctx->satp, RISCV_IOMMU_ATP_MODE_FIELD);
>      gatp = get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
> @@ -470,6 +471,13 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>              break;                /* Invalid PTE */
>          } else if (pte & PTE_RESERVED(false)) {
>              break;                /* Reserved PTE bits set */
> +        } else if (!(pte & PTE_U) && !pv) {
> +            /*
> +             * All accesses are assumed to be User mode unless
> +             * process_id is valid (pv).  In case we have a
> +             * non-user mode PTE and !pv we need to fault.
> +             */
> +            break;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              base = PPN_PHYS(ppn); /* Inner PTE, continue walking */
>          } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
> diff --git a/tests/qtest/libqos/qos-riscv-iommu.h b/tests/qtest/libqos/qos-riscv-iommu.h
> index 90e69a5d73..c218e9d66d 100644
> --- a/tests/qtest/libqos/qos-riscv-iommu.h
> +++ b/tests/qtest/libqos/qos-riscv-iommu.h
> @@ -54,8 +54,8 @@
>   * PTE masks for RISC-V IOMMU page tables.
>   * Values match PTE_V, PTE_R, PTE_W, PTE_A, PTE_D in target/riscv/cpu_bits.h
>   */
> -#define QRIOMMU_NON_LEAF_PTE_MASK   0x001  /* PTE_V */
> -#define QRIOMMU_LEAF_PTE_RW_MASK    0x0c7  /* V|R|W|A|D */
> +#define QRIOMMU_NON_LEAF_PTE_MASK   0x011  /* PTE_V | PTE_U */
> +#define QRIOMMU_LEAF_PTE_RW_MASK    0x0d7  /* V | R | W | A | D | PTE_U */
>  #define QRIOMMU_PTE_PPN_MASK        0x003ffffffffffc00ull
>  
>  /* Address-space base offset for test tables */
> -- 
> 2.43.0
> 

