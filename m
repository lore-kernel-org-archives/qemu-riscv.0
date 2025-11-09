Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08992CCFA13
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 14:01:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vI5yz-0002Rr-Pg; Sun, 09 Nov 2025 09:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5ym-0002IZ-4h
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 09:01:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5yk-0003yy-4r
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 09:01:15 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b710601e659so347531466b.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Nov 2025 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762696872; x=1763301672; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q7uHbJVGqhREGBEbw2X+gQk3wl7ZTZUNiM46Y/Qff18=;
 b=gNPwlp8Os1xyempChrv+lf5/5uxOtDqvHyy1y34EjJSOhC+tlk63Vd9bzFs+Q6K1nj
 /a6a2rgtIojmNfq5nEv3xK+TDH9hPrtE5NR7FGS4PCG3cZvounwak55YWYqRVcW9g17Y
 6RRXPyhAtdbUCmsfLzyhsxMq2YTg/lrXQ3ytn+cveUHxKKsjZSvGvKm9GQtgAUjYYBwi
 36iCgmSxmkf5b92t111MSEswA3xqbWABEphoX9cbT/OBhDklUFpd+RtrAEUlDOTVziJg
 yE/R0TPL6X/8JvpoicrGPVp5YI4XSO+3b8aI/fcjyVGAWvIHDAMITpDKeS96q9ioGF6/
 mubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762696872; x=1763301672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q7uHbJVGqhREGBEbw2X+gQk3wl7ZTZUNiM46Y/Qff18=;
 b=UmE3vk7JgF0OT3nrGHNTpq7Y80oAI7my94vFIRFRDGA9P0Ay4TFY0mpK3psJVcTR8U
 p7op7xnMpUfzVghM7IX9288POgEEMr0zQfOmSqD9v9H3KzZILB0ScSAbAU2WQ3OR0jB/
 W1YU/Frh13eDk9h5NeBZ/PUgnFL0SLtc2wsUW6rlXw3GaDjOCbLFP1/Hdr6lryK0LYvO
 ML4xS76dp1+tgZnaTuauzH8TH0EJcE1JzWTqpv4izZXisvioHl+sLnUikZ3PoBAsAJgE
 IOUcDjlguh/VRfX8R6emb9HL8hD2nq+85F4Z+Ic9eqFnTbtKV55Eo7BQP69YpryH5Vgj
 gGGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlwuvvmoaWW1f+8f3SB3MQInctoMAhTWfQ+B4XryBZJ4qUSNZzAgzTBOYByQ9FUIIc2s+HrocOXTo7@nongnu.org
X-Gm-Message-State: AOJu0Yy5oMliBUG88jiREKG91kftrd2W8F7aRQ2nMUl6P3o1PWCdMgaA
 DjG2vqe+koHYW5YtzJPkOEg9tP3lNlE4mnQUxpOZpLAtgZwd+oL5pmXbii7/F4G1ZJU=
X-Gm-Gg: ASbGncvk2uhpSUir88LcpNMsnoUpq+dDK2W82tOJnQtMFSoSnl+UHTqHxktQC/gJFhD
 DoP8Cl6/moKS/K4V01eFhUqqm2upi2vK7st9DScbiLSi3WyJbyoP8pgpjNJ2/QR+r2mf3ECw/si
 73v3DT0HYmcpadS8ZCSxmbJp98FmEPrSU/bdycbbZ92Q7bisVhCWKL4q2j1HlzajAWUlCAi2+58
 d+hXfbkslck+dTtGUhYd8N112J080H9cVcvWHak+/Wjeoktx79FyE8FaeOmbrwB42e6RNgnoRUL
 b5MIIhR/WXX1FBLnkW7pE4Td1QTpMLru2kYPAhN3VcZddM1PK8W6sn5fQ5L91teuu+k2Q0tq9O2
 VkwZ9rb+i1zzQwBXo5R0W552Q3VWtZ4wXIHy6Ss2in6nIdN27ayyDgmYq+hfeAZCH3RdyX8C3p0
 J5R836UbmlkrEIvqCVaORLzeTgv/pn0HjkQZWN6XhN6YFlz2O7FJcex57Fkw==
X-Google-Smtp-Source: AGHT+IEcPv+thLGo6KDe7lVOpO77zeE35E2PFHmmrRaK+7Jv2QnjElSOJGuex3A+OuFkV6uHC1ODNw==
X-Received: by 2002:a17:906:7309:b0:b70:8519:44a3 with SMTP id
 a640c23a62f3a-b72e02b33b7mr490602766b.21.1762696872478; 
 Sun, 09 Nov 2025 06:01:12 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa11367sm799597666b.68.2025.11.09.06.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 06:01:12 -0800 (PST)
Message-ID: <efd13f61-d14d-4016-b187-6917ce37bf80@linaro.org>
Date: Sun, 9 Nov 2025 15:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] hw/intc/riscv_aclint: implement the RISCVCPUTimeSrcIf
 interface
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-6-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-6-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

On 7/11/25 11:23, Luc Michel wrote:
> Implement the RISCVCPUTimeSrcIf QOM interface in the ACLINT mtimer device
> model.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   hw/intc/riscv_aclint.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


