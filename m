Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7911AC7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8haZ-0007mr-GN; Mon, 12 Jun 2023 09:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8haW-0007j7-4p; Mon, 12 Jun 2023 09:28:04 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8haU-0003d5-Bt; Mon, 12 Jun 2023 09:28:03 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-558a7faa989so2887184eaf.1; 
 Mon, 12 Jun 2023 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576480; x=1689168480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YhbAcTLh57k8xBHEyINhzUo+2BvmLiZQZikW0f57zSc=;
 b=FG1FPSFaW1DK985/in4Pt/nri5c20683Xdj/4hQTvl4jxXI9TewqET7cZAfZIGrPvN
 0wp3r8lH1NS7+FwgP40bNeH2j6J2iKkymxh34zOMRGBkU9SudI18HtLwzcZgGzM49eVq
 fuUOZn8CTF5N9jmXQjRCJvQw4QuzYvceROefeP30Trbiq2k0JqUhjht/Q188HQrmQ0K2
 JvBANAljGhDwL7PawFCz6N78x7nIEZ7sEewvS6VTBg6zOKAUkEAykGwiCMGbXqVYE3FF
 JfWdbe3Ckn6Dz21P++IrZEiYkI3ScWhsESPBzI5LEuFc0xZ9PzLT7b1no+f+4pSOIVMf
 2BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576480; x=1689168480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhbAcTLh57k8xBHEyINhzUo+2BvmLiZQZikW0f57zSc=;
 b=IbGd8HV1Juf/Xs+O0teNqVH+5bNJVVKuwCrmbZbBssTHnlT6rEwMVOC6YH4TNEcJty
 cj3leBoRcmCldGEjBaVHu1nNBJfQOCMGoySwSho5kIuZ1cAWYLN2gttlhaxesGf0sYy0
 r1paQDLHXjGXcvMu2bkBQQp0HUocZm3rMw4590thqon98YTxaJ2DvVjIz9Z3qAqE1WYx
 LgciI49bjmbgMZlrwFkOBl3NlfvdxFt2NyjrYh1Eva+RMpdDo33cZwynIAQmdTfxadTp
 j1pdf6mfBfenzyDogVTuFlxHeYKgXgW8ID8+lKR4T7/JCUubeewP0xBkH1dz2PGWcalM
 dwyQ==
X-Gm-Message-State: AC+VfDwH49fzIhGBAboXZPg1Tf0y6UQU68c9rhFSsDKADhkmAcQki+PF
 SOT5JtYNsqmxnto8Rv19yac=
X-Google-Smtp-Source: ACHHUZ636fWr6si+23ZdR86KlA1AR5++O/QtqP+9/tL55r1eNEwjEb/lGC5KnDpz/JWqv0uPiJEVOA==
X-Received: by 2002:a05:6820:1b95:b0:558:b26b:6442 with SMTP id
 cb21-20020a0568201b9500b00558b26b6442mr5778714oob.6.1686576479878; 
 Mon, 12 Jun 2023 06:27:59 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a4ad025000000b0055b333a3af1sm3171820oor.13.2023.06.12.06.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:27:59 -0700 (PDT)
Message-ID: <fe568cb8-b48f-d72e-a3ff-a5bd32662566@gmail.com>
Date: Mon, 12 Jun 2023 10:27:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 15/38] target/ppc: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-16-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc36.google.com
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
> This implements the VNCIPHERLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 34257e9d76..15f07fca2b 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2973,13 +2973,7 @@ void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   
>   void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -    ppc_avr_t result;
> -    int i;
> -
> -    VECTOR_FOR_INORDER_I(i, u8) {
> -        result.VsrB(i) = b->VsrB(i) ^ (AES_isbox[a->VsrB(AES_ishifts[i])]);
> -    }
> -    *r = result;
> +    aesdec_ISB_ISR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
>   }
>   
>   void helper_vshasigmaw(ppc_avr_t *r,  ppc_avr_t *a, uint32_t st_six)

