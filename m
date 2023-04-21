Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzGW-0003QG-Rn
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzGQ-0003Ol-9c
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:29:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzGN-0006Qr-N1
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:29:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so9940205e9.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116194; x=1684708194;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=472OONecVWosuY1vgDCjKtAxingjuVZ3GNaTf/9T0tM=;
 b=Z+cny+0yqi8sN6yxWE4j47BVtDqCi6hN/fIaHxQzPy/+7cpVoOnnIMGPJWXlZee0yk
 s8x+0hr23pyZKgF0YhSir9qYp4j2nIbt+lXQLDgpItbQDGGB0Jid5cEebwBevlskU0fD
 Uic4HFTzSI/gJvvwJVJJaI0CeK5RK4SxwRm4rixlS0Qug4S1kZiX0YPHCp1NAja3uhoz
 9uHuoJ8RHAagYgr8FVEppJOk/ihrHS8grtK7l9d3ufRsbu8uxoD08RkQrwystjOZVFAD
 a3TMIEN5hNAl5F2WqU3Q8DSIVFq27lC7ldb+eNdn27bx/3z1iju6Ii2Azxrc/iyv/gNE
 98AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116194; x=1684708194;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=472OONecVWosuY1vgDCjKtAxingjuVZ3GNaTf/9T0tM=;
 b=OK4TWjmcq1Q0jzoRa8OarUcSlMjO0441BExUaNF5olB8jfsxxJEz4+I1BGm262Sjho
 rqyE6Zw6InOrl4ZktKpeKIGRFypkrAKjQBWQxKmqOjBiZLREVBUQ8afsT9S83LWP7gPv
 0BfbJpTAon2hyvHnOq/VNumEoONdjeF7Qq+3Lg17C8pABtKqNfyT4Wux0sSjPBLTTpl0
 VGSdkyptfBZ3xqDFXaBkJrAyNmURVyAGOMHusz3KM8Ox5Z/KiApujalMlrTf3a2LGEPU
 ATdn5oJN25kvHJYFB1beQXTiui3UE8xfCVGowtLuq5qB+WSMN+r0qDpiy3dgCXURKwdS
 JUcA==
X-Gm-Message-State: AAQBX9cWA3mkqVoylPkM6/h1TP6Q7Yfflfd6ALrfs+Ej+YbtM2e2wrPs
 3AoLV+Ji//ZHHQ0mZBgHI2cTVCVGQu0w5RDgTCQ=
X-Google-Smtp-Source: AKy350Yf98ONhyFYTOimjKMuJv/mBbZDXyA88anNOCiIB5cTGz72CbXeAd2LcUBQ4Vtnn5uXhO1T8w==
X-Received: by 2002:a05:600c:2194:b0:3f1:72ec:4009 with SMTP id
 e20-20020a05600c219400b003f172ec4009mr3148939wme.9.1682116194055; 
 Fri, 21 Apr 2023 15:29:54 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002febc543c40sm5264466wrm.82.2023.04.21.15.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:29:53 -0700 (PDT)
Message-ID: <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
Date: Sat, 22 Apr 2023 00:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Fri, 21 Apr 2023 22:29:59 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> This will shortly be used by sparc64 without also using
> TCG_TARGET_NEED_LDST_LABELS.

Is that in this series?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c          | 13 +++++++++++++
>   tcg/tcg-ldst.c.inc | 14 --------------
>   2 files changed, 13 insertions(+), 14 deletions(-)


