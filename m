Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F5EEB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 20:39:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHsEP-0003kx-NA; Fri, 07 Jul 2023 16:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHsEO-0003kg-U8
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 16:39:08 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHsEM-0002Ns-BZ
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 16:39:08 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso3770799e87.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Jul 2023 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762344; x=1691354344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=et+/elcHg+a62zExuPVej8nSALpAZoGG0auR+sdNInE=;
 b=i5qplfqU8VhKZN/r+LJ6QXQHjFlthpIcUPvdVCsoP8f/lmFXK7YGDu5voPUyJXyLLf
 qwygHufhVvxc4JgpYhkUuqjtOq6DJqFP00g3+IKdPGbj25gDXwMEZ0iapNUeUCs59mq+
 mUboskpvFXQrE6P8XlTS54dJXqjBRMOYhZOKC7DiACPCon2sAmZLgUDlY/o4RmRjhqys
 rKXVCmsRQc6rtDlDkrhvi2kY4K7yTriZyj6iJta8tsYvn+xWHnCryw2RMiNEE6iOq0h0
 UWC+vzP6TNLPr2lDCqX53NZLOCxBJM+YLUyZ+OA4+e0iyevhuv+bJlzsu12Qcca+8GUu
 OyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762344; x=1691354344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=et+/elcHg+a62zExuPVej8nSALpAZoGG0auR+sdNInE=;
 b=iNVLoFOsYSzhakFHzpO/aD0DAc9IYoUspHYa3ZqP8GVu04NipIiAeWT2/IqVtriQG6
 8AnDQ6/pK3ySGNk5wAslhykl7cdearLf00jFdC1SMrbSVbldyybpk4Y8Nawls/R5Rja9
 eSSHW7TAQWTXhPhefXZjrKD3GlhXtzbbuOm3jT3CdMvSg12AE46Zhs4IlVZSTVB1oGq5
 h14wiBMH1grVsAbBHQiwI58++x5tpDXjz8xFbr2BJyyh4zBPJIOZGNWgNZdhz7i4gsUp
 myBYKFFZ9sJvTk5ruwLTYvclqYnZyqUMI80Yimh+unKRhIkpUFcxx5prRDVGYo5qWoSn
 lrYw==
X-Gm-Message-State: ABy/qLbFX0WgNwwaqF1jeMGpzJYKCxtIpez0/Nomhv5qMP4I3rnTfNA1
 HPuiRJvA6vgjvqxThN9sQWvw8g==
X-Google-Smtp-Source: APBJJlHv2P15DTNcKg0s/tjPdQn3HosoZWzksuVL7eBo2pvfaRMnQazh8CxNU1FWqXPaABjZw2rfZQ==
X-Received: by 2002:a05:6512:6c7:b0:4fb:8eec:ce47 with SMTP id
 u7-20020a05651206c700b004fb8eecce47mr5275445lff.58.1688762344383; 
 Fri, 07 Jul 2023 13:39:04 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7df85000000b0051bed60f333sm2415641edy.48.2023.07.07.13.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:39:04 -0700 (PDT)
Message-ID: <1c8c0a18-fd38-e74a-bc00-116efc6488da@linaro.org>
Date: Fri, 7 Jul 2023 22:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/37] target/riscv: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64ES instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


