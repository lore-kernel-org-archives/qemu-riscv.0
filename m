Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851BEC4345F
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 16:40:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryaDo-0007wX-3w; Sun, 21 Apr 2024 12:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaDm-0007v6-E3
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:39:18 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaDj-0000ux-N7
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:39:18 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6ed32341906so3488246b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Apr 2024 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713717554; x=1714322354; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KBIKe8zgLoNCoWSrF2oAO7S40KS5rkTLrzC/jSW5AhA=;
 b=hylT1XZn2561fHs160ZGrRG4BC0GXT2TzYKaVVC4e0IkGAmt1ZpRBlERXRDfrFtKHO
 VJOYc+QeQVwB/paQPkJ691talUJxFDT40luytN/gFGN6XuAGuF0trSnMcMtKeW9QjlX1
 5EeRG4/BN9d1xcyaCJC4Vj8T3bRD0jKh65663dnTiai7awEBQgwhhhOzIa7ehWhfxBZf
 sBdMCHzCgERT4uPbqpgOo3z9AdW0Sh21aLGotrzfh1J8LyI0xLFBEwMSBLOibjn1bd6I
 2lSBll2ifonZroS9e+20EA6nsx10UQf281MzyP9mjthKt9D/5d265uAuSdlPApC36eMu
 sBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713717554; x=1714322354;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KBIKe8zgLoNCoWSrF2oAO7S40KS5rkTLrzC/jSW5AhA=;
 b=un0YU5w8FOVg/4Owx7tHEtbLZUndFY7s22xk0eRiI0asgOvw2by99m533EFYErzNDm
 TDEBKN5tuRczOdsHCNDIhOuEW3g3iJAAmkR469QxcOZxLixW+qeqC/xbXiLtH9Eokzx1
 nH7hcfv8Y7I+twmoCmZRqdHcPTCBTyfPmYT2ba5ACkkBsAQrhNTC8nT7VbUzuOAnGDXG
 p0iLGzvtP6j4sTZY8wKJrNAnXapr1DRiRDX3RCKcbM/CrSu2MED4o/bQikSdQGrbRN/r
 Ia4xyl1x1G27a6oWJDVaF8EhVdZK0uFFg053JpBUdz6dbIAHWEL4z/0bEZBwCK5ofErn
 wxWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc/iaDI7g/5SuT0SuOwApuNRdGxwFDM3iLV5PAxU2XZR+ncSUxLTBV5mxLb+kMUZ5Ek0dkEhu7giQaxZbp6HvyL7+SGI4=
X-Gm-Message-State: AOJu0Yx57LJQkSrlIMkq7LAn9PkDScaaE6ZngL/PpgzvrxgM9LoHRl1x
 uyYmqzGkdKJU2t8iGXoxrKSpxh/eR8USPlRw1kOqh3Ulv2LrCOz7QF6U56jBCMI=
X-Google-Smtp-Source: AGHT+IGCwGjfAvYRcqjA2Bi2AYbsyA1QQoJSzL60PWGPM8M7/QMuG7JcYk5iQbZ3aKx71eqxHRHL1w==
X-Received: by 2002:a05:6a00:3a1e:b0:6ed:5f66:602 with SMTP id
 fj30-20020a056a003a1e00b006ed5f660602mr8896814pfb.9.1713717554235; 
 Sun, 21 Apr 2024 09:39:14 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a62aa0f000000b006ece85910edsm6342752pff.152.2024.04.21.09.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 09:39:13 -0700 (PDT)
Message-ID: <6cf18e2b-f914-4ae7-be96-8c9d469c48df@linaro.org>
Date: Sun, 21 Apr 2024 09:39:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] exec: Move CPUTLBEntry helpers to cputlb.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> The following CPUTLBEntry helpers are only used in accel/tcg/cputlb.c:
>    - tlb_index()
>    - tlb_entry()
>    - tlb_read_idx()
>    - tlb_addr_write()
> 
> Move them to this file, allowing to remove the huge "cpu.h" header
> inclusion from "exec/cpu_ldst.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h | 55 -----------------------------------------
>   accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

