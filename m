Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0094AC021BF
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 11:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnFuO-00018V-7y; Wed, 26 Feb 2025 06:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnFuM-000187-BG
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2025 06:48:58 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnFuI-00051Z-1D
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2025 06:48:58 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2fe96dd93b4so73026a91.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2025 03:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740570532; x=1741175332; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vup1rMKaLWkGyXhgxwub3Aeh3UgMy5iQuQYgcSV2obs=;
 b=E9pEIufhQDFFiKO7yI/l9H8uLr8hg8DIj9oJL8lzJ76nLKxO6DrSUZP2YgmmuM5ndz
 V7J8KsyK09CQHbfpvwXQ7GOljYr3A10XA7cn4zZZAAPY4vQw8XjWiBJVvZmEUcPW3tHW
 jy9QfcpN1Sq8nArfzvYrvBt14b0xbaLUTjaLKDyCraTG80nPmX4BUui8PeT/4gqdH6Nt
 UjvYBaPIRH0nO4dew22CKudMrExf+aSdnnhmtajER7Weh5IEVBRHq0ruvzy3SQqc12Ts
 Rgv3Zvqh1pKPAXH0MPeoya4wHxeeqvRr+wTEZnk0GQ4WmzI7PDZxozrYdj6EkqhXeNpH
 zyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740570532; x=1741175332;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vup1rMKaLWkGyXhgxwub3Aeh3UgMy5iQuQYgcSV2obs=;
 b=hvjyMbRE2XNu6emTVSRykrklJhiq9XEWSnVm/nxieDHK8ker6CWCxtmalxO5CGSVnN
 mh/7VTeFoAe6sLE/hUQxsf37PfFRjmMmJVs2qJmMwCGYN1iXLky0AMbg17QKxocVhcc+
 uDYfQ+WsUFy6xvq3eZqHq3OBV0kjZiuf+l2VJ1R8HwAo7mdIgIwyxZ4HI6OEZefu9u/v
 KPk3YX5vjiZVpjGhDQrTh3t3bbPkWM/GX6h1Hea90kaWjADWIpDSS5ABikH2fOQX0H9H
 DYFplgQLfOUNPizoPrhTlObYYqP/muD6JSBAD7LnEiErmFtFtOyOzSoSEAzfNZSs1hzN
 Ioeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnzyrycPBRaa6ixHmgCBTiCFqLz2H3J5zcyOYQrWqukLmFfchTwp1dPCsTfzObwRGxEO4TKjns6zzr@nongnu.org
X-Gm-Message-State: AOJu0Yxmjw/lrDofxIcMPaNYO0Mq2gyDnTO7rSTPooR5kBzFOfwr1tZg
 IA+QIdgHfeSWfNsB9dE/wDq8HP5lvGDsplT17EHLXB1J9poeHml8fLCwyPw863I=
X-Gm-Gg: ASbGnct4A1U0Tcsb035QpTV/WdobjTqg+qIkThQY/YsDC9LI05HkkzJkT5OSQM6t3qt
 ombP860b/jTZddwJWM27Yokg4ZcL7ekFhS8s5JtYmU+qiVkV25Zs/ppY8d4p3LMJKU+JGe3Uo1F
 vPVFZVjJM6XBTbO6F8uTpklGIl5Ll6TBxQkBwzl6OiNgC0St28B3nBdDH7+NuHqKsEV5td2Q2AK
 G7a6Z0pS8P7KIsW/gl0Sga59U/TxU7ug2usEviNr+KbviMjDis2X7HOL3+3fIGMZPom3H78/IgX
 HZKYE31HXNtmbuqcE0UcqFBBVYLh4jlVX7Jv8RAa9EnKzJPxSrXewSudpCiOXiqwZzw8stLHBsS
 KBafH
X-Google-Smtp-Source: AGHT+IHWPd8ufYHWLDrn8npfcVAuObzuAF7RCZ6vQtQvJnG3F8COqbeZDSrmN4Hvc4Gle8cgUFAqEw==
X-Received: by 2002:a17:90b:51c5:b0:2fa:2c61:3e5a with SMTP id
 98e67ed59e1d1-2fccc13d8c3mr41377284a91.10.1740570532361; 
 Wed, 26 Feb 2025 03:48:52 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:8aac:3850:3cde:f614:deb0?
 ([2804:7f0:bcc0:8aac:3850:3cde:f614:deb0])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825a95c5sm1403267a91.1.2025.02.26.03.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:48:51 -0800 (PST)
Message-ID: <6e072708-53ee-42ac-ac27-a938f8362464@ventanamicro.com>
Date: Wed, 26 Feb 2025 08:48:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/intc/aplic: refine kvm_msicfgaddr
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250224025722.3999-1-yongxuan.wang@sifive.com>
 <20250224025722.3999-4-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250224025722.3999-4-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102f.google.com
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



On 2/23/25 11:57 PM, Yong-Xuan Wang wrote:
> Let kvm_msicfgaddr use the same format with mmsicfgaddr and smsicfgaddr.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aplic.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index e5714267c096..5964cde7e09e 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -181,8 +181,10 @@ void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
>   {
>   #ifdef CONFIG_KVM
>       if (riscv_use_emulated_aplic(aplic->msimode)) {
> +        addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
>           aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
> -        aplic->kvm_msicfgaddrH = extract64(addr, 32, 32);
> +        aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
> +                                 APLIC_xMSICFGADDRH_VALID_MASK;
>       }
>   #endif
>   }
> @@ -403,12 +405,17 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>           }
>       }
>   
> -    if (aplic->mmode) {
> -        msicfgaddr = aplic_m->mmsicfgaddr;
> -        msicfgaddrH = aplic_m->mmsicfgaddrH;
> +    if (aplic->kvm_splitmode) {
> +        msicfgaddr = aplic->kvm_msicfgaddr;
> +        msicfgaddrH = ((uint64_t)aplic->kvm_msicfgaddrH << 32);
>       } else {
> -        msicfgaddr = aplic_m->smsicfgaddr;
> -        msicfgaddrH = aplic_m->smsicfgaddrH;
> +        if (aplic->mmode) {
> +            msicfgaddr = aplic_m->mmsicfgaddr;
> +            msicfgaddrH = aplic_m->mmsicfgaddrH;
> +        } else {
> +            msicfgaddr = aplic_m->smsicfgaddr;
> +            msicfgaddrH = aplic_m->smsicfgaddrH;
> +        }
>       }
>   
>       lhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> @@ -431,11 +438,6 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>       addr |= (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
>       addr <<= APLIC_xMSICFGADDR_PPN_SHIFT;
>   
> -    if (aplic->kvm_splitmode) {
> -        addr |= aplic->kvm_msicfgaddr;
> -        addr |= ((uint64_t)aplic->kvm_msicfgaddrH << 32);
> -    }
> -
>       address_space_stl_le(&address_space_memory, addr,
>                            eiid, MEMTXATTRS_UNSPECIFIED, &result);
>       if (result != MEMTX_OK) {


