Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6564DC7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:30:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8hcT-0001Qg-BM; Mon, 12 Jun 2023 09:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hbH-0000pN-JH; Mon, 12 Jun 2023 09:28:56 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hbG-0003o3-0F; Mon, 12 Jun 2023 09:28:51 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1a1fa977667so2847848fac.1; 
 Mon, 12 Jun 2023 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576528; x=1689168528;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oq75FS5O+TGyHcGuY002+D2eSqgy0kMaom//55soKN0=;
 b=oUqQtms9hlTN+5UhBvfBr29FLVvlIqj3jGdjggqRn3wJKDYSuXRwDTpbVg6L2sATp3
 9+lhMBE88qdcNFIpxn4YVjBTsxrB21z9OfWcFTZK1CcPRm9eKKKW40gHSkv4+sWlA7W1
 9anvocr8y3mr8q71tZEiJ4/70N/VtGOWy473gB8shdmmEbmR11iHnG77BwK8S6ZhHQ6X
 AADEkVcDjZX3+sarT68kxGTBze8ByqJvCfZDraXhDp0wVS7DhJg7xKCewK4Qgee5orZC
 CSAhz/H5TUqBWgOU7JXqprEE6utzUHmu3z0/hyhNxR/ce1lzNS0M4EYyVBLVAIk5woa7
 3jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576528; x=1689168528;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oq75FS5O+TGyHcGuY002+D2eSqgy0kMaom//55soKN0=;
 b=AEk16Vj3cHTZSGy1v4IAv12rRrDDuKiXaWtzta5UXqEtav22S1KdpasEhIGuFGVl8a
 0sJ1h7k9EsHAftIUkqxgreuRBLUjjV/eo7KQ6/8yqT4wXjDpHaYLClDEsz+FkoO4IZVa
 2dEDkzj+ze0XxjjHAZ9OSc5WYwGecp0ZScmiP+0gZLadf/XoLJCQE2nja0GwSelOd0Fx
 vjdE49vUW440kW/06kf7qHaVK8xSFSh8VYFfTRYUVUGTT5EwdY9Os9w8aIRGI2aSNAa2
 iGN9vdD62CuPZosq6X6CY4gfxJ18t9jnJUTRz9eI4PAr9qfJo9EVs588StAfiOPbCdGO
 CKyQ==
X-Gm-Message-State: AC+VfDxNnw96yaQaZxQFHlthuSCqtdcP2PEUjSGDGFDclEdEZaHkSi4t
 N0d/UBE2HCsGNeSqel8vWe1B+mDFSv0=
X-Google-Smtp-Source: ACHHUZ4DeDgybEEL+dcoaZNm3A19vaz4jaRL77nAulUU9sAtgbLsgOL3qS1haGvAvQUgnWeOKebqxQ==
X-Received: by 2002:a05:6871:44c:b0:1a6:751e:3dfc with SMTP id
 e12-20020a056871044c00b001a6751e3dfcmr2410431oag.5.1686576527831; 
 Mon, 12 Jun 2023 06:28:47 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056830104500b006b169acf1b5sm3860730otp.63.2023.06.12.06.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:28:47 -0700 (PDT)
Message-ID: <03be94a3-a891-fc5a-abc2-5bcb3c5009ff@gmail.com>
Date: Mon, 12 Jun 2023 10:28:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 31/38] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-32-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.096,
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



On 6/8/23 23:23, Richard Henderson wrote:
> This implements the VNCIPHER instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 1e477924b7..834da80fe3 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2947,22 +2947,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   
>   void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -    /* This differs from what is written in ISA V2.07.  The RTL is */
> -    /* incorrect and will be fixed in V2.07B.                      */
> -    int i;
> -    ppc_avr_t tmp;
> +    AESState *ad = (AESState *)r;
> +    AESState *st = (AESState *)a;
> +    AESState *rk = (AESState *)b;
>   
> -    VECTOR_FOR_INORDER_I(i, u8) {
> -        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
> -    }
> -
> -    VECTOR_FOR_INORDER_I(i, u32) {
> -        r->VsrW(i) =
> -            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
> -            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
> -            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
> -            AES_imc[tmp.VsrB(4 * i + 3)][3];
> -    }
> +    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
>   }
>   
>   void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)

