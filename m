Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuDH-0001BF-Ux
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDF-0001AJ-N4
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:07:01 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDC-0003l5-8i
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:07:00 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2547413a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288416; x=1685880416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
 b=qCrvOz2yM6Yvc/27Ca3lvvqoJtZ8boRbw/nPBLetawCiL+oNC5/xNlxkWpWlzpP2K6
 A61O8wcmjsUET7pC1tWH7fZownT7Yfmh2KHjajpKXP2CYB9+73gzE3dXdAbhxFTjp7Cv
 sUEuY5d+8aiKdKN2L2Ge7rRUUOE2slz18kse0JpQ+BXvYS8iaa5mXWersJHBED6oK8Et
 lkVS0xCNuyq1ECjhf9lPPvDJc1Mo6iZQu5/boBshApoEElOqkyXdJCaDrUSwKKXQF9Tw
 0rpWKx2rVHm6208uwnVMmX7kyTDTBY8d9B1mC9xCW4PHlXpMxZrOqAhJaBR8ABlNHsEN
 g8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288416; x=1685880416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
 b=S3hVlNgXg1GERMEN4571LeoHAwo3Ks2NRBh1TP8DchK+gTHCBtYJEZXjFimj19uoss
 ct4iEiec0k8DGQE2hNk0ZnoaJD4bhX6OOPpcA+Iz/EWeCUs2xzbisammWW9WTxue5drB
 8O+T8ORNumvcHQhlqD/NxGtI6/AHTOGf3W/U7bUoSGmsUMVyZVGzlWzv71IPe5YD3C77
 Qo+YWQILlXwajXtrKVuvyKV3i+BAXZXJvU1XfBUYFiLWqh00LJ0s+xLMexMqIvoahWrq
 3tFez43xAseNA4kpgOTuLHwjL4o4Cw9VHZGBf71FRo+qTIaODBEKHswMdVRKs0pck5zC
 5f7Q==
X-Gm-Message-State: AC+VfDwipsxYqj75G494sKx5r8HMUK+WH30Ije6XA0r6WBcjV3Z0rdro
 UvktgOZifmlJAqSEE8cyKteoobwE3wQABCP7hQEqvw==
X-Google-Smtp-Source: ACHHUZ6YmfAbS2DWLZdyFpGhdG9ShQaHvYqfb7kFJliPX4REGVwRXdQCF/2eXqWAiI4BTKrQpEt1uPcrDdJFuVhdu4I=
X-Received: by 2002:aa7:d408:0:b0:50c:2215:3193 with SMTP id
 z8-20020aa7d408000000b0050c22153193mr1405048edq.13.1683288416187; Fri, 05 May
 2023 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-23-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:06:45 +0100
Message-ID: <CAFEAcA9ffNOA9oKV3e7PbecOzu7yyWAs7ecqKbNrTHtiDKsGTQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/57] tcg/aarch64: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 12:07:02 -0000

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

