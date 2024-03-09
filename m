Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2501C54791
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 18:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rj1nW-0004pF-Vc; Sat, 09 Mar 2024 13:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rj1nS-0004o9-KX
 for qemu-riscv@nongnu.org; Sat, 09 Mar 2024 13:51:50 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rj1nR-0006Vc-4g
 for qemu-riscv@nongnu.org; Sat, 09 Mar 2024 13:51:50 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6e5b1c6daa3so1639429b3a.1
 for <qemu-riscv@nongnu.org>; Sat, 09 Mar 2024 10:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710010307; x=1710615107; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qT8iUAa/HsiarKSfacdT/ihvRTQvCnNoDb8cPYRBY+8=;
 b=TiUK9HW5AgMmCrPMt/8I1TusO9jd9C94IJPh5dt4BLELId2D12dn0fNzOGqU0p6n+9
 Ioh0MhmrRx6CI41qhcKGr+p9hwyF/SE1JJnIhYqbVg+KJDQDIm2QuV+DuAFKXJvrN9em
 0yBim/hZzgvJ3p+Jb+xPfhRbybWrhJGesQuSLQvx+0KDtaHSK6eZRMLkBJ/bVnt4qNj2
 xNMXyH307N95LKvZH7ratfC1yRw5b/uFkK84fMn2ywqQiVShcRkmAu5xIp7tf/xSE+gn
 eDVqrwDEuRde3TyFKg5t0jrDfbc7oRchxTWG0WrySL79L68NM9gLJuyToB8f5ocipswv
 B2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710010307; x=1710615107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qT8iUAa/HsiarKSfacdT/ihvRTQvCnNoDb8cPYRBY+8=;
 b=NEjkmdZFpijPprc0KL4v3vHyhSa+sk2Iu/0HcGYTibdteDB8gL2HqwZg8FmE0udoJL
 EVn3zA7Hz3ZGbew6MY5xH4Yw0L3xeVhTE38MDdGLpHGUihsZ5Nuj6R1I4zv3G6n68Wn2
 xpewiUpodyUuamLv77fWgMHq3ICF1mgX+xYS4owbHgHtRs1V7uKchB6iFCUkxGtnCEhq
 L6UC7FgTYKJ/ZjcOqDCsesM3/51O51p5jQpNdklI1c+dNN6R0uSoFx5hTCShyU+PTJ/b
 i9AwX+f4r3bIlv2REDDEEG2IKxf3nXz8euJi+7AJJXKCQSCKOu8psLqvQLWAR5S2thlL
 joBg==
X-Gm-Message-State: AOJu0YwZLd8lu2ntzcpDaqku2cPLriLD9GnfakVvHGRe3tyZc6d3KzjP
 cqRbSlrJ2VLjHgpK4tO0zvIeQqhnN0hcb/r1dUJYz/dT7MkbJ3hwuzSYKtewKWk=
X-Google-Smtp-Source: AGHT+IH5YljeZTCf29pwdec4hg5/7D/L2JhplHrZWKI8vPD7tbYuPNLNIhMew1VJ2zbT4nsQ1VlDZQ==
X-Received: by 2002:a05:6a20:d906:b0:1a2:a596:4dce with SMTP id
 jd6-20020a056a20d90600b001a2a5964dcemr3034822pzb.58.1710010306872; 
 Sat, 09 Mar 2024 10:51:46 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 m14-20020a63ed4e000000b005dc816b2369sm1590261pgk.28.2024.03.09.10.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 10:51:46 -0800 (PST)
Message-ID: <22c0cbee-a6f7-48e2-9a94-47bcc92b096f@linaro.org>
Date: Sat, 9 Mar 2024 08:51:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/10] trans_rvv.c.inc: set vstart = 0 in int scalar
 move insns
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240308215402.117405-1-dbarboza@ventanamicro.com>
 <20240308215402.117405-7-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240308215402.117405-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 3/8/24 11:53, Daniel Henrique Barboza wrote:
> trans_vmv_x_s, trans_vmv_s_x, trans_vfmv_f_s and trans_vfmv_s_f aren't
> setting vstart = 0 after execution. This is usually done by a helper in
> vector_helper.c but these functions don't use helpers.
> 
> We'll set vstart after any potential 'over' brconds, and that will also
> mandate a mark_vs_dirty() too.
> 
> Fixes: dedc53cbc9 ("target/riscv: rvv-1.0: integer scalar move instructions")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index e42728990e..f3caabc101 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3356,6 +3356,13 @@ static void vec_element_storei(DisasContext *s, int vreg,
>       store_element(val, tcg_env, endian_ofs(s, vreg, idx), s->sew);
>   }
>   
> +static void vec_set_vstart_zero(void)
> +{
> +    TCGv_i32 t_zero = tcg_constant_i32(0);
> +
> +    tcg_gen_st_i32(t_zero, tcg_env, offsetof(CPURISCVState, vstart));
> +}

If you have not removed cpu_vstart, then you must use tcg_gen_movi_i32.
You cannot write to the backing store behind tcg's back.


r~

