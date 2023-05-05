Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1purzy-00076Y-Ib
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 05:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purzr-00075L-PK
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:45:03 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purzq-0005qt-3i
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:45:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so2423053a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279899; x=1685871899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
 b=DOcqxeSu/bMOczf66pZ+OHLAFH+Jr8gZCsoI4/VYVy26cgWL8Dr9oq4rP+V+kzUbjk
 4cxNXbe9shiWhZ/RNXObm3F/PDx5dnxSG/dntcqoqMu35n5smjFdbuyj+diqnOzUUQiX
 E7soXGucW4NBPrSGd722qqTHtQBjpmUzEIoNwlz90Jof/sZbqL3MhwgFqlxAlkDcBbqL
 Dn/O5LfeyGVcUIX0xaf0hvHzQMvDlb9GOR4BcsR3NMKXQSu+/PkIkgF+ulhG6JLGWZ8q
 RpVwd0a0dE1xchV3CNih/YfKCToRAx1+1ivVDEwCMT4L8kP/BxUjAOehljCT0R/e/1u0
 hNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279899; x=1685871899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
 b=li0MkgEh6WkLPFtvi+/zq91MmqcP/chznhWplJ4M5ozJTgOQLlZPP5+gHCeJgEAEoX
 6mAMKEycS1BHxliK0CGksdQvKV9EN+CoiTKSZNV7iKX93ylD0Jd9jG7M/dNZgduDlvGr
 YY46P2jTL133LGHKdwsYDwV0c26eMmdX/XJT/JXrC98qhUXRee8J8TlCNmV1FmdW7pzx
 kB7FJrahPIUELhuKeCZWBX8CYagn+XjqoJK6mneovHtWIlXLN/SeH8k5g4Ij/sJIvpLG
 ayO8bcuUwS+qis+XXD2AiAp0MVIlyL/NpeWnH2JGw0YkNSyhD/REk74jChsHE0nsiggE
 +KJw==
X-Gm-Message-State: AC+VfDwV7Yw98T5Xjo3u3TlLgXDaFajmq69r0Wc+NOamq47WdjY3mEIb
 ldIfjufa7/vehubqJafRWcIW96F7a+82jcR+/1kYJQ==
X-Google-Smtp-Source: ACHHUZ5tbAQWCyDQJ4Oe/IHo0oWJ52M4qDlwSfUPnepNPkViLGJK0WPn5L3Hjin7OL5noyLAD/DZll5BCaNRvb+iNAI=
X-Received: by 2002:aa7:ca57:0:b0:4fe:ddf:8d8c with SMTP id
 j23-20020aa7ca57000000b004fe0ddf8d8cmr915781edt.13.1683279899509; Fri, 05 May
 2023 02:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-12-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:44:48 +0100
Message-ID: <CAFEAcA8gc7xkrkATWkrb2=vktB6zpA2TS4s4bZvHQxvdArQB+A@mail.gmail.com>
Subject: Re: [PATCH v4 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Fri, 05 May 2023 09:45:04 -0000

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can now fold these two pieces of code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

