Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMSqR-0001Re-Mv
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 07:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMSqQ-0001PF-8X
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 07:28:50 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMSqG-000056-KO
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 07:28:49 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id 199so1005519ybl.9
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=g3wO+MInPhXOJJuApiOb69B9Nmg/XgtAZTT79PQbkC4=;
 b=vIbPPDBp/rsiVOCtZ0rwe1nqmd8fjqqdW2BNM34TzIGS6bONbdx3ujlg1w1rGOODn0
 zdAF32v7+sGEh03BnW9KcHwr4yQ7cCXWfqDgrhGAJrZOVgVjilqGCYAa/3OwBhJk+n5u
 y09qiBmveUXcYcJRxndLku4fBS5BvEhp+XPwNQVaKlQFFdzvCcqvVabCkynBd8J8/Sjj
 ViC8KqjpkOylbcWr7zhwy+/qbenS4aTbSlnu+9//wT+RfhUnJjzwyh4FvS7bbyNM53Hi
 YahRtG8an0B0yBIHkByLQ4mZMG1+Al1VvQZ18DnXl2bvV+Ai8T6dYi/xa1rX/nSqAsW+
 GY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=g3wO+MInPhXOJJuApiOb69B9Nmg/XgtAZTT79PQbkC4=;
 b=SZlGf4Re9/LrFqkt8e0I18jE2NTd/w9SzsHZV4UkDSYIWba5l2KrRHztzJb1ou7Jz8
 yhRcCzUWKjw4iLXwT+V4o6MCficVIdrywRJ3h/hmLtyNqpk7hn2WI0Go2MdiNsEerjeR
 pRvkqCgD4To22jZLtxGDGEmHb2FjLqFINgk67OlK2VjRLH3mstxsse++HyliJMCLaPBM
 f9oASJrEaGGw/RVxbHvDxS6GaL5YVr29d7IB+NBf9C/hYQuJNyvprv2MmcIH2l2PfLVC
 ff6gEtzBXn5iCtPhNtct7o5SQxI4Gtz4qas8bhr1dwE/lItKVw0+xfnTe+1Kw+tNB4TT
 Cjeg==
X-Gm-Message-State: ACgBeo3sRetoXlPZbVYCdSAW7yoY2Vxz3mnMSqTmsxtnZOKl1mzjHoo7
 H5Z7oDU5pPL9uGgmS6DCRlY+LFpQe/EG9vfaNY4wIA==
X-Google-Smtp-Source: AA6agR6gztmtwvBGmjrpMLy97Hfq4TyWBW7QRvKHssg2CS2kA7aOAH6B9ZtubDP1SZ15jJZY5zYeX/FUXslYhhUp3mw=
X-Received: by 2002:a25:3d0:0:b0:67c:2231:65e with SMTP id
 199-20020a2503d0000000b0067c2231065emr2806450ybd.67.1660303719579; 
 Fri, 12 Aug 2022 04:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
In-Reply-To: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 12:28:28 +0100
Message-ID: <CAFEAcA91NRxn5OedUx0pLp1ThO4jLjmRMRbnL3zPRXq4g68qAA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 12 Aug 2022 11:28:50 -0000

On Thu, 11 Aug 2022 at 21:47, Furquan Shaikh <furquan@rivosinc.com> wrote:
>
> Unlike ARM, RISC-V does not define a separate breakpoint type for
> semihosting. Instead, it is entirely ABI. Thus, we need an option
> to allow users to configure what the ebreak behavior should be for
> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> privilege specification[1], ebreak traps into the execution
> environment. However, RISC-V debug specification[2] provides
> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> be configured to trap into debug mode instead. This change adds
> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> should treat ebreak as semihosting traps or trap according to the
> privilege specification.
>
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf

As a general rule we don't allow userspace to make semihosting
calls, as a (rather weak) attempt at fencing off unprivileged
guest code from being able to scribble all over the host
filesystem. We should try to be consistent across architectures
about that, and in particular about how we enable it.

I have a half-finished patchset where I was planning to add
a --semihosting-config userspace-enable=on option or similar
to that effect.

It sounds like these ebreak bits are somewhat architectural,
so maybe they make sense as a riscv specific thing, but we
should consider how they ought to interact with the general
behaviour of semihosting. As it stands in QEMU today, we
(at least in theory) ought not to permit userspace to make
semihosting ebreak calls at all I think.

thanks
-- PMM

