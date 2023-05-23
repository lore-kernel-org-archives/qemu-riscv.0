Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30CDC77B75
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 20:34:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Yi5-0006ah-OP; Tue, 23 May 2023 16:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1Yi3-0006Zx-1y
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 16:34:20 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1Yi1-0004v6-Ky
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 16:34:18 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ae763f9c0bso871835ad.2
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684874056; x=1687466056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7gEJI7oDuvv7tbPXfhhHdYUHgNd16ndnIz40ch9e1So=;
 b=Hoq+Kc500oYdDFTZ6Nltx0bbGlpbgy9hRB17VAq6dXIaF16ImiJKcyuaDDFmCkdxxo
 WXn0ib0PB4GiU0kt2PaMMKOOv4ZK77E02BOHz86E1UDYqOPktqHpnDGEwAZURtb9eS8z
 p+biDHPNPFkl/5Ulh2iP8AX/y1O0d3L2q814IunGsgK7DqTDaZXPAhuspLmcYBNZ1MWP
 iIaBf5LpBiNyvqUI6vSunBNDHJT3PgEPKdLOI5rKVPhYkGjoE/bFupYWw6Im0L2JSODz
 XtlxoJRNiFdM6uqrm1dmnDoAmBsOYElo7gNTga4A+XOgs8De3IUfL/PuajPGIt/QY6KI
 sNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684874056; x=1687466056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gEJI7oDuvv7tbPXfhhHdYUHgNd16ndnIz40ch9e1So=;
 b=I66MCoHdzW2rzjkZJEUKVxiyzZlxT3GCes2GOhS6YO5pmCZbPKsJ2YCfCg2Mmwk07e
 u4O3mjcU7k39u37oJWlJ42jHdr6j4qnuehssN8uhCEAOKxXfBG5grhjgtSVJVo5zSLQx
 tKjUkkuSARYLGzMIqSQL2Pwdz6W/9JKEKSmLQL8uDJMKH/uS6+gSzUCfo25yr3+p3ytR
 17NoRqGfDq68UDtaNpjwmP1OjU8CU5x4GlM47unPDVht53R7GY+X2fYejokgWLOWawDq
 P5AzZ/xpxR9yGpzZPIE2FfxCj7rnSglXEbhjXhjn1NQEVgAxmxEgVAEZS1ySFL0O9svq
 rCBw==
X-Gm-Message-State: AC+VfDwcZYQZvgjVhTT+LCKjkhQupz7T5vJlfypRXaxBJTKLPm7edjGU
 6QZDwBRq6vliw8tqbZ5kG2vmRw==
X-Google-Smtp-Source: ACHHUZ5zHv4+zIa+lxesQsAQQrrJ9UT6zJATPTDi/6U3WVOIoBPdbvhYGZnEQX9Fmb3AqIay7WkdAA==
X-Received: by 2002:a17:902:c402:b0:1ac:b259:87ea with SMTP id
 k2-20020a170902c40200b001acb25987eamr22116023plk.0.1684874056191; 
 Tue, 23 May 2023 13:34:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c13a:d73:4f88:3654?
 ([2602:ae:1598:4c01:c13a:d73:4f88:3654])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170902d88800b001ab28f620d0sm7164495plz.290.2023.05.23.13.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 13:34:15 -0700 (PDT)
Message-ID: <22b1cd80-27ce-9821-c434-ebc31bf6760a@linaro.org>
Date: Tue, 23 May 2023 13:34:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/7] target/riscv: Use true diff for gen_pc_plus_diff
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230523135939.299246-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 5/23/23 06:59, Weiwei Li wrote:
> Reduce reliance on absolute values by using true pc difference for
> gen_pc_plus_diff() to prepare for PC-relative translation.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc   |  6 ++----
>   target/riscv/insn_trans/trans_rvzce.c.inc |  2 +-
>   target/riscv/translate.c                  | 13 ++++++-------
>   3 files changed, 9 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

