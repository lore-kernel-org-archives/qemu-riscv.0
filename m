Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10785C19776
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 11:11:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnyGg-0003fO-DE; Fri, 28 Feb 2025 06:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnyGc-0003cc-9L
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 06:10:54 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnyGZ-0000Xy-CE
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 06:10:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2fea78afde5so2368766a91.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Feb 2025 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740741049; x=1741345849; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1IuYRt0nCaI/Gtjx8XI0C9zu57qmgnaQUFdiMhUzNY4=;
 b=fW8UYkwzXNbvzgp6dRKyVxiRNzsEfshmdNQCBrOxQXqkcDuI72cS8/RRg2T1mvNOoz
 o2+K227JYLewIkTGjGwIvTWZFqt6C5FkYV5BTeS+PSsm05Es0AegdcAHhLNDBrZq+aF/
 mffZEEW/8FVNWEVKz8wHFLknM0L3l25ZS+ILu7ij9mw4RUBfwr92Lkmk7YcegbPerCbO
 K5IxJ45nM45uJCk081D9yYQ/5HZ+F6L5eSTGlnzNUcO96RSN/0P1Pqct62lWzTDhYFM4
 YykrqK98h8BJdfef66+5smBD/ZERmBcNzJrsp0FjN4lHITbtRUOkkKnrsD3XbAnTd9sz
 Eswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740741049; x=1741345849;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1IuYRt0nCaI/Gtjx8XI0C9zu57qmgnaQUFdiMhUzNY4=;
 b=BV7HvbWoQvnxtJWRk/TSHFKbPPvgp03VC6CMjr29mLsqujbdTpKpgLrBlJeI9nfdLH
 0PFDJDryGs9aqDZSfDVaq5QczHHuNMgGakVg61AgoWTBQMOGZqZTLwaVHrI9oi1axUEg
 eM9yZ0ZqEHn0dW6V0gDQoo3h0f0s9Zh9X+Y0Xpt5+5jOAfPiIi9v8d/Udc3///RvEG5e
 CkQa5FOq0Fq+4+ysaJlZSCoRLezsXvPSZJ6CKlI4t8zcuOk5TrwHgkcDBaTAZsonJAkL
 IA+gBHRDZHTPiYwlM4nsbI4vjxL+cFs3Q/SsBhJfd55dz1y5Ad7/n+Mn6ZhQfONSEbH/
 gfNA==
X-Gm-Message-State: AOJu0YxTqIrjmK/RQ8gLLWT5hgZ2VeC4KaVCyZARKTtUE8sHGGQTOVus
 MyA45JgFNhUVmiU74WrzqXaGxXTLDOvmq46cJtxLZYz3+NUWXNIegYihcIBWXw8=
X-Gm-Gg: ASbGncvudFSNAGomEMXoziCsvdYU3u+G5TU2dFn9XX0Hrwz51dhdypvTtJWWonGVe09
 jIP6qLvHR1XbDw16RUtt1nHcfv+waISYqZJpMvvmbkTWL7oj4ea03V7MEAz1xnZ1fXagtrNrNSo
 fzIJCbGINjTcyvTOzA6BZODCCrKfTpwwIxpmPwUCYEoKSe8rhMFDZlIlz3XxaBmzgJYBD2h1Idq
 Fnav5yv/ppjckmGJsZ4u/Mcisl4g8n75OllF1KAyH+IH1ITBRAf+OivnofAY4GKa1uKwavrU6UL
 +62f3oAsfIeOS4AkmLne6BoR51PNY776nfGQP+1kPrEVF33nq8RL4E7lQGLhTE0EEJuJJR2uEh2
 JMv6N
X-Google-Smtp-Source: AGHT+IHRkaz2LQvVmsamq19dTi5Lo10UGzVGNIp1PwbyFGDhA7u+swvWXxu09syEEuKM8C6X0W8Slg==
X-Received: by 2002:a17:90b:2f8d:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2febab7862fmr5308588a91.15.1740741049416; 
 Fri, 28 Feb 2025 03:10:49 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:8aab:3274:6ac1:70e0:b96f?
 ([2804:7f0:bcc0:8aab:3274:6ac1:70e0:b96f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe8284f116sm6084471a91.49.2025.02.28.03.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 03:10:48 -0800 (PST)
Message-ID: <49d7ff1f-6fcb-45ef-88d5-cee1558d0711@ventanamicro.com>
Date: Fri, 28 Feb 2025 08:10:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] target/riscv/kvm: reset time changes
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20250221122623.495188-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250221122623.495188-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1031.google.com
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

Hi Alistair,


Can you please take a look in this series? This will collide with another
series that are changing KVM CSRs that will require a rebase. Might
as well do a rebase on top of this set too since it's fully acked already.


Thanks,

Daniel

On 2/21/25 9:26 AM, Daniel Henrique Barboza wrote:
> Hi,
> 
> In this version the following changes were made, based on feedback from
> Drew in v1:
> 
> - patch 2: reworked. Instead of using a different existing 'env' field
>    to get/put the 'sie' CSR, we're adding a new helper that contains all
>    reset vals for the KVM CSRs we support
> - patch 3: reworked. Add two KVM CSRs from the KVM UAPI that we're not
>    using.
> 
> Link to v1: https://lore.kernel.org/qemu-riscv/20250220161313.127376-1-dbarboza@ventanamicro.com/
> 
> Patches based on alistair/riscv-to-apply.next.
> 
> Daniel Henrique Barboza (3):
>    target/riscv/cpu: ignore TCG init for KVM CPUs in reset_hold
>    target/riscv/kvm: add kvm_riscv_reset_regs_csr()
>    target/riscv/kvm: add missing KVM CSRs
> 
>   target/riscv/cpu.c         |  9 +++++----
>   target/riscv/kvm/kvm-cpu.c | 32 +++++++++++++++++++++-----------
>   2 files changed, 26 insertions(+), 15 deletions(-)
> 


