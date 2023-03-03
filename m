Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYA8R-0001hv-0h
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA8J-0001OW-QZ
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:27:57 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA8G-0003AJ-Mc
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:27:54 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n6so3654401plf.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
 b=PZO92VnWC5+/GRuNZaOSoKRXuJdx17VekQvN+KnJtsajSF/qNxwNL8ilql7beoz+sI
 jsrr5PqGFjJc0w1GOMYfUcYOa2UzghjdZdNfW9RQaeWTQBVnLstjA1ZlgrTJEfFIoFTj
 AqWmtzShj3AcVjV0rF2jeJbQ9Q1hC7ZPlaD2WqsEstbdp5vVA3aecYqh8wnDSGYWiC9H
 0rBPYDkQ+1BlNzwPimaWKkX4+nmqkSFkZRX/zA9DNw2eQ1OjWm2fnh4jygZm3QDS5yvu
 3NNraci4TFV8D4SEFCRJtsTYeW8czVgI6nmyhtmJAefqMF152Y7Da7XB0TfSTgW+atdm
 jjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
 b=F56uQ3VAg4LnmFeOLdJV9wp5poiwRND53BGGw06l70s0EISdZ1cHv9sm+hSYIbHFWN
 uL7OTSA43xTzXX1U0MZJWYxyWNOsUGlzUmoQiwdzpNwA5XBhcChUrTRT3QHBfUMj0rXK
 8Z81DmYamGM9iT8Pt8RlQ7QNOyq/9XSXKePmeRc6FhglLv03RMnDE62ZsOmQp1yK9ceh
 I7Ou14uwIT9ljIpMOyStgpH9ZMYRlUeb1rf9sTNn+sjr8iB4OInv08Y/kcGC5T66d1Va
 1bW+HAqFQCWsaLbMJbfCqF7/rzrRv1aDcphXNMgQHCN3IYo8diYJN2GFQ02dJO6jVjZp
 GwTQ==
X-Gm-Message-State: AO0yUKUkmGcRxb1PdHzmQHss+niHyzPx7LpAvF3wkxjU3LFq+PU1Obfe
 B/3pEG38l4ZjSPjA9mjffsuaK94kRC4pCVw9cEsipg==
X-Google-Smtp-Source: AK7set8/6+XqcLDcUnDlOoZDzb65s0uZ3kXxtMKdvU+WYFeejXMeT5oss1hjWLPJi/KEVFSPcRIyo+gXF8CmChpalaU=
X-Received: by 2002:a17:903:2616:b0:199:4a4f:9d2a with SMTP id
 jd22-20020a170903261600b001994a4f9d2amr1075307plb.13.1677868071039; Fri, 03
 Mar 2023 10:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-18-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:27:39 +0000
Message-ID: <CAFEAcA8yj3+Kw7ZxZoNrRUbeCdjU6RpVi=t1e4d0yRybNH8_3w@mail.gmail.com>
Subject: Re: [PATCH v2 17/76] target/arm: Drop tcg_temp_free from translator.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 03 Mar 2023 18:27:59 -0000

On Mon, 27 Feb 2023 at 05:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

