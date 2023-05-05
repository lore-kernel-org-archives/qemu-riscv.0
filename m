Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuED-00023q-FG
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuE8-0001vA-6t
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:07:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuE4-0003uz-Ko
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:07:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50c8d87c775so996078a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288471; x=1685880471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
 b=toCwEcBpcgznIvluG75IaXc21e31dkk2dhDH/BmSuaT9MCPkXZ4cryBg31RS0IhyCz
 y9MPG/MM43JArzFEQb9vGN0T2I2DvHS9R2pjP9Pd4oAikI7A2TCqqCMayyLsD6xPbVsi
 Fc2pRyypF5NF1WG7fl0woqZboLWo9yCtkP88KcQJR/UWNqWcA+9kaPd7/6Rn4NtLson4
 ZL9eiIGLQCLSSaWJlypva7wIMoDeWYTQIr3vU2tK+lBbekCjHFZpz06GV1OZM1fbkkUS
 O6a80gv/DI1ksLpSSfH1cEaPc1imfmVsDAZG3cLR0Xu9Z5JeTFQCKHw0aVklgzaatXqP
 DUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288471; x=1685880471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
 b=k6j6pahaoF1P5qu0UZ0lq2Du4efKjUfRYbK8aRWiMMQusYhVBWIpWAaBtof63pFBcn
 t47ys4UP85xjvQPH5G5R5FRHu5JkwreWm0zJA1bxF2N7Jwg1v1BzvRG4+FfXAignySAI
 TJgyEMu0gM9jVl5QybnzxyjE22ZC3EGi0P54EbhkMAOEFNPTWjtqBMfA1GTpECx2kciJ
 duKGAAs4V+viLVIom1MgC/O4N9Vys5zlPOr3Rm262+xMmL+7yXxC7bY46MaGMnDUGYKN
 GYSgyUNjAKyrE0WZvK97mogYjF51Oc3Ej2K9GxsGfQerTnZa1AYgGYzXDX2o/HjTiKff
 4vJA==
X-Gm-Message-State: AC+VfDw20iggJK7mNTgxtc4yCyYDpUfS4vecfp8BMm2t1KOn+ktUAhUP
 zLBMN88//ItS1JqcxvC06RE1BawMNKwJjv6DX9uKlg==
X-Google-Smtp-Source: ACHHUZ6ycNwUU6FZZQsTUBIRzrQ60zMtGvjekW/pniytSxbWsfbBPnPx3gqF8EDOC9xspJH+inZ37erHI3todzQkF00=
X-Received: by 2002:a05:6402:31f4:b0:50b:c370:4967 with SMTP id
 dy20-20020a05640231f400b0050bc3704967mr1447655edb.19.1683288471040; Fri, 05
 May 2023 05:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-26-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:40 +0100
Message-ID: <CAFEAcA-Z7m+jP4NnDf-yS_junBx7PMY91rWgWO9-1qFOg4s4Fw@mail.gmail.com>
Subject: Re: [PATCH v4 25/57] tcg/riscv: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 05 May 2023 12:07:57 -0000

On Wed, 3 May 2023 at 08:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

