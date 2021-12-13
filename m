Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwn9G-0001fO-Nw
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 10:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwn9F-0001cQ-7Q
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 10:21:53 -0500
Received: from [2607:f8b0:4864:20::62a] (port=36419
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwn9D-0007Se-PT
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 10:21:52 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u11so11399044plf.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Dec 2021 07:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGc1PquQXh0+9331OAt9/t/pIqsDq0eIaBHESSHpnxA=;
 b=HzoQt+uthV6vbcJBqrKhH8j/XHs+GtMpyP7UM24kBENT+NfcMcD8q73DEayMJFAfXW
 T/H0duDe+hRFBkSje431MCOqjpnoeAzMinRBa/7+ZVIIa4YNDlfHT4AuuVcnptlaHPPX
 dj/pZL1t99ystjuI/QFfjp+cSMxA6ptDeiX2+id4PhthCtDq7alneV5MFNn8z3VgwScN
 dEgYKBBD5L40M72WwasSMttpH+1qv3ghydG+CuGiP0596hH956hilMQFSiV6qYyH8Xdk
 2vzSOGEN/TN2gvnlk/Dw+P2/zeG1czRpibulnt88oawnU1fUxdO8ZagCubTCFdoUrq+y
 iqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGc1PquQXh0+9331OAt9/t/pIqsDq0eIaBHESSHpnxA=;
 b=TqV6ZtGr5TWLVHPtypKQSQWchOylawzNxQNMvuL28NSy0mYedwr1TAd7zidOK1ttq4
 xPwVmPqICVz55dzZHhy/zVCajIFbWeDlzaU2PoM/AVCBGqiM23edNsL4crlnAgXfSR7a
 5mSMnQ5lsD4TiPoPmoZ8f98X5pVWYW8KvAiVQ9Pcy1etG7iitEzb7SmM4MEx/+vbJ4DB
 iqouownBD02OwO79o/lTuaGSAXkpOjsrrWrr8x0WQp4xMLdUwaGH8pVHCU+DlE1wuQAF
 NmheDVz1W1xWm5QYmrWkjqEHrHYCESG8LeSpgy8cc/x9jcwnYeW8ixYywcT6zoFDd3IM
 /lbw==
X-Gm-Message-State: AOAM530K3eLPR8yM2o/c6/3WtZA5TxbfZOPwoT1PsYbKgjpUxNzWFYKn
 XkV2mbvdZhdIbbZl1PzPhl5vZQ==
X-Google-Smtp-Source: ABdhPJxGt30nuzSBLZfqYPjbexcn085QFp2N6BpQabQxMRsjKxAHXZAfch8zfO4BJ3JlY+kcXaTqIg==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr44483778pjb.157.1639408910304; 
 Mon, 13 Dec 2021 07:21:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t191sm5315472pgd.3.2021.12.13.07.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 07:21:49 -0800 (PST)
Subject: Re: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 libvir-list@redhat.com, anup.patel@wdc.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, fanliang@huawei.com,
 wu.wubin@huawei.com, wanghaibin.wang@huawei.com, wanbo13@huawei.com,
 Mingwang Li <limingwang@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
Date: Mon, 13 Dec 2021 07:21:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210100732.1080-13-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 13 Dec 2021 15:21:53 -0000

On 12/10/21 2:07 AM, Yifei Jiang via wrote:
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +
> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (kvm_enabled()) {
> +        env->kvm_timer_dirty = true;
> +    }
> +    return 0;
> +}

This post-load belongs on the vmstate_kvmtimer struct, so that you need not re-check 
kvm_enabled().

>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
> +    .post_load = cpu_post_load,

No need for version change.


r~

