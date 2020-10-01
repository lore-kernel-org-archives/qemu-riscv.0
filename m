Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO2Nb-0008FD-GD
	for mharc-qemu-riscv@gnu.org; Thu, 01 Oct 2020 13:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO2NZ-0008Ak-Pn
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2020 13:28:29 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO2NX-0004ds-BX
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2020 13:28:29 -0400
Received: by mail-oi1-x22f.google.com with SMTP id z26so6405640oih.12
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2020 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vy+r5hxGZwwtLf/uYAutZcZKgInNFibT2LV9eyEsjqY=;
 b=c5D7Pe18TRQs347pr/QyD9gnkgvRfLQRxtC8riJLlR0PupE6ix1E4H8kY3E5gIqQea
 hv9H1eerUq1/vM2EnHtXyNHIlAuAi+UjL11tnYfalYntzODAn84MIHzUZEC0XRDtq1U7
 YUw0Pqd6ASHWSzqT9JS3+e9G9D/cUnQZ4/XeMBKo/5c0xPXDw63bTyzFmHqQJNAk/d2l
 GQoAoQGhvOdO6x9R1JuxbS+6HMLPsRkGLsDYpOhSuo7xaENuj+sh7sNofFZOkmVaY4l3
 n3JidHG2Q1+X6cs2++MHvIDvTq1m6vD0TCloSi8GmLyN9fsiDRM8FwjXHxPWf08ZwJM6
 Z2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vy+r5hxGZwwtLf/uYAutZcZKgInNFibT2LV9eyEsjqY=;
 b=CkPhfQJFribcyyRzQIhpCT6gxZRyM124+NrMjlZXysECiFGadgM5Q0ZR/ylVIQVE0k
 0gFFhwQGvWaNHOhZafoooo6wYEyM+fKKGQfpW+tZtV3sMQh9DTgiHVClYQcj6AwmqSHA
 1F4PG/KAG7Hkz2MZkC9kfpihogBJsuGRzh0VJAp+pRXb6IMm349P0jBOZNzR/bVugVRd
 cxjdgn43nGgYOtVUzWidJ5d38FcZUf5o9glmA3iA7gfWKt29Go8e8ySQU2Az9CgBcaRh
 Qex6YjwmYSScWZigzwpoQ1nQdawIyZNdOFnQLXiv8r2Gc+fKwg85PcdInMxSdLAGW+VU
 juJg==
X-Gm-Message-State: AOAM530M0lVMz9ScJef36G6rs2lgQSNNnlKv8+bMDVGg+46iXLzHCQQG
 FXSb2Yf1MPcXEssHiZT8fJHsDw==
X-Google-Smtp-Source: ABdhPJxF4JwGl/3dWlZ49sFLkxDWP2tluvSCWg/3efw6j4Wj8ekwzpT2P4qYz8APyYH4UMbR56O9YQ==
X-Received: by 2002:a05:6808:9bc:: with SMTP id
 e28mr647059oig.71.1601573306020; 
 Thu, 01 Oct 2020 10:28:26 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j24sm1344049otn.64.2020.10.01.10.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 10:28:25 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/riscv: Add H extention state description
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 Alistair.Francis@wdc.com, yinyipeng1@huawei.com, palmer@dabbelt.com,
 wu.wubin@huawei.com, dengkai1@huawei.com
References: <20200929020337.1559-1-jiangyifei@huawei.com>
 <20200929020337.1559-4-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e725e26-3952-dbd2-c4aa-d9e933406220@linaro.org>
Date: Thu, 1 Oct 2020 12:28:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929020337.1559-4-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 01 Oct 2020 17:28:30 -0000

On 9/28/20 9:03 PM, Yifei Jiang wrote:
> +        VMSTATE_UINTTL(env.vsstatus, RISCVCPU),
> +        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
> +        VMSTATE_UINTTL(env.vscause, RISCVCPU),
> +        VMSTATE_UINTTL(env.vstval, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsatp, RISCVCPU),

So... if I understand things correctly, this is synthetic state, internal to
QEMU.  It is generally better to only serialize architectural state, so that if
qemu internals are rearranged, it is easy to decide on the correct sequence of
operations.

It seems like this should be re-generated with a post_load hook, calling some
of the code currently in riscv_cpu_swap_hypervisor_regs().  Note that some
minor rearrangement would be needed to call that code from this new context.


r~

