Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppz2A-0002mN-ED
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz29-0002ly-C9
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:15:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz27-0002mM-Mc
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:15:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso15052015e9.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115310; x=1684707310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xq3F9Yl1mWqXHaoBsdwT39XxG/T+7w5RJ/3RWYE3Aik=;
 b=zKcgdObYL73f/3tiBqshgX230CdyyFG56uQtsfDUro/waopYOPSXNQXqAO+6SCSTqO
 DqsAB1OYN5v4j08YOpplPEMy8fajk9FEztGlCQN+spTfhQN6KPI7IdrsMY0AAcBAGfUy
 nO19i2b5esIJJZj4RCEgtE15TEwQVEunM7cLfJwI+MuqKxbAMGRDN+Sg0qtbygElXCEJ
 hg3F5WTUB7EIdecDK25pnDM5AeoPVqEZ4a7/1PqohPlI4dTHrfewqJWQGHCMn2dqIakD
 r3KtgYxJteLNLXxsjvhyimz15ouKB1KVMY92cMjzc1OeTKj4wJ6wNA9Pn1xpRIEOMTMC
 q9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115310; x=1684707310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xq3F9Yl1mWqXHaoBsdwT39XxG/T+7w5RJ/3RWYE3Aik=;
 b=eZQIzEE/YxKVtpKuqfwu9vOcZFOXmUnqLpAUOAxkAZOXq2gSvgWyI+kvY6biZ8p28z
 zth7d6AfoX8H9V+iVWe06OGG294byuLltOfQJA+Hln8jVx5xWlvY8YlhT554EhZiJYyA
 IWBjbYWkV6PogpvL3735pIoP8s2/vZME/oBGckSD91N8MjOYPy1h23WUN4QpNhs93W4E
 AD8ZPZpw1qMYCvmd8YI/awDAyg9W2PiI4eFpLjqGOPOjhG+sPcXRfYsL+K2QMUpKDiad
 axid5Q03zdGVgfUxd7wugRb58RhIiKJDZWbAplURpnqFDK4+C5oP4VwGPH50yfbX7EVS
 3mFw==
X-Gm-Message-State: AAQBX9ekFflSdsWww+41qQrO5rFgXgk27agE/0D4fsJ9dThxXJ/VW/E+
 MmXXNErpUyD/SoSnUO0T6DAK4Q==
X-Google-Smtp-Source: AKy350aAOjbJ7mr8udrNiDFyrNuG/VJDBcIlijscniOS0fLoBZQ4g+O1k0yjTAFunLw0Isod1ayQhA==
X-Received: by 2002:a05:600c:2145:b0:3f1:9879:5015 with SMTP id
 v5-20020a05600c214500b003f198795015mr360753wml.36.1682115310195; 
 Fri, 21 Apr 2023 15:15:10 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003ee63fe5203sm5881584wma.36.2023.04.21.15.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:15:09 -0700 (PDT)
Message-ID: <7ee63566-e6fa-6d2c-a943-22c2b288b590@linaro.org>
Date: Sat, 22 Apr 2023 00:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 26/54] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Fri, 21 Apr 2023 22:15:13 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)


> @@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   
>       tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
>   
> -    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, 1, oi, data_type, data_reg, addr_reg,

s/1/true/

> +                        s->code_ptr, label_ptr);
>   #else
>       TCGReg index_reg;
>       tcg_target_long disp;
> @@ -1931,7 +1933,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   }
>   
>   static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
> -                            MemOpIdx oi)
> +                            MemOpIdx oi, TCGType data_type)
>   {
>       MemOp opc = get_memop(oi);
>   #ifdef CONFIG_SOFTMMU
> @@ -1947,7 +1949,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   
>       tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
>   
> -    add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, 0, oi, data_type, data_reg, addr_reg,

s/0/false/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


