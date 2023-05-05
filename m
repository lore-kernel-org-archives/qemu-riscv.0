Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puu82-0006Ta-4p
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puu7z-0006RC-PE
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:01:35 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puu7x-00022h-R9
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:01:35 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-965cc5170bdso176998766b.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288090; x=1685880090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
 b=V0lalG9XXtCujSphE2jmcN7CLGLfvn0ySJiaRM3ot9Pozj01nX0C6Z70vzHr0uFV+F
 Fbqxm8wXkpBxsllSId1BPlxw4OlePFCF5oBzdj7paqlFL2itqxrU8aSvn+UHts3BaXys
 h4w/SAKTurLhJDLFVoM0IOg2CNlq2AP1bNDf6WmQWKb8sHUD6aFN1TPj/gI78Cm1Lmaw
 BxaNcazMnodF8SPBCXmtDutjwZ76NsbZ9pxgb05m2aODHOuj7Q/Dn13Z5MXPKyAHMwgl
 xc3DpxT4HYv9BhDd6UZJtV/RPn93hj/4FZfxIQ5jJ1Kp5yEamEKqq5du1dLue6IsDzhO
 Zg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288090; x=1685880090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
 b=AxStGqgdnPxMPMX+iBOKzmD/99q6GvSjkjsObEyYwnYVn7MF0NBwkGDDLApbFGti6i
 YicaWaOA2HX7XnICRYp0mEJB1/0W2oSmUX0+4l2y6VC5bNGmua2EW/N/KC1OhjIHAUwx
 menFsO98Kw0tlrrGPruE1HWMEYd/pqV6/SkAax650HjPgZHhxN8huJimdsgXRxrhn6WQ
 3LJzcxSwN13AEgFa8hPt29BYu6u7sA/+8lolDjYTP08lQ5vVTHwpVXQDAXkq028gMEpw
 O+kWOKeFPsreBqflJTcY9A3S4DauMHj6JVNeh4IPKGsMx6UJK8ijCvxyxjLcATlf7s1v
 HTGA==
X-Gm-Message-State: AC+VfDxYVh5I6fo/KGHajDOnXNOTxSK2KiFXxIZZbG0l5jmoN21TDEwP
 eWGe22Qn5WCtGo3bd6qWGXALYKQa2TVBgYvjh5QcSw==
X-Google-Smtp-Source: ACHHUZ7pDm7LgnyRLkGask/K4Is9uLtQ3FPEDhcx7+lrIW1zes640dGEGD7JEmSHYCHkdmJrbtZfGwdLdURudUp3gCo=
X-Received: by 2002:a17:906:ee8e:b0:95e:c549:9ace with SMTP id
 wt14-20020a170906ee8e00b0095ec5499acemr813409ejb.62.1683288090174; Fri, 05
 May 2023 05:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-22-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:01:19 +0100
Message-ID: <CAFEAcA_eSG4c1CKgOgOphM2yUZ1pL3AM6muf8Bcyx8zwXX9sSg@mail.gmail.com>
Subject: Re: [PATCH v4 21/57] tcg/i386: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Fri, 05 May 2023 12:01:36 -0000

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

