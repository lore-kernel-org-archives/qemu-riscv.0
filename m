Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24558C87FDB
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 13:40:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulSkf-0001ag-2k; Mon, 11 Aug 2025 09:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSjw-00016z-5e
 for qemu-riscv@nongnu.org; Mon, 11 Aug 2025 09:39:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSjn-0006AZ-Ka
 for qemu-riscv@nongnu.org; Mon, 11 Aug 2025 09:39:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso43438625e9.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Aug 2025 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754919531; x=1755524331; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JariJnbRh2SIVsx43ZoyoG0qSarOLEjJhdGnOzTfJXI=;
 b=IwG6EBpsvqOTWE58ayWI0DMVGuaT0v9C7jQR7aJXUesAb1vkAhLPUTb4ID3k6JMoHr
 hyUhl3IXHFc2a2O0S2sqW6A9KR2dIRgS2lPrpP4cT2y/HX5i/wg8RvE27sPsv0rRU1vt
 ywfpEtL9YuJnNZ7qVanaBf9HNBv/94O6ZVdYw+4MLDs+J9UDqOqPNlA4G6+0FKK4OGr2
 qILg5HmVXTIC8NnNAuBetsJZZDMr4aXlyy0kvQHDb6de8HPOEtNMewWJsXU/gYDklFqd
 FJaNTOPqZdi454LZ09PzUhZFp8RrUspeyZ59/v1qSeUX05c0PvvvZ9oMnJnz6iAe2VJP
 4piA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754919531; x=1755524331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JariJnbRh2SIVsx43ZoyoG0qSarOLEjJhdGnOzTfJXI=;
 b=rF4O6kIUElOrlkJ/TaLQ9x/O1qzgEwpJkJG3SHWS2xeMJ408FnGFinfwEgkh/0+Wpy
 n9KzNRbwyGeG2nV4oQ0eJKjkKDSscTKNYCbxModxZBn/uwL2eqUJlcaiERrQndBLZcvQ
 7XkC0Qt/2OZeRR963UD1d0LITL7oCNYY8Y73UmTm6F9QzvJaxzaUxGcJXYQ/iFEtQXES
 smyR2b1dvGrSFpPdqw3pb/0LeTwkzSiUyaqC7pZFW9VS6PVFOIAebnUIR3UBSILBC+T6
 5TwdAw+Os0SmoRvzFQ21R3Bs/UjsPA4nA9kjEq0u+TNsD3f9Rshq63DWVqlImmcY2t2l
 NL9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyB9HfgGikYQTrDWRy4W7fIo4lUWrQifK/LkOMilHrRCB+UCwBAOKDlhuofEs6gs+gJ4lzndtXEtmn@nongnu.org
X-Gm-Message-State: AOJu0YxqAn+PBo/iqhkNHCVScoEiOxSOys5An8Q0c6L3hg2IyoNe2Crp
 eoXmjrQvftToLLSZSxp76jG8wI6SCw+l3GMgTkFE7HKIUkoaxf/Eb+ia7LwNVZ21MAqGLT49jrL
 0SaPv
X-Gm-Gg: ASbGncuRKJQVnZnN6JgV12hs6zPTp0QvFcCVSzzIt/wrID7+Uw0mAKa+mMB1noZ5daD
 nVeBvd9QQdN0JKxwadFVXszkVIz+L1tSVJd1NS1HZMu/BIRXH+EsTY/g/gqOqpGB1O1xORBN/Xe
 LMo4NNfa75hHJwy2+zaonb/fADvpEne51ubsOp/k7UqUtTsqYwqG7fm2bXrUSup+xvaMpfjLEMk
 UbQ86SSCQ5wAab8+mUyWAht0ndiodcmQ7RhNN8ISdR8yJV3VsrGRA+Fl9ZXDCYKlKoHjiDtqYRd
 iWte519R3Q45AaeTGp/j04zuervKaAyU9uhN2KaPYUJtIvPyDOM5ENZI/OgAiOS0+8vON5o4IFP
 KYLNcWguLYMsuYH4UjMzzHYoorrIExIYJtrezYQJ/6T0vnOjnpOj8hDHTRSI0V3e2cdA42ok=
X-Google-Smtp-Source: AGHT+IF3JRpQlQC6Aw1u4qosjefhmeNsvB07i8k14PBpsNcj0J/lEi2CpF16KTbigZnrp30QFlsOLA==
X-Received: by 2002:a5d:64cd:0:b0:3b7:9c38:e8a5 with SMTP id
 ffacd0b85a97d-3b900b8bd0emr10240670f8f.56.1754919530913; 
 Mon, 11 Aug 2025 06:38:50 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5e99e04sm254070495e9.11.2025.08.11.06.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:38:50 -0700 (PDT)
Message-ID: <4ee9aac5-05d8-4770-8712-dce95958cbcd@linaro.org>
Date: Mon, 11 Aug 2025 15:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/uefi: check access for first variable
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
References: <20250811130110.820958-1-kraxel@redhat.com>
 <20250811130110.820958-3-kraxel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250811130110.820958-3-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 11/8/25 15:01, Gerd Hoffmann wrote:
> When listing variables (via get-next-variable-name) only the names of
> variables which can be accessed will be returned.  That check was
> missing for the first variable though.  Add it.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/uefi/var-service-vars.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


