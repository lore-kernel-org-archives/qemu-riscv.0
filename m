Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF1C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 14:06:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcPl2-0001kf-7T; Mon, 27 Jan 2025 09:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPkC-00013r-8A
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 09:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPk9-0000SM-Gc
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 09:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xkRJ/A+k3ci/jgRQIwBl5g6mUAHZnUlimZu8QfpnGLo=;
 b=SbEbqnzDmKdiZNyT2/TwmeUnnFEXdMEJOaEw54nGSfgQEyeq4pTYAZcIlV/BenFZjp+GzY
 7bBgvuLJ8FFlNdrlOrQBiE/MuXi+FAjiTmO9Qx4VtEaVYlHHWRmES+d7YsIgyD2EIRsnCN
 UqlJ35CtEr5x+fFPSiMaSQT0VfgNJmA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-lzjyUUWtN5W9LJm1k22DTQ-1; Mon, 27 Jan 2025 09:05:34 -0500
X-MC-Unique: lzjyUUWtN5W9LJm1k22DTQ-1
X-Mimecast-MFC-AGG-ID: lzjyUUWtN5W9LJm1k22DTQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38c24ac3706so3715550f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 06:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986734; x=1738591534;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xkRJ/A+k3ci/jgRQIwBl5g6mUAHZnUlimZu8QfpnGLo=;
 b=ItAV6OMeW/SiiXaojcAIM0DeFw+lwhKngJ+WaS/xouVXRlc/JYdTb7Ok9rv2Vq7ABg
 5z0yQ3zqmnxoxUqlqrjWBbzz78RkCVKEc2725FRUn3jMRQ59mInFzrHlGzb/wJ7sYg38
 k0kUt90CXldPwtH+eR7WrUA7V/7eMtefzqJNWnvyFfLXgF5Mv3MD533D69EkM7+Ecfdl
 n+cz/CJIhPTjEScNjeQsgiCVb/miMPfStUKOSaYIgkzIYAYMRo83oXwfH2W4QHm2RBWU
 FvU/OPbdb39a630x1Ct1fuoYfG6is9Tpe4w2X6eyj+55h1n40SK+C7MEXPA7GLjnETS1
 B/jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoR+XcVj484Tf0V6GmpFeLjvVVbCHwxdVslK4cZSQEBrTdj/RxA1xbbTTB4ZyzFRxoU9X81nSMGZez@nongnu.org
X-Gm-Message-State: AOJu0Yxg6kltdMUVW/vqURglDNZI3NRAMEfh1RSTKpdEteTXUcIDbuAM
 PA1rP/DFAXh+9TnDa379lHJ2lJn691EkEJAwyxzzMrFmfGdSxpjwv8jpxJc2ETkjUr1kBGceMo2
 r3TvPskm7pp25NFaGsVArPWHiz4HqCobD6vr8zQjYjHNW7+emxa45
X-Gm-Gg: ASbGncu6RMH4DizpG6j0nzPnhJ1LHz17uJ0dT24Ec3eEXX3HpFRQkvmP5w7y6rV9+sO
 CDBRV+E/ZtIwe9pXAlI9+j7pJklsjmzY4xc/hkp6+N5q7zNL/D1nZNo7t2k57cFNXdUJMjksUUd
 j6d9a01vfLBScu51PB6dtQj4lkzX9faefJOcXFg/oujZ8fCY4Gyjc5aEozCthGwGU4FEEinIZr6
 2SNML1jPWwBJvWweHPsQ4NYvRXLRWIzq0laNxZIeR2GL0zldzwqOODzgSdSlyFpcxxbi2t0z/pU
 uKHx+7aVGq80/e0wvsG5aDEIjp4Ffw==
X-Received: by 2002:a5d:64a1:0:b0:386:3262:28c6 with SMTP id
 ffacd0b85a97d-38bf5677c09mr36386806f8f.5.1737986733621; 
 Mon, 27 Jan 2025 06:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuYXESyi+kc9NCw7MuHL41XzG1QcCQlMyA984ONV9J24K5nNJ6tXBiXDGueu8RAcf5775iiQ==
X-Received: by 2002:a5d:64a1:0:b0:386:3262:28c6 with SMTP id
 ffacd0b85a97d-38bf5677c09mr36386778f8f.5.1737986733292; 
 Mon, 27 Jan 2025 06:05:33 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c42fcsm11361252f8f.96.2025.01.27.06.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:05:32 -0800 (PST)
Message-ID: <015585f2-4e63-46d5-a8d7-94db6a4220a8@redhat.com>
Date: Mon, 27 Jan 2025 15:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] target/xtensa: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-10-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-10-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AMoaBrJGLzMpr-9ZcdEAbJkeCvUEXduLKjxB26veH_c_1737986734
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
>   target/xtensa/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index efbfe73fcfb..bc170dbb5cc 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -159,6 +159,11 @@ static void xtensa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
>   
>       info->private_data = cpu->env.config->isa;
>       info->print_insn = print_insn_xtensa;
> +#if TARGET_BIG_ENDIAN
> +    info->endian = BFD_ENDIAN_BIG;
> +#else
> +    info->endian = BFD_ENDIAN_LITTLE;
> +#endif
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


