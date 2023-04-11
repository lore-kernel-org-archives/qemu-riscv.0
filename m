Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmD1q-0003Zc-PJ
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 08:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmD1p-0003Z9-3c
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:23:17 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmD1n-0007CU-5Z
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:23:16 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-18436e0b673so8695586fac.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681215793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UaeCEjfjmbZ1IyBVOX3LWRG303Kt2SbyMn7DiDt5v44=;
 b=gmcZS1keCT5vO0qt3LeQgLYFi2hsLorP6/0G5j3jTOa47yU7JDlbO6kuFFIxooFdBe
 ESIw0eppUwIbBTxxjsbddf0Yy471t0ZhWp2RcIw8f1tzHVDFB+dQfos+PKPecs5hCgYV
 A319rvICmUkbomFiUmfnHFnpBG1sTxfVYyA79EzwdneyRbFZkVFO7Z+n8yMzNzAqINnf
 7XvPnImNPv1HNMaKrpzPxr0VgVAozJx19mzegDSGqHYWOnVy500rmjM3qlIecNKqmbDu
 rl4bpsWg7ea6IDbwLwji/4BvSAyH0Ikv3y0lKipzg6UCBr/QtNWThVGZfCuPf7ahoEW8
 qfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UaeCEjfjmbZ1IyBVOX3LWRG303Kt2SbyMn7DiDt5v44=;
 b=NOQMMijEkUrpCkHlyWrXk6bSgP+1w6e//2zTvgX/eN5VJadEhXycpXde0SHX/t8ARE
 umeCumpIkNLqwzz+bk1wMIvXX40jBBv24dRoDgek5pB7QGiJh8wk+iidHtcgY6jMrKN5
 Tx4jd5vxG+La3vS7iQVLnHIAw5Zh9a+d/koARYVp/luib1ONEPhS3t7pHrPc2J0qj1SU
 U8DrhcMK/+o1zotGIo0c6tlwcWCei6d54XbbAJCOn3YJn15v6z+f+V7wMkBdfTCps8ED
 pwlyFNJa7CA3nm9ZgMooRAhvd/KdFBIz9KbhTkJ74DQNgijTO0TTWNIdRkxa3md3YGy2
 im7g==
X-Gm-Message-State: AAQBX9cEahRGUiyTuD7ShKYaLZa2IUUtEhhsDDPiN6GFoYxHXo9L0si/
 SBeuX+bu9bJXHzUEB7nD+7Mhzg==
X-Google-Smtp-Source: AKy350Z2yvdlXcKn7TQHu63Yj+wJzGSPfZlCPODk+k8/HOM2E2jLOo6a4lspoJPBXgPgebOdj4FhIA==
X-Received: by 2002:a05:6870:c090:b0:17a:d7dd:aefa with SMTP id
 c16-20020a056870c09000b0017ad7ddaefamr1243702oad.6.1681215793431; 
 Tue, 11 Apr 2023 05:23:13 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 qf9-20020a05687148c900b001727d67f2dbsm4998967oab.40.2023.04.11.05.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:23:13 -0700 (PDT)
Message-ID: <94db9b5e-e9ec-a2f8-b2b4-5a0029fccdd4@ventanamicro.com>
Date: Tue, 11 Apr 2023 09:23:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/4] target/riscv: add 'static' attribute of
 query-cpu-definitions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
 <20230410165251.99107-4-dbarboza@ventanamicro.com>
 <7bdf0305-bd5f-68d2-525c-3ec8106f90c5@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <7bdf0305-bd5f-68d2-525c-3ec8106f90c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Tue, 11 Apr 2023 12:23:17 -0000



On 4/10/23 23:03, Richard Henderson wrote:
> On 4/10/23 09:52, Daniel Henrique Barboza wrote:
>> 'static' is defined in the QMP doc as:
>>
>> "whether a CPU definition is static and will not change depending on
>> QEMU version, machine type, machine options and accelerator options. A
>> static model is always migration-safe."
>>
>> For RISC-V we'll consider all named CPUs as static since their
>> extensions can't be changed by user input. Generic CPUs will be
>> considered non-static.
>>
>> We aren't ready to make the change for generic CPUs yet because we're
>> using the same class init for every CPU. We'll deal with it next.
>>
>> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu-qom.h        | 3 +++
>>   target/riscv/cpu.c            | 6 ++++++
>>   target/riscv/riscv-qmp-cmds.c | 2 ++
>>   3 files changed, 11 insertions(+)
> 
> Is 'static = true' really what you want as default?
> Perhaps 'dynamic = false' (considering zero initialization) would be better?
> Do you want an attribute that can be changed at all?

I don't think there's a precedence in QEMU of a CPU that starts as static and then
becomes non-static during runtime. If the CPU has the capability of changing
its attributes/extensions during runtime then I'd call it non-static all
the time.


> 
> You could plausibly implement this via class inheritance instead.
> E.g.
> 
> static const TypeInfo dynamic_cpu_type_info = {
>      .name = TYPE_RISCV_DYN_CPU,
>      .parent = TYPE_RISCV_CPU,
>      .abstract = true,
>      ...
> };
> 
> and then the dynamic cpus inherit from that.  Your dynamic attribute becomes object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_DYN_CPU) != NULL.

Sounds good. We'll avoid adding an extra flag in RISCVCPUClass too.


Thanks,


Daniel


> 
> 
> r~

