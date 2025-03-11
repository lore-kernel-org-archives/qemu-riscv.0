Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67739C28B2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:26:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tru0W-0001Yn-Vy; Tue, 11 Mar 2025 03:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tru0U-0001XW-4l
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:26:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tru0N-0007bj-9z
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:26:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so2494226f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741677980; x=1742282780; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WBH8un9SN3jvdF5o16jBTUcJYgDHmjsu0gBD/ioH79g=;
 b=qqtGxbA9z6XQ9J3lLtHNZz/rMKS9cEE68CBPNtJpq15MTZM9pyCnBwyuerc4jI/2Cj
 to+uab5c/g449cxEP3Yw+lJDv9IU0w4ipTBEGjtZLrYVs4bIOVmfvQK7+81MWe00fMso
 G/RQaGaEk86ibJfGdY3VXWZqAEvPbUXHUljyOko8ByB/jj2iFVgjZkhStkAaTlfg7Onf
 jArJN7hqFcuCm5eDcc5mdasS8hv/s2lcQ6/vr6bD5RFhg/EVNdcwTOLDLlxVExDuCJhA
 NLe3gH7ZxiGWYpefbywdth6omtvBVuTrXZt74m6XRC3jjc1tLvBw41+mJalhB4gPdHLb
 Ea4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741677980; x=1742282780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WBH8un9SN3jvdF5o16jBTUcJYgDHmjsu0gBD/ioH79g=;
 b=q9H4kK0UsSHUFCS59DBVt46jcNJSw0w8zgftl65ix2WAP1SUI2YzwY1VgXNUDaodcA
 oncWfpLCupOlFYV4OBFwPMUmFhnShTUQ1otmlXsGVhk5jZ0BJ34vi/0G8Ncv6cz6oPRt
 FxkZQ1KfoifKGlOTGGMhwFWMH/4Gw0YrJKbPpz16d8lDjAU1Zj3iWAp0bCN7bJOgBNZm
 VEZK88yieyvHMdhLD4pyy9sxavIDILD25Fj3Hzdff6lUXQP+7tX7jKXbjr4ozoO1t+Ov
 +iBy6IsT5bZldyY9T1PBQ7e4HJem3xnz1yqcmatJud0/bWOUhl69vVD+q136yUGZmavK
 rtzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiqLWd+G+JJNIIxfQi0bEDDUn+XGUFHKzcQLcYqn2t4zdrmM/jsimK1c/nKKfcn0Xsz57b4mFM3BnU@nongnu.org
X-Gm-Message-State: AOJu0Ywv9VS1wg0nKyhgKWDQjAX4Av2c23pzDOVKxCzh8Whk1HJ9Aumc
 3K3cjHMoMrrUupHWuz17F+dp9hVcY8sxaIiY4DUu3+slLNQ9DhjXsEtSxpNkVOI=
X-Gm-Gg: ASbGncuVyRrgnxB8Dhw/1sMvFrtaNcalmEfNy0GLGNk+N4HHrdhYEiZio8Cv3JhdXUR
 zrqqliNgPWrWPt+gtSnizsrf9GEX0MPkmrRRlZMPjXi7RkoxpQgNxP8DWZyR5LICUkbaB+9j5JB
 mlBM8XwI3UlyoQhzZQK10IU81z8Nn7C/nEWTfHJfLlK4Tnwhzm5M6BlrXgwT2Wy4oSORNl635Su
 1T+FEplGJPfr7UoFqr5qSfYa7OEsz078wT4i5uIK2rSQXIH8pFuqE+3DJfcoxJP5p1u6Z0gb5zQ
 Dezc+8+7VQGwMRpgmpco4OWazCGwGcrXKtod1GpbyMGwH2I2MnQX1UjrcbQP3iZue8/ypvS1G/Q
 U32VUWK7kt1RO
X-Google-Smtp-Source: AGHT+IGFEKvevhRYU5jwIA+OF5lD7GqYNAbzux+l1q3TxUHSloakvK6wXKgncMmFM2y1SaO/Ty9ZZA==
X-Received: by 2002:a05:6000:440e:b0:391:39bd:a381 with SMTP id
 ffacd0b85a97d-3926487d48bmr2239834f8f.30.1741677979924; 
 Tue, 11 Mar 2025 00:26:19 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8b0548sm176538855e9.6.2025.03.11.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:26:19 -0700 (PDT)
Message-ID: <f0c7b0ff-a43a-4203-aba1-2e06a462771e@linaro.org>
Date: Tue, 11 Mar 2025 08:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] exec/exec-all: remove dependency on cpu.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 11/3/25 05:08, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Missing the "why" justification we couldn't do that before.

> ---
>   include/exec/exec-all.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index dd5c40f2233..19b0eda44a7 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -20,7 +20,6 @@
>   #ifndef EXEC_ALL_H
>   #define EXEC_ALL_H
>   
> -#include "cpu.h"
>   #if defined(CONFIG_USER_ONLY)
>   #include "exec/cpu_ldst.h"
>   #endif


