Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmCz4-0002UI-Fx
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 08:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCyy-0002Tc-KF
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:20:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCyv-0006hQ-W9
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:20:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g5so10726440wrb.5
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AdR/cis2mMTjfqTeFw23e6OnYtotYZMSJaPlWOngn1M=;
 b=QvrFcv6kcGpoH6ND5p+18qkSAGvApqwHjoPruGNRvTF6BRCySPAxK/Om1Xn7DJkce9
 CKgwD3l+nZ7GF+YdhFd0vr2nCqNQ4YIXnN90D/85V8L4X5yUgve72WcA7uxwSyZZjJvY
 cDQka3UCBhB4IbK7RRhWOc7Zs9WxD2QJXWTWU5uxRBe9Jre0TXsqAIguBgwvlqB5yTlj
 eN9qpYB4fbQSd51+ngOhp0cG3qfKu2QvzMZHMfrG77WIQyjTBBiWdKYVV6nj+snL/lI+
 RR4JEY6q7uTM9BEAmY0UYtYDGhnLR+WyNn2BDRf86CiFFpRiCpU07hn55qCoWzvLi4HX
 ScPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AdR/cis2mMTjfqTeFw23e6OnYtotYZMSJaPlWOngn1M=;
 b=thP8ZCi6wkDrQAowV+RdEgscN7/xm0jufzX6bh2/FOMlE/xhmS7TxvrMJXQhdFBeGV
 CL9lDfAD1GYe007ZLPRDZwa1sOTF7NDkLMMEtNtl9xjiZM4g0AHT9beiovVPpfPM4XYQ
 SWVHCXNPBy4H9Y9thhnQ5IracBfStJ0z/CH7j+Ld+w7cWMC7bC8V+qqujU49QlQU6CHu
 iExQjn3QLDJo5mcM0dv8o+RVabQL/2v+JkB/VMNR1WEhY1a2ahDOQ/F5VG9LfsQTBuJN
 eEFBTlaDspVUm84Fu+is4e60sOfyMYzxMp1Exr4CUdgpFycT2L0Hn2CfVsIMereB/Hp1
 mhJg==
X-Gm-Message-State: AAQBX9eyqHQc3Mkc/3RLuoN/7NchM2mBDti0jNWix7W8rEWAow7hi5DD
 lId34FfSzITVyljBVVcJZKwT6w==
X-Google-Smtp-Source: AKy350aBrDNH2PAf5OM8cxzWpOFXUlMb3YxnDekvUx42kWJRZQI/ZRtXeV9+ioMkqUbegdSpY+lHfw==
X-Received: by 2002:a5d:69c8:0:b0:2ef:b341:4a2d with SMTP id
 s8-20020a5d69c8000000b002efb3414a2dmr9748873wrw.24.1681215614546; 
 Tue, 11 Apr 2023 05:20:14 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d514c000000b002c561805a4csm14460067wrt.45.2023.04.11.05.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:20:14 -0700 (PDT)
Message-ID: <8127465c-79d9-aa94-4c3a-3c413934780a@linaro.org>
Date: Tue, 11 Apr 2023 14:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 26/42] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 12:20:24 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)


>   static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
> -                            MemOpIdx oi)
> +                            MemOpIdx oi, TCGType d_type)
>   {
>       MemOp opc = get_memop(oi);
>   #ifdef CONFIG_SOFTMMU
> @@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   
>       tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
>   
> -    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, 1, oi, d_type, data_reg, addr_reg,
> +                        s->code_ptr, label_ptr);

s/1/true/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


