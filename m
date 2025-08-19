Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A751CA0EEB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uoUtn-00058T-4u; Tue, 19 Aug 2025 18:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUtl-000570-83
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:33:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUti-0006y6-9l
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:33:44 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-323267872f3so5051297a91.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Aug 2025 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755642820; x=1756247620; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EecAmkTmFpVA3qOBBByQgMFEMgwekptfdvHKr+SlSdc=;
 b=yUmMWUiEASWETBP9prGaUsjezNJa4DRdFSSsFGO0Y/95sTJ6/F8CKOUlt0BFZuNH9F
 KGFCxcIRT0kAJH+OBC73NRGgiUp5qXlxrtBe8RNTQPzexiC2SDjZTUWPHsZVqUYs8/7S
 0N5IIJL9yGAv3Tt1D12HHHuOI3s8MJJoXoCdhNPXl8wSn/YihqO9ql9xA3JGUqYEbyym
 twkUNszcTX77sXpdhGEqAC4hwj5z0JCgzBJqvVw8064SxSXWBQYdIG05WHA5tmLRKmI4
 ztL1+lc7NFFzpVh/D7nJ+smhVCeBRNqpUR1QJ/gxf+K1XJo5Qr0ZEevhbgdAt87rA/tL
 G16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755642820; x=1756247620;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EecAmkTmFpVA3qOBBByQgMFEMgwekptfdvHKr+SlSdc=;
 b=RE6iv2ioIUe6MaR6Wr3NuVIfio3U6h7XOBQrh0hM1Hiz2tfYDuzpgZ7SNDvbLj5eiA
 ZRAKsBP7YpSDfi737np7vR9ODbBiNQiBevyuYbRNIAAL+IDC8AxVS1Eu95t0hV2cko5J
 igeFDaKkGIV6M6XWSn2ZTxwAjPNKwAm/apfKPRlcLGrra7UpO6Rj2vsNHmNJ2YFIDU0K
 Bn0R6l+kqG9e7bI1I4GPRtQQ5tZ2/0bKrrJwPB96+fzZnN/lZlCiMRLMQHgKWjsfTo2F
 fQ0tfBZPO7jg6DIjgCmh8XQpaHPb/NOcSZJpFBHU6GVEvgUxi/UqTAdFY4tlpkUAdQHI
 F0Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW/hxJ9TNCqQ+3v6XtMqY0X1FUcSxdg+8+REPvj269SMgmaD6nAmbqFUPTk+2ODWDZxt8ljE7+9C8Z@nongnu.org
X-Gm-Message-State: AOJu0YyjJRgLQVzVi0QW/p/WO9B2RV1Q5vEbxWBzOozaltmqrTN9wlZq
 29Iw7W3O/o8zOcqXSOoEvatMJmuELuOsesXWXlhZOjYV9cd8ZrWcmqIGQEKzTcKwQF8=
X-Gm-Gg: ASbGnctDk0ifwrrG1MT9gvXcjtey36CIivF8N4ql13Dfkgs7wc8ImZWbuSg0Rl/OBdQ
 XiszzV3MSNwNkkuMVur3EFFmZRoqAby2nJryGWfY6KEC73QGkjW0UN2C8iVnkzDuIGxIdWjNB4r
 4xGJpIwX/nzX/X1sJX/OD/IG7Z1A+ZOPOyIGvHinpPWOiHNuItmnjzK4nEPHGfZPqqrW6JEqitQ
 TD6oxhnqNtE8/BkamBWPW8vTfVSnPhvsdA/0P6q4ePE7SVDpsCMPEE74nIdpfK1XqkENMzkvAWb
 1fQc+pyUI1tS2ekF1GZy8xnq9W+eTCW5ERsAyywB/ceHYsQssU415tpD2f371114OP4rMZjs+oM
 CRpXyPMKHxkfZrO2YjCj+db9ITEduXNBsxQ==
X-Google-Smtp-Source: AGHT+IFmMIgsxmzoZFMZzx1pIAMpHJ5dDbCgTAV80a5vGKt1ge/W6NTZSuayF6cSU2E0X7hkbVz7nQ==
X-Received: by 2002:a17:90b:3511:b0:31f:253e:d34f with SMTP id
 98e67ed59e1d1-324e142051bmr1030264a91.19.1755642820510; 
 Tue, 19 Aug 2025 15:33:40 -0700 (PDT)
Received: from [10.0.0.90] ([120.159.20.238]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e2625998sm226275a91.16.2025.08.19.15.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 15:33:40 -0700 (PDT)
Message-ID: <ac5ac33d-26a7-4be6-bf02-75fa61d3ad9a@linaro.org>
Date: Wed, 20 Aug 2025 08:33:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/35] tcg/wasm: Add andc/orc/eqv/nand/nor instructions
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1755623521.git.ktokunaga.mail@gmail.com>
 <cf283ca6c957d3c454facb228000129c171c904f.1755623522.git.ktokunaga.mail@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <cf283ca6c957d3c454facb228000129c171c904f.1755623522.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/20/25 04:21, Kohei Tokunaga wrote:
> This commit implements andc, orc, eqv, nand and nor operations using Wasm
> instructions.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   tcg/wasm/tcg-target.c.inc | 55 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/tcg/wasm/tcg-target.c.inc b/tcg/wasm/tcg-target.c.inc
> index 01ef7d32f3..3c0374cd01 100644
> --- a/tcg/wasm/tcg-target.c.inc
> +++ b/tcg/wasm/tcg-target.c.inc
> @@ -449,6 +449,56 @@ static void tcg_wasm_out_cond(
>       }
>   }
>   
> +static void tcg_wasm_out_andc(
> +    TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)
> +{
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg1));
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg2));
> +    tcg_wasm_out_op_not(s);
> +    tcg_wasm_out_op(s, OPC_I64_AND);
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
> +}

Don't implement stuff that's not present in the ISA.
This will be handled generically.


r~

