Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl05u-00069Q-FH
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 00:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl05t-00068F-A9
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:22:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl05q-0005Zt-Un
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:22:29 -0400
Received: by mail-pj1-x1033.google.com with SMTP id w11so334015pjh.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3XA7xu7b05KgVtUtSLaFSgkNI9Huml9S1qbjZOV/CIM=;
 b=A7AGaQS8AbhPZNUGaFRYZb7iEGObdhqjJ974H7//mCKlXrIg4OfqiRIcLdRBxjVvsQ
 V/PC2nHH1tjANBFhCUrhQphDxJsayHejY59urWvCAzvJULXR7k2rEBd4LLApbpSfcffa
 M3c8+w30vxLQcPAz2mYTDSlVm5EuIAOQV2SEJU5gewelFxp3kgxbnIcS+41B4xxkDx4R
 g6khRJK4GaDk3S7SHTMoQGcWpUBhe5Y+EWVjJPyhfHZe5J7lTuORb5onupkUjGObjLqU
 Ydr4smfjNYVBosDNqTGxlP67sc/c/W3g72Uh9CQKwIFlkUDjDKwKP/m2crmREuyCZFk/
 nkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3XA7xu7b05KgVtUtSLaFSgkNI9Huml9S1qbjZOV/CIM=;
 b=AWwtWhh5YYyR5No444JZ8DlixdxLCjdGIPnDBeBlrXL5icU/M51Nr1LW9j+cxDX/Xt
 rcB48hsLzyfnLs64/pHkHVdTIHaiRXQPwQgpm21DHIXXvvzVauV3qkqtFmNVT6SSUuOY
 GRsuzOhTgxyI5a0GzPnzWDu0IDL0Zuf+bTYhJerSpfcKiJC/gD9dS9EzjA0uSOLtRFsG
 +P83rxBS/rbcfV7DnbL6QXtOStk5PMv1DdkTnOq8wa2ncJau2T+MoZmw4r/KVWXI2tWO
 mBpfCtbXCsxEjYWumHZfuJi62wyBM8ThW3dySanXCbK+hTVNlEZUkpk2P79IQVSW32un
 VQEw==
X-Gm-Message-State: AAQBX9c8vVyCbga1wP+k5FW/RdbPGk0RpBas57vpdeYAI0k8D8wNbw8n
 baokAZ2WUwPSQBSDVvesL3O8pw==
X-Google-Smtp-Source: AKy350ZvPzfE+y1QUhk2IBKWNvy8QImEs21aIMlCoaYiiwpGFf/8mac80Q8PkAy37yOwVjV6IBpT/Q==
X-Received: by 2002:a05:6a20:c12f:b0:d8:f082:437e with SMTP id
 bh47-20020a056a20c12f00b000d8f082437emr3896972pzb.12.1680927745360; 
 Fri, 07 Apr 2023 21:22:25 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa785c6000000b00571cdbd0771sm3781871pfn.102.2023.04.07.21.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:22:24 -0700 (PDT)
Message-ID: <f56d8333-2cb1-b612-ba7a-9acdceb62cc8@linaro.org>
Date: Fri, 7 Apr 2023 21:22:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/10] hw/intc/arm_gic: Un-inline GIC*/ITS class_name()
 helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Sat, 08 Apr 2023 04:22:29 -0000

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> "kvm_arm.h" contains external and internal prototype declarations.
> Files under the hw/ directory should only access the KVM external
> API.
> 
> In order to avoid machine / device models to include "kvm_arm.h"
> simply to get the QOM GIC/ITS class name, un-inline each class
> name getter to the proper device model file.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/intc/arm_gic.h              |  2 ++
>   include/hw/intc/arm_gicv3_common.h     | 10 ++++++
>   include/hw/intc/arm_gicv3_its_common.h |  9 ++++++
>   target/arm/kvm_arm.h                   | 45 --------------------------
>   hw/arm/virt-acpi-build.c               |  2 +-
>   hw/arm/virt.c                          |  1 +
>   hw/intc/arm_gic_common.c               |  7 ++++
>   hw/intc/arm_gicv3_common.c             | 14 ++++++++
>   hw/intc/arm_gicv3_its_common.c         | 12 +++++++
>   9 files changed, 56 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

