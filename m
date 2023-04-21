Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppyx8-0004mm-Sa
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppywm-0004SP-Fi
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:09:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppywh-0001BB-AW
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:09:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so23567765e9.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114973; x=1684706973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OVr1ZQWPI77BRoTfpfTakrNph9yKfr792/8pEHsKi7k=;
 b=YGQCAxAF4Fs76+4ePYnEsiBp9F8ekqfH5rFfpv72onpSdYn5NxrJ9NB0Wv1UV+Khmc
 qIpxAbgjcKAkm6dejwBaF5uJHL3REYG9ftXJsNsKDp4574LQKpzOaw8VCeFlcx2CToAO
 wG400NmeExz911j76uytjsjFzJGPrVr7zquMNlS2zvUN6qR7kQy4QeqdSWdK9CTL5JCM
 KegrhaaJJpdbMh0wE8QAQcOCFzLsDeyTgwIloF+yn1uHEq05M1Q2YmRBKjWXlTc6TgL8
 7IB3KQbQizLh/HKZ2ivpI/GT1GTd1PkXkUKZ/eBrTKkBx83ModlGWmGw3AxOGfr6azEB
 YYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114973; x=1684706973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OVr1ZQWPI77BRoTfpfTakrNph9yKfr792/8pEHsKi7k=;
 b=l3vWvPiUk0CE0wrrsz3rOMyXSZF7MV4clDs4BasmlJ8xrNhuWuVnEaESD7nRx4RVMo
 D5jaPqqu6Y0WFt6J9RmGYN0+Y8YsDyu6KX610EvLgdSN4S68IJEk1bDSIh1Xy7LV8v4z
 INvbVpoLju/V1sOKQvSsXHd0LgAUz9+mMBu9A+y3/G4qBF2gM4w0XWDUT/duBjcMl9v7
 UZlC/aLMYxKZuhHn3tamegTbnepwQPpqPbh529X/9XVA8sy5rUVPRs/2uYn3zDoNANTy
 IUiOvRSP1iLkC1yI8RKP3ns/uHe+R97QqG23GhmHJQVunW0NrTyDzzIQ55G+48m9ppcN
 FAWQ==
X-Gm-Message-State: AAQBX9dC80TUpU6JGgH14wVA4MM4wBWqJrggvVy3FDd06gKwJNc9+PHq
 /RVGYL0WqiwcMCxv/Zn4s0RSYw==
X-Google-Smtp-Source: AKy350aM+hzJKNxnYP/x0U5X23UupdvAPj7Lx++ZIyBBQY21j76+BDVkNqi7WuT/H9ShgQ2KK9Vhlg==
X-Received: by 2002:adf:f092:0:b0:2fe:c8b5:b5da with SMTP id
 n18-20020adff092000000b002fec8b5b5damr5004421wro.13.1682114973349; 
 Fri, 21 Apr 2023 15:09:33 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 u7-20020a5d5147000000b002cde25fba30sm5331308wrt.1.2023.04.21.15.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:09:33 -0700 (PDT)
Message-ID: <82f824e8-f29f-c8ae-f6d7-06669e12b474@linaro.org>
Date: Sat, 22 Apr 2023 00:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 06/54] tcg: Split out tcg_out_ext16u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 22:09:45 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  5 +++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 17 ++++++++++-------
>   tcg/i386/tcg-target.c.inc        |  8 +++-----
>   tcg/loongarch64/tcg-target.c.inc |  7 ++-----
>   tcg/mips/tcg-target.c.inc        |  5 +++++
>   tcg/ppc/tcg-target.c.inc         |  4 +++-
>   tcg/riscv/tcg-target.c.inc       |  7 ++-----
>   tcg/s390x/tcg-target.c.inc       | 17 ++++++-----------
>   tcg/sparc64/tcg-target.c.inc     | 11 +++++++++--
>   tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
>   11 files changed, 66 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


