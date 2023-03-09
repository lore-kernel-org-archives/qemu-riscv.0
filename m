Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paNbN-0006aE-Ql
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 16:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNbL-0006Xd-Vc
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 16:15:03 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNbK-0004Vq-1w
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 16:15:03 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1767a208b30so3765688fac.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678396500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YAB0nwTwTz5OL3ZASLpXeDoJNH2dEwFjDl4zjLqF4WU=;
 b=JtW+3/NQwwIkydWZ02laO2JvHRlydjxy40ofzKgxXjL/5I7eQMozjDiLLwJV27xlYW
 rrLGHTvDCanALkhEOZgzCkYcmr0kXy/s+/gkqQjuuNEbS60c+ZWPEGIDoLCVS62KGw4j
 rnHzSh+0U/t3tT/I3DqYi4kO318Au6fD5Imb1eTsx7e4riVfNFpCsQxq8VXdh5vdApd6
 qvU47G+vBLuE3IDvW2ayTEFiuh8uvjLME9E5TM5ERGubjRf2Pwjx7afEM78jlF87KraB
 gDJI9tLBkCAwDgfV31tH5JWRs3lW33FHzyzNxYVHQgMr/R/V6O5oHdbkh7aXVsPQB5CV
 a83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678396500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YAB0nwTwTz5OL3ZASLpXeDoJNH2dEwFjDl4zjLqF4WU=;
 b=vZ9fCxfy80NvQuTRnXj/48qAPD2gGw+X/Z7jcft4JVaqlZVBN1NOl3UMyCwvo1Ncp4
 v4H/SBF49Aw/6y8IKHSMj/3pE+Rp23q4F+vjLor9hBI+/j/y441qOz/hdC826JgrZv0F
 5LX5YVST3LltCjbStrXEjlD0jZuk0zdT2sMMcn8KuqjN7nJqL47FpY0+tbx5ehTrew8C
 /pvxHW/9ng86CRhHvQhvQxYLwJpqM5nF2XYs5A2kDyYVyI6BgMOK8q+Z/cy62bFVA89d
 6w9vduXCOfI5lLgAhPLhXlHSCG+bdNsTdQtzCcWFT2gkothAa1akPqfPT1C8vGToFXoK
 0t2g==
X-Gm-Message-State: AO0yUKWttGAY+PsMI34w1SGpzSIU84pAC46v8O6bwe9NycmvtSW2uGc5
 mRX8Vcsoo6rWNDXlFnzaNvTivQ==
X-Google-Smtp-Source: AK7set/wQn5Q+HSqr5Ebddl5nE3j9SP8Fqrxp1KbfBEwdZQ0Xr8k9ZcNE/oAFnDLdkAAWY+ZCD3yIw==
X-Received: by 2002:a05:6870:a109:b0:172:acf5:1d25 with SMTP id
 m9-20020a056870a10900b00172acf51d25mr14861918oae.0.1678396500496; 
 Thu, 09 Mar 2023 13:15:00 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 k37-20020a4a94a8000000b0051ffe0fe11bsm141964ooi.6.2023.03.09.13.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:15:00 -0800 (PST)
Message-ID: <2b4071aa-b584-a03f-1aaf-e73bafcf1db3@ventanamicro.com>
Date: Thu, 9 Mar 2023 18:14:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 00/17] centralize CPU extensions logic
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 21:15:04 -0000

Just realized that the subject doesn't mention 'riscv' anywhere.

Yes, this is target/riscv specific. I'll make sure to mention that in the
future versions.

Thanks,


Daniel

On 3/8/23 17:19, Daniel Henrique Barboza wrote:
> Hi,
> 
> During the review of a series that did some work in the RISCV_FEATURES*
> enum, Liu Zhiwei commented on how we could centralize the all the
> extension validation code and integrate it with write_misa() [1].
> 
> This does at least part of what was suggested. The idea is that, ATM, we
> have too many places setting cpu->cfg and the validation logic is
> scattered around (e.g. there are some contraints in write_misa() that
> should be applicable elsewhere). This series is an attempt to centralize
> things a bit.
> 
> The main accomplishments of this series are:
> 
> - the parent device riscv-cpu no longer sets any cpu->cfg attribute. This
>    was forcing init() functions to disable extensions that it wouldn't
>    use just because the parent device was enabling it;
> 
> - all validations are centered in validate_set_extensions(), with
>    pontual exceptions in write_misa() that has exclusive contraints;
> 
> - set_misa() now writes cpu->cfg. No need to have one function to set
>    env->misa_ext and then another to set cpu->cfg;
> 
> - register_cpu_props() now only exposes user-facing props;
> 
> - all validations from validate_set_extensions() are done at the start
>    of the function. Validate first, set extensions after;
> 
> - RVE is now forbidden in all validations, not just in write_misa();
> 
> - RVG is now forbidden in write_misa();
> 
> - write_misa now uses set_misa() and validate_set_extensions().
> 
> 
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html
> 
> Daniel Henrique Barboza (17):
>    target/riscv/cpu.c: add riscv_cpu_validate_v()
>    target/riscv/cpu.c: remove set_vext_version()
>    target/riscv/cpu.c: remove set_priv_version()
>    target/riscv: add PRIV_VERSION_LATEST macro
>    target/riscv/cpu.c: add riscv_cpu_validate_priv_spec()
>    target/riscv: move realize() validations to
>      riscv_cpu_validate_set_extensions()
>    target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
>    target/riscv/cpu.c: avoid set_misa() in validate_set_extensions()
>    target/riscv/cpu.c: set cpu config in set_misa()
>    target/riscv/cpu.c: redesign register_cpu_props()
>    target/riscv/cpu.c: move riscv_cpu_validate_v() up
>    target/riscv: put env->misa_ext <-> cpu->cfg code into helpers
>    target/riscv/cpu.c: split riscv_cpu_validate_priv_spec()
>    target/riscv/cpu.c: do not allow RVE to be set
>    target/riscv: add RVG
>    target/riscv: do not allow RVG in write_misa()
>    target/riscv: rework write_misa()
> 
>   target/riscv/cpu.c | 516 +++++++++++++++++++++++++--------------------
>   target/riscv/cpu.h |   9 +-
>   target/riscv/csr.c |  52 ++---
>   3 files changed, 323 insertions(+), 254 deletions(-)
> 

