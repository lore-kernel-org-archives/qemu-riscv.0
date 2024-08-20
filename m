Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C860EC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 05:17:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgHFT-0005ZB-CI; Tue, 20 Aug 2024 01:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgHFP-0005Wq-JN
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 01:17:36 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgHFO-0000dQ-1T
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 01:17:35 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5d5f24d9df8so2626075eaf.2
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2024 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724131051; x=1724735851; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASsuCh4Z7nZeWtkEbIHz+hsb9X2Wxl+qjsL+S/a5ws0=;
 b=CJsl7ZWDiiviVGZkomf8u3PHeQfbDoWacZdynySkgM6r/EBKN4chBMlcRLc8iQqNiC
 w6n6IrUsgTl81Ou1TSJHYrzkQBIb2YRmDPkoiF+17DzXWVx0rcFambdbIZN3vJDHmsFv
 7CDIC89N9Tt6KjTNrvZpQgCBDbJhKifkqqv9Tcj0VjE2OP2qeOuuLT5Ek8JFwRHrfuTB
 rOQ5JGtNGwMxDysxtxJYbbztHuNDwGRyF5LS05qYPTNW8I/lg3P3YdSNxsnskfksW+v2
 42L5BJDqtQJPSyFnt7DQXgQqlRJ7XL7ICayWEP7+/MCpb96zbxpFpcQAMe/fAnedeM1T
 QNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724131051; x=1724735851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASsuCh4Z7nZeWtkEbIHz+hsb9X2Wxl+qjsL+S/a5ws0=;
 b=SXlQWehHrjo10wXGkkUQXWD8/gftsSFY9feUL8zF3yvX+AqrwYmsjxqKnD/EuG62P8
 t+m4bFZN3NAYelg7PffvY3daOWHq59jazuNSZRUWfC1KWVWHejvADVh0ABWJGQfB4MF+
 hVhlR03wwKzXQarUnvmeuAcCdgKE88rqDD0EuQaOxgbdeaDY4mbASHto/fJ8THVik15O
 w/P4ARTnykT0nGEirA1GMFoiKb2RllZKAE+DnA+Ped+F1bQfjOMkOJ68YG1B4HJzRK9o
 Oll/QhtJm+P2faCMznNsSqp0aH+wTORtf+km385aCoyfkjyO68I9is/ur8kiGko8KCo2
 svQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY6SuLgGsDa4NYPDCWVbTyCc4w3UD4umf5jsY3D9nimDjZ/o+uRJ+EeF5Da64mE2Ycccu/HOVbioeLmCdkxmaUWcHklE0=
X-Gm-Message-State: AOJu0Yz0x4Eht3q+yA+KqYCt7lQEKxCNbMAgO5O1gysRLKcWy2rZCHn9
 IpfEWcjLmHzRQnOWjh+w/UJtQP/T26Vp7JR+b222zsnKsdcuq1lROw7FbzGCF08=
X-Google-Smtp-Source: AGHT+IGr7wUipPmUobgVk58sgFdGWD5Ptgjtd3DDrfhvsax0Y2kUwZ1YvKUL8qhxih3VQNvU9T2ywA==
X-Received: by 2002:a05:6358:2923:b0:1a5:2f55:c46e with SMTP id
 e5c5f4694b2df-1b39318021dmr955027455d.9.1724131050881; 
 Mon, 19 Aug 2024 22:17:30 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.3.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127ae07e41sm7430193b3a.65.2024.08.19.22.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 22:17:30 -0700 (PDT)
Message-ID: <e337d249-eeac-4e48-a4b2-1fa3d76117b3@linaro.org>
Date: Tue, 20 Aug 2024 15:17:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/15] target/riscv: Introduce elp state and enabling
 controls for zicfilp
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240820000129.3522346-1-debug@rivosinc.com>
 <20240820000129.3522346-3-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240820000129.3522346-3-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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

On 8/20/24 10:01, Deepak Gupta wrote:
> zicfilp introduces a new state elp ("expected landing pad") in cpu.
> During normal execution, elp is idle (NO_LP_EXPECTED) i.e not expecting
> landing pad. On an indirect call, elp moves LP_EXPECTED. When elp is
> LP_EXPECTED, only a subsquent landing pad instruction can set state back
> to NO_LP_EXPECTED. On reset, elp is set to NO_LP_EXPECTED.
> 
> zicfilp is enabled via bit2 in *envcfg CSRs. Enabling control for M-mode
> is in mseccfg CSR at bit position 10.
> 
> On trap, elp state is saved away in *status.
> 
> Signed-off-by: Deepak Gupta<debug@rivosinc.com>
> Co-developed-by: Jim Shu<jim.shu@sifive.com>
> Co-developed-by: Andy Chiu<andy.chiu@sifive.com>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.c      |  3 +++
>   target/riscv/cpu.h      |  2 ++
>   target/riscv/cpu_bits.h |  6 ++++++
>   target/riscv/csr.c      | 31 +++++++++++++++++++++++++++++++
>   target/riscv/pmp.c      |  5 +++++
>   target/riscv/pmp.h      |  3 ++-
>   6 files changed, 49 insertions(+), 1 deletion(-)

One thing missing here is to add

> +    /* elp state for zicfilp extension */
> +    bool      elp;

this to the migration state, as a subsection under vmstate_riscv_cpu.

Sorry I missed this before...


r~

