Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvH2-0004Mc-N4
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvH2-0004MU-54
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:15:00 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvH0-000574-Go
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:14:59 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bc394919cso2629874a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292496; x=1685884496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lzORy4UG7h0NxrjQALAA3hPpEcdKUd2ESwlKgbn0Ci4=;
 b=SndHSfVUH/Dj/TUJbW4T0Coc7ocpIb0trYjZP/PpIwnpFwh8ppuj1eZj5rsFYiXU9P
 q02vrj3ek+D6ApFG7aRv7/0UQWF4GA1Sy5usdjioN3IQZf6Xq4aJfJ/o1xr5XJWUlvfO
 IPFVi/8wY2Dx2Z8o7BGq6d4cdbu8zK7BygHPjjlVm907darKgMvFnuRESoDE16pGwHkv
 Qvhqv5RL9mloa6vI18JmC9d4P3DVUIDPnhdXj990LZ4+LyIVWgp1RY7MSP5MTse9TL9n
 fosSRr9GZSkVGEa0dEDzfqrBXSajWvteO2x5C/sMmQvUL+R4U092EIlBYKcw/ReMecTO
 lrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292496; x=1685884496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lzORy4UG7h0NxrjQALAA3hPpEcdKUd2ESwlKgbn0Ci4=;
 b=EitDp8S3g+obqpLWGDJdCD1uOzQFqu9Jgdp/+qmO4dKnDfNZ2DZTaCuHWG8p5Ozgct
 ZpL44V5aj0S12h9AwhhVpImfFpVaQcqOfCtTU9cssDUz+VfCaRkKkwax8fgbmQtFITDP
 brxK0mdqzJOz61OXiUgQz5x1TfzdS8YCH1TpnZ964W7McWE+gYdOtqNLyV8JDCPJwfLf
 yzMQwRW4teX4vZdcReAGtlRyJnM5QGu1g3x0vb5GH3I6wBgPrbJR4/MRflIe5syLR3tQ
 j0JTtDQcl3WyzymA5zjg7qm3L1hYM0MiBusdiJmoQKURjhkHmUA5/Z2ZtcpfkTWhUzgq
 NMaQ==
X-Gm-Message-State: AC+VfDwsOKCU0MLits2LoidzKee4gct6JECzTBC55HIfrmDJN8rp1169
 1o9H6NuEQlhMssFCcvH6bVBMl/ws6LZh/hRnbTLymw==
X-Google-Smtp-Source: ACHHUZ4uwV4E8H3oYR9s0xV/rDmG0a4jRM+XNPDIZiMMjFMQD8wbBUMfUFS8MT+74l1orHRpMYRlAPE1IpE+ZKEMnKo=
X-Received: by 2002:a05:6402:74a:b0:50b:c3f9:8512 with SMTP id
 p10-20020a056402074a00b0050bc3f98512mr1287706edy.14.1683292496398; Fri, 05
 May 2023 06:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-44-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:14:45 +0100
Message-ID: <CAFEAcA9y3W7BuaqUnMZ7gArAYJT1gz8K0zED1QreDgDuEY2gtQ@mail.gmail.com>
Subject: Re: [PATCH v4 43/57] tcg/i386: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Fri, 05 May 2023 13:15:00 -0000

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No change to the ultimate load/store routines yet, so some atomicity
> conditions not yet honored, but plumbs the change to alignment through
> the relevant functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

