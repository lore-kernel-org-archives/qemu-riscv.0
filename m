Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMeIu-0005AF-NR
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 19:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMeIt-00059n-OQ
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:42:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMeIr-0007lS-W3
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:42:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so2168038pjf.5
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=isb4e99Ra7WRpcGfgSioRMwXCLTyi0RjsAtLlpXK8Wo=;
 b=osUDqcQfWZ5xb6ZTMLG16NJx5hbCyCPUn00PeQ4VrPpPne+aTYZpgWjsZKb8RaGGWV
 MPr9eyU+PFuBqnX4/o33iMRMNAReyAqNeKNyJuEU5ULbY43zk/jSfYxH9g44kaAmB7F4
 YIsi9rhugNdp7o1jNti1UKi9frG3wE4BdE5IPhv8gAKKQNCeZ7vprpvUjRNk9RMPmeQO
 1L+ymmclWDK2wzaQyDNWu/AwDIewwr7OqpfQTpzHPdBMu7C5wMldxYyNLOStgOSvfXmM
 8AkU1SvO3CaTQwfP4ssCK++5D2kn++WO7/9K8AW6ZyT3wQQkVJkdXvfYzxpI6cwD/+fS
 p+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=isb4e99Ra7WRpcGfgSioRMwXCLTyi0RjsAtLlpXK8Wo=;
 b=mjaTs7zFvFJ/i+fQpeNyhBUwArkCy/lv+GRzoYmUqOaHrjYTKW5skRPZNwcAi86jC1
 FVGWU4LG53cPKGoGKLQFGU/uinFEJ54l2iHP/qhhM0Z3rmMqktFPvQ9FtgXWI2VkGKgL
 oPoPdBik7GDomfmP+XNQQAWci05Yh1Igz1ofSzFMNing3S2DfzaFC8K02fMdgsny9VmZ
 m2dCSK2s58DOV2BjEaEWJ7dbTl3mcx8fpU9YtWRUMTmkftib72R4D8Dr571v4scD9yRz
 Yb2OsYndy36QyXF3cLPTUm0iAA6f4ddF5Y5NqkSnTFCh7696+NJoRjMZRL+xhOEnIM5x
 BIsg==
X-Gm-Message-State: ACgBeo0bvV+fHuHm4V4SbkD1Xjl5jJGWIjDnLT3SSxNzjEyr3b2sWgPW
 K1rwo8C08zHSPbUGALmLC3r7TQ==
X-Google-Smtp-Source: AA6agR5LPU58SobpoSneTEckRne2W+0ImcuYAHbSnkDW7//iW+6hB4XYMuHtTzeOZaZSFc3uGqCRUg==
X-Received: by 2002:a17:90b:4a07:b0:1f5:1aff:4ab with SMTP id
 kk7-20020a17090b4a0700b001f51aff04abmr16483557pjb.216.1660347776304; 
 Fri, 12 Aug 2022 16:42:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 cp9-20020a170902e78900b0016c50179b1esm2310096plb.152.2022.08.12.16.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 16:42:55 -0700 (PDT)
Message-ID: <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
Date: Fri, 12 Aug 2022 16:42:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Furquan Shaikh <furquan@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
In-Reply-To: <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Aug 2022 23:43:00 -0000

On 8/12/22 16:27, Richard Henderson wrote:
> On 8/11/22 13:41, Furquan Shaikh wrote:
>> Unlike ARM, RISC-V does not define a separate breakpoint type for
>> semihosting. Instead, it is entirely ABI. Thus, we need an option
>> to allow users to configure what the ebreak behavior should be for
>> different privilege levels - M, S, U, VS, VU. As per the RISC-V
>> privilege specification[1], ebreak traps into the execution
>> environment. However, RISC-V debug specification[2] provides
>> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
>> be configured to trap into debug mode instead. This change adds
>> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
>> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
>> should treat ebreak as semihosting traps or trap according to the
>> privilege specification.
>>
>> [1] 
>> https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf 
>>
>> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
> 
> I don't see why you need to change anything at all.
> 
> Semihosting doesn't only use 'ebreak', but a sequence of 3 insns:
> 
>      slli x0, x0, 0x1f       # 0x01f01013    Entry NOP
>      ebreak                  # 0x00100073    Break to debugger
>      srai x0, x0, 7          # 0x40705013    NOP encoding the semihosting call number 7
> 
> If the -semihosting command-line argument is absent, then the new DSCR fields apply as 
> normal.  If the -semihosting command-line argument is present, and the ebreak is not 
> surrounded by the required nops, then the new DSCR fields apply as normal.  But if the 
> command-line argument is present and the nops are present, then semihosting overrides the 
> architecture and DSCR does not apply at all.

I note that there's a missing test of semihosting_enabled() in 
target/riscv/insn_trans/trans_privileged.c.inc, and the PRV_S check in 
riscv_cpu_do_interrupt can be done at translation via ctx->mem_idx >= PRV_S.


r~

