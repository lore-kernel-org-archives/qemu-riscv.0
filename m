Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D31C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 21:23:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcWZ9-0003nA-2Z; Mon, 27 Jan 2025 16:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWZ7-0003mU-9L
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:22:41 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWZ4-0002PE-Jw
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:22:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-216426b0865so81659685ad.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 13:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012957; x=1738617757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OW2HkPPwANqK9qN6DD8X5NCpTyrVJpv120SbiG3owM8=;
 b=tJsc+q0DbSO6QZ8Xswco8OrlcqEgAFed6WFtgd8K9DNX0SWqmaVpkIOp7ngMQA9haJ
 Ynwkl7mIVyA2pBXYVOqSJOFXS6zHXle2vaCICT9B0Rbmowizo/pUKX0SWUvBOcWlroxG
 uIM2RheLT8cEkl0uDXE5zlrQpiB3/30qI38i6h4/dyRT0oVKEBweuF6cO8DjNw81wxFs
 WsOmknvQs9IFCtmdtHgOd/zVzPqp8OcLZFAzQ/+OpSy4JtAniHq4UhtPNRtDWQDbbd0C
 PKBkDgnIqsCiJdGD1riZxeqNUMyDCBqK5TkM/CExlaj5A7vESSzECCmJF4itKJaqZOnq
 HI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012957; x=1738617757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OW2HkPPwANqK9qN6DD8X5NCpTyrVJpv120SbiG3owM8=;
 b=XdOfwcAXyjlC0faob2skGxAcOE2a9rk8yKJygBcZUDIbdszc6xI3+p6uP9EVjnpNjw
 e9PnOaezgXXO9exrnIoYhPr6SzqE4VFSlN/51fp3K9o64EqRQXH+OvajmOjCVoUAkUwH
 lAOuXXx+cYZa2ojQ8xoIqz2ir/w238WNYRZDsZhkJlRH5ETpRxpf+NLuG5EksFEBF1Nt
 3V+OFBjueuEp+y8AhnV/IJ+NvB5WcMNktOZzXyHIy2ciIH61Sujss+hbYXFCHwWoKUQ3
 fUNF6S4Z2BUTu4uAUh6vazzfdpaD803mkTlC+inzWuo1QSv9HsLg6celmzeCsyJv8r+S
 wx/Q==
X-Gm-Message-State: AOJu0YyZVjVxaSDoVxnF4Je+Rc8I6TzFuJ9okimVldI4QfzerknBOYXK
 ahPzbFf6m8DIm7P8mERvumo6zj18ieslj8V3s/BS7kh5h/2gCHJvsfM38DeooFI=
X-Gm-Gg: ASbGncsPQtrDX+vgZke8zAyOGWiZ2lPo1LU4rF5hB1FH/aArg0eFmbwqsVooFVwNtqM
 56Zk7hnkmW682jpnfp1ksQmCeHNAT8mwdldvjy4hOHHjvejfWu8YRXvnUgMwRIAQK7KivwLliKn
 u2/ZqXJK4Guzz19X7Q7m2XvXKma9rYSXSiugHcBHTOjluU/eMmkc7DgHJSzj2K/5lUbeEnUHcg+
 QrC5yf5m0ujg/63QPQBCE/uWoJdedpxhus22q8ldm1U/6jRe0uPO4bK78KlHaTXp74hW/G/j3JQ
 GoHNiQe7a0QQ/cThaapSbP9M5F0BAtCKWIsn/YWiaOBEqfv+AAinanMCiA==
X-Google-Smtp-Source: AGHT+IFXcr34MNKMV4JYKLozIUqUdHXikB76dhzKkiaCIHtv/HzqvJqCTdhKjyh62vh8mQL56aqbhQ==
X-Received: by 2002:a17:902:eccb:b0:215:97a3:5ec5 with SMTP id
 d9443c01a7336-21c35503551mr677022635ad.22.1738012957099; 
 Mon, 27 Jan 2025 13:22:37 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea4200sm68881735ad.88.2025.01.27.13.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:22:36 -0800 (PST)
Message-ID: <ed920ff2-2bf6-41d6-b67b-89aa34c4ea2c@linaro.org>
Date: Mon, 27 Jan 2025 13:22:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_ram_sym()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> Rather than passing a boolean 'is_big_endian' argument,
> directly pass the ELFDATA, which can be unspecified using
> the ELFDATANONE value.
> 
> Update the call sites:
>    0 -> ELFDATA2LSB
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/loader.h |  4 ++--
>   hw/core/loader.c    | 23 ++++++++++-------------
>   hw/riscv/boot.c     |  3 ++-
>   3 files changed, 14 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

