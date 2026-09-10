Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758EBC88E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 00:31:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4p9O-0007QX-Vj; Thu, 10 Sep 2026 20:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4mzz-00020t-Ul
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 18:12:14 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4mzu-000413-3R
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 18:12:01 -0400
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-939adff838bso21906685a.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789078317; x=1789683117; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DV73oYpng3J7iEjGFOGPicTrFECy5Y/6yRi94AHW2cM=;
 b=yyibTgHRuotLyb/Yo2Yb7WtDZLcdddRsGuhiphw3rDewupDI0pa2VhAnC3eorH+tWh
 FQh9LNXXdwCXxD33926IS9uogeXxVUXSwtuFQDvq2dCcsZZ4P/pf+HRVbaPtKJlQtZQC
 XUq6EKhoh7qUaAeo8WuCa6DESV1PrnEVf8W1BN2zCkFX1LKybR6arzOIq5qMLZKNpU80
 KbRbNRZpXE51YP1abUf900ULxo0/75iKtFbOUapssavN2Z3GaxWfu6TWEXWbrj/qA5bH
 FdnggtwmijY9hCWq33zaOb9DsuV7ZzH3Da04PwpM0EI75X6FErk+p4HZxkZjqAHd5I+W
 vsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789078317; x=1789683117;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DV73oYpng3J7iEjGFOGPicTrFECy5Y/6yRi94AHW2cM=;
 b=AhKPV+t1ZshSz8XCoQDv3scS+YNCX9Et65z9UHnV1ZQ5lkZGnSvDefBTJE1B0bh56K
 oEYqFZCDBmy1qvwXGPyMPqHUFetxhJVUDR/nPVAZh8x1fvOPeAVsbjV6WC/pVnWw7ldq
 x2vOOeiSaX3t5rZjjoXHhrPfaSyVXXx29/hRUFKCQshC5xLtwlihUC1s7IyWbwLnVpXI
 0aRMN0MGL4wJZbhTATkVbRHFU7068tOpkBS02Zm7hebAgSui4pW/5AyF+Q9pXl/ILsiG
 sRdkYh8QsEvPk6wgYEkDre5/goRNkw5BDlRx+9VVA9iOOT7fcpf1NPUCooyxjIjSzhcU
 Zk6g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxw5JGmGTDUXocoo0trcLViyhgmO51T66S8hJFczQouinoClX48Wr6ZTT4OFW8FcbsS/RTgNbrNmQZL@nongnu.org
X-Gm-Message-State: AFuF++lj9qrz/4tuP1XSVJavTLyUQ/oewjp3aG4QXdxp24L0kMG8ykSq
 WIrowgf8Mf34sPtkv0budNFGIfuaqnc66cm1NgthW2NCi6WwUAxSrrKDrVGkjVYNtVA=
X-Gm-Gg: AYBFou3Ie7hiZa1jaFLiE28ehNyiArgEZSQd91/cHVHiG+feD8bjPh5kbHKUgCCQF+V
 lsML/3RgOwWpxrbohCSuFvaT4jxqBgPbcPz7TxV7oZuzSf0RfxI1Aze/lu6+Ns1w0Y9h2XDXz3S
 FE6jFc5c9kFL9Z8yFqfy3g0cukRx1uGf8E646NZ/eGZRT2FS3Ps0QwiAW7s+oEM3EIC0atZNlZ/
 o+pA76BZDb7bREn6eCsa7946YBgns7PFcVE5c2NbB+JAJvBSaMRVjC5bZjCiP5L7jtYUCe9O7gC
 5X6wVQICQW1BdV0QRU9+S0F4yWMsnIgYwWC4i9NLHUkSwlUUKtH/Q6l5IlJwdxHw1tJVNDcLPh3
 fKrI3RJROTUd5/8LVQ2QEv3lBb6TonbS28lWshytErfaxJtWeKD1tA5AD3xzDQyiJKNcSf+ABZ1
 c5902N5/gG8d863WJYjsPkjX0PFpqh+zUDwvihD594oecIoToSvgpxcfE5UoYIGGiXWy+u3o5rY
 fGND65qLuVGxk4=
X-Received: by 2002:a05:620a:2893:b0:939:365a:49a5 with SMTP id
 af79cd13be357-939ea13c7a5mr141949585a.27.1789078316611; 
 Thu, 10 Sep 2026 15:11:56 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e8bf9d51sm73961485a.14.2026.09.10.15.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 15:11:56 -0700 (PDT)
Message-ID: <784414c5-0e93-442e-844e-79c648964a92@linaro.org>
Date: Thu, 10 Sep 2026 12:11:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv64: Set vtype before whole-register vector moves
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
References: <20260903170011.3627720-1-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260903170011.3627720-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

On 9/3/26 07:00, Max Chou wrote:
> According to the RISC-V unpriviledge spec,
>    "vset{i}vl{i} and whole register loads and stores do not depend upon
>     vtype."
> The whole-register vector move instructions reuqire legal vtype that
> trap when VILL is set.
> 
> The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
> OPC_VMVNR_V.
> 
> Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
> index 2ce9d47a633..fbfb4c44470 100644
> --- a/tcg/riscv64/tcg-target.c.inc
> +++ b/tcg/riscv64/tcg-target.c.inc
> @@ -778,6 +778,8 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>           {
>               int lmul = type - riscv_lg2_vlenb;
>               int nf = 1 << MAX(lmul, 0);
> +
> +            set_vtype_len(s, type);
>               tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
>           }
>           break;

If I understand correctly, this happens when vtype is completely unset, 
such as the first use within the TB, or call-clobbered after a helper.

We don't actually need @type, just not the "uninitialized" type, 
TCG_TYPE_COUNT, per init_setting_vtype.

That you encountered a reg-reg move in such a situation makes me wonder 
if we have failed to correctly mark all of these vector registers 
call-clobbered?


r~

