Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pITSm-0002tl-3f
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 06:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITSl-0002tN-37
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 06:52:11 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITSi-0008Fj-45
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 06:52:10 -0500
Received: by mail-wr1-x429.google.com with SMTP id t5so1616374wrq.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/EXAhfnbsT5kAq+2ynIx5wkhU6EGV1+SBLzOXFS+PG4=;
 b=B1/KJAtQCcvexuZ25WEA/XaaKMCjVuuveAqZs7uLOc2nsgrC8de9/4dX6cJihp8UZG
 knW2yRLDKBGNTkfNIzPygZlFvo7p0DSBuyUNj9KMdrsS1aRU2H03MtYueQnHThsMrBKc
 fQ0q40Mu5I/vUNTA2pUKdyfkxDl3HDlQali3F7YI0Zixlaucrpu7qMJOASWY4jYCHPrI
 QE/HxbxKaL0CBMTTxHPcfO9siFff4j4a9JaMLXmwOpJxCrP0MSm7bugkZEIGBI+9yM3a
 nbhphmFuOG3yocxUn30jjlk6vIxWG02AwrK6JRVn4NLh+bMD5q3O8yEnOYqMhLXE01zM
 03zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/EXAhfnbsT5kAq+2ynIx5wkhU6EGV1+SBLzOXFS+PG4=;
 b=NO77eLzAWCm1Vx15U6fU5JEALiGiPHZEk+S5b6ierxHkvlAcd+Xnfx6IDd7vNwPi+N
 OP156mXHdRrlQHqU1jEIyjo/BdjRbxtTven+gwnNBQIQ/qW1qHtuuiF/DaJAgoiIV9s2
 UqysoCptihPEO27hmx8zcqCe6KXNoyBqfCjy73YcNBGFfvIm/TXow9sL/8d2flfD1xlw
 SFtAIlmnp0J9kv2+NLu9NDmMUYit58RGcDWiBcvMbGBJYUbao3TmnTjDr7VuRax0iwTL
 9rYN7dsPxsQI5pKUEjkd4YbuT6VjoUf8u/xZxuceGXS10yi+36Vn9NVAYBJ8xMIdSA6Z
 yyFg==
X-Gm-Message-State: AFqh2koKMLPlV9I9KQG0ObMjeVenJnSFtG+UMZ1wpNODIOWzYdIFIYQr
 P2o6qWq5sW/jcNZz/ivUgmq+aw==
X-Google-Smtp-Source: AMrXdXujkgrfoVRrlvZvgilPJl4+7Rn7cPrFPoypszrzxd+mKhPMfsak+tIWF40A16Bb6MbooNYQNQ==
X-Received: by 2002:a5d:4606:0:b0:2bd:e960:9855 with SMTP id
 t6-20020a5d4606000000b002bde9609855mr9276409wrq.18.1674129124978; 
 Thu, 19 Jan 2023 03:52:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v14-20020adff68e000000b002365730eae8sm33765775wrp.55.2023.01.19.03.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:52:04 -0800 (PST)
Message-ID: <fc965afb-5e58-bad3-429d-d77e866d9f18@linaro.org>
Date: Thu, 19 Jan 2023 12:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
 <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org>
 <873586u4yj.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <873586u4yj.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Thu, 19 Jan 2023 11:52:11 -0000

On 19/1/23 12:41, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 19/1/23 07:59, Markus Armbruster wrote:
>>> This commit was created with scripts/clean-includes.
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> [...]
> 
>> Up to here:
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> diff --git a/util/async-teardown.c b/util/async-teardown.c
>>> index 62bfce1b3c..62cdeb0f20 100644
>>> --- a/util/async-teardown.c
>>> +++ b/util/async-teardown.c
>>> @@ -10,16 +10,12 @@
>>>     * option) any later version.  See the COPYING file in the top-level directory.
>>>     *
>>>     */
>>> -#include <stdlib.h>
>>> -#include <stdio.h>
>>> -#include <sys/types.h>
>>> -#include <dirent.h>
>>> -#include <sys/prctl.h>
>>> -#include <signal.h>
>>> -#include <sched.h>
>>> -#include <unistd.h>
>>>   
>>>   #include "qemu/osdep.h"
>>> +#include <dirent.h>
>>> +#include <sys/prctl.h>
>>> +#include <sched.h>
>>> +
>>>    #include "qemu/async-teardown.h"
>>
>> This file has more changes.
> 
> I'm not sure I understand.
> 
> The patch does two related things:
> 
> 1. It puts qemu/osdep.h first.  The diff makes it look like we leave it
>     in place and move other stuff across, but that's the same.
> 
> 2. It deletes inclusions of headers qemu/osdep.h already includes:
> 
>      <stdlib.h>
>      <stdio.h>
>      <sys/types.h>
>      <signal.h>
>      <unistd.h>

Ah, the other files get this done in the "Drop duplicate #include" patch.

