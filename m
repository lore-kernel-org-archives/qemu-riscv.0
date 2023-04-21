Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzF5-0001vc-Ie
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzEy-0001py-BW
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:28:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzEw-0006AI-SH
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:28:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso63349835e9.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116104; x=1684708104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
 b=JXknaJ2VkdiVb57XrTk8D4Mph6RkJ6Ls6CrhYELgAAvqrd2oQwD12JVAEolszMSZue
 abK0pGTzH3px9oUqQ34vHpOq8UIdfnB5OaqrDA6+YNpr2xEgsyR1gkoCukSUpXoR9dUx
 6RWNQDdtq8JUoetwMzW5HOiGpnZGs8VJxXHgCVOKuSX22VeD7jVjQOjgyEcqPGeZLjQb
 GZ5xq8aQEKsAzQQCCF+uySRTYGHeM9WScMn5VVUz9CCJJXtGZ7Y5KN2nGs/BEmPB6+rM
 00i5nemBC0UY9vGVMeP2xeuUJ2oj3BYCxV8JHU5lroDVMNMGGjYGhwSK/tZxUf27AsLQ
 b4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116104; x=1684708104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
 b=IGcBbIbqOG3QxCeBk87c20LqDZiNlNo70gCJzPzsCD2jq76rLJhUPIvFG7IJKi+S9X
 BCZofuhx5kACnmityRn9GYugPMc3E8u5nStGNwQAFbal9As8RS8jaYhfkxoQuxzZKxGc
 1Uyt4HIL+p9CecpkwRWjgol13ONobB7SXPMs0z6LIlasPnClU0/VxisGYjZ5kIeY/6fy
 3/evR/8EWiCAEe6Ldz3tp0Ai/1GAgpiVkumTlRaw3Kq1ac3QOLfI8pSb6JLUYoqyWKnB
 zxE/kEYA16k/1o8JA6UshmDel87lSnHUcoAzYG5ZNIiKmOPLJhDL9CNqoyeCuk9bkXza
 kMIg==
X-Gm-Message-State: AAQBX9fWXuNO8vdTgzXJIiKIpOofkB3mPjbargW14VoFBIrH+Xt3pTWp
 Umrh3dVVslwTFuXOumvyQEC7Lg==
X-Google-Smtp-Source: AKy350aUi+ue/VRcsHS5ABOpBu6u235arnDIqfVTFUmmMjThgea0qTK57pA102ZMsy7bS/x1O/bfqA==
X-Received: by 2002:a05:600c:34cf:b0:3f1:7510:62e8 with SMTP id
 d15-20020a05600c34cf00b003f1751062e8mr2844785wmq.3.1682116103850; 
 Fri, 21 Apr 2023 15:28:23 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003f179fc6d8esm5812268wml.44.2023.04.21.15.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:28:23 -0700 (PDT)
Message-ID: <9f7c229b-4490-d7dc-93c4-058003de6737@linaro.org>
Date: Sat, 22 Apr 2023 00:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 30/54] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 22:28:28 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


