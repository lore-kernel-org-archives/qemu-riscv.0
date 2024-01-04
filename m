Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE6C47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 18:00:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLRzj-00084G-Gg; Thu, 04 Jan 2024 12:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLRzU-00081o-4H
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 12:58:49 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLRzS-0004Lw-AL
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 12:58:47 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a29058bb2ceso22817266b.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Jan 2024 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704391123; x=1704995923; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/LKo2C5CZxR+iHnLgYm18JKD3MaNG3AbgeuPt+Xvk4Y=;
 b=GWmKG6vR99lLBQbJ+LKu8j6XTvrG79tJ9Bk5W0vDnLIuA2NgN6uEo8yS0uLioiq+bN
 Bjtt32KTrJe8zjEc3BQNFqoWikoKPxFvhiRKAGNOq95K5uGyjBg0ZtKkG4p/obnfFqhA
 b60g2tlb/EB8r+xUCXr7t5TsFdLmU39Nxogk54V4SCoLsXv82dFe1S75BZ2oxOHngumd
 wtuKXEiyd6PRcC8RilA1sbWEx+qOgU8X1lxbG7kaqC5s/kof9NZcjT3KFrsVRM8y3322
 onGXc7XNwp2CZyDNT2v0aFYb81I0VSlZSwGBa1q/gMD8g7iNHm2McsbQJ+syHdHMQIRv
 MM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704391123; x=1704995923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/LKo2C5CZxR+iHnLgYm18JKD3MaNG3AbgeuPt+Xvk4Y=;
 b=Gz5fZ495EMEvMgVr5Q/rS6VDpOF8dFISdPcG7pspxIWEGcc2DtUwysu41Dq5buX+hO
 iQIxaH4WnMCfZvtNaS3AGhR9e7GrAbs8kct3Ioqfn6dSU5hcj3QjntuFSGJ/vTjHVQCV
 l7iXNAn+4LlCt8JtM832p8HUYXJZu3U+9iB2NN0dxyy1QwHZGWomqA994ZKAQ7hCZyBw
 zbvZmM1lusy40I0U6KyR4MOTIaj8rhBGtOIVuKYv1kco+Vdusb4ZxsrVv+fej999p5H1
 MV54hgh7yMcTm3kC+nCx2eNQZIfb/ahUWcqAy3Ak9SGVDXFe8o+W4XmmBZf3rDvhVDJI
 BL+A==
X-Gm-Message-State: AOJu0Ywtd9n0gG9McBEIiCKtmuhsbN+vbxp/qe3chcZhTdDAPasf9SFI
 MGFncb3bOPkPDD8CjKKELtPm+6anOSrBXw==
X-Google-Smtp-Source: AGHT+IGkcc1wpzJVybfZzb7KEiMBWqthhQSUJmv8QaffAc1iapxvh/OrBKT8JLmM7D+61IvgzlhDoQ==
X-Received: by 2002:a17:907:3209:b0:a28:ab54:4e81 with SMTP id
 xg9-20020a170907320900b00a28ab544e81mr473891ejb.150.1704391122854; 
 Thu, 04 Jan 2024 09:58:42 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a170906704d00b00a27af2cf7c3sm5796066ejj.175.2024.01.04.09.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 09:58:42 -0800 (PST)
Message-ID: <9fcd0827-a729-4cf8-a6ab-93cda04d88f9@linaro.org>
Date: Thu, 4 Jan 2024 18:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/31] target/alpha: Remove 'ev67' CPU class
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-2-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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

On 15/11/23 00:55, Gavin Shan wrote:
> 'ev67' CPU class will be returned to match everything, which makes
> no sense as mentioned in the comments. Remove the logic to fall
> back to 'ev67' CPU class to match everything.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/alpha/cpu.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 39cf841b3e..91fe8ae095 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -141,11 +141,8 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -
> -    /* TODO: remove match everything nonsense */
> -    if (!oc || object_class_is_abstract(oc)) {
> -        /* Default to ev67; no reason not to emulate insns by default. */
> -        oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
> +    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
> +        return NULL;
>       }

This breaks linux-user:

qemu-alpha: unable to find CPU model 'any'

