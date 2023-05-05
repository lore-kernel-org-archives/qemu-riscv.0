Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puulJ-0000rf-Il
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puulG-0000qM-DG
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:42:10 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puulE-0008Jn-Dj
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:42:10 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso3322859a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290526; x=1685882526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HRfaO2e+ySs0LwBkN0aMeaZi/Q32IBPUuRmQDFHFZbA=;
 b=tpGxdHJYspAs8aKp0rhjqoiGrPOvljvD8WFnHOyh8eWFbhHMFQK6yJ+7rgH4SiwMum
 kKl4jY188R6DJpW4AYM5V1ygEuJCMBAoNPu8Q+T+Vj7YfojW41LPHGyp+zzBcoaUnX2i
 qLU1jgFxuVbTRe9Z3KgYQLPtul0HirrJeVfW4iALw8nUb3QRkg64jum8xbridhY3pvqr
 NGEgFxquFaHWMe7e5yl0nA8+BA+r37XFoTxvHE9wnbHotMhsUl10CW8Tz/hGQDF7zSYX
 T8VsiGDvORPH/M91OO+/sYsan+0crEVgn+mDq9NMhQ0CCTfTqCVSbX6cmG1XC1DzVdBY
 w4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290526; x=1685882526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRfaO2e+ySs0LwBkN0aMeaZi/Q32IBPUuRmQDFHFZbA=;
 b=H5m+t4V6puD/WvzPgWDA/+g/+OG9hnytcyhjDbsVDbotjN2cq2wl+UD43ZppjyP3Rj
 xBMSSte2OipzRAQhIEmQLYMzV+Ur6boG9NnvtFlXmtKfAqYAkBuKIxEP1pP2COdWUYDI
 sEhbBjfmsqT4gu2PEBEIDTMM3frDhOjxbcV4+zZCzOPL62IjdygeeuKdfySJmlu3z27Q
 6cHs53bS1LhDlY2nl7r82vJqS8/bk/6cpo9EbbZA5OqSLsbYDMuB6FzKKJOlsK4ufkEF
 DB7A62X2qz4YnVsgMSa++YPhurbHxUr7DPd6/vqIs1oVuAMYsyyFDL2aENjsZ5+FGoFo
 cU3Q==
X-Gm-Message-State: AC+VfDzZTGUjvtDuvvqJHlnIVQTbr0qc8ZLiW+XghHkNCJxrisEnu2Fq
 Qt9ftWxszh+azsq3r88qkYKmXuiqIzEzHPDCjHKqkA==
X-Google-Smtp-Source: ACHHUZ4U8rKK1vH+TvTYCQFhMDHfZTEFBEsi966xktLotWHECwPQwl0G+ye07+W6YV74+bA+WxYnOeRPqLFZsT1aOuU=
X-Received: by 2002:a50:ff18:0:b0:506:bb0e:bc4e with SMTP id
 a24-20020a50ff18000000b00506bb0ebc4emr1152081edu.39.1683290525710; Fri, 05
 May 2023 05:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-40-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:41:54 +0100
Message-ID: <CAFEAcA-gxwTpU4=y7+-9Pu6kWFdiA08AOhmTbs5aSeUZ5+mq2g@mail.gmail.com>
Subject: Re: [PATCH v4 39/57] tcg: Introduce tcg_target_has_memory_bswap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Fri, 05 May 2023 12:42:10 -0000

On Wed, 3 May 2023 at 08:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace the unparameterized TCG_TARGET_HAS_MEMORY_BSWAP macro
> with a function with a memop argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

