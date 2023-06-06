Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2238C7EE29
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Xos-00024R-97; Tue, 06 Jun 2023 10:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xon-00023E-5o
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:37:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xok-0002Qs-D1
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:37:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-256797b5664so2750000a91.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062269; x=1688654269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8R5f+wVeYyyOX5s3SzQiZsALWUytR5XYy8E0V2grN4=;
 b=CsWGqro9y9lTrrbe306ID4ST9FD2F020//U8+ba/dHouLkA/uWHkul4OQqQ2wF87k9
 5Z6/5XEyLq30pq7wy2XXitoZExPplNiHMao2eZauKFrBcVRzBjgeEQv5eYOLr2A3Pdvx
 ltPNiUubbohL1cS436rOr2u5oFfdUpDWSyWrGBCL62H0y2odiQqRNEkYx6uJ4/lFLS+p
 m1DD7Mm9haPkKsKck01nh15KgM44wY7XYTqdCZHYvuni097/9uWoXNyqM9YpXZVfaGTy
 7Wjmmm51QxFpkEV7gTtRXaCnlwwHrJEzSjXcU3FGY3Ju22uuwrLUwFbevhOo/2OVWNMq
 7YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062269; x=1688654269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8R5f+wVeYyyOX5s3SzQiZsALWUytR5XYy8E0V2grN4=;
 b=WwiQXEUAAw+U891nVfDdALSp8Nj/vo+GAUBcJjlsr8f7t+CtCrLOzExmH1pGh/VoZs
 DpU0yRta/bvv6c7Tk3YgeUsbRihWWDo+fiOcSxbbkvIcCyHEpe6gw9RBxWJlkQaqwbWp
 nylyeY5iXTfbb2mwZJIH7IoeDey2IeHvX+zXJ6FiT1IO+mGUzPLE+ySu3PCyIB4rOd4V
 LtUM4nLBKloNsm+d1h7RcsYogBOPmTmjSJrpUyhTqllkk/jTiUMYsQrV7BJls8yfNbsR
 a0KA0KuAScgpKcEXq+lqmOh3MjNw4n3bzIIrZv6SMsYemA+RfodDW9sTUtNpHyVUIm2B
 cKyA==
X-Gm-Message-State: AC+VfDzLKB7d60E/o+JAZy+TTGXbPsj0uOuFcLI0+JrILZ475a4NOywG
 BxwaeyTev2EsZP+2jrwZBqsFGw==
X-Google-Smtp-Source: ACHHUZ5/y/+jnHKCYboD4dSy5/IRfLkgptwr6AR4ghOJGC1rSDmCtIYcbXoqGUeI+ZT++4n7sv0L+g==
X-Received: by 2002:a17:90a:51:b0:259:3e26:b5d9 with SMTP id
 17-20020a17090a005100b002593e26b5d9mr756955pjb.2.1686062268718; 
 Tue, 06 Jun 2023 07:37:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 ch7-20020a17090af40700b00259b2a50a41sm238105pjb.36.2023.06.06.07.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:37:48 -0700 (PDT)
Message-ID: <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
Date: Tue, 6 Jun 2023 07:37:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

FYI, after yesterday's tcg pr, we can do more than this.  These fragments no longer have 
to be all included into one common helper.h. Each translate-foo.c can include only the 
helper-foo.h.inc bits that they need, and the bits need not be visible to the rest of the 
front end.

It was something that I had in mind when splitting include/exec/helper-gen.h, but the 
patch set was already large enough.

The renaming to .h.inc would have been the first step, anyway.


r~

