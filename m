Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogWo-0006xF-6q
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogWm-0006wx-L6
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:17:28 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogWl-0005DR-30
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:17:28 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-54f21cdfadbso396540977b3.7
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681805846; x=1684397846;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZZS9txSmhZNZIb+aSAgPzICIN4/6Tb7j49J+eB7HPBo=;
 b=NT6Pd7FUSoJGX7uSSOlVdrV5KJj5/SfxaSvQZ0+vxVzBpbblezzjzqsvQcpXZDHJBx
 Lqsr4I/9qc6OhOjvFGTydwADkntCS9jqFdbzn5yGouKijhS9j/pUDAA8XjB9yA6OtMxp
 3aNm13jy1RCwSIPQzm6kqwS7/6Cw9n6mvR74FyZMD2YGHtFSsldXYLT21dKuYHtoJ2Pa
 KqPfTlAzlrK8jUNKAl4WJ2yuKniI8D4dWX7lDR10hnCm8K9sgGzLy5ZdoStN4Lvlu67J
 eV9tduu4jxtFmhRH7TB3LGiqlZMIja27T0g/MObhxsASP+SdzkShJMKAQenDI/ym1mQB
 fRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805846; x=1684397846;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZS9txSmhZNZIb+aSAgPzICIN4/6Tb7j49J+eB7HPBo=;
 b=GTJqqW9Yya0RZotdGblZjnB7DYTenFZwU2WB4x3wfJwn0NFZ+YZyVS5l0NOGJPOf/y
 VIbLNjpf8GiPMJF0fUrZCgx/fx/WbKulbB4s8AlygEfJUxL4N4/TLTN6XnLmUZ/zYSbA
 xSE3zQ1hI1RGgxOPu4ey03yvIMwNXRZtsAINavZY3e7QudCPI3Or9YaWKJybGL190Q4F
 xt5ndhqkeeMJ8L5tO+SW26Br0oHrPBp85CfpT27vTVUwjNLR2uKr0oTcJkWjNjXxyu9Z
 R4jPNyytFrAY5Jr2sKcIulFL+Kwn3HFhsG4MRzkPIoh7fwj6unR5loXLCE4kupPrMT3U
 DAXg==
X-Gm-Message-State: AAQBX9e7AgcD4P21Vxgt/pc5phX1AY7/L2alx6QG6mVwhapgagpsuYM8
 fuOeHtZcN+VtAg0rxY2f5ttJJw==
X-Google-Smtp-Source: AKy350ZaI1KzL6tYz+MoOv6CmK41eGTirgrWh7Txf5OXD5bWFPwMVDM/yO2CC5awOxRaXD0p64nyoA==
X-Received: by 2002:a81:a157:0:b0:543:439f:3b27 with SMTP id
 y84-20020a81a157000000b00543439f3b27mr17365423ywg.8.1681805846094; 
 Tue, 18 Apr 2023 01:17:26 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a81bd03000000b00545a08184fesm3589508ywi.142.2023.04.18.01.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:17:25 -0700 (PDT)
Message-ID: <3e2bf588-98cd-1c63-9dbc-ddd97e7ac8ed@linaro.org>
Date: Tue, 18 Apr 2023 10:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 04/17] target/riscv: Move vector translation checks
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-5-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-5-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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
X-List-Received-Date: Tue, 18 Apr 2023 08:17:29 -0000

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Nazar Kazakov<nazar.kazakov@codethink.co.uk>
> 
> Move the checks out of `do_opiv{v,x,i}_gvec{,_shift}` functions
> and into the corresponding macros. This enables the functions to be
> reused in proceeding commits without check duplication.
> 
> Signed-off-by: Nazar Kazakov<nazar.kazakov@codethink.co.uk>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 28 +++++++++++--------------
>   1 file changed, 12 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

