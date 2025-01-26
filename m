Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9713CC0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 21:15:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc9xy-0000ZG-As; Sun, 26 Jan 2025 16:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9xw-0000Y8-K1
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:14:48 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9xu-0007ie-Pq
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:14:48 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ee989553c1so6504528a91.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 13:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737926085; x=1738530885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
 b=EW5QVXJDzlPKt7uDkgOwcHnHWR5FioUVdH95HqC2zGt+1GlD/TsWn45AHq0foKxRHE
 OXWp+4wQLjnrRFBQGWDyCU2U0UeY28M57wqz3OJoBcvIlkNCceaezmgBq5hMpSiibIqO
 EuXuoDUtRgsAXzik2ynkqAZLP3cFhmn5h6FtkFXPDec/hKaZ8Hj3fFg4w6ZBs8Y2nNJl
 3qSMA5VlvQNwRtyYqQIw2S71q/Ux/Jq/lLZnfErtzcg6lwfRYJZZ0t/L49Rgtq73wHQg
 Zyr1OboX0LdYfjFAjI6nvIJ8rJmEvdBKMhdbVjDSDrZ3IJ7ygCAI/73fKDYEpIxBS7w7
 c4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737926085; x=1738530885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
 b=m75OCnBpHvlg6zx6PKtpIMw4Q+Q7zTFgsiK49+TJ5SvqkmHmnZgyTAsmTK93h6eSJe
 tc3rO4iM9Q5C8TBLz7Fj2D4hLZBJ6K4tveSxG4EVEi8Fu14oSvKpi64BLNbOgCIqltyG
 PGEtM2RQRPW36F9fhk58SYoO2CoTyZOcCTZApDKCdmnBuzsyGg6/4mVAdNwXIY08TXBV
 mQY7a/V9kczlzVu6GEh68dqtt1dkGfSCyTgFopXhlwOuo9sjpgaxy09D+oGTMUSG3cM1
 ycUNDXsadDCyGmvEA8OU/AB27FYfZrUSkVY2YXyB+Cz7aYWYnEzx9H2XzqdbzTI7Aejl
 a4nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkM7jJ4ec3CIlV7KTWoOlVKGR+xBbsqnUuBR9nXj6uR6c76z2a/xzXhrJS5gIFT/48+2PuU/Zl4rzd@nongnu.org
X-Gm-Message-State: AOJu0YytIH9WCI5NzNJHjyvHWvlZt6mihSdNTqmH9T19YasWt/EEDTBw
 PNdoKwtg7ZDD007yJZRqkquwByBPN1R/5Zz3aWo91lPIExdf37RIrIFpuBd/wTg=
X-Gm-Gg: ASbGncvcUYArEoSokPPxNZWIWSwTLZ5L8fJpTyptR/bUU0lO9IYBSmxC9V8QXRcwAlR
 7dKL24UrMcF8CA/vSIkUKA4+k+25UC9CyICpvAEQpWO20VgQP7yfGcnJtK8Z5CJ4rSFDfD6CJUn
 Rv6TziVOUB4QBGIGo5KW+b1XFtaHWh56rxlqt7+J5xOhJlJKuqNVvc2fhclx34oFLL0mRHHq0PW
 eZVZ/IEs3EvzW0MzSXcMuvB41rUsZta/bKGhUUYRTilXcvOFgXDNjmYSeWUkKziCunl1HLbiwud
 +VVJw72aSjiJvQUMA89ktF+0/wswCsD9ONtPheWBNRO6EE4=
X-Google-Smtp-Source: AGHT+IE1AaZn04VsAmZoovvHskfFwwHs+/I0v2XJVpXr12XD+Jd8EH5sfL0xlHcxmhZL8x5QsccIOQ==
X-Received: by 2002:a17:90b:2f50:b0:2ee:fdf3:38ea with SMTP id
 98e67ed59e1d1-2f782d32c45mr47771107a91.23.1737926085217; 
 Sun, 26 Jan 2025 13:14:45 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb193e1sm5644337a91.42.2025.01.26.13.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:14:44 -0800 (PST)
Message-ID: <f7c1590d-5c61-4408-92c9-7241aed2c6be@linaro.org>
Date: Sun, 26 Jan 2025 13:14:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] cpus: Fix style in cpu-target.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Fix style on code we are going to modify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 6d8b7825746..a2999e7c3c0 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -47,12 +47,15 @@ static int cpu_common_post_load(void *opaque, int version_id)
>   {
>       CPUState *cpu = opaque;
>   
> -    /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
> -       version_id is increased. */
> +    /*
> +     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
> +     * version_id is increased.
> +     */
>       cpu->interrupt_request &= ~0x01;
>       tlb_flush(cpu);
>   
> -    /* loadvm has just updated the content of RAM, bypassing the
> +    /*
> +     * loadvm has just updated the content of RAM, bypassing the
>        * usual mechanisms that ensure we flush TBs for writes to
>        * memory we've translated code from. So we must flush all TBs,
>        * which will now be stale.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

