Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63F3EB64DA
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 17:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIBoP-0006DZ-DL; Sat, 08 Jul 2023 13:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBoO-0006Ch-0D
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:33:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBoM-00084A-1i
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:33:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso31787425e9.1
 for <qemu-riscv@nongnu.org>; Sat, 08 Jul 2023 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688837611; x=1691429611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vhV4Oj47aIfmbogK9H2Y2CuNCwo/afWQmtDo+m5doOM=;
 b=lJi67UvYEpxpZ1lvSADw1c7Zk7PjskYm9A4d1Ex/b8/P9A+1+ZN1NV/j44xhe0kJtR
 9b1fprYvni84s6i031OK15ouOr1dUUpjpdzDThUJmDciDqsp5OEZ7XYTk6T6L8D7ea0J
 /FB8xGx5n/f3BjytI/fg4RHYnrwa6G09FyiGvsIyqkZbhdQbBc2fJu+YVoIVyVS/wONV
 b5Z0yoz2b4jANvTj8+4whyLtmo/Xdv/ctpzYLkTAUHJTU2a9fRpxjHURSN6rN5bSPR28
 ySv8DKV3KGynyUTShqtEgIKlePJMvkzI4K+3k/Ue/k9O2wqIN5vfUbCKSf8/sjg+IZt2
 qTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688837611; x=1691429611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vhV4Oj47aIfmbogK9H2Y2CuNCwo/afWQmtDo+m5doOM=;
 b=GTmfwAN4GTfoN2qwJzk7vVdHd8lV1Rz+hXVMF9zQgCBTq7CgYsoqpr022Y62QPQuWp
 JHX0i6jHYKM9sAgHYoM/RgZ/puq9D6NBEUO9zn3MQe9o2c95gPYNj6h3KDYgb9iwMwfA
 rOlUxYQWIF7BmyeKRrHR5W2NGDn61yOHsJR6V1Wz2Fw5hNdfkRmWs6pSqLCmp7h2xf/A
 5E16WKkQ1ExJskvJQu5B/fjV/Y1vWvT4zfU6iiYpA4+COvaRL4zLgX6+2h+lFYNGDtYh
 XRlfl7avYmB68M7fp5EVDCb5u9E4kSWdCcftH/IFjXT9eXxuZ7YKTNHHllC+QbGZoOfw
 kIeA==
X-Gm-Message-State: ABy/qLb0Z4yaNCQv5rJqqQYcIXvjx0x93Ex1F6lMJGFd0AfWSddDWzmd
 VjNHm44KWs47zoeh6fZIuly/9w==
X-Google-Smtp-Source: APBJJlHo5ykbPhyVPeiy03HyxCAQEyWe9pzJxN6SatcJMDcIrbJ0s35VuSCrJBAA1YNvT8WiTF8Tgw==
X-Received: by 2002:a1c:7206:0:b0:3fb:8284:35b0 with SMTP id
 n6-20020a1c7206000000b003fb828435b0mr6064868wmc.30.1688837611567; 
 Sat, 08 Jul 2023 10:33:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a7bcb0a000000b003fbb346279dsm5636923wmj.38.2023.07.08.10.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:33:31 -0700 (PDT)
Message-ID: <8d8e2f16-da0b-70e6-8225-9bc9102698c5@linaro.org>
Date: Sat, 8 Jul 2023 19:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 33/37] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64DSM instruction.  This was the last use
> of aes64_operation and its support macros, so remove them all.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 101 ++++-------------------------------
>   1 file changed, 10 insertions(+), 91 deletions(-)


>   target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
>   {
>       AESState t;
> @@ -228,7 +138,16 @@ target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
>   
>   target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
>   {
> -    return aes64_operation(rs1, rs2, false, true);
> +    AESState t, z = { };

z can be const, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +
> +    /*
> +     * This instruction does not include a round key,
> +     * so supply a zero to our primitive.
> +     */
> +    t.d[HOST_BIG_ENDIAN] = rs1;
> +    t.d[!HOST_BIG_ENDIAN] = rs2;
> +    aesdec_ISB_ISR_IMC_AK(&t, &t, &z, false);
> +    return t.d[HOST_BIG_ENDIAN];
>   }
>   
>   target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)


