Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9D2-0004ZE-5X
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9D0-0004TD-Mq
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:28:42 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Cz-0006wZ-6T
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:28:42 -0500
Received: by mail-pf1-x436.google.com with SMTP id n5so2024856pfv.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC5aDh9QQfLJ8nzcrCrqXMtBp100M4u+alta7wDtNOs=;
 b=ZRXRDvkCviOl8P77HHu4dEMyh4y3e7gL3u7fHRpSKtk4g5/Q9MtgeAOHy+lSw5xzWt
 MQVEMeyvPIev41B2ONFabzfSgVnPzsN0vUkHKyUcel+PHTNU1EbtLtTlE5o7cEKFaN3p
 dvv/n//M5GTD1JVFeaJN2YUutdE9Kbu5Suwkquje0Woxfllg3zFqS4pBjdj8n9ahvXBV
 aFj0FSe9eEvMORYrtFqqOPn+JF2L+jV02Lg1IPiBLbnhlUqkOoXnyBlygfi7vikoniBb
 C5tRoOEv4e+WnFOrJoP3rBwbC2oXfctINjcqVzUuio34Led8XUT7sH4s/0mrgp3x4ItO
 99ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZC5aDh9QQfLJ8nzcrCrqXMtBp100M4u+alta7wDtNOs=;
 b=IvURAxClNYpFb2rA+xITuG7xdhktgOEKmASbBc7T42fGlBintqeVz2xz5BAUEyEyoF
 /N0qrR7EAUn/EBXgSTYtixSODzghMeJy+q7Va5clIdwQWgPfi13Yv09OAzHdEGrUmNTg
 gM6nw/iwIfGxmem89mibEPQY2HE0hqj96g68Ws7e3yKeNFgxxIvKHDvNnx4dmNmC2ip5
 69kIg0W9HGWzdBDYiwHx4QJ0fo2pm3H7YleCZf5kIFvlwrDP7ld4MG8M0vq2aC9hBMb0
 mJ3vBDfSmKnLT9YF73biDDwiLP+N/8q4kmJXvzTOCR1vWPPTw0T7MymGZ5Q5AeGHSCkJ
 I/Vg==
X-Gm-Message-State: AO0yUKWk+c/gTeeIaZSjL38C+7ZblWgJVmPy1NSrt+ivUvt3vcuVHd5t
 7FolJxDMEwP6rg57jywRMMQcHEa5nQ8u8LtfHNtPIQ==
X-Google-Smtp-Source: AK7set/Se3uZ0sefWocthwYqjNb4NiX9kXo6FXSa/BhJDWcbwRtE+ISdnI/A9tGpcqaiYzveGjJ6AggdP5hh6ZA9Hg0=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr778837pgh.9.1677864519885; Fri, 03 Mar
 2023 09:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-5-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:28:28 +0000
Message-ID: <CAFEAcA_emihcb_dLiN529BwO-sinoQQBfUrxUCGH_HeV7dh5wA@mail.gmail.com>
Subject: Re: [PATCH v2 04/76] target/arm: Remove arm_free_cc, a64_free_cc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:28:43 -0000

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h     |  1 -
>  target/arm/translate-a64.c | 17 ++++-------------
>  target/arm/translate.c     |  9 ---------
>  3 files changed, 4 insertions(+), 23 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

