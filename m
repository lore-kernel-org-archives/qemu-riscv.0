Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9F5C0218F
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 20:02:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc8pE-0004yI-Ce; Sun, 26 Jan 2025 15:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8nx-0003Ww-7k
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:00:26 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8nv-0003Yk-NP
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:00:24 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-216395e151bso47381565ad.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 12:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737921622; x=1738526422; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
 b=OcE3bwx/vx4RyLJY0EdGPjrB64rKNR80VhhcqWOAM9X3CVqJ/ARvSj9Z0puv7SEHYm
 gaR8jpq2vxo9EDP7mmyvdpq5m0wISjMPNLxUXB+cglmnaU0yPa5yrUsTSxoD+eOMK+XH
 uRjv7l/KH9Ym9l2FRk4+zypCn60prK6xlyr+k/4JiST9cO9GW6dmojILijYa/egsq2ow
 GVdSv8me0GR8HmTjAq0OZq+y7//v7zIIHcOM0xIL8mscZUUIWqqS7PJUG4GS6263Ing4
 geZw5+UILhKD9+rpI8HD5BNHlAtAoyqWeT9GcEVVHPaozW+Iv+15FAL9hlXiFLoYNYHg
 1RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737921622; x=1738526422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
 b=DqItaWMF2zBnOliKBDMepfDg4PjvvuQvjyZJQPaTo3n6q+ScIPVydlW4uhPzXa2Orw
 4n+OnhuH5U+rr/HqvDtxLF6izxoLU2fnpyh7r11D5f53UxGQ0Imb2MmkAjskBQvrFv+1
 J6poUpl0fti/MX0izXI/m+eK5tb1VLfoqjI4WQOC+lPXVtO1JmFeoklnllMQ69HrVlhJ
 7AmGL3F8dHB5uKqFnGWeygJYcphQT9ifPY9tpAryrg7O0oNp1Dt2oXzon/A4eOQVlqBb
 Td4OnXOp/QNI3u6m0uMTb1Gxwm15UIJMuzdb7hImykiK99qYXSaNY1Qy00KzXU0eGqVr
 kdVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBshpw42IPqKv/C9UaKYtvDZTIl9cQCGe8ljxN+tzOybDscIVrFORIpTBroMcVEeED/KDVaTdrUv13@nongnu.org
X-Gm-Message-State: AOJu0Yz1gk/+ktmD8ZUVt56xj0UpfvB2shbE0V95y30y6ZxJLOhEW/aP
 +Uzzvhon4MjUpPyYfHXxeFBRmEYz5lsNEi8xn6JqbrNSpmZciFg1qX8wWGvd8Wc=
X-Gm-Gg: ASbGncuME/7NgE+qKIU3z0YCp811hbNDrOmN51QSAD42gRkvfg7gHTukEkA3zv9T9F6
 8LI8Y6z3IlHrJtAdLpym6m6p/oIVH608ChxEaajdHEAPbPpIjsfkDEqAi3OuVgMHSy5v/RWApRU
 q4G7Ga98heu5nYVtL+5xtvS0Nhblif2YbgsECu61a05X7U4dlfqQy3691vUtg0z5RnuSJVhZOQB
 AnZNA5b2R2C6FC9w7nvJgybPN2AApafKbztWsinLTOh+X5htSoAhtFneAyk190qi6JWokfOif/a
 EcIjXUEvvWeTKL2yr5AJhLF7urEGeMKoxvy1KY617n51SRA=
X-Google-Smtp-Source: AGHT+IFeEZa5nVv+mtwIu6A9hZNGU86wznbWhD1KnBdApuLwR5PvKTBdXCajk9Qtynkb/fqX/bwRng==
X-Received: by 2002:a17:903:124b:b0:215:98e7:9b1 with SMTP id
 d9443c01a7336-21d993177a2mr227130405ad.5.1737921622320; 
 Sun, 26 Jan 2025 12:00:22 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9e083sm49207555ad.25.2025.01.26.12.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:00:21 -0800 (PST)
Message-ID: <bb022c56-2ec9-4e76-9bc6-efe2f7272806@linaro.org>
Date: Sun, 26 Jan 2025 12:00:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] accel/kvm: Remove unused 'system/cpus.h' header in
 kvm-cpus.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
> Missed in commit b86f59c7155 ("accel: replace struct CpusAccel
> with AccelOpsClass") which removed the single CpusAccel use.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/kvm/kvm-cpus.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> index b5435286e42..688511151c8 100644
> --- a/accel/kvm/kvm-cpus.h
> +++ b/accel/kvm/kvm-cpus.h
> @@ -10,8 +10,6 @@
>   #ifndef KVM_CPUS_H
>   #define KVM_CPUS_H
>   
> -#include "system/cpus.h"
> -
>   int kvm_init_vcpu(CPUState *cpu, Error **errp);
>   int kvm_cpu_exec(CPUState *cpu);
>   void kvm_destroy_vcpu(CPUState *cpu);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

