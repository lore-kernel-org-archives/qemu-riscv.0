Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3Mc-0007yu-0M
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3MY-0007eX-Ow
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 22:04:02 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3MT-000705-5w
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 22:04:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id q2so11271267pll.7
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 19:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681178635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4yvGcCzLhTpbedWiQuxqQ848MZzzMu+QQMFAOpatbl8=;
 b=nO2SBxXh9FhBYoy5PNBMb7AjIssvzdGr5kO1SFZjGECu2Vrz2RbvS5WHF6yw+cobgI
 KBaJ7e/c755T91EnTG7qLaW+WZP2iotpclOBDCXbG/EfaqugKOxw8Xy6okHCA4mW9vJt
 eKhFO6gJWGVE8ZozWLok2MhKt9X3DeIG7UzZ5QjtU3uJK0k3YyL2fKzVNkYRZxGSkAHi
 xYoy5PfudrUEC/P7VnvodRBO+cNO9NjQibJOy++nYKB4xdocrYYEZ28OPsTO67mltpft
 dXmiZygBtpQyv+r50dHxxUBf+q2YANDfOQYGeLoSxgN9EPQ97BCe4G5Sa8uTh5YExGNp
 Rtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4yvGcCzLhTpbedWiQuxqQ848MZzzMu+QQMFAOpatbl8=;
 b=LnttIHFib4ubGX7Kz5Mv1bmlpav/nJkha80b2vSPSMt2On8wotWFHSCNr6kP10owUF
 LClRRuBaGMEHUB+bw0imfAhGI0FRKihY+xcDfHodQSi2dZ4RjAVvMYo5wCtGFTSVSARh
 e3PNY+N8cZBG0XD2JhUSvcet4SA8NDMHsh37hcALZaEYaS1R72E8C1ykJ/kvhoJFIUda
 j2bDs25ph2GqpVX8+wqX+nAi6oCAdX4bunX//HnKoHaHuPxonFnYt0IMIMLBiQ2NqAN2
 PRCCUdH/BwI0jSG2cNo+n8ok0BtQgyOIOraH7BZehLj0V8Jurql/NBX3tkFjvKd5uwFQ
 Meuw==
X-Gm-Message-State: AAQBX9ceipF8r9bnMUM9GO81gZosfhTKvkqGhD7aUs1WSJAETK2QauS1
 uMLpikBwZ+f5fD+Js9T3X+lYyA==
X-Google-Smtp-Source: AKy350a2ShUWbmIqtSLcQChVQGRdxIzsjumkcD8FIzzOIe6tT6WqhYY8JL+8DaxTIFjsF4VaF49V/Q==
X-Received: by 2002:a05:6a20:4986:b0:ea:ea82:2ffb with SMTP id
 fs6-20020a056a20498600b000eaea822ffbmr1465758pzb.45.1681178635251; 
 Mon, 10 Apr 2023 19:03:55 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 e22-20020aa78c56000000b0063a1e7d7439sm1392891pfd.69.2023.04.10.19.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 19:03:54 -0700 (PDT)
Message-ID: <146db5ae-784c-c03a-d2e5-231ae963bd29@linaro.org>
Date: Mon, 10 Apr 2023 18:56:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] target/riscv: add query-cpy-definitions support
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
 <20230410165251.99107-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410165251.99107-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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
X-List-Received-Date: Tue, 11 Apr 2023 02:04:03 -0000

On 4/10/23 09:52, Daniel Henrique Barboza wrote:
> This command is used by tooling like libvirt to retrieve a list of
> supported CPUs. Each entry returns a CpuDefinitionInfo object that
> contains more information about each CPU.
> 
> This initial support includes only the name of the CPU and its typename.
> Here's what the command produces for the riscv64 target:
> 
> $ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
> {"QMP": {"version": (...)}
> {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
> {"return": {}}
> {"execute": "query-cpu-definitions"}
> {"return": [
> {"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecated": false},
> {"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": false, "deprecated": false},
> {"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated": false},
> {"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "deprecated": false},
> {"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": false, "deprecated": false},
> {"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": false, "deprecated": false},
> {"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": false, "deprecated": false}]
> }
> 
> Next patches will implement the 'static' attribute of CpuDefinitionInfo.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   qapi/machine-target.json      |  6 ++--
>   target/riscv/meson.build      |  3 +-
>   target/riscv/riscv-qmp-cmds.c | 53 +++++++++++++++++++++++++++++++++++
>   3 files changed, 59 insertions(+), 3 deletions(-)
>   create mode 100644 target/riscv/riscv-qmp-cmds.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

