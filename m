Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF762C54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 12:51:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhqjM-00049U-Vn; Wed, 06 Mar 2024 07:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhqjL-00048s-CQ
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 07:50:43 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhqjJ-00015I-0I
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 07:50:43 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5ce942efda5so5530743a12.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709729439; x=1710334239; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBcbbHbcLf+RNvJ+hljvoKF8DsmGrjB2/Y9nnm1YQD0=;
 b=fIUMNAdoIrHNj+l0ZGYJxj5v/ebngoaqb8yRwzFnXR/aAqR0X7ODo8dGCPYWS/Qh9X
 ps+/vEAzhamGEeONP/zCewe4iLytUBQJc2y0yWC9oIMHUv0SZDzc9g4NBkeLlXbzgWxH
 5pmt8pyONaAv3buaKN8TuMqbGEWpR6dqlUHgpS3mbDfAdR1bKQmqno4EAkHwOS/BAOVa
 ZpXDlS1OO6m4WwyqyV60dSNZMeFSkJ0JrlY+1xdyVFlnnKm7XzoD9sfz+seCY09GutWL
 z3ROreW3jxbETOWQJFZxNHBELVXc/BKagYlSPTdkEZJuNNp7sC+LjUm/51iIlP7RplaQ
 Gklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709729439; x=1710334239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBcbbHbcLf+RNvJ+hljvoKF8DsmGrjB2/Y9nnm1YQD0=;
 b=p50tBBKaUEPNaUoQjVU31cLLPQlK2nGf6ogJDkK5vUUXZvrDTmNAYIIW639XlTz86z
 jJ+CzKesj278idJMOz4DeEuKR4L5c4sQ6SYtM3wITS6nLQD7U/2v+UwpZm6hBP2nJkPT
 qbpK1HQ8IHGt9xvtPzgl9TYaROGYE7lfI4CFgsKyGD1X2E+3MqTQPiNpBczeU2gZQzSy
 D0ULWK1blVc/IfeKem/Cd9yVxFH2EWASxVfsq/1D3em2zmxNWoKyAJacIXSGCJsksagb
 uN3hIwVLO5IHBSAuhSYTw+H0B0ODbMaStk3xzQSYGs5zuXIftg6VddcfAbHvyO6XVSQh
 HesA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd5b90ZkdH1gIRVAD8TdYKVov0mIwvbaRTqrW2rdBNiu8u940I4Wd4SvWEKYoAoGLuhQGVu1FnfLS2piyCiXRtASHm1IY=
X-Gm-Message-State: AOJu0YxOHSLxPRYCc9E98ZY7ywoGXD1rFBVSOGvqSnv7951IOgw3KeVO
 s4lhX9KDtl21e6wET/5SKQbTJwENMh68tm5EqrhyXaD8gImJbYgGHDFzTpMFnx82Q2p1r8G3aLd
 w
X-Google-Smtp-Source: AGHT+IFwDUj631MS59JiSUPlg1ffH5nvTN+j8yjuZaADn92UsK/T0U/j/solmZIkJk7msdSOWunU1w==
X-Received: by 2002:a05:6a20:12ca:b0:1a0:df79:656f with SMTP id
 v10-20020a056a2012ca00b001a0df79656fmr5174930pzg.31.1709729439536; 
 Wed, 06 Mar 2024 04:50:39 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a62e410000000b006e46047fe04sm10706966pfh.204.2024.03.06.04.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 04:50:39 -0800 (PST)
Message-ID: <b754dd39-0faa-4f9b-92cb-9b630a6fac51@ventanamicro.com>
Date: Wed, 6 Mar 2024 09:50:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/intc/riscv_aplic: Fix in_clrip[x] read emulation
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20240306095722.463296-1-apatel@ventanamicro.com>
 <20240306095722.463296-3-apatel@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240306095722.463296-3-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 3/6/24 06:57, Anup Patel wrote:
> The reads to in_clrip[x] registers return rectified input values of the
> interrupt sources.
> 
> A rectified input value of an interrupt source is defined by the section
> "4.5.2 Source configurations (sourcecfg[1]–sourcecfg[1023])" of the RISC-V
> AIA specification as:
> "rectified input value = (incoming wire value) XOR (source is inverted)"
> 
> Update the riscv_aplic_read_input_word() implementation to match the above.
> 
> Fixes: e8f79343cfc8 ("hw/intc: Add RISC-V AIA APLIC device emulation")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aplic.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 775bb96164..6a7fbfa861 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -162,7 +162,7 @@ static bool is_kvm_aia(bool msimode)
>   static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
>                                               uint32_t word)
>   {
> -    uint32_t i, irq, ret = 0;
> +    uint32_t i, irq, sourcecfg, sm, raw_input, irq_inverted, ret = 0;
>   
>       for (i = 0; i < 32; i++) {
>           irq = word * 32 + i;
> @@ -170,7 +170,20 @@ static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
>               continue;
>           }
>   
> -        ret |= ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) << i;
> +        sourcecfg = aplic->sourcecfg[irq];
> +        if (sourcecfg & APLIC_SOURCECFG_D) {
> +            continue;
> +        }
> +
> +        sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
> +        if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
> +            continue;
> +        }
> +
> +        raw_input = (aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0;
> +        irq_inverted = (sm == APLIC_SOURCECFG_SM_LEVEL_LOW ||
> +                        sm == APLIC_SOURCECFG_SM_EDGE_FALL) ? 1 : 0;
> +        ret |= (raw_input ^ irq_inverted) << i;
>       }
>   
>       return ret;

