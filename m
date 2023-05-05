Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuX2-0007Ax-JU
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuWx-0007AB-GT
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:27:23 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuWl-0002m5-EK
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:27:23 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-953343581a4so259520166b.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289629; x=1685881629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
 b=uR2KMBaPV8825gRuNGzmhYFr13Xb5HtXkNX3RkeWXQs7Pr0bqaSVrCxL9LO0N7lpDq
 Su7hD9vDLeIyeh0KWqrhEnlN0bovDtOPnVubJOrdoYCeHXu/hIk/WwJfRucDXJWa4RLb
 H/3W/molE/wR5ZnRWaXWAgSOANZGThvIpGhuqE5AwokDn0jFizcaliRS7lLIjAZCSSvi
 pn7aYyk+Y8T35EoCFVKHi/rwylizaT9vxPfc+N2Wrlf3cNrDmw8UoBlvnxKyOMU0HVQJ
 WkWIzdoaASgzNon8X532iUquDaqvU4wWZ+MLYDp8XoRM8cnELTeT/c8XVU3ldQycS3gE
 kjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289630; x=1685881630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
 b=B0XXNda51uSiLtQfT7NHg0mGbh7mfckD9vX56Yqpy7tEpSB8AkzZxh6wgHkIvhEY7O
 TBetiUuWB8jbAdoTfjsJ0cAR3zUKmO2hH5TJk8TK39s4iYiPZ20mHBymZ0DtiiuEw+z2
 4MnNK5GIsX4ucgNMduSGxrKBMZdnsdD/zOLEASz/HpYuLN45upwjyJsXLjNvFxc6EAfu
 lJNfQSSkHm390S1iQte1lRUCmPYrub9Zr56NR/yeSAXTLZQoFrTYynHlJxm46xhlvOAc
 8Jv/IBsU2xIPKn65U0fvs6PcK0TnzACa//1Gczj/sinrzMSIMAOjrFDoeqNfQIpjOl8w
 4aBA==
X-Gm-Message-State: AC+VfDyveRG1xmNPfGB3dzPYdvAZ20tfc9ptyJvrAvBzCk2eC/fdrS0Y
 Mzx32DJHOvu9XqhY671hZmSyn8CM0bNTZFBIzks8InsHMeEO6uOM
X-Google-Smtp-Source: ACHHUZ6LFPn6TbFXDqcwJ1xIkxuynmVjqExw2XoSer9jMdWtiaRduSiGjGaY4ioMc7FpIyzC/U4OfMlUPcE7zGyQWIY=
X-Received: by 2002:a17:907:724e:b0:953:9b27:8f00 with SMTP id
 ds14-20020a170907724e00b009539b278f00mr1117237ejc.74.1683289629667; Fri, 05
 May 2023 05:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-35-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:26:58 +0100
Message-ID: <CAFEAcA8bQUdLfS9HNzFwHXPFTc5TNKZOi9KfpQMdFym+xKzD7A@mail.gmail.com>
Subject: Re: [PATCH v4 34/57] tcg/sparc64: Use standard slow path for softmmu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 05 May 2023 12:27:24 -0000

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the target-specific trampolines for the standard slow path.
> This lets us use tcg_out_helper_{ld,st}_args, and handles the new
> atomicity bits within MemOp.
>
> At the same time, use the full load/store helpers for user-only mode.
> Drop inline unaligned access support for user-only mode, as it does
> not handle atomicity.
>
> Use TCG_REG_T[1-3] in the tlb lookup, instead of TCG_REG_O[0-2].
> This allows the constraints to be simplified.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target-con-set.h |   2 -
>  tcg/sparc64/tcg-target-con-str.h |   1 -
>  tcg/sparc64/tcg-target.h         |   1 +
>  tcg/sparc64/tcg-target.c.inc     | 610 +++++++++----------------------
>  4 files changed, 182 insertions(+), 432 deletions(-)

This is a pretty big patch, and git diff hasn't done it any
favours either. Perhaps I'll have more stamina for it in v5,
or maybe somebody else will look at it...

-- PMM

