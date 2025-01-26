Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DF1C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 19:56:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc8jb-0000jO-B6; Sun, 26 Jan 2025 14:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8jQ-0000h8-8X
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 14:55:45 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8jN-0002ni-N8
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 14:55:44 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso6573470a91.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 11:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737921339; x=1738526139; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
 b=bYOp3ovYJ9Gs76E6mAyXXKB+2kls+FKn/ga/Zzk/Dt78q4Jw5i3ZRZkZO2faJLVYng
 Mj+WdYaBCYwTt83GN68bIVZ4iupGH5IkK/FwtiwqdPgIXqum46WxJq5vbhsiSRy0PlMC
 4o7fHNcaSsVSfVp/7Zf4C+hT0P6jyXdTOkoQKwgZoWnGpltVBrcv4zkdPp+Y6bUqv0iV
 66WXLeuPPGTP3Rp+XeygrD+kUK/4S4lxABhVUfFWUMWQxTuUJGfi6dOiYg/fRw2oA+nY
 +q8GlMkG0mOV3QLh//n4MC9izaUupVkI9VjuBOSL0rxT58KMLFEU8FGIFBNmGSBE+o6c
 /UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737921339; x=1738526139;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
 b=FGn4lmQY6FKft64VvcK78GyVBEU1WvqR2C70oWRMP64KFR+WrltUrxphIYp24gDynT
 SLzS874zD5K+869bCx8mFv5FnTEq+cv/sjy0AHJc97FEyiwp+C8kBDBPMLG+wwOqEksd
 7oD+AIwPcjcvQZ9yp9onHGfIRQrz5UYVZRvXzF2QjoskbmwtESqsbS143PFDvknp1v5A
 erlGGt5nYB50PzrZlxz6UF0JWBGPNS+GmASewCEXnSMUBx7RE15clcAdfjY96ZOnRd15
 LvwmhBjgtcnW1LA92O91+RM2kKDoPc5ftNSNSl38eobddb01G5skJsXqJNBYM57NHlZ9
 IXLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa37+SzaWBVCNT21Bt5CvfGCgjikF56eAvzeJ3DDug2QSNMOF4+5PWFWyRxGgL1u6vrGEuI6q8GvKQ@nongnu.org
X-Gm-Message-State: AOJu0YxMV06qz+QcjHOUbYKnxbi2rZV7XL6039bTnsy864BMZ/Xp76FC
 8WtnGKQUm37OV/b6MtbvHCWKRbmD1e0KUZVxWt0iOb4eNLYffqoJw6NdzSpnKvs=
X-Gm-Gg: ASbGnctDCfP739HHY0QaNWFyDv1QetARCxFVRWLxuMkaCOst8Pr9oR1pHXOcsWP/rGp
 3kEq5OGcgLPQfIY/w/QtlZjKiq4f6RMMw6ZDKYrrDysmPfxszPx2bScuiEfgMVjiSSvnODbc08H
 FKnBF7N+FxcoHWGKQEy0X//YPhgxh811C9UQKaUIAOXMUUL747e8OlbB/WgWKcC948xEgwZwmkC
 Qnd7VT1GlmWJqA2YHFOPR83uPtuZtBW5YgotecGG2B480J2HnyZ7jwpWfR8Ut/QpfnOvv/I99Xt
 IBE0ZQlEv2+pM6z5Ib0VMvCbVgZyS5Vl0QVj1hMTR0NuzKVnZvhUj1Uj7w==
X-Google-Smtp-Source: AGHT+IHkPOqmTCjp5vaq/+XEVF4ezQ8MyiAJ8YKEj+eBpJYARUzB5sl2GUtr7fAvVdhnF62+x0fMUA==
X-Received: by 2002:a05:6a00:a09:b0:72d:80da:aff with SMTP id
 d2e1a72fcca58-72daf9c1dfcmr48758529b3a.9.1737921339455; 
 Sun, 26 Jan 2025 11:55:39 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a77c4ecsm5519455b3a.121.2025.01.26.11.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 11:55:38 -0800 (PST)
Message-ID: <ea6edd46-f1f6-40b0-bf89-c7f6f68bee87@linaro.org>
Date: Sun, 26 Jan 2025 11:55:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
> Keep common MMAP-related declarations in a single place.
> 
> Note, this disable ThreadSafetyAnalysis on Linux for:
> - mmap_fork_start()
> - mmap_fork_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   bsd-user/qemu.h        | 12 +-----------
>   include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
>   linux-user/user-mmap.h | 19 ++-----------------
>   3 files changed, 35 insertions(+), 28 deletions(-)
>   create mode 100644 include/user/mmap.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

