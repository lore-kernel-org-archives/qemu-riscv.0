Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzQT-0001vr-IM
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzQO-0001r4-Hr
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:40:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzQL-0000dI-Qo
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:40:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso22779185e9.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116811; x=1684708811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
 b=GV1un2O/iIOz23DpTe2YQWXQF3000aalUd6NufmMxr3d8mDQtpgfX2SO6wnokXLhuK
 9luCN7LrAhmUsqyHXGR4uvWxKN207Pc6qoVnZaQ4iufZUbEk9NGALOw8D26ScIxjpF0e
 mxRpxobDP0hMEtTRhPr9y6VU8tT9SaS4EUtZRw/S07oDmXVTOaZ7u7iFGXtaF435RkjO
 R2gFihrkF9fGXfWN3XdFZc5Ah98b9xotM1IWqhHoIOMthdxUYAjOSoyyydZCl3+FAIE9
 LBcahI6VmZ0KBH9J+mVUjDYR9N2L/P/jBgDxXGPCaCoCPMJRZKfOr3cgRFOq2sIzcj+C
 dkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116811; x=1684708811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
 b=aOvvN61dQPx9GIHb1FxWG6f6XKF1720Nq6brV0n4dFZAFmNbHdmI/OPMBdmxR1xyo+
 D3aYuzONqwYJ9uHcLNI/gLLwFX4mkwA8cTY4dwU+PEfb3qrrS45RqSrSkVGkAyecvjU1
 9DaRMJ2O2gdJuOmQjNy2VWyPnoBBFNAea2etZZlC4PEtnFRz0AZq6s69EHLiU5MAQ6UL
 kx1MHkQ+TVB7sdldzybaV11wv/e0E7Tsx+Va+oePuaKpc7v3YCiH2xdI4wFHhWmUHbnw
 PJAAHj1gPJ5jNAYHv5KHRrHNG6ucMdB1VeoA7poJHfWx4v1+uoRRopqLCpTrn5TyHOSS
 JmHg==
X-Gm-Message-State: AAQBX9ddJbhF8R/uBRR97ZPOK+sFLnijN5nqh7hDZ1t0cDxK7keto4ZH
 7UT0vY2IUQ2Xcaw+Yb5Guhpf9A==
X-Google-Smtp-Source: AKy350aUj7Pbnh+7Xo6OSIMhPVhOr6g2YHHkZ83GzxK15BlNKlVvqPZLKiCFtkz7pR0C3addWQ9Elg==
X-Received: by 2002:a7b:cd02:0:b0:3ef:d8c6:4bc0 with SMTP id
 f2-20020a7bcd02000000b003efd8c64bc0mr2897673wmj.40.1682116810858; 
 Fri, 21 Apr 2023 15:40:10 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003f195d540d9sm1496439wmo.14.2023.04.21.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:40:10 -0700 (PDT)
Message-ID: <76538c93-af56-a80c-48fc-e3b8e0ee5e3f@linaro.org>
Date: Sat, 22 Apr 2023 00:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/54] tcg: Split out tcg_out_ext32u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 22:40:16 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 32-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  4 ++--
>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>   tcg/mips/tcg-target.c.inc        |  3 ++-
>   tcg/ppc/tcg-target.c.inc         |  4 +++-
>   tcg/riscv/tcg-target.c.inc       |  2 +-
>   tcg/s390x/tcg-target.c.inc       | 20 ++++++++++----------
>   tcg/sparc64/tcg-target.c.inc     | 17 +++++++++++------
>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>   11 files changed, 54 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


