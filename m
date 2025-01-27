Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCE1C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 14:06:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcPkW-00017I-Mg; Mon, 27 Jan 2025 09:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPjx-0000sr-RN
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 09:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPjt-0000Qr-TE
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 09:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kpL8ryd0XOn6zpiaU8a/KxgMPhJSJ0UjVcM5zrIuUN8=;
 b=QY1W2IFo013WW5Rv/yVqXFH3aDL9SPGlp8mQOwfUkGnsRrl6KmtQJKeQ58FYXz/SobzcIY
 qX6q0lcWIbJ1T2VYHM8OyOmkdtFbWZG+ucJskTIwEMv/2onenmGLPC8HrRKJMjdD61Qar1
 S/HEBta4io96839v9howrrDD561d2DY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-lfrKQ1mhP-mc5WQdlVersA-1; Mon, 27 Jan 2025 09:05:16 -0500
X-MC-Unique: lfrKQ1mhP-mc5WQdlVersA-1
X-Mimecast-MFC-AGG-ID: lfrKQ1mhP-mc5WQdlVersA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43624b08181so22895155e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 06:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986715; x=1738591515;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpL8ryd0XOn6zpiaU8a/KxgMPhJSJ0UjVcM5zrIuUN8=;
 b=vxi+uP4LxnNeBsGMZwb4Z76b7QlcIOkQ9sK08FKV1HxT6Wj3gVHuM4lKGcEwbJ7xpg
 D0yMdQaCgB1Q5+t3X0ZCwFFawqi41O5T2xH7DcUT36RsOB9DjqjTRVLdvcaHAaodoWge
 LFsYcAyHzBXE7wbmovTnwn1mGOB7HMmNstz9YzBYuAh5rn6jnHjgowWIsPoICX47wkht
 ITPL6y7oKCwzPZ+UEP430z0BUGpRKugpDBAipPqq/JSBjFv/eFMP8xVk5YYAoDPE+X60
 0Sy/SFI313+ROVf4jlpCpJwc/iC3JhHw2OjRhf2jKYrACFPHAk5Faq2pxblHeKERkB+2
 SMtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4NviwTfIvUTWImKGUISSXQEeuVlypJwedJF+ZT2nJCIyJ81FszeFvM6spxK3T6nWGIYuaUlTV27f6@nongnu.org
X-Gm-Message-State: AOJu0YwTmy0Oj7evvTw67NNhmx+EZ+IK7YZLDSramJ2BcC34VBqCwC9O
 HouzsiDdLFIBGH4khwWjCpEDGYwFvMupxsP94dSXM1SF7QE1lNCeYQrZXxf2Dt9QyBzmvlgU1Fj
 m6aH4Kp6SELxlkFxg1T8HnYdNZ5pPtx4kMarlCBIKqGMJoko9UfMk
X-Gm-Gg: ASbGncs08lawCsbJHpyrUC59JjQbAKCaSrescGpp9aCGmGSt3bAsUi06Tv7voTwSG6d
 Szp12DJii6zxSuzljVtsNHhGZdf7uY7qKjBpKA1kEkIbFgENWrbmB72V914GHg7IthG9TrEXmkL
 cj2EvvKy0N6FW4MrKjLa4Bj+qE/esMxApFi+nWYlHil4u0R8nTvjBErMxlNoAzc/3ca5stCzGW5
 xxDipvvIMno0MR56CQqkHtjd0zzk4sY8AfIPlv/Ux4Nd4Db5vmf7fFxLIe3fXW88NU9STGkdZxs
 N1++1GWT3NC9Gk+NKqdSCrXhBfYRGQ==
X-Received: by 2002:a05:600c:1e0d:b0:434:f2af:6e74 with SMTP id
 5b1f17b1804b1-438b886097emr157573265e9.15.1737986715305; 
 Mon, 27 Jan 2025 06:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0eD1twzunzQS1QuHuVHRc2avVF0DBRkSRcMWdFdEJPlNCQNQ76eKBCTBs04O9DijHXbKHWA==
X-Received: by 2002:a05:600c:1e0d:b0:434:f2af:6e74 with SMTP id
 5b1f17b1804b1-438b886097emr157572725e9.15.1737986714802; 
 Mon, 27 Jan 2025 06:05:14 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4856d8sm133442165e9.11.2025.01.27.06.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:05:14 -0800 (PST)
Message-ID: <c9ec5db0-3cc7-4513-ad31-69c92bfd4304@redhat.com>
Date: Mon, 27 Jan 2025 15:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] target/sh4: Set disassemble_info::endian value in
 disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-9-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0AkQUTAAJN--59Em7_dsrahJMrFfpU66LE7rcVZxIg_1737986715
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sh4/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index e3c2aea1a64..9d3e6cb2fd7 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -134,6 +134,11 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
>   
>   static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
> +#if TARGET_BIG_ENDIAN
> +    info->endian = BFD_ENDIAN_BIG;
> +#else
> +    info->endian = BFD_ENDIAN_LITTLE;
> +#endif
>       info->mach = bfd_mach_sh4;
>       info->print_insn = print_insn_sh;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


