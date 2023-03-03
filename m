Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYA7y-0000DN-Rf
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7x-0000CL-Ne
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:27:33 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7w-000358-6v
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:27:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id y11so3680305plg.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
 b=RMLZfIOuZ1DTH/QlVJN1jKsa4ib8Pi8ggm6+JCOgl2vth4Nk22fFfBvmuEpE60Qtk+
 sPFLHL5HP7ERF+JziONTngm4VEr5yPCuQz1P9XVjuXxaFuiXnScN/+gkdYRpA39FdTcA
 4YMevUP5HKRjf14J66WVCof2hlPxbnl+9Xp21WnK6P+f2GXPl+KX5F+xw+bG3ua92usd
 ppBaRMCVB5RiIUO2y8xUhLYyEj0pMWEV9scBRwhGy8UY8QXC7j74Eb0lvPrfedGQu7j3
 FHZK8hsU9IA7jxpzAIwQkn165/N6HvW5kv5wXF6wRho4nsBX/BD2qiXl5udQs+dqblib
 Glpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
 b=YOM5NFhOVKkKKMqi5JdK+zODEiKi4LOfB7vHYWzIABSBu/tGvfeZW8/6mhV44DsGTD
 52WVkyn/8Jqo1R1vctXwpgiCCJPc4FJXzUnOxyu6U7IohRAqAhzbbqlz4OtKtRLwVNWq
 ZO2B7T+BbeHp7bAE1dTp1L89M2jEsi4su8XGfOzedItYvFqMQcl7xS35hWmVhxW4KYjP
 Gcme62aRsVMfLL8npPwx4vonXeFbAI/zHTnNvMFsyKYAj5eNla1QR3shmtKGXazPJUsP
 XNeRH0D0BJYfW8ohNywWxHZQ6Xe0YtJMBXAWrjuMBHv9KhBBot27rQl0UgnwduE3ln6N
 rB+Q==
X-Gm-Message-State: AO0yUKUpde+2UcqzyqOLbn9emiREYvyyQHUUkFChYZD+dV3F/623soF2
 RzitGar76CXYhpfEJ0P+qG6ypzmKn4m7Z92whF8hJg==
X-Google-Smtp-Source: AK7set980xQFpL7gnbOC5Er9xh4VYohDz1Kz4Y9LPBbEXurAqeADlHkvJCsnNVejYznG6e/egRdtGJ+Hd0TlbwyAcuw=
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr1030807plh.13.1677868049626; Fri, 03 Mar
 2023 10:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-17-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:27:18 +0000
Message-ID: <CAFEAcA9JuQJWHuAYVhgn4jpfMKPtSYAh1iuZ4QemkfzEcCycvg@mail.gmail.com>
Subject: Re: [PATCH v2 16/76] target/arm: Drop tcg_temp_free from
 translator-vfp.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:27:34 -0000

On Mon, 27 Feb 2023 at 05:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c | 193 -------------------------------------
>  1 file changed, 193 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

