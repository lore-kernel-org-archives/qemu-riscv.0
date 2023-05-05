Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1purrn-00033N-81
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 05:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purrl-0002v6-Hn
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:36:41 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purrj-0003c5-Vs
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:36:41 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so2635639a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279397; x=1685871397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOxAmCxmq4mUmQUBKqSuiGDnmChZNo7gJ0Dlt2ph/T4=;
 b=IxMAP7a/YsZVoKDoPthH7twSLdBtu+z1Mg1s/uv1lQwYGACb9QDrGo0qr8lvrxAAlU
 BeHoLL5rfx3JhmTAjJM8vw4TVYNtlw7dUKA8fBlWoOaS/rgo6w/hR6H/6k8fHbhqMpxc
 7uLvBeS1RoMtcL4QBT8JYYWoauAM/M+XOOSj9mOKpIV+NHPPSIxp8lyBE3ktf9QDB5in
 CEx+TiNLq2Q2s3aOAGyQlEwoRd7Qgljx+lxYOy4f/Ee/dwKG2iYQPxEkaVLRc78PcDej
 OfzRSYV/BL+fhYeNXiC61Av8DSKbG+fvu7isyoj4pqsd9vgLiLm/MX0Uztf+aUa2ybAV
 YhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279397; x=1685871397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOxAmCxmq4mUmQUBKqSuiGDnmChZNo7gJ0Dlt2ph/T4=;
 b=RfMiDPfOydDmIb+cTKwzmpEFxG+QqLmwEgdfKpfRI2+pehjft60jquMEtou3A8c8qI
 pusJSRvMJ9dvKYx7luzjRALQAHvKm5VKkRM7PAtExxvAV678/dmVkqQRMXsgR8SpokXx
 rrB/lZkOO2IT4x/PwuyniCUBtD2h2aksBHRitFoQtUbm7Fi825OLbcVsm4tUlYyMZQ2b
 yqi+OIq0mkdYJY3xnwWi0ohta3CENmInLvzNmfiPkQg+5Ho24n89We9IE6ZNqhwywWwV
 a6G1qVahrtlBcVKTQndOCBSYCFF1DHuAxh/fPvOITiMDQv4f6vH1q2rIK09qhoNS1ZY9
 FCrA==
X-Gm-Message-State: AC+VfDxbOyDEtYe6ol0/kZXQWf7CvyCc0r/1pZf7SM7Z+0RL43lbMX+v
 uUOlThKauZjxipnxK/5Wh2VlgW0VF1Rf+cMUxw0vVg==
X-Google-Smtp-Source: ACHHUZ5pkR8UwmRh6C3wTmfx21nSHayjmf2zWPuhZUNzyhoVefBnfSPD81hSuQYDHmCX3BahFPuJq8/4tUvY7uFEu2g=
X-Received: by 2002:aa7:ce18:0:b0:50b:febd:3cde with SMTP id
 d24-20020aa7ce18000000b0050bfebd3cdemr649377edv.42.1683279397303; Fri, 05 May
 2023 02:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-10-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:36:26 +0100
Message-ID: <CAFEAcA-mXQ5+3bt=uHaQV4YRncp4HJiO03hE2sNRpgC+7xouxw@mail.gmail.com>
Subject: Re: [PATCH v4 09/57] tcg: Unify helper_{be,le}_{ld,st}*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Fri, 05 May 2023 09:36:41 -0000

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With the current structure of cputlb.c, there is no difference
> between the little-endian and big-endian entry points, aside
> from the assert.  Unify the pairs of functions.
>
> Hoist the qemu_{ld,st}_helpers arrays to tcg.c.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

