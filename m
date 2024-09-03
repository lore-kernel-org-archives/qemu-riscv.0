Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8180CD343D
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:53:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slUtw-0006er-Me; Tue, 03 Sep 2024 10:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1slUtu-0006Uo-TX
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 10:52:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1slUts-0006EP-HY
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 10:52:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2da4e84c198so1024462a91.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725375175; x=1725979975; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MkIQoxz2FwuirHNqETpJJv7XZpiekPTSuxHDCNyh+08=;
 b=Nk6RChCd8mrBWJmFaRZqAUY7KXW1njloamH3rvNR5qlIlwsNLtbdx9gTRMC0psc3tW
 /ni1umF798Ok5q04CPJgY1FLwdpT8fMr10jHbZyCB/PVFhRYaY/2nCSRxANwgVfA1pwA
 Nq2IOpaHYdx02aFB/Igs6LKGmz1IE0m6wmLG3wvn/NptV3UHhiXaHjG8vhowbdOgQ4Bf
 jhIBRv7m/u1Ze+WJZGWcyCqCBAfz5D7AuoV7Jri2pZpk4AA8u0Rpt4u+icDclrzWL6GB
 z1o7PAhD8+IGJL4DxqvwhfjbNurtyPFdDIfxCBqVxtJUjYe3YK3/N1RC2lZKA3qrnpSf
 sZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725375175; x=1725979975;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkIQoxz2FwuirHNqETpJJv7XZpiekPTSuxHDCNyh+08=;
 b=Di7Kob8xa1h4Usfku1ez1WP+U+gONRTsVLe/ovqTniLVjp6uouIXvIbtoS9hz0oYh3
 SkfTNDxEw41b4ArTJOCijzgpcO52mOjVILhsxVWWmwjTiIzytU+XQ+TsV8YdXmSwtI5W
 UrUpjpBw9SMIEpTtuWCp6IBQmm6qiZbQSu5oWr9mmdzJyNl5t5pIxc+VKLcAGGUAVDqQ
 +jXlEsrodnIXd9+yVNUzqB+gHKHbDhVRcIgoX9mdvG+UDG4FCfIPZbUXyx7Pr/0nNAGt
 FPE9/RKKoowAKAl+o65E1EPWRboeErBRaCjwwuOojGB29jD2EludMpjwtsSV+VJvBCGE
 o9cg==
X-Gm-Message-State: AOJu0YxBQwHGYwJoODGcTem3NYlu4L1uvhzNaZYD344vcpMBP2fMMYhg
 JXEmTd4JYnDIR0C0N/P51u2n0Z8eL4/nJ74PjLIp/PKuwtJ/p8UVbR8zkvFlbKw=
X-Google-Smtp-Source: AGHT+IH4eUO/mvYfMZ6faqzDFDUoj3JEbJppfRgFZvqNQuytFuAhdNaj9z5Rl2gGHRVdg0E8ZtF9nQ==
X-Received: by 2002:a17:90a:cf0b:b0:2d4:6ef:cb14 with SMTP id
 98e67ed59e1d1-2d8563916e5mr17383205a91.28.1725375174789; 
 Tue, 03 Sep 2024 07:52:54 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445d5ba3sm13966975a91.11.2024.09.03.07.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:52:54 -0700 (PDT)
Message-ID: <f78a75e9-0ed5-4b0e-ad38-54f4541c4e7d@linaro.org>
Date: Tue, 3 Sep 2024 07:52:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] tcg/riscv: Implement vector sat/mul ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240830061607.1940-1-zhiwei_liu@linux.alibaba.com>
 <20240830061607.1940-11-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240830061607.1940-11-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 8/29/24 23:16, LIU Zhiwei wrote:
> From: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 36 ++++++++++++++++++++++++++++++++++++
>   tcg/riscv/tcg-target.h     |  4 ++--
>   2 files changed, 38 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

