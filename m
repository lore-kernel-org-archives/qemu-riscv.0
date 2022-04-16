Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfmbP-0002xL-Ef
	for mharc-qemu-riscv@gnu.org; Sat, 16 Apr 2022 13:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nfmbM-0002ve-WC; Sat, 16 Apr 2022 13:52:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nfmbK-0007De-0H; Sat, 16 Apr 2022 13:52:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso6633475wml.5; 
 Sat, 16 Apr 2022 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rh7wu6SuBdKMEqLT4CtvggJiEYOfdM+h6YoISZ8ANO4=;
 b=qJjCyeWcGHOXZHksgcmSM5bnuIev7EQf6HyaDLhIxYyyZOei9bcKRe/ddso+nNmXcY
 oJtsD7N6CX1SS+69FkCbwf+MkU0O0mSvu9KXrpvDEWQJTAYnq1UUF/xYhKyr7jCK03vh
 AhReWm0f0qQYO7VXMVrapoNyVvOw+aKTSTh6pmTd19W/8IvQW38mDUQ5YDiH9unLls90
 fNhvn/DeYz0DjlKwK2p+RJo/NPpPKr2WiedBq3He0Yga3upazBZWPSSCkGa8FuBcfqsu
 F9CxDq/OXE5ZeqgHmYjMjXrMtZBroJzqhjDiyUOELV47opj/ENnIyxlz58PUm5gbBus2
 zcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rh7wu6SuBdKMEqLT4CtvggJiEYOfdM+h6YoISZ8ANO4=;
 b=jVT/5Y2KujYXjIjahVzq9rhefZfBUm0OM7xwVtq2jB7JgXSkhkZrmcZqNnnC0uMn75
 6Z1daQ2RnAnLcnceboscyXeqnaBCYLUiV9KfO4YVFsEHOSDhosaFOacSHLEsNYUwiL7h
 01ElHSFG7WvBXsGW4yjxBTtBq3HEjUG98grAWfo/0UHfa2Bdmk9iaVt5MgJNfJb5YfKI
 JuSStj7CIYEn0RU7EWsRq1fkG2DOQ+1Yh7mBD5fuP33k4xg2xGDD6pQ6kpADmWqrJLE8
 uQRUsiLxUaX/dEjYK5lJPVwctmeKDOJIl09h3Zp1XyR3Ss72NiwR8cESjGX0oKgRKxvt
 dEQw==
X-Gm-Message-State: AOAM533H5s/sUJ0/2ct2WLeAQmaNju3Hr3lGA9VA0Avuinky+sIzFHxi
 UfkLctVMhp7XUOTooPq5/0c=
X-Google-Smtp-Source: ABdhPJxodTFxR6dDYJTd1i/a05IB/z+PLB2fGRfJp5/+HkWl/aAHTIGvjLBpjU/7uDeO6m/RPEyBfA==
X-Received: by 2002:a05:600c:1d8a:b0:38e:d10d:1a89 with SMTP id
 p10-20020a05600c1d8a00b0038ed10d1a89mr8276028wms.5.1650131567465; 
 Sat, 16 Apr 2022 10:52:47 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:a0d5:a739:3557:2461?
 ([2600:70ff:f07f:0:a0d5:a739:3557:2461])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b00392910b276esm338652wmq.9.2022.04.16.10.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 10:52:46 -0700 (PDT)
Message-ID: <2ded9132-c2b5-c428-6554-98c71b50e8bb@gmail.com>
Date: Sat, 16 Apr 2022 19:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 02/18] hw/cpu/cpus: introduce _cpus_ device
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330125639.201937-3-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 16 Apr 2022 17:52:53 -0000

On 30/3/22 14:56, Damien Hedde wrote:
> This object will be a _cpu-cluster_ generalization and
> is meant to allow create cpus of the same type.
> 
> The main goal is that this object, on contrary to _cpu-cluster-_,
> can be used to dynamically create cpus: it does not rely on
> external code to populate the object with cpus.
> 
> Allowing the user to create a cpu cluster and each _cpu_
> separately would be hard because of the following reasons:
> + cpu reset need to be handled
> + instantiation and realize of cpu-cluster and the cpus
>    are interleaved
> + cpu cluster must contains only identical cpus and it seems
>    difficult to check that at runtime.
> Therefore we add a new type solving all this constraints.
> 
> _cpu-cluster_ will be updated to inherit from this class
> in following commits.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/cpu/cpus.h |  71 +++++++++++++++++++++++
>   hw/cpu/cpus.c         | 127 ++++++++++++++++++++++++++++++++++++++++++
>   hw/cpu/meson.build    |   2 +-
>   3 files changed, 199 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/cpu/cpus.h
>   create mode 100644 hw/cpu/cpus.c
> 
> diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
> new file mode 100644
> index 0000000000..c65f568ef8
> --- /dev/null
> +++ b/include/hw/cpu/cpus.h
> @@ -0,0 +1,71 @@
> +/*
> + * QEMU CPUs type
> + *
> + * Copyright (c) 2022 GreenSocs
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_CPU_CPUS_H
> +#define HW_CPU_CPUS_H
> +
> +#include "qemu/typedefs.h"
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +/*
> + * This object represent several CPUs which are all identical.

Typo "represents".

> + *
> + * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs in an
> + * Arm big.LITTLE system) they should be in different groups. If the CPUs do
> + * not have the same view of memory (for example the main CPU and a management
> + * controller processor) they should be in different groups.

This description calls for a clearer CpusGroupState name instead
of CpusState (which confuses me with CPUState). Alternatively
CpusArrayState.

> + *
> + * This is an abstract class, subclasses are supposed to be created on
> + * per-architecture basis to handle the specifics of the cpu architecture.
> + * Subclasses are meant to be user-creatable (for cold-plug).
> + */
> +
> +#define TYPE_CPUS "cpus"
> +OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
> +
> +/**
> + * CpusState:
> + * @cpu_type: The type of cpu.
> + * @topology.cpus: The number of cpus in this group.
> + *      Explicity put this field into a topology structure in
> + *      order to eventually update this smoothly with a full
> + *      CpuTopology structure in the future.
> + * @cpus: Array of pointer to cpu objects.
> + */
> +struct CpusState {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +
> +    /*< public >*/
> +    char *cpu_type;
> +    struct {
> +        uint16_t cpus;
> +    } topology;
> +    CPUState **cpus;
> +};

