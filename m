Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuaP-00018D-Bc
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuaI-00016d-7N
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:30:50 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuaG-0003ph-MV
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:30:49 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc394919cso2550110a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289846; x=1685881846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cbvXxw6ZAQT9U9fcJMesQufLYpJLQd/f934mnhTig2Y=;
 b=sIb10+7ulyE+SNEDGga5tPUkTrVbpuTzPMolcm1IUSs3tXRLDvDJMn+hfREKud13RN
 GgcmgzUoERiTFYk6S21EoxrObzYUuGXNW+LjkR7mcEP29uNk2TNY2EDboRanmRkcv6P8
 1o8/9r56dceC/909mtievCchLftfXABQkC+zcffOExXSMJIhuzxLDPqALDYtUouYiEft
 FVvjTDI5BErwKilOTrYuAgb8tUphUmWmhpJ8bmdW1n5xmq7p9yTjH36X7qGb60s8GVFV
 puXJwu30pt24P5PLzz/LCLE2Z6/QL0Tfzx0knbnHI1AWb260WmSprfxE8o5eQoO5EV4l
 vtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289846; x=1685881846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbvXxw6ZAQT9U9fcJMesQufLYpJLQd/f934mnhTig2Y=;
 b=GRDEmPgFdE9Oh5ZkwEPAlC0geD4QLPBQd6hAxR2LQVD11b+J8VzW8S5g5OJoHH4ZRJ
 UmG5agWPkTYQ7L1uvDLbrR/p2GGMAugPcHLibuU6xvWRNq8jwWgLQlIyb0IEDUwKyZfz
 O2YcXOD8D92yMwu7tSwYVrLzkJegQmv6k/iNSFqCrFjoKbpproZ1FjT1dQYs4fFw4rtw
 S82qzUj/h0vv8chqbCGtkNv2qSPww0zwrfL/0yUsS2PTELkbIXPId9hbwGMC+fw/0wS6
 QDSDKmknBM/utl7xe4jqul44UT8kZ8XfpLxPHXmrYJyOHFi0igPQydI14hEHtEueiy/l
 +WQw==
X-Gm-Message-State: AC+VfDx51/KolvfLzZdrE3kV0dHbXfKBfzHT4kTw94LB3Bj1PQBG3Mhf
 zmBMCgothKETRrcEqrUn7NTPuutX5JLlTsUNTrEGfQ==
X-Google-Smtp-Source: ACHHUZ6zRaOwrtY2BEqYAeLdEKjPlJ77JFLMwPMxC9wPy/A3R3Rml1z4tG4wJQeTM42AVLvKhws6HZeazO/EiYIlv0Y=
X-Received: by 2002:a05:6402:1857:b0:50b:fb29:1d91 with SMTP id
 v23-20020a056402185700b0050bfb291d91mr1268243edy.1.1683289846043; Fri, 05 May
 2023 05:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-37-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:30:35 +0100
Message-ID: <CAFEAcA8YXLJwZEeLytwmtwFnhg4NAkVZJHC6D6PcdcqvmgSR4g@mail.gmail.com>
Subject: Re: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports
 unaligned accesses
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Fri, 05 May 2023 12:30:50 -0000

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This should be true of all server class loongarch64.

By this do you mean "anything that runs Linux" ?

If not, we should be a bit more user-friendly about bailing
out than just assert()ing. For the "tried to run on an
ARMv5" case we use error_report and exit:

            error_report("TCG: ARMv%d is unsupported; exiting", arm_arch);
            exit(EXIT_FAILURE);

thanks
-- PMM

