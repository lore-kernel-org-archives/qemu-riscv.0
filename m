Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52299C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 21:27:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcWdH-0005Sd-5o; Mon, 27 Jan 2025 16:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWdD-0005RG-Pj
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:26:55 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWdC-00036x-B3
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:26:55 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2166651f752so100358335ad.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738013213; x=1738618013; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zUre0Mdf0BtVe7A6A7XE3tyBl/YmugDLg58HFmxhDzU=;
 b=dHA6p0fk+m6JdDL4/KBkCHq+zgfLNBHYTiJD/bK/02IXliIbmN2QSRuX6iXlW5MESz
 SelBnTdEw12DIo7diyXpI2KpT8GGElg2NmVbeljDgfVXs28CB1whgd2Gw/TqF6G7b3F3
 OkxQpBB8Vi6jVGt+TCQ/xkXxRNhXPANI8ulrQamm+odMjIyk2F654bk7FNkj4RQLnoth
 9nmEGLVJTmPL8ba4+ddtWWip2DgWCRBoHUE1VgwJoPKejtQY8LUP76JRDxYet4jAChVW
 9jBBX/V8bPJnj/TmHLB2saSnHc8V/M4EJ0zDpwOTbNgCtRdADajv8xJS9VrNMZwC2R96
 z+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738013213; x=1738618013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zUre0Mdf0BtVe7A6A7XE3tyBl/YmugDLg58HFmxhDzU=;
 b=YYpu9S8V3GytEFIpqlfTfDPLjVIYnYhtcU02edMJcwo4bTmFhJb3wMdW88gjz4hLi2
 EbV2Up50zYc4bWhoXRXQHoN4PDR8V6YJqDN93AbXgWUj/8C/i29FJbTRYhj4rH1hqeYs
 PMvu3pqNWZrSLBOY6Ulj4MmVk9VZAJSGeCz2+Yf8/3DYMh50pm37Qn0VgimDvZjePcBT
 l8E079+9kyTvvhtPJz7YhVF42WruSHSk1NBmw+s20nGJ+O5NwPoVyE/nIZinJYrz+MtM
 NhXJRDpxpj7ZggKKWC0RYQW6CkQa9ghmkwYXZwfulmc8Qcpf3ntTrNGPgV7IDc4OSXXn
 z6AQ==
X-Gm-Message-State: AOJu0Yx8xOhI/ikZPnCJj4Ce1CS7scqNMbuxZ0rqZniK6ZC38Hc+vx0H
 Z48fI1xv+2B3nQN7h9rTYAgFmUFbGYEsYvJvDmgDEgRoEemYewavPQXmycEDfn1lTv5cYzWEjp8
 g
X-Gm-Gg: ASbGnctJsLqJ95sjCM5dw+uGj3IfzEqc5CjjrLK5uD5/4w8VgGFxZ049Ngjnij7wVe6
 w4vKiptFTiY0eJnFrnaiyCJE3ve/kiJaR+4JoYdcpM58mAWWuRvyKFx3oEPdIm9v/bAwmBIoF6t
 gzbu4ud0jMhCFjyx1HPiFsoTDiYC/zaB5qDzZUG/GSf0uJK/XLCY5VZQlmKnwzsnwRJub0ns7UR
 Jx2Q6BMMA5La94rXae2Qozfx8N68hicXm8F6ZE/8my78aNXWQNdyWN8BoDW/6nYo6/zAA0mq4r6
 nB34X7JP+28I4S9RgldTxBBbyCWFfhuHUN6RuTGTf6DAcXQ=
X-Google-Smtp-Source: AGHT+IFbQULqDxJtAVmyq/O9WshPOjFQSkWyTacetSVCMM0UrnuIv5XuskVvjC2JvisDpBIzk/kxnA==
X-Received: by 2002:a17:902:d48a:b0:216:6f1e:5799 with SMTP id
 d9443c01a7336-21c355ee2b7mr702445295ad.35.1738013212898; 
 Mon, 27 Jan 2025 13:26:52 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414dbfasm67986535ad.183.2025.01.27.13.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:26:52 -0800 (PST)
Message-ID: <823e27f9-9baf-4da3-874e-ee58b4c6473d@linaro.org>
Date: Mon, 27 Jan 2025 13:26:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_as()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> Rather than passing a boolean 'is_big_endian' argument,
> directly pass the ELFDATA, which can be unspecified using
> the ELFDATANONE value.
> 
> Update the call sites:
>    0 -> ELFDATA2LSB
>    1 -> ELFDATA2MSB
> 
> Note, this allow removing the target_words_bigendian() call
> in the GENERIC_LOADER device, where we pass ELFDATANONE.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/loader.h      |  2 +-
>   hw/core/loader.c         |  8 ++++----
>   hw/arm/armv7m.c          |  2 +-
>   hw/arm/boot.c            | 16 ++++++++--------
>   hw/avr/boot.c            |  2 +-
>   hw/core/generic-loader.c |  6 +-----
>   6 files changed, 16 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

