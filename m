Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375CCC48BC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 23:50:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcZsG-0001p8-EN; Tue, 20 Feb 2024 18:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcZsD-0001op-OS
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 18:50:05 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcZsB-0000zc-OV
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 18:50:05 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e45bd5014dso1185047b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 15:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708473001; x=1709077801; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xlywUXRiZth4Y9UaD707yyWHwY/b1gf8xdgz+YzbwlM=;
 b=RJoGSQsfMzyNxWgQ6KOMoABeP1RIfGSg9QQEbHx4FK5vwPSmSCGjN5cEx68exPsTPH
 4hCP+1DLBwIyqppJhi6HSHLEFM4WWR/FVaShCrdFWF8PgG1DJID+AKVwnFyGMFShMKGp
 NjZjYU10ihyw9TcA8mAcYyufs26SAhq50uV288Dad/Qs2f3gT2JIXWhqp+re1WPKbzAE
 Jgmsmvi2Uh4kVb/EnLWjWGkhjnogAJLU/stO5l1wh9gUSYq3IO6+RWoF4wZFW+afR+Jz
 h+i2h+JABm/1SKV2Q0Vj9CR4jF8anl17COHIoRFqRlHYBz0svUlcuoXSUazJx3JhZsnc
 OSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708473001; x=1709077801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xlywUXRiZth4Y9UaD707yyWHwY/b1gf8xdgz+YzbwlM=;
 b=RFecc2qAW3ujs30rFgkonzDdy9a96Ck5QjJ13TzYOPRfKRe4h0bIEsQKADJroiT2mT
 7FZLGZdHVN6emA6bLTcrgbURPJC/8gr6WFw7gHLAfy89nFzMdnOcheLR5mTIviNrXVze
 +loC6e97BJyoyDDZLozq7ftLdap6557w7rSJSnpEoqx4dmCMJSA5Ddka5abs/IYMMnXE
 y8F1qQl2dbfomDDd3pq7QKtpjYKeFBWw9vg04Fi3jLIz6CrJdGzsaMKijLW0LKckrGid
 rEQbxLrqk8CQ3Cyyd2kfvEqrpmJ8TB54cp8mqPv1suMM5lItuCHxptEV8vPaD953e8vH
 q0WQ==
X-Gm-Message-State: AOJu0Yx8026t7FTq3/m1wj48A35qE5ukhzjTuJjrdNt0rHXJX6apiekl
 w0weoJ5PnieDsUowaMKhD/scLv5ci+YiqrNFtVxNk+nA5hAM3Fp+jpNxznYBG5E=
X-Google-Smtp-Source: AGHT+IHKLu8oY6ug1NnsVvE02rYTlFzKnZ9z2Ro3UyLYOryWQXxLsjzpTfLZ0VxVxeOte5CLcnfWqA==
X-Received: by 2002:a05:6a00:93a7:b0:6e4:6c3f:d769 with SMTP id
 ka39-20020a056a0093a700b006e46c3fd769mr6866356pfb.29.1708473001433; 
 Tue, 20 Feb 2024 15:50:01 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b006e089bb3619sm7817082pfg.112.2024.02.20.15.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 15:50:00 -0800 (PST)
Message-ID: <f5d3ea8b-8aa5-4ee5-b895-67eec6d140ee@linaro.org>
Date: Tue, 20 Feb 2024 13:49:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] trans_rvv.c.inc: mark_vs_dirty() before loads and
 stores
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240220222510.209448-1-dbarboza@ventanamicro.com>
 <20240220222510.209448-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240220222510.209448-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 2/20/24 12:25, Daniel Henrique Barboza wrote:
> While discussing a problem with how we're (not) setting vstart_eq_zero
> Richard had the following to say w.r.t the conditional mark_vs_dirty()
> calls on load/store functions [1]:
> 
> "I think it's required to have stores set dirty unconditionally, before
> the operation.
> 
> Consider a store that traps on the 2nd element, leaving vstart = 2, and
> exiting to the main loop via exception. The exception enters the kernel
> page fault handler. The kernel may need to fault in the page for the
> process, and in the meantime task switch.
> 
> If vs dirty is not already set, the kernel won't know to save vector
> state on task switch."
> 
> Do a mark_vs_dirty() before both loads and stores.
> 
> [1]https://lore.kernel.org/qemu-riscv/72c7503b-0f43-44b8-aa82-fbafed2aac0c@linaro.org/
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

