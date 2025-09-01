Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216E1CA0FF0
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 17:04:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ut7wt-0001hK-UZ; Mon, 01 Sep 2025 13:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7wn-0001gM-RG
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 13:04:02 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7wm-0006uI-Bg
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 13:04:01 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d6051aeafso38580107b3.2
 for <qemu-riscv@nongnu.org>; Mon, 01 Sep 2025 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756746238; x=1757351038; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s8i6D5jkAUDyThSuzViGDH9PwKhirlJq1D1dtTZbZSI=;
 b=Bh6FqKBeRmivtWFm4LubbRmx6ROYPev/SQVLkCOSkDarxOr9lxAwMk/RycwJ9RYr5b
 o5Reg0SIUVb1T08SAjCQnql9zerZdbECETnPlb4xf5+5ItcaVMrRwj/Sa5yUPMRQIp8/
 PFLv+8UjIQrulzb9gwboNI9CMbgrbTHbfKNUj8lCvHHPffZTvVwwLt3/08MKsgsR6lqd
 blxV84+XU2WLpRiu1oxQzU5858fi7Vpfggg0iwr08eIC4euh2Bpqr8e5ugx9u+u/NWhB
 qXbAHClxGEsKQTmynDaUK0ThrC1gXQHcZ45mRXm9rQevDzbrpoaU67GWnRJIMtPmS4/Y
 MZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756746238; x=1757351038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s8i6D5jkAUDyThSuzViGDH9PwKhirlJq1D1dtTZbZSI=;
 b=jweQkQpeym+ZhHzVoLE1aav4ohOQbDbvT7D+vzYuuu1v9r79ZDwle/jB5JCzrH8k1/
 KF4LWtFjlkA3JJorfquFajNcphhi9QYVjbo828gs+2d/KY7QHA34+QAKIPHDpdpfOypN
 KheMewjzBdHzRd3oxDxW7Z352Tpr0b9TzXHiuSjuLq7x9lxnvIdTDHagLDMEcnqGZa5j
 8U4n08mlYSy2BPTy7Dx66TJ+vwd6pdDYPwhlQi5uLGUDuqlhc7kkoB0fOXu9dNBsQaE/
 AFEaammNFx1ouOoKoG2dUVvjLJ3S4N9TWZoTefnUN6MEX2fvCL7249ulKWpSHvjzEIIn
 ygNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHpjc2ANhkoJJPATbdUIBrui/b/TNsIvRXlvQeUkvukZbiyzmaEuzwPfUolNa7FCQPiQadz7iFyU1f@nongnu.org
X-Gm-Message-State: AOJu0YxiuTMzM/RZlV/uDdfbfEpPVuwpuan3trwrJe2s4roDp0R7ckwI
 3WDIJ6UPLLPdjnUxhz0AgcpttXXVlMzUBFZ1wkD9jQgQNjvIflORl605kHvGV0GflXk8q3lQZ/0
 5dURgHoJSR1AnWKhj8tPTc7YCPs9WIglrD6Aube2VoA==
X-Gm-Gg: ASbGncuD32twd7FUKDBMJbYUoSpO7TU7u4a1dDDhgz+fk//IFb/FTOFe0gXttgHbuMF
 EkYJ+MNd+QKvgEaAW5UTvcGJ1XH5Qlq9XJ22MhMOeaMX+zl3gpbpDRyhsFY9C5vxfCipKrnHqDd
 egxuPQTxj9ePjQtc4edTU2C/DlwHXKupf5w0b5N0dPG1Mx/pqWSii5ix+Suqpi5i7vGgSYwwBVU
 MvuDuu/
X-Google-Smtp-Source: AGHT+IHnqnDvMl20p1XdCy/6NlPhO8udKqWBZ37/pVmHfoBv8D4Av3q7gGUUgjzxo2rIeIGZZFGkCaa/cVhKbzxlmNA=
X-Received: by 2002:a05:690c:9985:b0:71f:b624:322e with SMTP id
 00721157ae682-722764af341mr104788327b3.26.1756746232816; Mon, 01 Sep 2025
 10:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-9-cjchen@igel.co.jp>
In-Reply-To: <20250822092410.25833-9-cjchen@igel.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Sep 2025 18:03:41 +0100
X-Gm-Features: Ac12FXx5i4R9R1zWKUOD0YRdUrFqyEPkAA1Wf4Ok6RoZdovbeM5ESEnmpbbH1sU
Message-ID: <CAFEAcA9FAnnQrAf1eUPr1=FQ+=Wbu13gyfj3T3z+k6BhxHj6uQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 8/9] hw/misc: add test device for memory access
To: CJ Chen <cjchen@igel.co.jp>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Tomoyuki Hirose <hrstmyk811m@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Fri, 22 Aug 2025 at 10:25, CJ Chen <cjchen@igel.co.jp> wrote:
>
> From: Tomoyuki Hirose <hrstmyk811m@gmail.com>
>
> This commit adds a test device for checking memory access. The test
> device generates memory regions that covers all the legal parameter
> patterns. With this device, we can check the handling of
> reading/writing the MemoryRegion is correct.
>
> Co-developed-by: CJ Chen <cjchen@igel.co.jp>
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Tested-by: CJ Chen <cjchen@igel.co.jp>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v2:
>    - Fix the typo of ops size of big-l-valid.
>    - Replaced the huge macro blocks with dynamic loops that fill in
>      the `MemoryRegionOps` arrays at runtime.
>    - Remove test cases valid.unaligned = false,impl.unaligned = true.


> diff --git a/include/hw/misc/memaccess-testdev.h b/include/hw/misc/memaccess-testdev.h
> new file mode 100644
> index 0000000000..c1b17297a2
> --- /dev/null
> +++ b/include/hw/misc/memaccess-testdev.h
> @@ -0,0 +1,104 @@
> +/*
> + * QEMU memory access test device header
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Author: Tomoyuki HIROSE <hrstmyk811m@gmail.com>
> + */
> +
> +#ifndef HW_MISC_MEMACCESS_TESTDEV_H
> +#define HW_MISC_MEMACCESS_TESTDEV_H
> +
> +#include "system/memory.h"
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_MEM_ACCESS_TEST_DEV "memaccess-testdev"

Could we have a comment in this header file that documents
what interface the test device presents to tests, please?
Both this patch and the test-case patch are hard to
review, because I don't know what the test device is
trying to do or what the test code is able to assume
about the test device.

thanks
-- PMM

