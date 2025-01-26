Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C71C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 21:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc9x6-0000Ib-PT; Sun, 26 Jan 2025 16:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9x5-0000HJ-Az
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:13:55 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9x3-0007cy-Gy
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:13:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-216401de828so65928485ad.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 13:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737926031; x=1738530831; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
 b=zdBYWagp9hSeDHJac3Tylk/CZ0NJAHrYYQmgphgN5UOt7kzvEdhqKUHjDFAbKSpe+f
 zFv+4Nehw2N8HsWfYDTrUTO+w7Ae4ORgPj02f6zgJin6yfzUqiOIwmb9CepmfdZ2hOQq
 1KMYYbLkDwOIMwqJfoI/TRTd22QZ0GsF2qyxvi3Z0oXjP/kpwT4TQQHmfdVABCyRsjYg
 SOAM3/G9HPxKEYixhQfmxJq65pn9Z1TXMX2eHXvDtHTbgcSpZpqnMGOyu22yZQ45yHCE
 U9RgaKT/BvZ6pX6TYBQcrcGb/6zBiZlkwUorYO4YjyFxXBESZJls1MLY8hlrgxg2w7Cg
 sHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737926031; x=1738530831;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
 b=mokjkIG5tGdNWN12GgexDpMZM8O7N3oCdif4rQnDbddK8oahNaXE6Jz3FHiYU3kpfj
 TgkBxOYxVXEWt7tg9dSKWephdNlhfsH+SFx5CkzHzgpgryL2bYjiFdh3mwy/mygHrPAx
 WX6Hi+n7B535Z3EPecgHprZKmAEE0IuLnQFH+H9dZ9y/q0poCEJfUjVHo8vpAFThyoaE
 miSD797m9HIirhRz3K2VfYEMare7m5Vh3gIgT16rETeP4Etj3C5e9iMsQjIA5+s9bipC
 FSbCGioGiElPvCo3xcpnlBlWyYKXAGOfWYkZv8vlTK++d8buvK42ByfqbWOHMMLtwSWC
 XRXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFzq06vHTvgwXZDqV97yvVXE47SV9w96WFq4Epgr9yPr5iCa71QxBbGfzAwrSjQA93Qo5FCwCQENZt@nongnu.org
X-Gm-Message-State: AOJu0YzfKqGtp/VunMX8IhekfMUNaKJfFgucWUkqe0NTjsbDPfSKf0JP
 Te9K4DdaBolflDMnaJEI6CgEbkfMbBNxaAXsT1h4QSLXhpiGxmkrRb84dvEePyk=
X-Gm-Gg: ASbGncuz+L0epm2L+ZLNvGYzL9boWNxEiRa5aqHNEVt8eY1zVIRp9VaCZWo1KSm4GPE
 kXMPhF3ME58a+m8N4hAQ2lk0T+hIn14LOb/keA0UuVfeBtkR3vR/+CvWlvka52Kua2GYeF/Xqw7
 YAVi0p+SKM4CKqBB8iD9/qmVzHV7Lrzu1DHPUW89bbOZiq83k7OT1Ks/19qV24VSxf/t7X+IMEq
 0sx8djk0jVanKGhkobrc5LDUdIgIckG0Y1hnJCAXVISVW4ElAKF3+CQ04pSOPIXmq5zyjnSnf1F
 gm9jIilYsTzrc9pM6XsjEch24d+eRA0BJEBr+54b5G/GmZE=
X-Google-Smtp-Source: AGHT+IEZs0zeKB5IzyrVqsgjZQ8Qgr6yuUndfoZR9xIIrSSkISsRSLWzsvON9msLe4CFxT+Ly8wqnw==
X-Received: by 2002:a17:902:f551:b0:215:431f:268a with SMTP id
 d9443c01a7336-21c3556016amr565306785ad.31.1737926031507; 
 Sun, 26 Jan 2025 13:13:51 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea3bb9sm50157355ad.92.2025.01.26.13.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:13:51 -0800 (PST)
Message-ID: <c844b086-b3fd-438d-a4ce-6571094e5e14@linaro.org>
Date: Sun, 26 Jan 2025 13:13:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] accel/tcg: Move cpu_memory_rw_debug() user
 implementation to user-exec.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
> cpu_memory_rw_debug() system implementation is defined in
> system/physmem.c. Move the user one to accel/tcg/user-exec.c
> to simplify cpu-target.c maintenance.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/user-exec.c |  92 +++++++++++++++++++++++++++++++++++++
>   cpu-target.c          | 102 +-----------------------------------------
>   2 files changed, 94 insertions(+), 100 deletions(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index c4454100ad7..e7e99a46087 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -19,6 +19,8 @@
>   #include "qemu/osdep.h"
>   #include "accel/tcg/cpu-ops.h"
>   #include "disas/disas.h"
> +#include "exec/vaddr.h"
> +#include "exec/tswap.h"
>   #include "exec/exec-all.h"
>   #include "tcg/tcg.h"
>   #include "qemu/bitops.h"
> @@ -35,6 +37,7 @@
>   #include "internal-common.h"
>   #include "internal-target.h"
>   #include "tb-internal.h"
> +#include "qemu.h"

What is required from *-user/qemu.h?
We really should not be including that in accel/tcg/.

> +            if (flags & PAGE_WRITE) {
> +                /* XXX: this code should not depend on lock_user */
> +                p = lock_user(VERIFY_WRITE, addr, l, 0);

Ah, here it is, complete with comment.

Indeed, I don't think lock_user is required at all.  page_get_flags() and g2h() are 
sufficient.

> +                mmap_lock();
> +                tb_invalidate_phys_range(addr, addr + l - 1);
> +                written = pwrite(fd, buf, l,
> +                                 (off_t)(uintptr_t)g2h_untagged(addr));
> +                mmap_unlock();

We probably want to own mmap_lock for the entire function.


r~

