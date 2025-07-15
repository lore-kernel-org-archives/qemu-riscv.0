Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBABC83F17
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 09:59:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubcRP-0004e3-Go; Tue, 15 Jul 2025 05:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubcRG-0004a6-KT
 for qemu-riscv@nongnu.org; Tue, 15 Jul 2025 05:59:06 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubcRE-0006qj-RL
 for qemu-riscv@nongnu.org; Tue, 15 Jul 2025 05:59:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso60586805e9.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Jul 2025 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752573541; x=1753178341; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FpLBRmgjQAmGD20whBP2U/LYnyFDcydpML+VeRfHVP0=;
 b=uSEK2VnfWaFhY14jnFTks4gnnvFV/DADxxQwXQEJSq6N+QXhf18j1mUAZK243FbG1i
 VKkCry02WNBQuhzmG8lATPrWfO0y3IXFFxVBMgi4YhPzEJLg9HFtnP6YA2TdILA60IYA
 qO7NhXUTpfwiD/qWlEdVKZyVEy3rGN/AiJQkIim2dQ9tgWllmCmfzhAi13W4+lSgHKEQ
 0pm81Vl/tHR0ec8HrV3drsSD+VTDKBYlZ+h7zf3yqKBIfdlbsG1vGuYbdz+ZiQu4v2IU
 9OPVr/L1YpAlWq/s5gkLjfAiIzqDkgQ+y6vyjKcDik75BbjxlR+civuDkbFXKEIa03FM
 VRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752573541; x=1753178341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FpLBRmgjQAmGD20whBP2U/LYnyFDcydpML+VeRfHVP0=;
 b=hknQs48iTR+NsrO61cExouBCp2/MxEGoCS2+oGI/ysKMBZpoNPjvpM+Rvqzjca5/xW
 UFga+LLAo3+BVjA0all2o/S0u4faPEFqTEivkbfyee1lnkLmTYva+9NTc+vf1z33UKfO
 qgTwxKm3TErxdCAreX00WiI95ktwNjl75LBqTVl/oo+Y4TsPcmFCKrHUn8h3e5LRhNuD
 YxdT7X2HYHhUDL0fAjmQwgK4DrAyDSDRsnZpLXfXXItqe0LD+aU907MqgrHjb6k5qo1S
 NjASwQXU40E3+3mbkpndpVIu/p1r77f+pSno1641VQHG5XjPjX9Agvo7GHM8EThLwHO9
 xKMw==
X-Gm-Message-State: AOJu0YwU+dc7rU1NzGuRczFBY6UVTXadp/epeQbUexFSlYUUxI/PRVu9
 DMvssnH9AoDge5xXDKOWhBXXD3z/4RXfENlPcWqsr1Nt+8EfmMiaM64OcZJfS8LK2tA=
X-Gm-Gg: ASbGncsCQWr7GjkeXgrcJO8AzwhRaT/2O6hJV6xHnxXswpSJXorcToSXOoxf0VQyZHJ
 0pNq0coxi1X27aaKQndeLGmyvxdVTTJ2oV7tJEdMiKL/F2OYEHlXPw2s2r9Is/J7PGcqW2CJx2G
 BGbdqxLOOEA/gswg4urQGw0RDAfJD52fOvQlkGFVTeAvaSvES/Kf0yPsBg+DWZ00l9QhsSHNZrY
 Sq4CYZ5fwr2QLqzVA44MF52cjJbKwfmKlrhqJZjvCSYzlmkswb8/cyu51oZtjV/WnaU/o1omVSY
 /h/Cyjt16hX5TNEoc5m+9nYKkYrVoRD4XIkPUscAgv+Lcklp7+qfqb6Y9s9fK2lUU/IUqOj4fhb
 eGaef6MTKKGkR3Ye1bcocUSfOqSNLV0hhhBX5a1Dk0ky39Urdy+T+IqhsHw2Xpg0cQ86Zp+g=
X-Google-Smtp-Source: AGHT+IE+sn8ROE/00arljFEjbioLdaGmYT7QFoQWEj1oGg1lhEARGZg+l9dvmvF95XVrZhIWNusJzg==
X-Received: by 2002:a05:600c:198f:b0:456:18ca:68fd with SMTP id
 5b1f17b1804b1-45618ca700amr95011695e9.10.1752573541014; 
 Tue, 15 Jul 2025 02:59:01 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45627898725sm10671255e9.1.2025.07.15.02.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 02:59:00 -0700 (PDT)
Message-ID: <12b159a9-15b4-456f-a601-feda1176f3f8@linaro.org>
Date: Tue, 15 Jul 2025 11:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] riscv: Add support for MIPS P8700 CPU
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250703104925.112688-1-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250703104925.112688-1-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Hi,

On 3/7/25 12:49, Djordje Todorovic wrote:
> In v5 of this patch set I addressed two comments:
>    - 02/11: Moved cpu_set_exception_base from target/riscv/translate.c
>    to target/riscv/cpu.c, and added some NULL pointer checking so the
>    code follows the convention
>    - 08/11: Improved git commit message by explaining cmgcr and cpc,
>    and introduced a macro for 0x100 offset used in those features
> 
> The reset of the patches are the same.
> 
> Djordje Todorovic (11):
>    hw/intc: Allow gaps in hartids for aclint and aplic
>    target/riscv: Add cpu_set_exception_base
>    target/riscv: Add MIPS P8700 CPU
>    target/riscv: Add MIPS P8700 CSRs
>    target/riscv: Add mips.ccmov instruction
>    target/riscv: Add mips.pref instruction
>    target/riscv: Add Xmipslsp instructions
>    hw/misc: Add RISC-V CMGCR and CPC device implementations
>    hw/riscv: Add support for MIPS Boston-aia board model
>    hw/pci: Allow explicit function numbers in pci
>    riscv/boston-aia: Add an e1000e NIC in slot 0 func 1

At a glance, various new files miss their SPDX-License-Identifier,
which is now required.

Regards,

Phil.

