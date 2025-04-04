Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79DFC36010
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 13:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0gmE-0003SK-Ac; Fri, 04 Apr 2025 09:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u0gmC-0003Rh-Dp
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 09:08:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u0gmA-0003yD-6F
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 09:08:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso19137985e9.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Apr 2025 06:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743772078; x=1744376878; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sWNPYwcQS2v4r0YL3JKZUq35y/xI66WU8qs2yBV59n8=;
 b=nivK9v/obHnFs7hfTSGNkN7rCbrQl/dJY/Id8b1lL9BleVu0MQiDcuQcrS7X5QC3rQ
 4ICm+KseQ/Rwk0Q++KBReW6v2MxDjKWJ+NyWIZvOIfjDqdBzmG+fg6qSDTYFdaMrSSbA
 kpNvaEy1pcaqJvQTe9IzYAWbOq17yj+I10cUZOGIGQ5b1gujK6/8ch2qhpYA5xzgadDN
 NPi6HdUseSCmomF/8MbuGmSWPOODl6mu/ddO/D5r5tae00G96SpnP/8TUj3xGkGB+er/
 mjWakgHLvRv41P1K2IbmF0z8MZnxg3oG1Yn/qVAMPqOlDBIGPrEeTRPyD8XlTy+8Y6zb
 LzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743772078; x=1744376878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sWNPYwcQS2v4r0YL3JKZUq35y/xI66WU8qs2yBV59n8=;
 b=cvst5j9CwU7pLQigS+taKxn7C5r7h1LvL4ngHZPkdY3zUK+ZvO8Nln0hBuLDQ9Ycjk
 oRMrkDKbdnPP+N9+Z32bjTLo6pGxg8lDGQK403GDy7tH9SUkwWKJxSXvuRZv9kHxlzOm
 N/a7cDGijEWH5Mqh41N8xfmA10LMAxYtGMEbKnKlcoDKM1PO4y7PVvAcUaqi5nOouIm/
 te4h6RhLlXz7BI4o17GH3N++skVX1hdJFzxtY+5nWpnZIb4NQlqwlp5mEkNUUtGxOTMY
 DIHwOY3Mo5sStzPP4h6vNxFzdqQH0CcGUFJgRcrXEml5F9OGpxBsRiCAADVnbjfQXlIL
 IcqA==
X-Gm-Message-State: AOJu0YwIVkLg8wn3kobkwQh1e2nDmXtLcwOWqdS6c/+l2R+P59vyBeyn
 5XzbtDZzCr54SNQAyYCoxpS4/RUQXqtk0GJMphxkkEn6diukMD2eAZiOliz+3po=
X-Gm-Gg: ASbGnctBEE7a0z8P169FbRyb/kKkstoEL9RVXxgFCzQ74H/H85LdaIJRr9+HIVdPdXd
 yZclx0A30h0MdTUCqx8+LRfToLhScCySoCS9n0O4vysy3WomaGzk0qM8bQ9fNxVChhKi43wtlAT
 MSv6ff0dmj7siNwkqbZ5MTw+mlYysFj0GM5pnk69bwcfDGFyWl2CMUM645jUI/NtfM8orVXep+N
 LmBEwwUxgN+Hgq/2M64M3em6wkChjzSLIaQpS8jiI1WfgD1iYPq3KWlCaQEeasi8sje1Ww2vRNj
 VIugMlW8KJARUE1m9ncebtMDO69lm0z//V5d0h0z8XhPgGmmQB+Fn0ay0y/OTBVKD9FDnY9e2/G
 3pjbXZtYa6GiGsKpMpA==
X-Google-Smtp-Source: AGHT+IFSGclpSDGbL/5j2UJtn7TyU8HoUvzJntwZNdwlM3/Z2JW1Rimwy2PuBbwzX6+u4E67spTEVw==
X-Received: by 2002:a05:600c:8119:b0:43d:762:e0c4 with SMTP id
 5b1f17b1804b1-43ecfa19076mr24723495e9.27.1743772077125; 
 Fri, 04 Apr 2025 06:07:57 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec3669002sm46141555e9.33.2025.04.04.06.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 06:07:56 -0700 (PDT)
Message-ID: <cfcf9a32-1745-4d46-a2a2-977a0d0af195@linaro.org>
Date: Fri, 4 Apr 2025 15:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.0] docs: deprecate RISC-V default machine option
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250404122858.241598-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250404122858.241598-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 4/4/25 14:28, Daniel Henrique Barboza wrote:
> Commit 5b4beba124 ("RISC-V Spike Machines") added the Spike machine and
> made it default for qemu-system-riscv32/64. It was the first RISC-V
> machine added in QEMU so setting it as default was sensible.
> 
> Today we have 7 riscv64 and 6 riscv32 machines and having 'spike' as
> default machine is not intuitive. For example, [1] is a bug that was
> opened with the 'virt' board in mind, but given that the user didn't
> pass a '-machine' option, the user was using 'spike' without knowing.
> 
> Being explicit in the command line is desirable when we have a handful
> of boards available, so deprecate the default machine setting from
> RISC-V.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/2467
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   docs/about/deprecated.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 76291fdfd6..0f41a99c67 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -304,6 +304,23 @@ online to check that this board did not completely bitrot yet). It is
>   recommended to use another MIPS machine for future MIPS code development
>   instead.
>   
> +RISC-V default machine option (since 10.0)
> +''''''''''''''''''''''''''''''''''''''''''
> +
> +RISC-V defines ``spike`` as the default machine if no machine option is
> +given in the command line.  This happens because ``spike`` is the first
> +RISC-V machine implemented in QEMU and setting it as default was
> +convenient at that time.  Now we have 7 riscv64 and 6 riscv32 machines
> +and having ``spike`` as a default is no longer justified.  This default
> +will also promote situations where users think they're running ``virt``
> +(the most used RISC-V machine type in 10.0) when in fact they're
> +running ``spike``.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Having users specify "-M virt" doesn't seem much of a hassle IMHO,
so I'd not use 'virt' as the /new/ default in 10.2 (but we aren't
there yet).

> +
> +Removing the default machine option forces users to always set the machine
> +they want to use and avoids confusion.  Existing users of the ``spike``
> +machine must ensure that they're setting the ``spike`` machine in the
> +command line (``-M spike``).
> +

