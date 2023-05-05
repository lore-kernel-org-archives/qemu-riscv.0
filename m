Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puryN-0005uB-AL
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 05:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puryK-0005tW-5k
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:43:28 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puryI-0005cO-BY
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:43:27 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso2784920a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279804; x=1685871804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PuJ6ae1PfjSdTsIRD02OPAtk9Uf/WGazrcd7M5Rziwg=;
 b=ck7+UQclXU9s4MoKUOzA8cbA6Mcczv0ywJjq3Ok9Fay8muZiO34ZtpFFlinzzoZCWt
 zgaR/YdPbJO8YlbV7egVpYCDR5BhZOK/84htj/PEcTzspXvaIb/geIvtZRS+uXYWzeoF
 evno5+4iFQBZhMkeQeSLJgxNMwLgs0/9VEAg2lvionLS7KPMwG5D6UVuaufgbfAy0ZEq
 OcX/E93jOub3ve+jnKDlmDDv4zqJP4tTqncGEfI/Lma+4NghTapH5+1mB2Ozu+ADihsq
 WAZV3NSVwSp1IpOsiGqTsOfVsIEUF4rIIER0hWQQHkA9wcmxOINeimQW5qBEvIcqxGTa
 q9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279804; x=1685871804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PuJ6ae1PfjSdTsIRD02OPAtk9Uf/WGazrcd7M5Rziwg=;
 b=RSmL8GVgOZwI5oXPdvz88uBJYdHd6TWLXJcoQLrRQYqLvK4mmWLXI4YJlc0lRUct9n
 FF6uigr192booZAt3mR/HIyUBfcBdfpTirSGgiv7n2Hi+8TQfq3l5vrBgfWmoMKbr+TT
 rkf/R57wYmjdUZtp6Nnd6j5t5PY9/kp2fSTRe2KF7oNNqP7hrH8mDJZTfBudoK192Slh
 Vb9bBXQbq4beQgQrjIyt4Ok9ReJU2HfznhU7MXry+NtLOZ6kGy23id/Ae7GfwRFFLb5m
 Nr6c3MTfEP0FMtIiEVZNuQ6YyIzw59bE9f/lXTOdKQn+2LDsfHSSFDQY6CAiSU2I7+kI
 4lzw==
X-Gm-Message-State: AC+VfDzvvRpie8vey486znO/flL4X+tRf/JzIrrg24LVkMiQICeQ+Iui
 9Lt1YhrpyJB0mD8w+6fnxZK1Gt6W7qiIw7Dm/Xcmag==
X-Google-Smtp-Source: ACHHUZ7XQbKDEXatSFUElEJTSAXrvKmtI2g1m30By5lckjoPCNCTkShoRlIIZXmcCEnymMFrd0cmWj6AqCKNpwPb3uM=
X-Received: by 2002:aa7:d355:0:b0:50b:d5d1:7409 with SMTP id
 m21-20020aa7d355000000b0050bd5d17409mr794305edr.23.1683279804312; Fri, 05 May
 2023 02:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-11-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:43:13 +0100
Message-ID: <CAFEAcA976E5VFD53HE05v61QCKy3ZmiBNfP+PQYpZ8t+wZKvFA@mail.gmail.com>
Subject: Re: [PATCH v4 10/57] accel/tcg: Implement helper_{ld,
 st}*_mmu for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Fri, 05 May 2023 09:43:28 -0000

On Wed, 3 May 2023 at 08:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> TCG backends may need to defer to a helper to implement
> the atomicity required by a given operation.  Mirror the
> interface used in system mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-ldst.h |   6 +-
>  accel/tcg/user-exec.c  | 393 ++++++++++++++++++++++++++++-------------
>  tcg/tcg.c              |   6 +-
>  3 files changed, 278 insertions(+), 127 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

