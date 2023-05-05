Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuLg-0007xn-Ev
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuLe-0007pY-JE
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:15:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuLb-0007u9-Ba
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:15:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso3029833a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288937; x=1685880937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
 b=BSr7gm6LMYphEseQIwyCeggFciVQedUb13wAHIamWju5kbbWmqFDUI6rPQj8mf4zhy
 yk1Nc0iZAYYv6qJv/44p0GxjeCW2usjWMC+a51Y3JMc0585UeuBwqxDeP0IJz1KqAsub
 w+ogk5sBc8qU8UgS1LlVFi2DVJrnYclcMLrZwrAYpfCOHAPSZDIE2BOEompjEdPHEb/B
 SEQcfLgYZRS39r7SJKFLyvv97wAF+SxSvCGGR2shsnLWV/zWsOtMydFQk04skdbV6oAI
 Z1Sx/XmqlzhZtTUYPaGu7MkrpFcAEHTYvVd6O+cWrDckVPEa2KfvRrF8KmmX2Nfx5V+X
 t+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288937; x=1685880937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
 b=Y4w0ooumGEmhDSiDzru3x5Wf+4YTKM0p3eMH6SaaQWrBvmABYZo4YmAb1R2eAB8G/N
 idHcU51xoHXQ+YUwT/92mOHVaVSSGisLg5o/bdyMlkquXHzmzUXANZ1WiJfI+HbbNuxJ
 r2BaSIMDTetxjJV1smLXX1L49SkmefAmIWmuFxcvy/M6b7PnA/NTQdGx7lTU9zJQranp
 YGQzaaRnGMnpcuDxZdC12b9+9otQIviB4hPI2FcxA4FTZkuxaC6vX9vY2BgEnt2VmyPE
 E/+K555HR2+XDwfY9EXjXuIjvEIO//vNf5tL2IDNQaN9krw3tu9YRd4/eCtZIOxZ9/yC
 eJrw==
X-Gm-Message-State: AC+VfDzOBicH590Nsy1rbV6TF3mHTsptcck3EuvHyi6yutxY1JGPZw9t
 zL1n2wbTfqo9Dvzh+3v5NzUgyN7EIJTh+uC3BfjSgQ==
X-Google-Smtp-Source: ACHHUZ5ACWXELeAmP2r8O/H2wf7FX3FZcKdmmqHjkvb9BxsDT/FmA5JPrRn4oAm9OIzmxHkfDljBz9GNFWec+X1l1vg=
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr1370834edc.29.1683288937699; Fri, 05
 May 2023 05:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-28-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:15:26 +0100
Message-ID: <CAFEAcA_t-1-ue7PSKd3oXBD04wnYHJu869RRc1J3XuP+40-bmg@mail.gmail.com>
Subject: Re: [PATCH v4 27/57] tcg/arm: Use full load/store helpers in
 user-only mode
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
X-List-Received-Date: Fri, 05 May 2023 12:15:43 -0000

On Wed, 3 May 2023 at 08:09, Richard Henderson
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

