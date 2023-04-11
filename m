Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmBcL-0003rB-C7
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 06:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBcJ-0003q2-LK
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 06:52:51 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBcG-0003Vw-R4
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 06:52:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso5762735wmb.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681210367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FtFD8kN6FO+NAIzupOIHkLMGBKmYVksTR+1coo89Y7Q=;
 b=jGuSNbAzl708El34fzHQrKn0aK+Vv48Yl0Zt1Gx05xMkK+QzlIVqFa+Q136mRGAw+5
 4iEcoZNaRH52ZvDW+dC/Ii2lhMj8yz+KUC7O/FtXLXeoQvSf1QMDfmj09Aqbp+pkCg2t
 DLagwKGzgTjiEyDYYB6YUetJLvBQv1oLDalH3im/ngKXKemhcdpKCKnBcL45S2g/0uLq
 YRGmz4pkV11hCRkPqJuMQeVsnG2x2KdfUy2aB3FpUBrfv3iv0fLITwD72HIXURt857+T
 pddKDCyRSHXAPcJ6A4888JPCGrRk+BdqabjPETiRY2ytosQnpdee7oIZ2B70fEI8PXxd
 oKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FtFD8kN6FO+NAIzupOIHkLMGBKmYVksTR+1coo89Y7Q=;
 b=W0KxoMy+dYJYig7WKcXNA/0Yht1WHPjvFIPC1ZHkZGuxGJX2PS7EA/Yxp229f9PbtA
 NFNDDQv2bX+7pkRDdO/fi78oOmCxDnN3d+KmWFoSs3EhaU2D1BtsD4noJUhaCaRUV7AH
 se6HEyTh8IYln68kGVcNEVDJrtG3CVkx7W1x/I138jCwaUfwoidRtI9a+I7qfxYZczk2
 fdu0n9Lvxie5B6FREkA/jQcO9aoiFGVI+/NoTn71k7nUpszPvbTi8+HEzcc7SJyqQ2xm
 nNtVnqSL1tb3nT5DHDEr/oH4zyns9tIGf0XoAX3VMQemGCYuDQNkyje5xwwsU7QuggcY
 Ew+w==
X-Gm-Message-State: AAQBX9eltWp0SAxK5kFT8EPAIbkypTsLeuJZpiqhQkDaIW9xwHfw6diM
 G3RnthC+DTza7iy2Yvb8b4BZEw==
X-Google-Smtp-Source: AKy350aDw65lyg1aenDZGotKExz4Y5Xrhi3E4QvjcbMTPdiDurhMdsCr71ACXeGURZ5mrEJ6vqnksg==
X-Received: by 2002:a05:600c:2cd8:b0:3ee:9652:932 with SMTP id
 l24-20020a05600c2cd800b003ee96520932mr8680972wmc.12.1681210367128; 
 Tue, 11 Apr 2023 03:52:47 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a7bc389000000b003ef64affec7sm16561508wmj.22.2023.04.11.03.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:52:46 -0700 (PDT)
Message-ID: <8d4f291a-9b16-ce84-4f52-de625f1abe4f@linaro.org>
Date: Tue, 11 Apr 2023 12:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 01/42] tcg: Replace if + tcg_abort with tcg_debug_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 10:52:51 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 4 +---
>   tcg/i386/tcg-target.c.inc | 8 +++-----
>   2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


