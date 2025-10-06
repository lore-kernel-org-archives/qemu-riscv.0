Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7DCCAC5B8
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 19:09:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v5qZF-00012G-WF; Mon, 06 Oct 2025 15:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5qZA-00010M-Co
 for qemu-riscv@nongnu.org; Mon, 06 Oct 2025 15:08:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5qZ8-0007N6-2B
 for qemu-riscv@nongnu.org; Mon, 06 Oct 2025 15:08:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso4014883f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Oct 2025 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759777687; x=1760382487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qOTKjETXMBOffS9s6NtRmA9z9L3u3pZARMneJShhpiY=;
 b=y3FiaNgPzEB96LWl1mIoeq9T+J8sICmznS+ts5vsRY1TTZxDXen2+XLPid1qVF5Vi+
 XdYb97E8RXnc1nEWNU2Ur3WdG7AIo1LFpdcLNDEd0FHD4WZUnL3pGBTFlI+2lEKNOkwQ
 OjxSMEEMjM51DCRP4FUgQr8EONIJgnDQPuLwYH7MEEPLr7br24gCou6xPMi2mCG4yA93
 y1CqmraWq7Yuk2U5vguQiaCBJciujZbeItL9FkpJ7q+LwF0HD/OB+N/vnEsAR1mWwuZ3
 an0eaWmvaJMb8meGowhmmXf1pZoF+qQ3BQ3KtgyGBvdmJWYkpN/tco51zJY6qHGoILxx
 lFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759777687; x=1760382487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qOTKjETXMBOffS9s6NtRmA9z9L3u3pZARMneJShhpiY=;
 b=Lxgmmgm/kVYDJ52xBsnWww8idubUlASsBXoqa+8pA8705J7HX+Kz9YHcP3rcpOnf+x
 MXbImATv969Mdnf6jXXLD0r6ucAN/TFak8t+VafuoFAbbg5mkXTIDzLIJTuuv4atV52I
 y0lPZCHIzD4XCYtKCTcnZLqLPZbI7E0C9uLxX6G23reStdd9lAJnLfIw+/LFQWIRQAOY
 fH0hc/DIOU6LmiCjZOdjdyugWKr+EqpXTK0OZzDKvEy4ud/pGOzmMZdTdIO15to7NeuU
 /tIKAs5MLd8lzhJe4S3cAMFkRsOX3kG/tGmizEEPxblNVPjAzVk7ILAwKXLBTLcwZKbN
 1DKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA9dJTdZH/whZdi4voe83ZZXH7Ou2SbAistSyt5Gk5BUjdU0n8yFq0tLbDJSqXwHvo+dfgnSxuJwKk@nongnu.org
X-Gm-Message-State: AOJu0YyDnIGln3pMrbYKm81WsuDlMeJy7scxybm89PLmtxMbMYer59k6
 baBXjv8EbQC0m13eGkiHkanY5rXUfZy2XV8I/UmP9Ns/TsADwQ7xPvhCjbQdIzIXlg4=
X-Gm-Gg: ASbGncuR2S6Yd7U9KPofDxmwcU4So41E+ivi+1gz/5m7KTRdRkm8FodEUAHsQWCFcd5
 Qmm7rlByHV6ILE445YU/4IgKvcCfWCaQUG48gjH/hmKF44s5Df+3PcLeV+6w4U1IrxVP0fGPenH
 ZnDBsqk/K+4Ol2agzTzUNgKpJxJwwkxZ6d24zmMCX055YDq7oTi3XnhSEg1Yr44dacVt/xCLBJk
 ikjQT0KLl3YkCUaz6vUnKEg+EiLQtH4xPMaFJo9Msaf3AWcN7aMkEzNoSF6aUm4jvJZJa3jlyCg
 2+3BquKQ2jnCLGlne8UGxUoqASyPv3g0orrHDq5IfMptmy+8MQqrudZCHEwoLWFVxD8d9XnUGat
 qLLLcDpxB8y0g8JB2kDsuFxw3L3DuE5fWict6OMZ28Rt+yOp3aVQ0fQB58NJj3/5TcAQqWP333o
 AFnBSHvHwLs8oP5MgR0SUYfTA8QQpx
X-Google-Smtp-Source: AGHT+IE2zLackfX9ZmIkhfmMyE2JVkQ+ZGcyT5zj/rwa3m7atUT6XMgApWF9mKJEjUhhtKZj1BNVvA==
X-Received: by 2002:a05:6000:2f87:b0:3f2:41c4:c7d5 with SMTP id
 ffacd0b85a97d-4256719ea7dmr9732894f8f.36.1759777687534; 
 Mon, 06 Oct 2025 12:08:07 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4ab0sm22005734f8f.52.2025.10.06.12.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 12:08:06 -0700 (PDT)
Message-ID: <e68dc6a2-17fb-475f-9f70-cb2cbac6f652@linaro.org>
Date: Mon, 6 Oct 2025 21:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] exec/cpu: Declare cpu_memory_rw_debug() in
 'hw/core/cpu.h' and document
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20251001150529.14122-1-philmd@linaro.org>
 <20251001150529.14122-22-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001150529.14122-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

(ping for this single patch)

On 1/10/25 17:05, Philippe Mathieu-Daudé wrote:
> cpu_memory_rw_debug() dispatches to CPUClass::memory_rw_debug(),
> move its declaration closer to the CPU API. Document.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-common.h |  4 ----
>   include/hw/core/cpu.h     | 20 ++++++++++++++++++++
>   2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 910e1c2afb9..ce64a999035 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -150,10 +150,6 @@ typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
>   
>   int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
>   
> -/* Returns: 0 on success, -1 on error */
> -int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
> -                        void *ptr, size_t len, bool is_write);
> -
>   /* vl.c */
>   void list_cpus(void);
>   
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 0f7eda1a10d..1e928f57c99 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -685,6 +685,26 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
>   int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
>                                void *opaque);
>   
> +/**
> + * cpu_memory_rw_debug:
> + * @cpu: The CPU whose memory is to be accessed
> + * @addr: guest virtual address
> + * @ptr: buffer with the data transferred
> + * @len: the number of bytes to read or write
> + * @is_write: indicates the transfer direction
> + *
> + * Take a virtual address, convert it to a physical address via
> + * an MMU lookup using the current settings of the specified CPU,
> + * and then perform the access (using address_space_rw() for
> + * reads or address_space_write_rom() for writes).
> + *
> + * This function is intended for use by the GDB stub and similar code.
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
> +                        void *ptr, size_t len, bool is_write);
> +
>   /**
>    * cpu_get_crash_info:
>    * @cpu: The CPU to get crash information for


