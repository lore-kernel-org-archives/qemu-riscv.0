Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06312C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 18:38:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qah7h-0003F0-M2; Mon, 28 Aug 2023 14:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah7d-00030E-H6
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:37:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah7Z-0007OP-Lu
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:37:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68c0d262933so2018778b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247872; x=1693852672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJdLD+RpTgBuOMUPAXd1WSCYUi9xdb5K+pOHEHxt+Ds=;
 b=fPczZGF/PaC/ueYiKyRVZadTHhC1paswHzF9gzK7hm+R/KQ6u42UGLlH5m2Sc1al2Q
 haGbv558bT6u+ukF6pM/butdBsZM+wdaIQZ8dmNjujnNPYu1hopYcjsW10aOkGnTcJGQ
 WMcwSIZMDjczaciwqXFGNx13n/j7DvRQCTlACn4WMV7kVnX7l3GTQUunxIdVSTAvPK5j
 FtRFBBNMvKL6fQAr12TXf9aSJeJevnVLbwT7Ehp8fJUe/urCI8nj8/vDWPQsMXJ8gO50
 XiNEMkxMt4i4KmKlC5jdtrRozC+gHdP+BW36hvYuN+049KDFizHFGM5E4plBCpKKiUOV
 sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247872; x=1693852672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJdLD+RpTgBuOMUPAXd1WSCYUi9xdb5K+pOHEHxt+Ds=;
 b=FT9duZ1npttqlFQILHxRPDL6RTqUNejCMYvL+KAeRq/9FKF7S0v4LemvunWnnKfabi
 5uS5rNgDbrilO4AbiGBKcfJ2hpOri20ef4gZdzjATeJNVjaAl1UwEh7F73sytm4WYiVH
 E7LBwwN5dJIlDcwUNeyHHCgSIjz0uGUhdzbhZhCldlkr7pndN7k0N46+13QiLHuCsrob
 RBqu+iZjRPdF+0UrHB1Hzb1RJbx8POeAp/YDrunMfdgb3sDN4bAmh94ABycrZQFs4Vyl
 hxPJ0kZpeLnK9HktHEb/zpsn4EnXLoZowtEH7dVttpFbXxhEi6aExmXvw1PpzF1MugRm
 TcHg==
X-Gm-Message-State: AOJu0YykkCmbeWjGwWqP8dLSCNVmGlTztM82JtfL/TWNQ9wGd6Te0U9T
 WUyhm/PCgpqg1cSGE2zW/AB30Q==
X-Google-Smtp-Source: AGHT+IHhwyqE5LGmovcEybigbjdEb7s9mLYUfBszdlY2jkR1SNSZn7OvHk4KOJuFREbYR36twwkp6g==
X-Received: by 2002:a05:6a20:12c9:b0:13b:9d80:673d with SMTP id
 v9-20020a056a2012c900b0013b9d80673dmr28106825pzg.48.1693247872097; 
 Mon, 28 Aug 2023 11:37:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a62e516000000b0067ab572c72fsm6998539pff.84.2023.08.28.11.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:37:51 -0700 (PDT)
Message-ID: <46aa69c2-d52e-af01-b9ea-63ddc0787a89@linaro.org>
Date: Mon, 28 Aug 2023 11:37:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] target/helpers: Remove unnecessary 'exec/cpu_ldst.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> These files don't use the CPU ld/st API, remove the unnecessary
> "exec/cpu_ldst.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/cris/op_helper.c              | 1 -
>   target/mips/tcg/fpu_helper.c         | 1 -
>   target/mips/tcg/sysemu/lcsr_helper.c | 1 -
>   target/s390x/tcg/excp_helper.c       | 1 -
>   target/s390x/tcg/fpu_helper.c        | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

