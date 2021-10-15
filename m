Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbWg6-0000Pa-Sm
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 19:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWg5-0000NS-GV
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 19:31:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWg2-0002Up-QO
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 19:31:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 21so7291669plo.13
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
 b=LGE3BySfYXyWi7ah3iBw3Ddb7IrL25CErAshQVgRYsyTeVF7XgKR+uj02MxFxrjo/x
 2TegCpFWukh5/064OO22WObFlF+fbV5SSpms25CFf+ipifvZfeUOkQ1YwSfroRti6eu6
 RpOjhxhqk5wK7WoDkerMUwtgpADd0uQivgkAjMUIM5sppoSCoespi0ke/WwYr3gBHAfy
 HsAhIw/3G9Xn6BtoPSPQHXxMn3e65R+0mFIDaOK5KtUJFS+GMHlbcbhqplwPpZ48A8Xz
 lncGt9UFYDHabJqJVI223Q+TZtJeUOnA1M4UIae7/GCMc2lhVeKlQgSsK4lWJFQxQcAk
 zD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
 b=toV5HSqMMRUCe0PeEGCqZa8+AgagQBcE0E7oSVJ7od0LzpDeq/b9u9q4qSBU3Ce8C+
 R9F2j5u/gsJyG9hOcYfLMVybXDsr9KYM098c+9E5sBEf3n6wH2m2gxJYHqAqAJVHi7bv
 yVP+pOlJa0/8EOs742FRDEJPrtxjud5BGhc0mQmcbilIYp5lCh/rCr9M8Sh0TohWkudj
 bPGaejBBAi41Jc3j12YuODDA6haqYEPmpICGOqiKzCrbXwrNEFlKoKGPFvZs9A7QbxoV
 GYbZkwc9NmQiQOLrm7aYrE10vT1ay72/OXbD0+69Hj0/VUO8dcbANJ4TFLcO6l16R5ZK
 tjcw==
X-Gm-Message-State: AOAM530LaWdn8eLHTcQWCHRGflY/0WQg787bZwjkJtOZZoxClIynVrYK
 0tdQS/fWhrgkbS9YRixo9Va6Rg==
X-Google-Smtp-Source: ABdhPJxLVFNwEfBgqFJo7OkrYmP42XVo+gL/OyZqM1LgPhGuXfIpT6XiNj5LJxKEIleE+RtWv1hXKA==
X-Received: by 2002:a17:90b:4f4b:: with SMTP id
 pj11mr17103951pjb.4.1634340708825; 
 Fri, 15 Oct 2021 16:31:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u193sm5419487pgc.34.2021.10.15.16.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 16:31:48 -0700 (PDT)
Subject: Re: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: robh@kernel.org, drjones@redhat.com, qemu-riscv@nongnu.org,
 ehabkost@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
References: <20211015124246.23073-1-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adc064ec-b068-cb91-a883-27e4ed77ee88@linaro.org>
Date: Fri, 15 Oct 2021 16:31:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015124246.23073-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Oct 2021 23:31:53 -0000

On 10/15/21 5:42 AM, Gavin Shan wrote:
> The empty NUMA node, where no memory resides, are allowed. For
> example, the following command line specifies two empty NUMA nodes.
> With this, QEMU fails to boot because of the conflicting device-tree
> node names, as the following error message indicates.
> 
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=512M            \
>    -object memory-backend-ram,id=mem1,size=512M            \
>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>    -numa node,nodeid=2                                     \
>    -numa node,nodeid=3
>      :
>    qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
> 
> As specified by linux device-tree binding document, the device-tree
> nodes for these empty NUMA nodes shouldn't be generated. However,
> the corresponding NUMA node IDs should be included in the distance
> map. The memory hotplug through device-tree on ARM64 isn't existing
> so far and it's not necessary to require the user to provide a distance
> map. Furthermore, the default distance map Linux generates may even be
> sufficient. So this simply skips populating the device-tree nodes for
> these empty NUMA nodes to avoid the error, so that QEMU can be started
> successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v5: Improved commit log and comments as Drew suggested.

Queued to target-arm, thanks.


r~

