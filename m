Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pub8i-00069e-Gj
	for mharc-qemu-riscv@gnu.org; Thu, 04 May 2023 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub8A-00066O-Gs
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 11:44:30 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub87-0004IQ-Ow
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 11:44:30 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so18496523a12.1
 for <qemu-riscv@nongnu.org>; Thu, 04 May 2023 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683215066; x=1685807066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
 b=YZX7NjTtuRuW0PHT6NYHwI2cpi2v/9FVFGGZsH9vxX+Px9/6NeaiYC5pm/kOMTJLJK
 yH7JyHctqFKTe04qk8vovgtJi/xtnn5H/4HRTaJPxQkw80HIKzbVIyfh63VJgW4Lw6RQ
 X5p8+pz6hjlVzyv0CGKfqPkYYdi2a26itR8uz/0FhyVywI8LnWthP1nCkuRtFlw0mOoz
 3w0jwunP+OC1SzS6gO+sirhh69Rpejx49KURF36AEqA8gKQBuOpkQNTPqxZZd/gq/67r
 olroA23buRP/7+7IRFN7IhTOChzRj1XypFF3kZzwSJsL+uxwqMRqc3zl1KA9AM0FuFyx
 B5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683215066; x=1685807066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
 b=Edue+MlY8NkAWZTj9UZmQN6VjDnxI1mldPIHOn4GHGO5iRkooDOg4O+xEB+onUh+gK
 +J8Bd2IfRSlcv5rO5b8gO/8zFPoBKPZOyIdD+u7geYvSYUvaB0zKpy7F3SHzLPGor96h
 kiaY8hg7MEyzXVUBQKqSp9zXxSfPfRuBeEKlID8EXdCgDbwJJHjvZvznxQAYKOZzj3Y1
 Ydp29lf/uAZ3a46DtPIWoS2yVEV1W8+EItSzmeAG+wma5dNzzB1/1yoZkBqwTZUMwgFm
 I8WRdPdncO7r053dCNTpjfuV1Na1VxlUpNqTOhUdJkrEtooxJJbPNmdWG3AOFWHDT1MD
 ouVA==
X-Gm-Message-State: AC+VfDw8q0xdIcHPwbwkcJams2o99krj+KGcE8fbvTCXTWDI7DsBYyUk
 FQU2QzNCJGnuvrgt+Bn9qrDHq0q3SDw3mNCgE09f3Q==
X-Google-Smtp-Source: ACHHUZ5vVQAWtpxTBsS0yDud8X3Od/9iKx98WuA3C8BVBSoHUSa9eZ5cmDeDMiCBgFwTwFswyxzeXzt4mYFf0K6oMjc=
X-Received: by 2002:a17:907:1c97:b0:94e:c40b:71e3 with SMTP id
 nb23-20020a1709071c9700b0094ec40b71e3mr5504940ejc.5.1683215066393; Thu, 04
 May 2023 08:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-6-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:44:15 +0100
Message-ID: <CAFEAcA_ZW3EW1L6rCuhDjpaANhkaNvAbETWaaFFdvJ2V88aOSw@mail.gmail.com>
Subject: Re: [PATCH v4 05/57] accel/tcg: Reorg system mode store helpers
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
X-List-Received-Date: Thu, 04 May 2023 15:44:30 -0000

On Wed, 3 May 2023 at 08:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of trying to unify all operations on uint64_t, use
> mmu_lookup() to perform the basic tlb hit and resolution.
> Create individual functions to handle access by size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

