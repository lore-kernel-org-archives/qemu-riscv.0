Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB0CE77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:35:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNx19-0002ak-Lb; Wed, 18 Dec 2024 11:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNx17-0002ZS-4l
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:35:21 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNx0y-0002xf-Uy
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:35:19 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3043e84c687so24506581fa.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734539706; x=1735144506; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zPU6RgKUjg8sNiUSiDqlsB2bKmDIe4cw4T0+xzwT/LM=;
 b=fZqSNieSJXQIowD38nigFrrKhPU7kk/j8ja2y00bSaCbssMCupofCIpj3ev2rdgBUx
 YqlxzBv0cVpqaOB6sC/7D3SErwKOhx/9K86diDGF0sinGTjfJ6BkwxZpZjE0kkt3zGtS
 qPg5P8wbBKl4c0OItVf3AdxiYjqLVA5uCCvu6CHFyh73aEGLKKsQLMMgee7duhV/slgQ
 Y16obv+NDJo+JLZgzGLXj0ODH7f6aD/b1od/eA/+xQ9nstCXPxDSggrBHbyDLfxyLnT4
 tzOVzMXoTZo4bP80Nc9ivQryYl1/v6N0kT/qGfN0p8Vj7L4w/0ztemWQymPl6cvDqPzF
 sH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734539706; x=1735144506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zPU6RgKUjg8sNiUSiDqlsB2bKmDIe4cw4T0+xzwT/LM=;
 b=RCAfNm5Nem3IyaBkGHIo+hl2nqA96D3FYV7tFq5mw/scJeAXxxufvAWxHlY2O+fI0d
 SOphBw/7SGJKUEK+htH0l85kVxxNQstecuAZC7UrJfBzbWHthaJ4Sgym+Dv/Vb+65Y1q
 vRtPSdAKoAer1TzfB8nhVtxUPZk5up2HEs+wY/G7401OlpyAt2tiO2UwgzF9nYIVDQP/
 /vmLfX3YYfMLHjU7WOdoFPk0+/Z6g385neAWYYIHiAACdI1Xt/WRY1iBn+DXdsp9zagB
 NtryPDMJDWl15SjGVAyoMwpM4qejMgwT9YrvskGN7FTQY4X/Nj13z5cUKmhTAz5/QZXt
 IkKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrufWa6QMAG5ibJy7zY6kVNRmKYTjL5JvLxj2D+6IPOPKgI0cJf91QIjDN+K6rxDqzSoZN0oFoWbz1@nongnu.org
X-Gm-Message-State: AOJu0YxlU7/ls/GO2kqJfRN+Oje7ohcZJCcIBuw7ZDH+Zr7HMx7BjN9u
 s3b6oKnQDS83MhY2OrM2pH3i9WQqCcnHhGIglJNSm5ly4B0drDDEq3nCPr9RFBo=
X-Gm-Gg: ASbGncvDUu2euAebdT6daIlP9RooKHmIg3AF0kJUGXQjAAnK52UVIEUnVWaRMQt3eHs
 mLbUHACIozrWsTxqKQVr0atjabLSNC9OdfYnVSmp+bgYc3O+lHH+6mX74GLv2VUpwiz8zNYDVEO
 hmhhCjL3Ob5BcNwKgBSITjQz2tJmfwJbu9ZTmoYywoURQB1KYHnW0bAQJ2sS2p0eMQctepS7aee
 /ooNUZ6yBr9P9JCF4f5HHUopjwzXNc2vScC0aoM1kpBhebvSbtRfAmO+fzsVu9G2x63ugEEGMw=
X-Google-Smtp-Source: AGHT+IGVQfXBq/kTsX5njceAZHEdWTby88+NHaZSaczdDeylNPjSIZYUAwOz0rDKoATKhwcfnThuFA==
X-Received: by 2002:a2e:b88b:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-3044db691camr15260541fa.34.1734539706439; 
 Wed, 18 Dec 2024 08:35:06 -0800 (PST)
Received: from [192.168.242.227] ([91.209.212.65])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034401cd9fsm16196461fa.19.2024.12.18.08.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 08:35:05 -0800 (PST)
Message-ID: <81752fe9-7805-484c-9c9d-feb6b572db71@linaro.org>
Date: Wed, 18 Dec 2024 10:34:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] target/riscv: rvv: speed up small unit-stride
 loads and stores
To: Craig Blackmore <craig.blackmore@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
References: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
 <20241218142353.1027938-3-craig.blackmore@embecosm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241218142353.1027938-3-craig.blackmore@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 12/18/24 08:23, Craig Blackmore wrote:
> Calling `vext_continuous_ldst_tlb` for load/stores up to 6 bytes
> significantly improves performance.
> 
> Co-authored-by: Helene CHELIN <helene.chelin@embecosm.com>
> Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>
> Co-authored-by: Craig Blackmore <craig.blackmore@embecosm.com>
> 
> Signed-off-by: Helene CHELIN <helene.chelin@embecosm.com>
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
> Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
> ---
>   target/riscv/vector_helper.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Thanks for the graphs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

