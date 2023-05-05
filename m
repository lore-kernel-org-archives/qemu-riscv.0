Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvIj-0006IT-Tb
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIh-0006Fh-99
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:16:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIf-0005lE-Ny
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:16:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso3423361a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292600; x=1685884600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
 b=jceiXtC5uwpydNJDbKvI5FG4jH2GcSbc3SERS71I0VHqvnqazh3vhcpxMryShCVDk8
 0hFiwdy8oYPNfi8GTKFjEuvnU3l+MJMpUE/V+0eQJlHDZUzVjJJ5llJnU8whfDfkMU4p
 aVXn7aa525pmbf606qwYZHSyiSmHmPCnAduvr1RJcrJ/SOJM1bJVCLkO2IjXK18sGaEs
 LKZuXcgacfwq/Q85GMYBTVbBgjMXgsI6yNnv46xKeRKequif3Cck7pOP7H6F9YfEKpn/
 lYogIfpUWnNt08t3tZEfw3I8bZmIav1O8ik6i+zFnBFGqMnRq9jEybDS6BQUqx5M/Fha
 gUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292600; x=1685884600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
 b=jEmD4K918lsH8Ufcs90vyxgJN8sJSSZhRleXKvdQVIPzsKBEoeEq3unnSuK+t57gNF
 tC+OHLyAKYQVsSipsxiCY1W9oUW4mRwu2YtAwzC8a7ItVD1DUOIEz/ERnlBIPLVeYD5k
 pb+A8afTYjKmBhY9IkgZpSXYJmjwRg7hUBWvXbWwQm3CdeNoNJqDkkYDqzTv+pAzOaZt
 oX+0Z7bx6g924c+5a/SfWkr2sjfuTDxFs3Qjh83YlDBtmAZqQCnsMfw+TtvCZtwI7gRl
 tKPz/zG8IpGOqjHnWh80f1whMXJ6F/23UN/QYPYacXP0mSQ9UMlopq3YFm/fsnu9jCdb
 Oytg==
X-Gm-Message-State: AC+VfDxHvezJsfemi52/2M9sJKQq//9baS+gQXzqS5LuoXaFwSUFRH9w
 hAsQD0p04gc86mRiEhDCaImIbV3aA+5iZvjheJb/UQ==
X-Google-Smtp-Source: ACHHUZ6mFq89IMzyOG3OjocXJM0D8qOq1hmloEhQTLZIp1kT5HCT64hygkCaH+dvmK2NFDoPJg/wx8fZxgSQXAmGuig=
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id
 h25-20020a50ed99000000b0050bd30cc595mr1415260edr.7.1683292600161; Fri, 05 May
 2023 06:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-47-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:16:29 +0100
Message-ID: <CAFEAcA_29qccyY+K1esRjy7Y8o2YOSaJsHzcnvZoxr=K32w2QA@mail.gmail.com>
Subject: Re: [PATCH v4 46/57] tcg/loongarch64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Fri, 05 May 2023 13:16:44 -0000

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

