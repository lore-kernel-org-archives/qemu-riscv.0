Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138D6C88E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 02:45:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5aBV-0005Qw-Vh; Sat, 12 Sep 2026 22:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aBP-0004df-Ek
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 22:43:07 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aBN-00021W-NO
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 22:43:07 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396ccb652d7so566870a91.0
 for <qemu-riscv@nongnu.org>; Sat, 12 Sep 2026 19:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789267384; x=1789872184; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L0/J4rpG81dFsTAdAA7Mb59J1+MdiBpL1WMMuIA1E08=;
 b=UTSM74CUa4dfUfvPTD1/UkaHcPJe+A7Jc9TscdYQp+hw5hdu9XiwsL+ck2JQLiArnt
 mpQAxl38J44OBoPAPJUutF27n26+srge8mc1KZULzUVp2rfamdfGsY+fypTFJuiKiS6V
 Pi0en/AAZXxpo7c1XnxuZ4tnCQ1delYJqZPAIi+HXxO4SQFG+jyRjxmbGRNPvxzi0TDK
 fGqFxMa5JR4JerA3FBGs0ZGW+/9iJGgVKkVZbkV+ygPW8f8v0Nb5NlHdS3xEThI7f3Qb
 VmaqbPdrdneeTbj+YrAMFFOAANAx97rF0Wl7IElomtTr373JNzLVDpqyC68a3FNgOTBS
 jYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789267384; x=1789872184;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L0/J4rpG81dFsTAdAA7Mb59J1+MdiBpL1WMMuIA1E08=;
 b=D5hwRl44nVpWlOtRWd/XmnKsPhzce4psi5n7dfOV/VPhFWNGJLCI7olROnDOxZ3zsw
 Be01b0sTr3HgXR79dA/MrGNyV7RixkLORSdbiPq/RJjDk191YEzuOAlgwYeEA+ZXlgnb
 jMUL3HlKEvv6VYML5jbx5XjB6TuhQWS4OlvXpp2TPqP3bx5SXIPn4FJEo3sZMyfKvjlI
 psuCO08biZvD/lqaSnMK3e3qmChvigPw9QOzuT8NhNcPR7QcvcUS/dcbhs+vzs4WaeAe
 QaZLAfwEdoqGSAItidh+Bqq3vUVm6Hb/38GJpbniUw05x9y+ARU/BvA/BT9K86RMEUNL
 aAUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCSnQ9P4ciPcRnqzTSyBH0NIknjo0xSonTeV6abhoEG3gmkf9ck/zIT/A7ZtXoyUqdT68mYx9kAKjD@nongnu.org
X-Gm-Message-State: AFuF++me3gfThCK6fAOwI5H8nIPohcIyLAnqp9/BvkpYFqUrUjVt9eF8
 dOnZrTrePTmMDzHX963OxhlrRbQ8UGqUUJSYf+4f+MFTf9SwOU0L1tMlEc7vL/UQE0g=
X-Gm-Gg: AYBFou3FWi+wCUemkwJjKD1V09AvExxEcFo/iGmIC/4NaMrJ6TeegJn6hsnkxwEBuEE
 UurrW78wEF9rBYzrOAEgA96ZRU6v20sLrRPeCV6xZ5ZO3NuFyTtgHnDLXqpZhgDwwkpEEIsJQ6E
 1yEGQBBcJHDCXVq1UtVqGwPWdmZiQocuO5trM0evycFAR8R73AiKZo747hxVqcHjZcuPRELMgTg
 I8AkTxJhhttsGNZuvNnwr7/12mcVPUPUmJ7ysqhhTQngxkWgeJLJIHLQ2RmhPKDnSKdVSX+FMpU
 M3Mk83Bg1xOzZUfG7OqlueoxNXjMVccetPuCZBpD+UOEXFGEKWw5efqVHhkCT/y3tnbJ0pXyDEP
 TOX0uNrU3LYOTYEl94734RYnGGaYvHmHnCRoELVsLDzV9vpsFAuEAtANsSOzXSo0dLSvFPA3shk
 2w2Lj3loFiLOv898vfH4h8w8afCaeGlCKc+jSpWS40ekuVfWdr8xwPj3k4H6fS3UkzxpVuYLcAB
 x+6HNjwlK4AMGrKUU2LuzH7ZkggexrIZyCYLQHMHiwyHOOPDhHXUzTrNzRpdQ==
X-Received: by 2002:a17:90b:2242:b0:398:9beb:5c19 with SMTP id
 98e67ed59e1d1-39dbc6e3f15mr9150282a91.20.1789267384256; 
 Sat, 12 Sep 2026 19:43:04 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b78d59sm15332612c88.8.2026.09.12.19.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 19:43:03 -0700 (PDT)
Message-ID: <8ae886e5-5841-42e1-a4b8-dc0c103ca860@linaro.org>
Date: Sat, 12 Sep 2026 16:43:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] target/s390x: Restrict interrupt handlers to
 system mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-3-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> Move s390_cpu_do_interrupt() and s390_cpu_exec_interrupt()
> declarations from system/user shared header to system-mode-only
> section, removing the unused user-mode stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/s390x/s390x-internal.h  | 5 ++---
>   target/s390x/tcg/excp_helper.c | 5 -----
>   2 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

