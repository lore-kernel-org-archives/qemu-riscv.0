Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3172BC47DDF
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:14:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rUl8M-0001z6-2f; Tue, 30 Jan 2024 05:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUl8K-0001xr-1i
 for qemu-riscv@nongnu.org; Tue, 30 Jan 2024 05:14:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUl8H-0004ha-4R
 for qemu-riscv@nongnu.org; Tue, 30 Jan 2024 05:14:23 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-28e79182570so2718917a91.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jan 2024 02:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706609660; x=1707214460; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FUlxL+39zvpvl5E9zKEekDOOrtv6RH6k7fqk6sfwuMI=;
 b=O4IoXD2dYo4NOWGOh5H4Xfet6qZsTW6GxDXsJeHBXOOZ2lsMH7qiYRBt0Wc1P0V3/h
 tf1wi8RSvQOCANRv4eGMfEFX5w6Kn8WcLhgBHcM2B72jThD8a0SoufC4ajx+rtAgLHoJ
 V/ssbeaKa4iYL4qN+LGpyTliaP5uxEN66qnhk46VJLHPVtF6S3t6j7SwJWW95v+aBSil
 UtzhE25nFys/+sNR1kkGRr64PEBchhges0AwijR23Y2hx0YCgneNHMqSfVAKw74t8pjW
 YLaN2vnYjefCv8rOilMbCHtna249aTrFe5tyuBlHJ0ys6k1ErdCu2rvWjESOff5Ga6wP
 27LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706609660; x=1707214460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUlxL+39zvpvl5E9zKEekDOOrtv6RH6k7fqk6sfwuMI=;
 b=rnUOc8ErEtVJ0Z2Wr5qEpr18BbAo78aS/tSvrpqe3yQxbdjrYCRP3UaDZqXfiGAgsP
 b+Oo/ThF6yTgUbD4gk46ztw+IfvXFkAzezgwm/nQe3OqYX8H+rGkpm8a8xnQ3qqXI087
 R4Xa1JyT8IVJaQUxdA5+GduK2wbmH9FjGqwYdyim5rnbeW35ZHtXIrzHH71cnMyFG0U6
 I9RIKi6nvvpdC3Ow/FdwFDJVWJGHDVolJq9uVZv+oxWNEfspz3AZoQf2E65UluKXhxr5
 8M6UWNuLG579fsDO3Ga9RHi9lbUDvO3FrWqwNv4U1lMGUoS5kuWbLTA3/F3J5vF7+Oi9
 cMKA==
X-Gm-Message-State: AOJu0YwDi7BDfDLyyeKWLfriahrgZGBQ/ADc9+EQ0CKa+yWCnB4y6b7I
 RNR9vG680eB0jdLcuWrPk7LbjG4guVupYT6x0sQHGD9+H4iYobWqHETmuE+bGa0=
X-Google-Smtp-Source: AGHT+IEcoFWpnhKUl4j99xsHteg5M+jANkCADLKdR5PYE16G+bZO2y+w6/O3QrrNq/mOOoTnHIBrFw==
X-Received: by 2002:a17:90a:616:b0:293:8708:7a04 with SMTP id
 j22-20020a17090a061600b0029387087a04mr5097354pjj.18.1706609659751; 
 Tue, 30 Jan 2024 02:14:19 -0800 (PST)
Received: from [192.168.0.103] ([103.210.27.218])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a170902ed4d00b001d8f24ee024sm2544453plb.173.2024.01.30.02.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:14:19 -0800 (PST)
Message-ID: <6f47ce70-5d11-458d-969e-8b14a511862c@linaro.org>
Date: Tue, 30 Jan 2024 20:14:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/29] target/loongarch: Prefer fast cpu_env() over
 slower CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240129164514.73104-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 1/30/24 02:44, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/cpu.c            | 39 ++++++++---------------------
>   target/loongarch/gdbstub.c        |  6 ++---
>   target/loongarch/kvm/kvm.c        | 41 +++++++++----------------------
>   target/loongarch/tcg/tlb_helper.c |  6 ++---
>   4 files changed, 26 insertions(+), 66 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

