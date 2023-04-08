Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl08n-0000hF-8c
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 00:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl08Z-0000Rv-8F
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:25:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl08W-0006Ej-QV
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:25:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so5703697pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hW/VSf7Q3/d56s71eq7R7lxXfgNg9+7clCwmfbVpN/Y=;
 b=AD0MsyTBfV0voztSlaCjS4/i8WtfCkzfpKBNK/v6C6M8jjO/kXSKCc0dYSUPMWO3/c
 mioyBcuh9dbN5ZUB4ifq0fkuqnxYXzP4KyuHu1SdBKyT3uSi3f1bxld3EEtOXumjKsrD
 UM0RuTSzyddlVlfnRFuKOYnPHAfUeu7YYbuqoc9sU7sBzUg3Mli9fq3oBFUfoZZE1gAZ
 DcaFqJU9Zw/bmGDE0gGhdAekfTlGITjw9XkE6+dYDbfIl2O2IwqTPC/l3yo+rBcoet8u
 7hWl8wsCBXfi3VcPWH1UcC+diy5cURNzdIot8UWAyQSObeTmkpMzbUhezy0KAgQ7Z4of
 5CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hW/VSf7Q3/d56s71eq7R7lxXfgNg9+7clCwmfbVpN/Y=;
 b=08jbmXfGFkt4K9RmuU+BtE1kXaU33neyqQKjSGkX3/vaUQL+aKLv6QXXTWVqNnYa39
 6fuMen3FIcqvDfAzUk0eJvNeONCUaRJx5WviWcHxPorpISOvGGQTcDVgk7Rrk9KdTo7s
 zKmGpDczND/CNfN2jqYhOO9I41viquVknC54lhQhgsX++Oo2DRI6Fxj8ojPqK4rHry99
 8fOoUybKAmWg+9VNl2MntJLHTAoqmB0bnPSZ3r8DFgO2E1uMHXJJfyyfaY2J6en07piM
 XX/p+bRLeoQ/MYSBGWjIgdL/hRZSewcPmKiqJ6iwYwM95rNsaqJgRPbVlVsuqmsiRWGU
 V0rA==
X-Gm-Message-State: AAQBX9d/KbqCOwCS9RWehCgv0gA797576i3Ezys3jLEI8g5a0S3Oe/bo
 Xf2FCoUYUhZOPweezPSiRJcD0Q==
X-Google-Smtp-Source: AKy350ZUbQYkpHgjHTHqWPoCLiXyBP/r0ksrikXsadVUUJ0Z9+D+HwacqU3D1RBcoFMeI9Y1KRfWMw==
X-Received: by 2002:a17:90b:1c91:b0:22b:b832:d32 with SMTP id
 oo17-20020a17090b1c9100b0022bb8320d32mr5197335pjb.9.1680927910856; 
 Fri, 07 Apr 2023 21:25:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 gd22-20020a17090b0fd600b002465ff5d829sm1432776pjb.13.2023.04.07.21.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:25:10 -0700 (PDT)
Message-ID: <ef9c1261-2f9c-0f22-b502-56b5f9c52618@linaro.org>
Date: Fri, 7 Apr 2023 21:25:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/10] target/arm: Reduce QMP header pressure by not
 including 'kvm_arm.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 04:25:28 -0000

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> We only need "sysemu/kvm.h" for kvm_enabled() and "cpu.h"
> for the QOM type definitions (TYPE_ARM_CPU). Avoid including
> the heavy "kvm_arm.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/arm-qmp-cmds.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

