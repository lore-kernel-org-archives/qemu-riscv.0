Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFdOU-00023l-Li
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 10:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFdOS-00021j-03
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 10:52:00 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFdOQ-0007qN-GE
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 10:51:59 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322d768ba7so15950114fac.5
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WwVMr3DCxLXykOzNi+Px+mDON8RyJnPpnV4piDeP7As=;
 b=HjsYNdxtu4nvATuGxqJUATWGo9P8uXS63XFkR5e2WT1lNz8eQ+Ki4NLi9xqUSoBFGe
 tLeqhte/cCcUI8fMkyC7x3Ckk3Q0w0MhhmmviSeD5ryWNkn1Lyrwu4KJlXEI6GtDu6J9
 VZuNkeaOZM1yoNtk5Z6kqcv/ZodXuUpSto1QgLWH5U70BwOqmnNuLhl5bVcpAaKhM0w3
 /PZoHHmolDyT7DSjTML+8WfWyor6a67RSuxyyrU18Dy3NnV7MA87GENX83LYYod2Zjz7
 GY2NpSkHSCtzFA3pKL3zqkhetHGHFxelYDexQ+qC5AiQyEq5ST2EDQstHagN+Et8rkgm
 MaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WwVMr3DCxLXykOzNi+Px+mDON8RyJnPpnV4piDeP7As=;
 b=zAAaJp8MOdSfQndQMZmw+obOuTkdR3KU/jxBMDYA0LzKcs7GlE+LNt2rjvQ14AWOWd
 uu/dT5Ol+EwMe1wxYQUiUKB4mLzgBw9gvd3I+JoKSFJ/WyWSGUqFVmV8RGE7ypw1XMH7
 esYxwLCkqCXqUfqO9SKUwvVj3VRHOMoYcIQFuAGRwXlH7cTejCSu3MPb2KQExl0sMC4j
 nOPn0QrAEsSJNTLJZe6GVG8Ogu8MysfEOob4hXNb0Kg8bGWw+rDLdYwfJx8sNUBZD7iJ
 oSMqBENx6SI2HSOlbJOigptkmfHbtk1xg4l6MnO0QgYreg8YmWV54LAHfTa2htGkpSWR
 HIyw==
X-Gm-Message-State: AFqh2kpVnF5qwIMU1xyM1RDpRWu7MZ9s869GQKLNWPQDP2ssR/G5Aizr
 p2RiwJXr+ZadxLbPwp8VIHRhug==
X-Google-Smtp-Source: AMrXdXuE+eMd1GxgNIo2lxDmKGRFEhh3xAQvlEJjTqGLv49KGUgd/jbOzu6r1pGFhfWmNQuGbaFvng==
X-Received: by 2002:a05:6870:5885:b0:14f:b76d:bce4 with SMTP id
 be5-20020a056870588500b0014fb76dbce4mr30123726oab.24.1673452316489; 
 Wed, 11 Jan 2023 07:51:56 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056870418600b00144e18d8525sm7426264oac.25.2023.01.11.07.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:51:55 -0800 (PST)
Message-ID: <46284293-8a49-36f4-c52e-4a976d8b0591@ventanamicro.com>
Date: Wed, 11 Jan 2023 12:51:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] target/riscv/cpu: set cpu->cfg in register_cpu_props()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <20230110201405.247785-2-dbarboza@ventanamicro.com>
 <cbc36e57-6a55-0c96-0170-ff4c0563d556@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <cbc36e57-6a55-0c96-0170-ff4c0563d556@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 15:52:00 -0000



On 1/11/23 02:39, Richard Henderson wrote:
> On 1/10/23 12:14, Daniel Henrique Barboza wrote:
>> +/*
>> + * Register CPU props based on env.misa_ext. If a non-zero
>> + * value was set, register only the required cpu->cfg.ext_*
>> + * properties and leave. env.misa_ext = 0 means that we want
>> + * all the default properties to be registered.
>> + */
>>   static void register_cpu_props(DeviceState *dev)
>
> Suggest invoking this as .instance_post_init hook on TYPE_RISCV_CPU.
> Then you don't need to manually call it on every cpu class.

That would be nice but we have code such as:

@@ -317,7 +310,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
      RISCVCPU *cpu = RISCV_CPU(obj);

      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
      register_cpu_props(DEVICE(obj));
      set_priv_version(env, PRIV_VERSION_1_10_0);
      cpu->cfg.mmu = false; <===========


That are setting cpu->cfg attrs after register_cpu_props(), i.e. "I want the
defaults and these specific settings on top of it".

I can think of a few ways to add a a post_init hook to reduce this code
repetition but I'll need to play around with it a bit first.

Thanks,

Daniel

>
>
> r~


