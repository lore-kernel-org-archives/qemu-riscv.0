Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pISLD-0004w6-8y
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 05:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISL9-0004us-7o
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:40:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISL4-00045f-Un
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:40:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so936149wmq.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 02:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JSodUzwkhQQuJwNuDcmK84gxFfK021RaXwCnvJRn6B0=;
 b=cdb+UyFRqc+eu5cbkpm9FolAYfW7QUorbn1XLcLW20bpWTOhMCiiN8qPhkVbeD1gMQ
 fHsP4/FhKwrcrqAXWEjOupH9iqUhWgawAsgkWzQzq+1sZMnaNi8BNO9lQ7L8jOMsppa7
 MAiFSyXDtjH1TLXuTwc+vl5Tm/wh6yj1YwJGVggtram6NU0qF5ZQcCXbzdZMN3OG7t8h
 NMz4haL8qI6FT+CouHpZ8Mc73s/3m0rwfT8RIZn8hxKEQrA2hrYIoLGFk3DgldoDvHvT
 4xKwgsfb3Jgvv44swzCDi7YoqJ1F1QIQGaFC1lYWtwLENizYTlz3K9LgsomawXwlieMR
 ID1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSodUzwkhQQuJwNuDcmK84gxFfK021RaXwCnvJRn6B0=;
 b=pz+A8/WBRPgDkVncDRHarR8Tdtvyh0jxRrpaOrt/Z4hIksOtXr5HwZ/9FAkSBQLsU2
 FXl1xkxTxl6vbisv2HMQ7acAB2ZLCdhgHJuPtOYtu2qrWZy4s2fXDJOMWcIccYpzg3JH
 HhVoGhgF3R2apa9erhLNQc7T81InW1Js2feIrnOGcJxLYRjnGTcw+UXZGjaXGr9mZkmX
 Kr9kFZUVuLKYNM97NMYAPZ8looUU5Z54A6y8cTQBXGRxAuw4TcqPTLirbfcFOZPwr5Am
 Ce4FQ/s4P+h3FMZnPnYKAI6zkmPxuILb04jDUgEsONphDQvZmDUXJzCKdhY+Wi/KoPES
 gQrw==
X-Gm-Message-State: AFqh2kpGzhz8+TWke2V2w29L29AxyAYIkDLIxDmV5mt6UmOLEe/hj6dY
 db0gV6XbnJBOSoCiiR/yO5NdJw==
X-Google-Smtp-Source: AMrXdXuv8QEVcWP9UQLnRnviP7/RgpNMTn04pBojnLP/KYu6tvuM6DZvSNxsODf9ts12NuoQbtSQbg==
X-Received: by 2002:a05:600c:5025:b0:3db:14dc:8cff with SMTP id
 n37-20020a05600c502500b003db14dc8cffmr4996081wmr.33.1674124809602; 
 Thu, 19 Jan 2023 02:40:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003daffc2ecdesm4289890wmk.13.2023.01.19.02.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:40:08 -0800 (PST)
Message-ID: <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org>
Date: Thu, 19 Jan 2023 11:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-17-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Thu, 19 Jan 2023 10:40:15 -0000

On 19/1/23 07:59, Markus Armbruster wrote:
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   audio/sndioaudio.c       |  2 +-
>   backends/hostmem-epc.c   |  2 +-
>   block/export/vduse-blk.c |  2 +-
>   hw/hyperv/syndbg.c       |  2 +-
>   util/async-teardown.c    | 12 ++++--------
>   5 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
> index 632b0e3825..3fde01fdbd 100644
> --- a/audio/sndioaudio.c
> +++ b/audio/sndioaudio.c
> @@ -14,9 +14,9 @@
>    * to recording, which is what guest systems expect.
>    */
>   
> +#include "qemu/osdep.h"
>   #include <poll.h>
>   #include <sndio.h>
> -#include "qemu/osdep.h"
>   #include "qemu/main-loop.h"
>   #include "audio.h"
>   #include "trace.h"
> diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
> index 037292d267..4e162d6789 100644
> --- a/backends/hostmem-epc.c
> +++ b/backends/hostmem-epc.c
> @@ -9,9 +9,9 @@
>    * This work is licensed under the terms of the GNU GPL, version 2 or later.
>    * See the COPYING file in the top-level directory.
>    */
> -#include <sys/ioctl.h>
>   
>   #include "qemu/osdep.h"
> +#include <sys/ioctl.h>
>   #include "qom/object_interfaces.h"
>   #include "qapi/error.h"
>   #include "sysemu/hostmem.h"
> diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> index 350d6fdaf0..f7ae44e3ce 100644
> --- a/block/export/vduse-blk.c
> +++ b/block/export/vduse-blk.c
> @@ -10,9 +10,9 @@
>    * later.  See the COPYING file in the top-level directory.
>    */
>   
> +#include "qemu/osdep.h"
>   #include <sys/eventfd.h>
>   
> -#include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "block/export.h"
>   #include "qemu/error-report.h"
> diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
> index 16d04cfdc6..94fe1b534b 100644
> --- a/hw/hyperv/syndbg.c
> +++ b/hw/hyperv/syndbg.c
> @@ -5,8 +5,8 @@
>    * See the COPYING file in the top-level directory.
>    */
>   
> -#include "qemu/ctype.h"
>   #include "qemu/osdep.h"
> +#include "qemu/ctype.h"
>   #include "qemu/error-report.h"
>   #include "qemu/main-loop.h"
>   #include "qemu/sockets.h"

Up to here:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> diff --git a/util/async-teardown.c b/util/async-teardown.c
> index 62bfce1b3c..62cdeb0f20 100644
> --- a/util/async-teardown.c
> +++ b/util/async-teardown.c
> @@ -10,16 +10,12 @@
>    * option) any later version.  See the COPYING file in the top-level directory.
>    *
>    */
> -#include <stdlib.h>
> -#include <stdio.h>
> -#include <sys/types.h>
> -#include <dirent.h>
> -#include <sys/prctl.h>
> -#include <signal.h>
> -#include <sched.h>
> -#include <unistd.h>
>   
>   #include "qemu/osdep.h"
> +#include <dirent.h>
> +#include <sys/prctl.h>
> +#include <sched.h>
> +
>   #include "qemu/async-teardown.h"

This file has more changes.

