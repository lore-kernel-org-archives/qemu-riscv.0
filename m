Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCBAC52D73
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 21:41:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1scAsH-0002aN-3I; Thu, 08 Aug 2024 17:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1scAsA-0002Yt-3A
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2024 17:40:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1scAs5-0002pW-Lf
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2024 17:40:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1fc47abc040so11872305ad.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2024 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1723153231; x=1723758031; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DHArUNFGDWjSdzFvX0OcFBbySnBz20hOWaa8VBmMDs=;
 b=Y54y0NM1YpQdmG4eWX3AUnGddltfrEo4qkdKvCKZA7uxxeoXPL9HhynHwKRTuNoLMR
 At2kC7IYa6zVD82DnDO7Kt+Xb8mk957zWMGlVPLoV6cffANA46IBM0SklXIWf6XthDwH
 HNnVcgv9B0cnR9UoJ7nwLLUmtoGaGkpY4nkGtEQnZdQcEg/mnOOW0lrgBpDC+Kwcbxpn
 YizplcMhLJkmnm5oBkGhV8akEH6k7MNGhTEMQWuu+yX+22/KyJfirS2Ew+a47iZ+uGGn
 c04omEqQ+PTA+DxsbTHIcFft65wLSx1po2nACuTEivF+/223aW6W9+9eQ7jHaWv0jacO
 s84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723153231; x=1723758031;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DHArUNFGDWjSdzFvX0OcFBbySnBz20hOWaa8VBmMDs=;
 b=HFHpNseY5D8TBOZmpUOIRhxd/zlWkqBLBHrH2PCSliRgTF5h/9zlzlZyaXL7bAensJ
 RN4cLz+F7Tx0tE5zT7yv1TU20ViLWUWgnPxXogFO2tdl97IjJIDEPTmAnOugVIs6ef/l
 AArpZfJaF4Sfgha6u4vDBJr2OAQUu89EFr/eFe12s/r1gq1ZTA61Vs/BiX36r2HgPYHi
 xlBDIMwCdI5caApm8ysKtgfGAyyvyDcwiEupAYFCjeNCelyihH4xv/kwT4REjb+DUPgL
 RQ1xsJlD5gZLXJniK7fsy2eCgnCiXdDf1Zz3iDvhJB5ckOuS5tQf3yJ0M5MkKt3DQO47
 /I8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLZS3Ot5py8jSy7ZvsPoAzfeuJ5MEvNoLFhV42Be8dW2BIVYLaJUfZ+pUtSHLJyg9dN2cgj71ruKjcesgOfOxLNeNvbrs=
X-Gm-Message-State: AOJu0Yz/54Tkxe9K2H5xz7Ax/WGLcIXWwRGMbpHu/JpB9reQOJxxlAeC
 32AwiE/nrcagyaTOJOIWJneyxBFv5ykcP6mR9w5NvSpWe+V4pWCOucwu1H5zAJk=
X-Google-Smtp-Source: AGHT+IEQYhDdH1NW+E8f+7eSP3RFG1z4KUHCQ4BfbnNEBmgIPMfyalqHj43OukoQc50fBnkyaivg1Q==
X-Received: by 2002:a17:903:2308:b0:1fb:59e6:b0e5 with SMTP id
 d9443c01a7336-200952b6dcamr38852055ad.19.1723153231551; 
 Thu, 08 Aug 2024 14:40:31 -0700 (PDT)
Received: from [192.168.68.110] ([177.18.66.246])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f272f0sm129591345ad.4.2024.08.08.14.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 14:40:31 -0700 (PDT)
Message-ID: <aad11c6d-8c5d-40bd-8b0d-3dae10b80d4d@ventanamicro.com>
Date: Thu, 8 Aug 2024 18:40:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/intc/riscv_aplic: Fix APLIC in clrip and clripnum
 write emulation
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>
References: <20240808082030.25940-1-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240808082030.25940-1-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Ccing Anup

On 8/8/24 5:20 AM, Yong-Xuan Wang wrote:
> In the section "4.7 Precise effects on interrupt-pending bits"
> of the RISC-V AIA specification defines that:
> 
> If the source mode is Level1 or Level0 and the interrupt domain
> is configured in MSI delivery mode (domaincfg.DM = 1):
> The pending bit is cleared whenever the rectified input value is
> low, when the interrupt is forwarded by MSI, or by a relevant
> write to an in clrip register or to clripnum.
> 
> Update the riscv_aplic_set_pending() to match the spec.
> 

This would need a

Fixes: bf31cf06eb ("hw/intc/riscv_aplic: Fix setipnum_le write emulation for APLIC MSI-mode")

> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>   hw/intc/riscv_aplic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index c1748c2d17d1..45d8b4089229 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -247,7 +247,7 @@ static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
>   
>       if ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
>           (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)) {
> -        if (!aplic->msimode || (aplic->msimode && !pending)) {
> +        if (!aplic->msimode) {

The change you're doing here seems sensible to me but I'd rather have Anup take
a look to see if this somehow undo what was made here in commit bf31cf06.

In particular w.r.t this paragraph from section 4.9.2 of AIA:

"A second option is for the interrupt service routine to write the
APLIC’s source identity number for the interrupt to the domain’s
setipnum register just before exiting. This will cause the interrupt’s
pending bit to be set to one again if the source is still asserting
an interrupt, but not if the source is not asserting an interrupt."


Thanks,

Daniel


>               return;
>           }
>           if ((aplic->state[irq] & APLIC_ISTATE_INPUT) &&

