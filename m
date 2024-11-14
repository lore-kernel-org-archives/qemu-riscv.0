Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E2D637D5
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:19:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBOUO-0006Mw-Ou; Wed, 13 Nov 2024 20:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOUM-0006Kt-Qo
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:17:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOUL-0003H4-7a
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:17:38 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so954205e9.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731547055; x=1732151855; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u3uSBRj3NjQFOQXu1E+xnMnaxOkusZRMjmX2g75QHhc=;
 b=E59ozgikRVAmdKSLsfhe0qaWC3Wvo9BH967dj+wRO8rlqnKH3BdTn+D6RE1oYmFsho
 4+bqQdo2HSHewCHgoDEgYSRyIbTYeEeGKrs4AFt2lAThkbNhkIxKbsvwqCSoaec1i0xT
 DsKh2Fz76XVV108nQRengk9LYIRBFrv6bP6xd8oULR2pAv+c9BguJlBmtOwndhD2lriO
 2ZhjY/8C40ITlhAqhfNnDd5vsB17mGC6E5cN9nT5X+DEz4nAnbfz++UetIYHOl5KMSc/
 qNQjOYiKqY5Zj2xjdrsnGBNXlL6JuIA0hQllpDUVPq/6Al9Gu5MiJFxXPkPSZAeawwM3
 bwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731547055; x=1732151855;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u3uSBRj3NjQFOQXu1E+xnMnaxOkusZRMjmX2g75QHhc=;
 b=JRVg0RNPyjcdmPm3IfmnH58UED7N7udl4rEalA8hHFdjIUb+ya7Fuq2k7Db4hcWjJs
 9OJhCJ4vgfIlmARRAn6fIj+ncvySlJ0t+vr2JREqvUpdCuN1bZf1UCQo7D78lQ9aE+rI
 pepqcJ41L+ShpiUTVHhI+7xAzv6mGoctz/bmz5TRU3st5fHFTy4T0Up0OOe8fc0lO+sO
 gGn3B+4qxTkbK05279Jg96Gurt7fnXPsAt2KL+Vkc4CUA5W4pNK3uCXA1xtNjvvUPAKe
 1he8ogIbBdXSzfdBAh+fdNbUTNrpZp4JxVxw2IycqoGe9GEKe40MhtVwCt99YCbNjnEO
 icpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyEkDe01/Phs25C7oh59N6fNvSPNywKUB4JqtU/hut6C/hKSQfkByYoO5QCyUfT4504Xm51o5hlA7f@nongnu.org
X-Gm-Message-State: AOJu0YwQKmLqvhusd5bL2GHDI0aMe+vurtAob0c3jvi38cM6F8FUpMdn
 MXJ9DnL69lrjJTPEhX3MGAiwjfPQAbSVDkQtmGLam2HmzY9IZ0oPMcvdrzQOMsc=
X-Google-Smtp-Source: AGHT+IE+cc6HJ3dgm5075H6eDzH6RJj2mGnuwlfaEBLP01j9ZnW1Z2AY2ich2HKhG+Hgy0Xx93oFZg==
X-Received: by 2002:a05:600c:4e14:b0:431:60ec:7a96 with SMTP id
 5b1f17b1804b1-432d4ad33ffmr43842555e9.25.1731547055220; 
 Wed, 13 Nov 2024 17:17:35 -0800 (PST)
Received: from [192.168.69.126] ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da298c97sm4715215e9.40.2024.11.13.17.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 17:17:34 -0800 (PST)
Message-ID: <05f475fb-e52c-4f8a-a4cb-7cc9ea76229a@linaro.org>
Date: Thu, 14 Nov 2024 02:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] exec: Extract CPU physical memory API to
 'sysemu/physmem-target.h'
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-22-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241114011310.3615-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/11/24 01:13, Philippe Mathieu-Daudé wrote:
> In order to keep "exec/ram_addr.h" focused on (target
> agnostic) methods related to the ram_addr_t type, move
> all (target specific) CPU physical memory API to a new
> "sysemu/physmem-target.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                       |   1 +
>   include/exec/ram_addr.h           | 483 +---------------------------
>   include/sysemu/physmem-target.h   | 506 ++++++++++++++++++++++++++++++

...

> diff --git a/include/sysemu/physmem-target.h b/include/sysemu/physmem-target.h
> new file mode 100644
> index 0000000000..b30c42da60
> --- /dev/null
> +++ b/include/sysemu/physmem-target.h
> @@ -0,0 +1,506 @@
> +/*
> + * Declarations for cpu physical memory functions
> + *
> + * Copyright 2011 Red Hat, Inc. and/or its affiliates
> + *
> + * Authors:
> + *  Avi Kivity <avi@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +/*
> + * This header is for use by exec.c and memory.c ONLY.  Do not include it.
> + * The functions declared here will be removed soon.
> + */
> +
> +#ifndef RAM_ADDR_TARGET_H
> +#define RAM_ADDR_TARGET_H

PHYSMEM_TARGET_H.

> +
> +#include "cpu.h"
> +#include "sysemu/xen.h"
> +#include "sysemu/tcg.h"
> +#include "exec/cputlb.h"
> +#include "exec/ram_addr.h"
> +#include "exec/ramlist.h"
> +#include "exec/ramblock.h"
> +#include "qemu/rcu.h"


