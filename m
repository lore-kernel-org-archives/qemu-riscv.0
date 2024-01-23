Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E0AC47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 05:43:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS9ZI-00041U-6j; Tue, 23 Jan 2024 00:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rS9ZF-00040L-Vb
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 00:43:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rS9ZE-0007YZ-8k
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 00:43:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso43500755e9.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 21:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705988602; x=1706593402; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lyIiC1EIiQskfLSoDkAPudnvFPb58Id/R1RX4I7i1uU=;
 b=Ers4Tg+xDM1xtoWL8TFXQj1CA/6Z8RaKzzE7eNS3S7pS1IFi1pGGyiu1ghGjf0xdwz
 NPPkRh5Dbgm4Z6Y4D+kkiJmjuH0CBSGDGmTEs9VNyrkXWhe9ELAbiF06y2XGCgUnwyAN
 16OeklgNoCgIjmJs3nFujPK9L3pDL+N5dLm1CLhmdxYAOBxHVb8SNIdLHETbBmtr32zc
 HMOykoHejydf/yESVIeyKCrGeLycbdiJvUqeSdVnj7Vi530HkZ2oKH9hq9cFXwAeor/J
 BtRY0aaV0Mu+TgDCqb2whUbVg9lRNV1KuoKwFWvBJa4UyYqY6DQS0Iv1AGe3w4rWvYeL
 juYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705988602; x=1706593402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lyIiC1EIiQskfLSoDkAPudnvFPb58Id/R1RX4I7i1uU=;
 b=N7ITpqkH7rNOJ+dyBmd2POLbWEQlMMGlGUEWrWK7vzTXh7y2hM1iQfdLG3PFUTfLvG
 JpA3BBiDuEx9a5BOysJcM9CpFQ4qfaFdg2S0mqkBuAqp6bgeVXoOEOjohaprV1Z7jGEM
 iBfmNDAa8CC2M0MJc9IdfvG6XAxITKcoiJ+LvmcK5hc0l7o+haEOTKu/5c+jGo4UtZhr
 JYeX9CDBSR63ITomikEBVgQi0mYxmaRkVRovlNZz3LUlfeb4dbDBDlg7Fm3huhYJhpKo
 6d5TgsuYMoTAgSbMFVzNTVisBzw4nKqS7OPo/fMMybwY92iwDWGfKSFxmz5KpqpOy475
 q59A==
X-Gm-Message-State: AOJu0Yx5M4nmJ1+/XQtLJDw7Mdb+VXjsHTHX5KwjTzUNDFsCUneMYoCy
 ped0lsOHbBVnYLJfvRHJmKtUXglsNV+ieGnle5fd1e5//HFfPIekRBXIBttp6lY=
X-Google-Smtp-Source: AGHT+IGrZToKgn6ZXDHOyxq4nRmc6VnPbgd6V1B4eluB0fE8oZBVPs/53HJwiX8rI83tc86q7KSlwg==
X-Received: by 2002:a05:600c:19c8:b0:40e:4f81:3f68 with SMTP id
 u8-20020a05600c19c800b0040e4f813f68mr174026wmq.16.1705988602621; 
 Mon, 22 Jan 2024 21:43:22 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b0040e541ddcb1sm41322468wms.33.2024.01.22.21.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 21:43:22 -0800 (PST)
Message-ID: <687527ef-70c0-4cb7-bb3f-262e60556979@linaro.org>
Date: Tue, 23 Jan 2024 06:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] hw/riscv/virt.c: use g_autofree in create_fdt_virtio()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20240122221529.86562-1-dbarboza@ventanamicro.com>
 <20240122221529.86562-6-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240122221529.86562-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22/1/24 23:15, Daniel Henrique Barboza wrote:
> Put 'name' declaration inside the loop, with g_autofree, to avoid
> manually doing g_free() in each iteration.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/virt.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


