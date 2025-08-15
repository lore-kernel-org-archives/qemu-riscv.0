Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF0ECA0ED1
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 21:12:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1un1iP-0006Li-GE; Fri, 15 Aug 2025 17:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1un1iN-0006LP-WB
 for qemu-riscv@nongnu.org; Fri, 15 Aug 2025 17:11:56 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1un1iM-0000Ya-4T
 for qemu-riscv@nongnu.org; Fri, 15 Aug 2025 17:11:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-32326de9f4eso2241839a91.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Aug 2025 14:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1755292312; x=1755897112; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/5HWQziECJRtdMVOtPPlR/b7wS4brht4dv5dM0Wb5PE=;
 b=kSZ8ew1gQNimadpweQmRP2hlkRETgmSNaCCVk3MrS1yMo4wlMJQiDw+yrY3PT1YFTv
 p5IVf1QXHz79TLK848WEUvCk3266X1J6p3vkICyXHfoWc5fcZPhO3EBeHvXlevAVO5lX
 N7DIe5fsuvdA/I1c70C+CWW4EG9I7z2ee9Udpi9bwOlTBrHWkIWpPCVIu/dE6xfv5uJf
 RMd23xVrTbAbEv8iCoF/UnGQCXLPDNPI+YDhVMjR2xlcGPcve5nmVQ0FMz9a8dUdW/3C
 xefLiFvN7vm5Kb55ixMkHEu19Lp8i3kXXirJqzMQ3vUePEIQloa+M2g6diUIRN8NQQ+E
 ukaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755292312; x=1755897112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/5HWQziECJRtdMVOtPPlR/b7wS4brht4dv5dM0Wb5PE=;
 b=HrrkKvIj3n7GxgpCk0ooXldCV3duHlM600vZKqWc6c/k3dK60d2fy7VcaVnjZPfuda
 HxGf1XZeEu51ECeJFoAzKd357GQT5n9sn9BdAnU1I9RpII7s4OiX+BdKAumP422MftlG
 IX+c5OD4B9VQ93jXViipU/UZhXeTIs9NBYPYURoAH/cS+jF8GqGLPce12w8JYEy8eXLJ
 ZDRCgKQykgyYsS95HMEQi0fKpUkYch6d2uM0nEp4oYyGI3sUe9qfH9S6P+jPpDZaAq5e
 BhW9922T6FsCVAJcYVO6X1MatjQFbI++ji8wwNUynkB0m4Wo5H7+lOkcFrjJpi2JePpo
 2CHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLYcVlBd3QLCfyiilaVfhe0QXyDSBLtTU0nJzQPBReNvT7CqKbb+0HUwBRyr4PJCNzahpzjygWlbdm@nongnu.org
X-Gm-Message-State: AOJu0YyfgtAgy9khkMMqG/plQr9bYrDhcEKQ8Fodo8v6yFC6GSEeF1AS
 j34LkOYZxWm9I+QDgIjbYpzeofUF2yOP7GnsMXToUmoeSoctI5Wl3OUqmdS7Hz+xzYA=
X-Gm-Gg: ASbGnctPJooOg54Y0vq4yclPxmdjJS7Zs1Tax1aNnmL341i1M//5cnaDeqRlh8jV3ZN
 XtGTqI/en7F9i/Bfw877XilQ6dgkB82bM6LEK/jGtpc/QQKrAD8VwkosE0Z/FKpJ2CVVogQysk/
 qAFQEMZfJ+pjZo03pQvSICnTbrP0Qi76C0QfaByBgjSZxkgJAWjQK3tZbrU+q5YshzO/K4pkT3v
 4TMk+M6D8pyGAhPl5Hc6t4/4OUPS2WDHcTA6RrwbY0NCaLi+Pppne6dJAkBfEVqtMaltc7ZL6xL
 G/JltsgqfBtQSsfHY1GUuKgrO1qhpJeVqDz437fNDAY/cPPMHurIk2MJZNOni+pPN39hong2sk/
 nEiQlizsi10hEHmx/k2JddWLE+ZXgcHMF2Ao=
X-Google-Smtp-Source: AGHT+IGHzw04imB332ZpKqEA8xkfrnZaEIo6ytQ3eK/yhTBnYD0V9Dvd8u9SV7dUxtG2ePX8DHVu8A==
X-Received: by 2002:a17:90b:4b4f:b0:311:ef19:824d with SMTP id
 98e67ed59e1d1-32342163f5cmr5472025a91.2.1755292311692; 
 Fri, 15 Aug 2025 14:11:51 -0700 (PDT)
Received: from [192.168.68.110] ([189.38.141.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b472d5d73b0sm2085957a12.17.2025.08.15.14.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 14:11:51 -0700 (PDT)
Message-ID: <4dc77180-a923-449c-b053-f46e592b74f2@ventanamicro.com>
Date: Fri, 15 Aug 2025 18:11:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aplic: fix mask for smsiaddrcfgh
To: Yang Jialong <z_bajeer@yeah.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: yangjialong@rvcore.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250811034454.189208-1-z_bajeer@yeah.net>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250811034454.189208-1-z_bajeer@yeah.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

LGTM. Tested in an Ubuntu 25 RISC-V emulated host (virt board, iommu-sys),
  with IOMMU enabled and a kernel that has VFIO support. Passed through
an e1000 card to a KVM guest, everything works as expected.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



Thanks,

Daniel

On 8/11/25 12:44 AM, Yang Jialong wrote:
> 4.5.4. Supervisor MSI address configuration (smsiaddrcfg and
>    smsiaddrcfgh)
> smsiaddrcfgh:
>          bits 22:20 LHXS(WARL)
>          bits 11:0  High Base PPN(WARL)
> 
> Signed-off-by: Yang Jialong <z_bajeer@yeah.net>
> ---
>   hw/intc/riscv_aplic.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> v1 --> v2:
> - fix calculation of MSI address.
> - In Supervisor mode, lhxw/hhxs/hhxw fields are in mmsiaddrcfgh register.
> - And lhxs field is in smsiaddrcfgh.
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index a1d9fa5085..2dd54cafaa 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -96,7 +96,7 @@
>       (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
>        APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
>   
> -#define APLIC_xMSICFGADDRH_VALID_MASK   \
> +#define APLIC_MMSICFGADDRH_VALID_MASK   \
>       (APLIC_xMSICFGADDRH_L | \
>        (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
>        (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
> @@ -104,6 +104,10 @@
>        (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
>        APLIC_xMSICFGADDRH_BAPPN_MASK)
>   
> +#define APLIC_SMSICFGADDRH_VALID_MASK   \
> +    ((APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
> +     APLIC_xMSICFGADDRH_BAPPN_MASK)
> +
>   #define APLIC_SETIP_BASE               0x1c00
>   #define APLIC_SETIPNUM                 0x1cdc
>   
> @@ -409,13 +413,8 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>           msicfgaddr = aplic->kvm_msicfgaddr;
>           msicfgaddrH = ((uint64_t)aplic->kvm_msicfgaddrH << 32);
>       } else {
> -        if (aplic->mmode) {
> -            msicfgaddr = aplic_m->mmsicfgaddr;
> -            msicfgaddrH = aplic_m->mmsicfgaddrH;
> -        } else {
> -            msicfgaddr = aplic_m->smsicfgaddr;
> -            msicfgaddrH = aplic_m->smsicfgaddrH;
> -        }
> +        msicfgaddr = aplic_m->mmsicfgaddr;
> +        msicfgaddrH = aplic_m->mmsicfgaddrH;
>       }
>   
>       lhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> @@ -427,6 +426,14 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>       hhxw = (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
>               APLIC_xMSICFGADDRH_HHXW_MASK;
>   
> +    if (!aplic->kvm_splitmode && !aplic->mmode) {
> +        msicfgaddrH = aplic_m->smsicfgaddrH;
> +        msicfgaddr = aplic_m->smsicfgaddr;
> +
> +        lhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> +            APLIC_xMSICFGADDRH_LHXS_MASK;
> +    }
> +
>       group_idx = hart_idx >> lhxw;
>   
>       addr = msicfgaddr;
> @@ -771,7 +778,7 @@ static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
>       } else if (aplic->mmode && aplic->msimode &&
>                  (addr == APLIC_MMSICFGADDRH)) {
>           if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> -            aplic->mmsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
> +            aplic->mmsicfgaddrH = value & APLIC_MMSICFGADDRH_VALID_MASK;
>           }
>       } else if (aplic->mmode && aplic->msimode &&
>                  (addr == APLIC_SMSICFGADDR)) {
> @@ -792,7 +799,7 @@ static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
>                  (addr == APLIC_SMSICFGADDRH)) {
>           if (aplic->num_children &&
>               !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> -            aplic->smsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
> +            aplic->smsicfgaddrH = value & APLIC_SMSICFGADDRH_VALID_MASK;
>           }
>       } else if ((APLIC_SETIP_BASE <= addr) &&
>               (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {


