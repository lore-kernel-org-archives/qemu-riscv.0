Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC3C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 20:01:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc8ok-0004Fa-En; Sun, 26 Jan 2025 15:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8ng-00033t-92
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:00:11 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8ne-0003JK-Mt
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:00:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2f4409fc8fdso5690156a91.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 12:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737921605; x=1738526405; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
 b=IUq5IpTPOLSEIAuBU+WXvx6ntkc2O4sbUPKuU1v+o3MF77F79fnfBTlB59lyEkYorh
 4ZSbtqd0A35SwGQ4obMNLeqvYMJXjE117/2LHk6/N7w4/h5ra2WORh7i9wuXvFWs75/M
 S5pq9BU8ZA+DGyw6zWLCtJlKrVYT2SthY3O4sXjGR6U5p9CEKyCZyYKR91BrEmRW3iOD
 21foiQPoiD1Ftte71ZUP3MAT9DTYX158Fb73zGA8oIZaO15OczHxvml7ScQ1gtAULbmj
 5/g+77PvF5HZlF1oIETlh9foRgHVxSVCnKfxaPXExcgcU17X0cSWcxoVG0c/3dLS8enW
 fuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737921605; x=1738526405;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
 b=rDVf9h31Wc09r0zEMSDN+ksNaj8I+9X+c9PlTPrSnxcgb9eHaoxLZht3mI9aeLKR4h
 Wtqpphs0tWi8QOnTGzrvqCRV2KY5VjWtbCI/FEb8HrXP5aTnAumvVliOkqahqcywPHRZ
 FANdiCPbBZ2Rhw5EynFHTFrsEfUd7bicuiAu6zY9z46EQe796Ii5fuMurqYUjxNlnY2p
 ixD+Js321mXUVbqPd65eLbuyYWg1aMOjn7AGYypXbByBAY7uH6zLDy41I7T3b0zmOwMF
 Be+kwBFy8RBt+Uj6grOCfQyZikatOVHzcsT9C1qLy9vbPeO8b7BkPxMbkZF1m07rPTgD
 yjGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8r8LEf4dcy3q9AygKwb0GsWoEMaUGZO6MqMLrRtHs0rkUTmIzdZ0YJfY990QfmQPXpBBkG/PVuRXs@nongnu.org
X-Gm-Message-State: AOJu0YxE6B5+VgnzYCgzXca4aqIYJum+0ijX0q7WV1cS2QcHvA6rDNN9
 L5N91uXQu+Lq2Nx72oq8XtvNFA49spMR/CTIR1j6p7VLif76fF/JjUYU1LgGtU8=
X-Gm-Gg: ASbGncvVR7yjC5gadHf7FLfgwEZ3Sc81LDpJ42Q451q8zvadth65bzNUuzMhwhITWT2
 PL3E/xkdfiv+Je7rPH3WCin9qhAAjbwBHBQMRdG4UdBCwrIfXm1bErZJeeW3QsvzOR7vYLb4H+G
 i8FEkDYvDnvrh/mncgpRIwcOF/sJLdE3vfFCj2nvx6SC43GRrjPL12Xm44yd5xoS1HbuS0MD2wB
 3kSxJLwHDI+xkL6+he4QoG6WeL1SI9zNfcX6xtkTOT3fcFU1XrxLvIH8KaQhtjk+tJDN3JT+RMX
 gOcF0VFtywjjK5JdSSZKEGAENSXPkm4pB7o+wO5jmABM3+Q=
X-Google-Smtp-Source: AGHT+IEP4DwQ/u514V5B38J2P62wTL0qYp8JNncl4+5UB0i/l/G/YI+4UbX8eVL0ayMsA+c7B1DDZA==
X-Received: by 2002:a17:90a:f947:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-2f7f176b184mr25848071a91.8.1737921605198; 
 Sun, 26 Jan 2025 12:00:05 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1dc56sm6196959a91.49.2025.01.26.12.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:00:04 -0800 (PST)
Message-ID: <ba781224-7b4a-43f6-af25-acb308f11313@linaro.org>
Date: Sun, 26 Jan 2025 12:00:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] cpus: Keep default fields initialization in
 cpu_common_initfn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> cpu_common_initfn() is our target agnostic initializer,
> while cpu_exec_initfn() is the target specific one.
> 
> The %as and %num_ases fields are not target specific,
> so initialize them in the common helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c         | 3 ---
>   hw/core/cpu-common.c | 2 ++
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

