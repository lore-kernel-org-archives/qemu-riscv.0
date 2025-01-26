Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D424CC0218F
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 20:35:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc9LI-0002cS-CZ; Sun, 26 Jan 2025 15:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9L4-0002ZB-Jt
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:34:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9L2-00011R-Pp
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:34:38 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ef714374c0so5750050a91.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 12:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737923666; x=1738528466; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
 b=IyvYzXDWglqc2TDOlIfdERC6BgdriQ8JCKYJTBLWun3F9TCTgSfxWb3NVtzrfI4wBJ
 hooROt7D/k/NyHzUIRvjxeQoTPGE3a1PHXu5/K54RM5iTuh4BPGEdMHZ8aycNVg8j5en
 oXalHdsFjhisKhBd9VX84pyuw6gOegqwHCmTAtzZTYBdtBYryLQM4FVNZsXZChRpmnmM
 pUHKGtt+UxgZINaiHoIMQIh4D/rJCqAo4gShYQx7p8kuWuuzwq8l4RjSPuu/tQFY4eOi
 jsXecPVxZKMoVhnJLd6x2tQewxZ/Eaa+9sUtlPJfa9dLbfYzS2tL9yqSRMif10yuB0Ph
 WAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737923666; x=1738528466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
 b=FeC4bEkaGw6k9P3M5tp3kmfWewKJs8Fm2LG3l/JF80Y4kjK1Ey6MsTSh46xWX5qbnj
 TIrlCKKnDNh2G3Umhxc73Lpfq3C3lKeqWgwIUiJLwLaRUBieqT4hxZyHukAAwbUhkcrZ
 khhy1vuFpYSzkBgqCn8Sfx60hxK0rC/QwdTSqKA3WLIVzwOrdU+Q/7Wfqs0ueDAkQoVP
 o/FIP0RaK57boAZXg2Q7pRwkWd1wW8w/lliz4PmZpEmQPkyd6k1jxFtiLxO2AlyQGjwr
 KQtdnvKeHH8VqnlfJDVX6j6y7exQ9poR5atHzdKzAdfIdRuH7iOixZFJaeiWP0nk8VfR
 jmew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqYQ+iz3QFatPj2RP7CsVuG3lBuQaAjuPziM6j52Vlg61yc3MljLc/Ch6mCpsRIHuEe37/LqeoKKV/@nongnu.org
X-Gm-Message-State: AOJu0YzVPHKANwr+/UnHzgBX/vP2mNuDs8wVg71n1pxCQSXfZTg8uCvi
 4xnE5vmEIgizqTnr9Eln2gbADtbmDC57kvaz9zl5eiDmyUw/Eemr/qmFz9hHOJU=
X-Gm-Gg: ASbGnculzAR/CQBVFevcdXFPjmRJ7W1rYyjEQh7wNBz/XTPx4dNP7XL/irN0nVgAuv+
 PsCgXI5C1eY+rinVjsOhtW7+CjnYXIcc9ZCUoPmmnVXVgaciC+REKKaqY92xQ8wYGpGzTYSVMdQ
 SOj7extfqdgGOm/8hjOAVZ28nua5uGLr3nGEaIioP/i/TWE6qX/c213tBj2CyVekonvlr54SgkC
 TdIiwoCTc4IuxetJKIwC6YXYI1O8X/LorL8LWiQ7cEDVfbDy3AKEzQTDo/u6YAzPQ7TeXemys6f
 /4UMxFU85b7YsZoMk84PTGrVYReR4GNi2ygP5I/qrkKHEs8=
X-Google-Smtp-Source: AGHT+IEnuvCpks4R8m2CWUAxXqy7OUK3I7qmzF32T6Ls9afPXbIvlOOo7wFmoCIeuE1afURwxObJ8g==
X-Received: by 2002:a17:90b:5488:b0:2ee:7e53:bfae with SMTP id
 98e67ed59e1d1-2f7f177c6b3mr23097382a91.10.1737923666307; 
 Sun, 26 Jan 2025 12:34:26 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffaf8b27sm5519409a91.37.2025.01.26.12.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:34:25 -0800 (PST)
Message-ID: <2641e9da-db13-490e-9bae-64ecde1f9352@linaro.org>
Date: Sun, 26 Jan 2025 12:34:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] accel/tcg: Restrict 'icount_align_option' global to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
> Since commit 740b1759734 ("cpu-timers, icount: new modules")
> we don't need to expose icount_align_option to all the
> system code, we can restrict it to TCG. Since it is used as
> a boolean, declare it as 'bool' type.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal-common.h | 2 ++
>   include/system/cpus.h       | 2 --
>   accel/tcg/icount-common.c   | 2 ++
>   system/globals.c            | 1 -
>   4 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

