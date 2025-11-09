Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684F6CCFA13
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 14:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vI60t-0004dX-HT; Sun, 09 Nov 2025 09:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI60o-0004Ps-PH
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 09:03:23 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI60n-0004Tf-5I
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 09:03:22 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so275603666b.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Nov 2025 06:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762696999; x=1763301799; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zS7AbEGMddZbuw+7JMZ27pbVDA9qbRJcIRYc7b4x294=;
 b=VtgefT/qFxywkrdScrnF9LgBa1sTaMYgcXG/Mb8DUeR3Zx1Wp6rgtQUrHPkWljzqkH
 0/cd1qvE3phC4nnCxPd0PRa0LgI1cZEtfdSTMXdmUyDhnGvbdNQIxqXlmi2oHfDRMxDt
 MY8NIUyhM6XHIW/0j0q9u25x0HH1jKllejXvf63w6IBu3QAv26KY8U7TU5M47o0F+5Hz
 +swXuD7bZZK8CIdyYXsK3wSFaoWH5G8w+gLKov40WTjvOIF+lec9gdPEoMSdq0bWgfJG
 4CJ60M0PbKav9lO6Ki4j58kopz6hGtvsoHom3zgs9SdMFLCvhyWdFWEEklFTsGX9W5E8
 RSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762696999; x=1763301799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zS7AbEGMddZbuw+7JMZ27pbVDA9qbRJcIRYc7b4x294=;
 b=Lt++1mKssJ/B7+OlGmA7EmsRe26/Ff09TRk6fFIJl++yMnRVXAugg9rrXzXJpiaBWx
 Ic2m1kbbTxxRGxztNb3Wu790Rhc/bndREB+nZefRLB7TreA2MD/c6HXON31W1qfuas0l
 7OFcVtPyt4i4h0OH9uyuviH2MUOPmKe5U8GyvU+RxEtMk75Mo+N33xPjK21Bl4CO+1sl
 nu/t7M82qTlvk1q7XRNpg7yfued03y1MkoOj6g/JeiRiSKD5D5uGOhNMy8mY8Cq2baxs
 YZLlrWXOHO0W62JdeMmU7xvbOawBNtFCQVCMKd+RefqhLOrtFd37F6f0uVNs/oc6qASv
 Z1UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU89sthVG/du6+Au8MMvUJT2GDzDZP4bMIiOwmiIcnJ3txoJEvXFNMl41Ms1yU0Vmyv27rBrQrRgvVZ@nongnu.org
X-Gm-Message-State: AOJu0YyUjZMQHhirLhxmJ4tviJOe0TyVygxVDFF4Cl1PgntgiT9I9zAo
 Z00oUe0Hyk82GqNmCm1PrVteQuArTYpSkKrdzXqanXlWOxcNriTizEEIBudTjATskUw=
X-Gm-Gg: ASbGncuSng4rApb1gGNLUYzPowNrStr7W+42bWH5TtA4i+2VAzijlp2ehlzRMTGMvsI
 tF7Z6gkGJOu6z6euWOPecIuOgd/914EWf6AcTyKyW4hygxAhJgjoKEGZUD/JZ7Yw8MZO0hozKWK
 67bscHqeRG13rcHNiSV78/vTfhmBl2Ij6zrOSAaTSh93vYsbj+63uBwWzpu+Njv4VWxNEFn5n/V
 owUszoBVJuQ1L5+uvpsf2C/a14EgJhRH3zsPw2ju5LZkLygGkUMPowm9ObDFphd9SoSwyQ9FsLR
 htNY6yENK+J1MeFSpww2+LZrywkJwPiPY9rmDnyPl7mQdI41LMZcai4IBD8KaHUlvOxp4Xcu5qO
 LgvucTF0/CbFfJJygKtxbHF3dS4PQcF3wqaxAip9/2RFet1aQsbxkJpG4dGL7dllWt7VV+LpL5j
 dsL+XXtQDxhy1A0d4MWnQ7Ljgtu4ickgD9PiknPkWYtNKBqdiIkWI4z+reTA==
X-Google-Smtp-Source: AGHT+IGCuPjCiT+eu1j7JxHX7JwxbFo1LD5zY2H9EFgLMFKeuIzXqJuLq5xVhXYfLTrm13s7LT+YaA==
X-Received: by 2002:a17:907:7e84:b0:b3f:f6d:1d90 with SMTP id
 a640c23a62f3a-b72e02b342emr472456766b.11.1762696999453; 
 Sun, 09 Nov 2025 06:03:19 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97e54asm806021766b.34.2025.11.09.06.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 06:03:18 -0800 (PST)
Message-ID: <420ca5b8-861a-4ec6-b64a-461707a48866@linaro.org>
Date: Sun, 9 Nov 2025 15:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] target/riscv: drop unused include directive in
 time_helper.c
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-2-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-2-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

On 7/11/25 11:23, Luc Michel wrote:
> Drop the unused qemu/log.h include directive in time_helper.c
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   target/riscv/time_helper.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


