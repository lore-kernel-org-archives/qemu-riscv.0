Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39FCD0E6C5
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:57:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqjR-0001Ck-9W; Tue, 25 Nov 2025 05:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqjM-0000o9-Ul
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:57:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqjL-0001xr-19
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:57:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so30244655e9.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068225; x=1764673025; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8F+7XBbj8dMCWClWSWjNz2+XpUchu80kvzZ8tPKf/Jg=;
 b=XqiIIBhIvGV1vaEWK96Jjq7jqa/K8kAHqM/c0qkEPm/iV0qnCnXHeSYHp6QoIZm3RH
 x7zZQVszdZ5nTwoivuMqUevVmsCoKCBS7D25oq7fRyRxwB3AiQknJ6kohhTpL7KzFv85
 KAnBSrE1RfJR1vWm+bd94ATn236rwMY1JQusN0Q3mACUb9Ret4o9FPhSSdBiR9PVoHnm
 OdyrWeveH+ovNUA/KlzvaXRWKNLBFQPXZeXPGZN0hi+MU/GC7C+LLzQ6iDK8bQz8vwBJ
 UizNeJAt1sIq9TdtFNHV2urD3kKXIFIcxkjUaHqK1C1nHs+3Y+NaI0hFBNG3PiIhit3v
 deHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068225; x=1764673025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8F+7XBbj8dMCWClWSWjNz2+XpUchu80kvzZ8tPKf/Jg=;
 b=eoMzRHl8/g7ZY8P7Zp2+CKrifpNBoQ51QZQpFAvq1tbU4R3t3ngms6LARjcZhZpsD0
 tK/ZdoeO/FCbVqdBEUQPWMrZ6PLgLDV7JT21NGHMN2AZXtDFejX3Au9YNkR93DsjpSGT
 s28SXO6dxg0eB2c75cBnCeZLUwPloeCitcgk0ia/uLy8kKd/1RrMrIBNfGFiAQ/Osgpz
 mHJzsS7+vQajYIAZw27ZjKzZBdb8ZCgmFcut8dciFBiqhfqi4cE+5W+20jWHRybuCHru
 B+m+ip2/2SEHNsFtIkKveVw7XUjuurvKQJVfyicnp+Md7G01sfnPK4faiy2tJ8u6cGd4
 wlNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0uoQfYcDp+WXlR702y9NNSJRAW6P8T5dijl5XIRBFTN4+a+lUn29IdG/Klopi/8kFvYaGa3QtoenO@nongnu.org
X-Gm-Message-State: AOJu0Yz/q2YJqkRzgfYOxdS8nWCB/aBEy8i99jsVerelXWyQCSg7/q8H
 Kfeb9YJV28VUIqTja6fJoWS6Wa/xkq3czKIaLOncQldwz7i+FRpstj80sDHiiMDdbUYA8Iu8p0H
 GzKNXnol1lQ==
X-Gm-Gg: ASbGncvVwPRa+PlAr11Ta+9xxccwgQuHk81Gefs1p2rkAJF08jnyjpx9+XehPaX8qaL
 POr/xAh+jh8bBIELs2rM6nTbZyMqkX9ivjqOmazudHMDLDhbEsLssTUiKwtWqt4WYheD1pL5JIZ
 CyJ6/YnrFt1VhGxCmMolRH7YTSZpFIesqLOHx3EfH+jFOnOCBTD391EUEx7o+PyAyRGTa0hL6XQ
 fKD5hjkk7XJb7bXaLxtCR2S2HQMUBpK+VAjbMOafbxSIVDoR2wwoOwwtIkcrZOxzl+a4V2hzGHZ
 1SBZY7cQuhYE6mr2ww7zHGpoo2i2tNsWL6S1Q3Ph65X9VPr5dTIb3O7Dfr11xu/num6fPQw7WJw
 jt4Ycsb8o59d/yaNIDwTO9onotwU0hcwzEisI0qanrRN7l32dQWEE989ZeyOET2w99mc+EeeYE3
 D10e9S50XSbykNmfKzj2Aox3mxhTxgncA8ojvkz6DYUybJ7Cb9sIfsGg==
X-Google-Smtp-Source: AGHT+IFgr2ULu6OeQVHYV1WhuPkFgtUzDYCjKxF1hMHvtSEPDSxh/PAZk5fAzNXco65utjHs7Sv7/A==
X-Received: by 2002:a05:600c:5253:b0:477:63dc:be00 with SMTP id
 5b1f17b1804b1-477c01bf726mr120223685e9.25.1764068225122; 
 Tue, 25 Nov 2025 02:57:05 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf227ae2sm243420425e9.9.2025.11.25.02.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:57:04 -0800 (PST)
Message-ID: <0d10960f-0046-454b-985a-da663e9202a8@linaro.org>
Date: Tue, 25 Nov 2025 11:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 02/12] target/tricore: Use little-endian variant
 of cpu_ld/st_data*()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20251125105434.92355-1-philmd@linaro.org>
 <20251125105434.92355-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251125105434.92355-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 25/11/25 11:54, Philippe Mathieu-Daudé wrote:
> We only build the TriCore target using little endianness order,
> therefore the cpu_ld/st_data*() definitions expand to the little
> endian declarations. Use the explicit little-endian variants.
> 
> Mechanical change running:
> 
>    $ tgt=tricore; \
>      end=le; \
>      for op in data mmuidx_ra; do \
>        for ac in uw sw l q; do \
>          sed -i -e "s/cpu_ld${ac}_${op}/cpu_ld${ac}_${end}_${op}/" \
>                    $(git grep -l cpu_ target/${tgt}/); \
>        done;
>        for ac in w l q; do \
>          sed -i -e "s/cpu_st${ac}_${op}/cpu_st${ac}_${end}_${op}/" \
>                    $(git grep -l cpu_ target/${tgt}/); \
>        done;
>      done
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/tricore/op_helper.c | 152 ++++++++++++++++++-------------------
>   1 file changed, 76 insertions(+), 76 deletions(-)
> 
> diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
> index 2c8281a67e0..88b50bc1a9b 100644
> --- a/target/tricore/op_helper.c
> +++ b/target/tricore/op_helper.c
> @@ -2451,84 +2451,84 @@ static bool cdc_zero(uint32_t *psw)
>   
>   static void save_context_upper(CPUTriCoreState *env, uint32_t ea)
>   {
> -    cpu_stl_data(env, ea, env->PCXI);
> -    cpu_stl_data(env, ea+4, psw_read(env));
> -    cpu_stl_data(env, ea+8, env->gpr_a[10]);
> -    cpu_stl_data(env, ea+12, env->gpr_a[11]);
> -    cpu_stl_data(env, ea+16, env->gpr_d[8]);
> -    cpu_stl_data(env, ea+20, env->gpr_d[9]);
> -    cpu_stl_data(env, ea+24, env->gpr_d[10]);
> -    cpu_stl_data(env, ea+28, env->gpr_d[11]);
> -    cpu_stl_data(env, ea+32, env->gpr_a[12]);
> -    cpu_stl_data(env, ea+36, env->gpr_a[13]);
> -    cpu_stl_data(env, ea+40, env->gpr_a[14]);
> -    cpu_stl_data(env, ea+44, env->gpr_a[15]);
> -    cpu_stl_data(env, ea+48, env->gpr_d[12]);
> -    cpu_stl_data(env, ea+52, env->gpr_d[13]);
> -    cpu_stl_data(env, ea+56, env->gpr_d[14]);
> -    cpu_stl_data(env, ea+60, env->gpr_d[15]);
> +    cpu_stl_le_data(env, ea, env->PCXI);
> +    cpu_stl_le_data(env, ea+4, psw_read(env));
> +    cpu_stl_le_data(env, ea+8, env->gpr_a[10]);
> +    cpu_stl_le_data(env, ea+12, env->gpr_a[11]);
> +    cpu_stl_le_data(env, ea+16, env->gpr_d[8]);
> +    cpu_stl_le_data(env, ea+20, env->gpr_d[9]);
> +    cpu_stl_le_data(env, ea+24, env->gpr_d[10]);
> +    cpu_stl_le_data(env, ea+28, env->gpr_d[11]);
> +    cpu_stl_le_data(env, ea+32, env->gpr_a[12]);
> +    cpu_stl_le_data(env, ea+36, env->gpr_a[13]);
> +    cpu_stl_le_data(env, ea+40, env->gpr_a[14]);
> +    cpu_stl_le_data(env, ea+44, env->gpr_a[15]);
> +    cpu_stl_le_data(env, ea+48, env->gpr_d[12]);
> +    cpu_stl_le_data(env, ea+52, env->gpr_d[13]);
> +    cpu_stl_le_data(env, ea+56, env->gpr_d[14]);
> +    cpu_stl_le_data(env, ea+60, env->gpr_d[15]);
>   }

Pre-existing checkpatch error that can be fixed:

   ERROR: spaces required around that '+' (ctx:VxV)
   #56: FILE: target/tricore/op_helper.c:2455:
   +    cpu_stl_le_data(env, ea+4, psw_read(env));
                             ^

