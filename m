Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946DC71157
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 18:08:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uRxDJ-0004eB-2H; Wed, 18 Jun 2025 14:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uRxDH-0004dn-Qb
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 14:08:44 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uRxDF-0004FL-Pz
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 14:08:43 -0400
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2353a2bc210so64693215ad.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Jun 2025 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750270120; x=1750874920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/9rBicfpfl4Sx/ypeGsUH+JY0WO2czGDRGsQNylkssE=;
 b=V2VjG4WQK5uVr+d5ErEd1mbnYUGcpI/ZQ1izXEVeJtGlrhzaqj9qYJpDGa+wvVonTH
 EXjpvLM8RpY8dYdJAVhAONOkY4GVocBfS0d1YXNYqgtU0f5tJNWgOPIjJc9fhTIanUH/
 icGR0mXZenNgUoCLsadkFVEg1z5LyONq57PhnQlg1mODmB3WmLFzV7p3JFeLo3Gcb390
 thGE5L0sw0z1jH46G2hBwgrUT6tsq/sAW11PWE7UB3y+p2GLDBFJJ2IBzr0RbizKCuEf
 nYXRqoHGZv4aO2WnfviELDRiGuesMdfjk6M53AXDrBeaivTdVyOsKX6Q2OLrVUrxvSes
 ZJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750270120; x=1750874920;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/9rBicfpfl4Sx/ypeGsUH+JY0WO2czGDRGsQNylkssE=;
 b=OyEzkc3rh8Shr+MKG4aHK17AkzmiV5np36eNJ4u3j2iJoIbjxGhH6577V9NSZGmWZ7
 bOQSHWqc1WjV6dstR1V+IYNaZJSBqgdwuNgfg0NXTTi8D4Udc4Ke0tPc9JWrviAzqQoM
 T/BiSNW8dioUN/RklaxGYpbjPg2wzYmQ4eaupbotLDADq3b5/qeisc63VtQ2oqWQjj5E
 5o/JYBeA5oqgK5IIWfZE36Db24+H0hhtpbnKhXsLeLsaCefF+1cvluMnf2o2F6xPZFs9
 H3GQOl9Ge8PP6YcZDTSrSZciQv4YVGLOYvVo7kyIHeGbQ2UZVwyo8rGGaEax0GSe44XU
 cF8Q==
X-Gm-Message-State: AOJu0YzZ8tOPK0NCY46iM9D4AYi4Hz/zELVCRk64SO4isF79YI7lrFiT
 PrQGU1P2Bv+asWvI/3bKPRNzu+uoWjHLqi6hl/bXf/WCAxs/6ezQFfKdwcR/tvrMbK8=
X-Gm-Gg: ASbGncsc3c+SWrZQ1eV1teB7M/XsfXxXn7IuJTT/z6R8/Lt7h87CWGScO72KUx9xqxJ
 X7cdAZWf5+H0sgNYL0vGRWEayLt+7ii26TGCds6hymsoCEHml2i2UlKV/pFFN0duHzkDJy/GqjS
 MJm1Q9ZBlys5WqD69z5+KCRxSxa8P4r7WYE/farz3nlXz8huQZvovBobpFXHvhFBOOk2ANXR7JK
 GP8F71WvDtMt263LFJp8MHbWgzrAAVsSMX4r7BSfBb/QWxAsa9lU2iZDphgp5tDUMxUQ3w3Lwsv
 IQF8ceu1muqdFy+0J9l/CHr/FZNKLnOzTmOPEsY1EhnD46XqPmNYjgOnPdF2HWWgAplZRtIf9Go
 Q
X-Google-Smtp-Source: AGHT+IGQD040TkkrZPQpQqwC2aLl3xiJii89CwvFru2LJvCe+uCgW0BuW7hHaKi6P4w0dzJ+f8ca9g==
X-Received: by 2002:a17:903:41c1:b0:229:1619:ab58 with SMTP id
 d9443c01a7336-2366b3e3879mr290517395ad.43.1750270120044; 
 Wed, 18 Jun 2025 11:08:40 -0700 (PDT)
Received: from [192.168.68.110] ([191.255.35.152])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea88desm103478095ad.150.2025.06.18.11.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 11:08:39 -0700 (PDT)
Message-ID: <f81499ac-b10a-4ef1-a380-8425e3698e1b@ventanamicro.com>
Date: Wed, 18 Jun 2025 15:08:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] hw/pci: Allow explicit function numbers in pci
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250618122715.1929966-1-djordje.todorovic@htecgroup.com>
 <20250618122715.1929966-10-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250618122715.1929966-10-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x644.google.com
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

(CCing Michael and Marcel)

For better visibility I suggest copying the maintainers of hw/pci/pci.c when
submitting this patch in the next version:

$ ./scripts/get_maintainer.pl -f hw/pci/pci.c
"Michael S. Tsirkin" <mst@redhat.com> (supporter:PCI)
Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:PCI)
qemu-devel@nongnu.org (open list:All patches CC here)


We can push this via the RISC-V tree but we need an ack/review from the PCI
overlords.


Thanks,

Daniel


On 6/18/25 9:27 AM, Djordje Todorovic wrote:
> Since there is no pch_gbe emulation, we could be using func other
> than 0 when adding new devices to specific boards.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   hw/pci/pci.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index f5ab510697..23f7f02837 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -974,14 +974,15 @@ static int pci_parse_devaddr(const char *addr, int *domp, int *busp,
>   
>       slot = val;
>   
> -    if (funcp != NULL) {
> -        if (*e != '.')
> +    if (funcp != NULL && *e != 0) {
> +        if (*e != '.') {
>               return -1;
> -
> +        }
>           p = e + 1;
>           val = strtoul(p, &e, 16);
> -        if (e == p)
> +        if (e == p) {
>               return -1;
> +        }
>   
>           func = val;
>       }
> @@ -2045,13 +2046,15 @@ bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
>       int dom, busnr, devfn;
>       PCIDevice *pci_dev;
>       unsigned slot;
> +
>       PCIBus *bus;
>   
>       if (!nd) {
>           return false;
>       }
>   
> -    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
> +    unsigned func;
> +    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, &func) < 0) {
>           error_report("Invalid PCI device address %s for device %s",
>                        devaddr, model);
>           exit(1);
> @@ -2062,7 +2065,7 @@ bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
>           exit(1);
>       }
>   
> -    devfn = PCI_DEVFN(slot, 0);
> +    devfn = PCI_DEVFN(slot, func);
>   
>       bus = pci_find_bus_nr(rootbus, busnr);
>       if (!bus) {


