Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFN5c-0004w0-IS
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFN5a-0004vP-Gr
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 17:27:26 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFN5X-0000CN-8f
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 17:27:26 -0500
Received: by mail-oi1-x242.google.com with SMTP id h185so11349383oif.5
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IpoeC3L4roef9zj3oNJSECsxwrRb8L77/kWW9Ca4OjE=;
 b=M3bRd1KXmm1YAUUllfmPJS91n25kMXC0NzesyNd4hB4Uq5/95W1NObH5bRz5iHBQQN
 FvcId6jogwG4DMgPq1LAFqr2PdpyAx9hHLt7NL1LTgma0nSB1/EDGg1EwPGHi8m7ihCY
 Gdq/mnIvFDplKqDQUJCvNIP5+05E4UeoIgOExjENpacBaOwuzeXc+wUAGp70um14hyQB
 Tk8MF4F8jnqai+idLFE0Y8/dZCWIf7JIrGBhKmJ2OCQQndaH85yls1SCWA/MdSY+QTHT
 l3pKG2rDW5J59hnBhnRyJuhmJSmaJPPoWIp7Aoi9e9fvBfkQtSsPABA56IE0VTuEVAT5
 pqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IpoeC3L4roef9zj3oNJSECsxwrRb8L77/kWW9Ca4OjE=;
 b=cHFdV2PAjic3GDomktY91sUut8OE4zyPS5c5uyXyrvCIr4wV1ThjIs4IsAmphJlZPe
 1lr48OR35eF7RZnOr2bEiiptx4fHMEaDDn+Tpzw4pjrgYGIqP+QlQ05DdjMaqUciU2jQ
 u45+v5PgO3J4skIL1h5Jf10mw2esrjtfPi0mRKXGaruaFXrVJarUuCcnC9Qp266RKsJL
 PhSJJ448qBuXqauwLAaEjXAjWIIw9+PgZn5p7aXXW3CyjsFV4vsBp8yjQ7FUA02N6vrB
 KJM07o259ttRGFai+YDySevHlO1JoCnYn12WvLB+jULaKeqIpDJJDn//9IIZH7IjXKng
 S8HQ==
X-Gm-Message-State: AFqh2krntDUrYfQDLbrIm7jxak0yeGVB1ry+kB4g7Iq5A8GbzA2hQSh7
 4jETsgrOVXsBIQ6XN01E+oy1Qg==
X-Google-Smtp-Source: AMrXdXulFaF1xAqbNuVt6XDKi3TPC5Ums6arIcqg6x2+83NkwYTQ1ABQ8zajgXQmCYb8JYFYDTtfQA==
X-Received: by 2002:a54:400b:0:b0:364:5ec5:bc with SMTP id
 x11-20020a54400b000000b003645ec500bcmr1565594oie.59.1673389641593; 
 Tue, 10 Jan 2023 14:27:21 -0800 (PST)
Received: from [192.168.68.107] ([152.250.93.24])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a544f93000000b00363ef79e2a1sm5876316oiy.31.2023.01.10.14.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 14:27:21 -0800 (PST)
Message-ID: <2613669e-f535-e91d-14b8-5968094877eb@ventanamicro.com>
Date: Tue, 10 Jan 2023 19:27:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230110201405.247785-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 10 Jan 2023 22:27:26 -0000

Hi,

I mentioned that the bug were found in riscv-to-apply.next but forgot to
mentioned that the patches were also based on top of it as well:

https://github.com/alistair23/qemu/tree/riscv-to-apply.next


Thanks,


Daniel

On 1/10/23 17:14, Daniel Henrique Barboza wrote:
> Hi,
>
> I found this bug when testing my avocado changes in riscv-to-apply.next.
> The sifive_u board, both 32 and 64 bits, stopped booting OpenSBI. The
> guest hangs indefinitely.
>
> Git bisect points that this patch broke things:
>
> 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8 is the first bad commit
> commit 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8
> Author: Weiwei Li <liweiwei@iscas.ac.cn>
> Date:   Wed Dec 28 14:20:21 2022 +0800
>
>      target/riscv: add support for Zca extension
>      
>      Modify the check for C extension to Zca (C implies Zca)
> (https://github.com/alistair23/qemu/commit/8c3f35d25e7e98655c609b6c1e9f103b9240f8f8)
>      
>
> But this patch per se isn't doing anything wrong. The root of the
> problem is that this patch makes assumptions based on the previous
> patch:
>
> commit a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85
> Author: Weiwei Li <liweiwei@iscas.ac.cn>
> Date:   Wed Dec 28 14:20:20 2022 +0800
>
>      target/riscv: add cfg properties for Zc* extension
> (https://github.com/alistair23/qemu/commit/a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85)
>
> Which added a lot of logic and assumptions that are being skipped by all
> the SiFive boards because, during riscv_cpu_realize(), we have this
> code:
>
>      /* If only MISA_EXT is unset for misa, then set it from properties */
>      if (env->misa_ext == 0) {
>          uint32_t ext = 0;
>          (...)
>      }
>
> In short, we have a lot of code that are being skipped by all SiFive
> CPUs because these CPUs are setting a non-zero value in set_misa() in
> their respective cpu_init() functions.
>
> It's possible to just hack in and fix the SiFive problem in isolate, but
> I believe we can do better and allow all riscv_cpu_realize() to be executed
> for all CPUs, regardless of what they've done during their cpu_init().
>
>
> Daniel Henrique Barboza (2):
>    target/riscv/cpu: set cpu->cfg in register_cpu_props()
>    target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()
>
>   target/riscv/cpu.c | 525 +++++++++++++++++++++++++--------------------
>   target/riscv/cpu.h |   4 +
>   2 files changed, 292 insertions(+), 237 deletions(-)
>


