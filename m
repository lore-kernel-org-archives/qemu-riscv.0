Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phqE4-0006di-3J
	for mharc-qemu-riscv@gnu.org; Thu, 30 Mar 2023 07:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phqE2-0006dH-6H
 for qemu-riscv@nongnu.org; Thu, 30 Mar 2023 07:13:50 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phqE0-000424-Lj
 for qemu-riscv@nongnu.org; Thu, 30 Mar 2023 07:13:49 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17997ccf711so19344969fac.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Mar 2023 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680174827;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5oAXVDBVa31P76KWaQrtxvoRm2ZMBG/QMEUM96oSda8=;
 b=lHatjWNvsqPRapDvQplP9iv5MghVpukB91Mq5SADJQr0JBkDgZG4i6Yf0jjv7tQee8
 zTZrDjKvkEXLmyk6HqoWM2N0Vk8yBK7M4BhmrRFPd+THVy/u+cJWvpIt5w3bdIgcbl9n
 0HOjf2/XDW1w/nMUK756MEFocP2h5ZRTDFdWksvBR/fmATfwmrDSNmdGEqLqdQ0qKY0W
 mmVMjdmaWayDlGzb7CNF9oO7z1SHcd8M/rWG3BZSDEaLELzWq1uMFPgJT6Xn5yQ7E5cc
 SHt2vJ4ZUXqaTekyaD/X7utsvFQZRJL0k7x7WaOpWr7YWymZxoZKZVmC3nIGvqs+woa0
 SqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174827;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5oAXVDBVa31P76KWaQrtxvoRm2ZMBG/QMEUM96oSda8=;
 b=jqPqm6zlQPSm/HxUxhc2UU6qGahFO7gTsItTG0deR+y1x7BW9iLzdVFNZP1bEXbNsu
 EGhmMmNQtchDTV9RsWZNAKEjCTTGsLdQBCs+CPsF2s7gzRa2PSMfw3TR9S9glDD6COEk
 UB7pIRFJ4gAJBRZ/FL3wOmLAK+EK/LT7ft8Cjk05OnTw3AZNdql0dZAJb3bzbSrZKJ1M
 k21rdflk6RX0aHKC83pXwvtZCo20VWYrL3LgVWyFjOhXzkmxzvzCgpZ9TmWXElRXk1K2
 0wRjcIwdMFXzNB+/qjEVBmSASMrbZcK7GRHS4ZmyAWpvRzZfE0igjSc/aJlwnJ8slALl
 3BnQ==
X-Gm-Message-State: AAQBX9fNjzP23nC2AcIJkshR/VyfYlo8lSC3sz1SEwVfeUjT5mbcGv2m
 0VhaQAJFI31kEzDvfWzwtcrMCg==
X-Google-Smtp-Source: AKy350YnVz3as49xPL0h0owigKfmfJ1Rg8vvwGLTqQVN3wwRnqaWmcFVST918SVGpkxU8LUurwMeTQ==
X-Received: by 2002:a05:6870:2104:b0:177:80a2:4dc6 with SMTP id
 f4-20020a056870210400b0017780a24dc6mr14281327oae.58.1680174827326; 
 Thu, 30 Mar 2023 04:13:47 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a056830130e00b006a14579a8besm4165569otq.43.2023.03.30.04.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:13:46 -0700 (PDT)
Message-ID: <4b77267e-84bf-a7ec-575d-92b671b5ba38@ventanamicro.com>
Date: Thu, 30 Mar 2023 08:13:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: Set opcode to env->bins for illegal/virtual
 instruction fault
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Thu, 30 Mar 2023 11:13:50 -0000



On 3/30/23 00:46, Weiwei Li wrote:
> decode_save_opc() will not work for generate_exception(), since 0 is passed
> to riscv_raise_exception() as pc in helper_raise_exception(), and bins will
> not be restored in this case.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/insn_trans/trans_rvh.c.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> index 9248b48c36..4b730cd492 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -20,6 +20,8 @@
>   static bool check_access(DisasContext *ctx)
>   {
>       if (!ctx->hlsx) {
> +        tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> +                       offsetof(CPURISCVState, bins));
>           if (ctx->virt_enabled) {
>               generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
>           } else {

