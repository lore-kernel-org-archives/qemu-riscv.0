Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A9C2BA15
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:55:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJWUA-0003eL-EB; Tue, 18 Jun 2024 06:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJWU9-0003dj-Aq
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2024 06:54:45 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJWU6-0001fp-Bo
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2024 06:54:45 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6f04afcce1so674314466b.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Jun 2024 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718708080; x=1719312880; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xgIw9IKUSsnidIbwU0XCTiXGMITo0Ef+Km6UW4Y49Fk=;
 b=aCF/d6nfyQ5Q/E4n0kz/gKvAxgGNZrpfaBwv4JTHxjnTOnrruB+YJBvKkcKqMa/17y
 SjBhFdk8pI0uuPfl7djQVDDvUnWl0JXAACTqudqZzAXacywrDE7AWXzWJTz3x3v90q0e
 GsdnGy8j59l3GJU2I6Z/ZOi3UAut9XbxmlZgzeTTpqfoYpMgH8OGkYauyOy0vTZRjAM5
 sOG6kdtGbdenis97fmqXj1NpqM8i+1rqm0tW/eDGqfMAGo60HpIBhGgPv53kHtPeFNw6
 0Zf+PJ110IhkzdDIu34vakkgmALSJdODAjKIN8KfasfBie9pmn1uGng2hG/Eq1+exwAN
 J1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718708080; x=1719312880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xgIw9IKUSsnidIbwU0XCTiXGMITo0Ef+Km6UW4Y49Fk=;
 b=liHPVnK/qQgtIUn4WcCxKi5YnfgYpL3L/hdHHa4w6FRIazvdulw/aIrC8v0Yi6cPlC
 WnTL8BIR9Qdd9ldaSugUzD18II6ppR4jCoh2+SgMWU6NTMkI8FqfbPCQJArr7PK5e4hz
 jfdKw5gDHHAeKyyBc35bvr95fcxtFHLJGIq818errjIIF5EeRhUEUlSOwTBpJ03NdgkV
 QLyuE0MClbHSX73N/G6IZl31U8JdUBpJSQ6Z0IYjKJa9J2C/JbHI5veojVqpdVy/PPe6
 mqmfzHm2OPzpm/FsHQpNP9hIcZqvL8K4b6uG0n8S4/oC7LWBQ6DaRU/X1oYSdnKu0a6v
 8M4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEaq0Is4KJSfSPSq8TAyaRQLMTnpU5BhXDu3HSKaPrhy6cUc2Wd00AFUiJd/2drVSY+AZf/b0cXcBuTKyG3GAZEmI1Q8E=
X-Gm-Message-State: AOJu0YxCqL46jYF1p76yT/JImXJ2yX9TZU5Y8vuTWjlglReEYcr7db3F
 U3VVvPWH/jM0jMplEe7oUKcGNpwWx7YzJ0bvL9ELC5Nrko1gVDV94kMq1coGHJg=
X-Google-Smtp-Source: AGHT+IGxZyGzG0jvmNQ4ewG7UzcAp3hQC312ZJdOYdHrBTypjKckzf6MmQlGUmP6AUsp7l3GaJ6Igw==
X-Received: by 2002:a17:907:c086:b0:a6f:6389:4aba with SMTP id
 a640c23a62f3a-a6f63894c9cmr1099538566b.3.1718708080320; 
 Tue, 18 Jun 2024 03:54:40 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f5f1c8d6fsm546611866b.0.2024.06.18.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 03:54:39 -0700 (PDT)
Message-ID: <dfa19fc2-b049-4856-b118-b7e5cc6a92ae@linaro.org>
Date: Tue, 18 Jun 2024 12:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/dma: Add a trace log for a description loading
 failure
To: "Fea.Wang" <fea.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
 <20240613013501.426905-3-fea.wang@sifive.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240613013501.426905-3-fea.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 13/6/24 03:35, Fea.Wang wrote:
> Due to a description loading failure, adding a trace log makes observing
> the DMA behavior easy.
> 
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   hw/dma/trace-events    | 3 +++
>   hw/dma/xilinx_axidma.c | 3 +++
>   2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


