Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7FEB64D8
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 05:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9IsG-000686-Na; Wed, 14 Jun 2023 01:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Is3-00063H-C6
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 01:16:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Is0-0001JR-Qo
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 01:16:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9b1so3008855e9.3
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719792; x=1689311792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qj61P99PMz7Bwj7U991Mjm37+0kIZapr3a4VZrigir0=;
 b=xsmzCKwBpFPriRVOKvEcsL6CG8/+fvkjmxU1fLTKJ1aOyxrXRj+bF39zMVqdH5o9bY
 3P/n81L0HBj03l+MS7jV2gXPLq5QG/5GwE1KLwVB3JrhCWC/y92/JGrFwvU7TN5rAeZ0
 CTZSlhZ0kF6JLwmxK3UlB6j/JbtZIs3UK8Dplg0gNS3Z4+T0tmBPxBORhnVKGZMaLA9W
 sNvp3y2maKgfCL/54C7wHHV7SSA4qS0C3zR8AUdG0e1BqCiOrJglrPU1bZYJkYVjPNp7
 x4JA63vNqz+tO4GqtYCAkrOrZ+geqMBEugza8F+WlQ8BHPV5zHgHTpKr6gbF5CPj2GWm
 ScDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719792; x=1689311792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qj61P99PMz7Bwj7U991Mjm37+0kIZapr3a4VZrigir0=;
 b=fMWquPdmX8dM5La4wZMR+ijxhdOi/LNyrCgtI9p6nriTtJhkpvkkUyC6gj3Y2H2fIE
 x8uPQ/O4yMI2KbyoIthsI8oXmn2Mx13KPeOsPkUWLYwIES14a47c8VFmYvTgDEc7TTGv
 4DFvglDO7BMQPuShU4RGlVcq74goKdELEnA/ijFLu0hv0jYW2UiJsq0NNN+vbX11AoI6
 ALedxuFtMk/xwRDH+iZQDFDteyhAfhdyjk5dKQgdxCjvIVnYJChR2VrYcIID/wioHv0q
 C/EKlohjO5/rgeTotRVcLQ7X1Oog9+iOQowlUf0mjp0fZmDGixLDPb/YHZuf4ZmBVsJh
 pGjw==
X-Gm-Message-State: AC+VfDwsSm9O6decBaOB2tytu2lJSrYAWXp2AYV81r4FXcr3sNH1fuH7
 ZR5jpMu4xgAM0n1jbvzE9SAywQ==
X-Google-Smtp-Source: ACHHUZ43eA8S57a47YbXnkfzIsnlkAn+NXb+jNccTbyf4EN8m1mEx3gOtuG1Re/aU0ZfTT3hocicGw==
X-Received: by 2002:a05:6000:181:b0:30f:cd95:a603 with SMTP id
 p1-20020a056000018100b0030fcd95a603mr2579482wrx.51.1686719792039; 
 Tue, 13 Jun 2023 22:16:32 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff503000000b002ca864b807csm17098769wro.0.2023.06.13.22.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:16:31 -0700 (PDT)
Message-ID: <ae869dc0-c1e9-54ec-007a-102b53b4b935@linaro.org>
Date: Wed, 14 Jun 2023 07:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 7/9] meson: Alias CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230613133347.82210-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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

On 6/13/23 15:33, Philippe Mathieu-Daudé wrote:
> We use the CONFIG_USER_ONLY key to describe user emulation,
> and the CONFIG_SOFTMMU key to describe system emulation. Alias
> it as 'CONFIG_SYSTEM_ONLY' for parity with user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

