Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B044FC77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Xpe-0002hp-3u; Tue, 06 Jun 2023 10:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xpa-0002cd-17
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:38:43 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XpV-0002hs-UH
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:38:40 -0400
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7747df5b674so246626039f.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062316; x=1688654316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YcVeRheuB7gq+ezkQ3FqST0s5x7EHoi8tTahXk0iVkc=;
 b=epebHp+O4sx2km81wwjHOwBNUErXSEntL0wGHl20sIFjOoS5QTt+t4HFfm5wg6+sF2
 J8gyVp61rshxZtmVkkxWka37Tk7V01qolg0Ua4QdeNz4pbwhuy97NBBdznlq/EXl+Y4P
 1v5TAzmF0gFfA0sMLR+bB4brF0POi5X9mI/4DRRaEvrAYp609i0IIK6vO0voebyFWubP
 +XQYXqi7JcP8+GyjEBbIPb5sJM9cEf4TBJsiME0qAkUUO6SN+mx0OJ84k1FtRFmvm7Zj
 mYgTkpZnp+CAA5AsWqjo9bOCt7/Up3ZM4GAijORQAOXALbgDhRQiclLAwV8+plBT2+1Y
 bSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062316; x=1688654316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YcVeRheuB7gq+ezkQ3FqST0s5x7EHoi8tTahXk0iVkc=;
 b=K+H5D/cu4Tv1U5nDVmsR4fK3vRuw8r7ZktuPzyTNVCSYOz6PbnYs8nhrYV7IUXfrV8
 bXUF9Wm341fxhfVQO9dU9bH+6ccDwlRXUmB/TaU2WqgAyuFvVJTujJcwIgWVJmB7Z/VJ
 rsMHxD6Wxf3lMmh+oiT1ODtytiar1JgEBfSv2L/vDIIV3jdSg0C4D+pr738SKSPggHjL
 AQua8Bccaq9fAJDBDsPFZhRU3s+t8DL/1r2OKERDN7mEKyEv5xNfc/qxxo1gzkFsLfzJ
 nWwexLPYxaPvxxBvaeycZSknovTTZ/eprlKotEFiF6X4I/NUVz3ddAIUhjkLVYvfEysA
 1WhA==
X-Gm-Message-State: AC+VfDzU8uUJKZV09jGb10NMYseU8uT+fIii4VWVp2DX8hZxvYXg2AmZ
 mOS9LRHGTRZD9yaQqHPWMbzu2g==
X-Google-Smtp-Source: ACHHUZ4EhMFsgZaW+K6ZoEtr9srq8hfMt91Kag4BRJnLgCjVmhO9h8JhPZ8ol9/vM9A6q1wRFNOuOQ==
X-Received: by 2002:a5e:dd09:0:b0:774:9c66:cbd6 with SMTP id
 t9-20020a5edd09000000b007749c66cbd6mr3922978iop.17.1686062316667; 
 Tue, 06 Jun 2023 07:38:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a656381000000b004ff6b744248sm6940210pgv.48.2023.06.06.07.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:38:36 -0700 (PDT)
Message-ID: <86378349-e78c-3bbf-8960-a9f2399f0bdc@linaro.org>
Date: Tue, 6 Jun 2023 07:38:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] target/i386: Rename helper template headers as
 '.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2d.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename the included templates as '.h.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/helper.h                                      | 6 +++---
>   target/i386/{ops_sse_header.h => ops_sse_header.h.inc}    | 0
>   ...hift_helper_template.h => shift_helper_template.h.inc} | 0
>   .../{cc_helper_template.h => cc_helper_template.h.inc}    | 0
>   target/i386/tcg/cc_helper.c                               | 8 ++++----
>   target/i386/tcg/int_helper.c                              | 8 ++++----
>   6 files changed, 11 insertions(+), 11 deletions(-)
>   rename target/i386/{ops_sse_header.h => ops_sse_header.h.inc} (100%)
>   rename target/i386/{shift_helper_template.h => shift_helper_template.h.inc} (100%)
>   rename target/i386/tcg/{cc_helper_template.h => cc_helper_template.h.inc} (100%)

Move to tcg/ at the same time?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

