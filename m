Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D539CC982D0
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 20:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7J4j-00020y-18; Thu, 17 Sep 2026 16:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x7J4f-000208-V4
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 16:51:18 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x7J4e-0007Gm-8X
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 16:51:17 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-39b350c69b4so72291a91.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789678274; x=1790283074; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S1NLi4QS0kW/YsWZ9DyyaAD9U0xrPbTu7ggvIBtsciY=;
 b=qDca3R5on6JxTLG6HZb7QtP/palISPTao9MA1TTSdm+fnMsvPgZixaw4dalQheXS1Y
 DFCI1Zuc6W51kyvZzcKqO/rnaLP2rxmp1Lk1cwvm/Db0ZqBpwKmNIoMr3Qfl+7LQE+zy
 /dQOSlQNgnpEUfEdNipnYerPtesD3BSTtgjoSrze42O5blStxfcPPqmu+F6izelRBW97
 A9Afzp1kOTOBJSM6Jfc8iJQW7OZdL5z9i5wysVZrkWqL/yMoleMg9pelKY/0ghgh/qS/
 9yGhjo5/BxznUz5XTT/C7bjKzMuT67b4WpVsrSIReW3GlE6TVPYmmOCTGt3vA72Q9BU+
 FIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789678274; x=1790283074;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S1NLi4QS0kW/YsWZ9DyyaAD9U0xrPbTu7ggvIBtsciY=;
 b=E/kyWCGLZAQGyGFMXCas1XMDrkVBk+V95BQB70cALhai4cXzEk0EoRWU/G9quUs+38
 pQhdKjmNe3W41jkNMwRIPoJyorH9ptllbFUXbQdVJ7G0cHqJkMrS35cBABk8da3xU8RH
 z8cQ+RaVVo70oxd0E1kU/N+WzRtF4aoQlfILdP2HN0Qp70ifoUEY6bHyDP0rmpx7GJ0V
 2H7UpeEAoYCWuWLVA+4CJsvn/tBzp/E434lddggsAja0k/6GgoCpJGLwAC2AcsP7ocYn
 eUF7rg92spTyRkQbQPRAUM8GT9pe5w+hIRkFQZlZn1TZIvVQKBMaHVNBmFP1KZiNtXsA
 8H8Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYhBxs/cBs9yyxYw9DRzftXYk5H+hAatd6AreQTH2vnQVgPzj8sOX4WSDux8dyCdN87aLDL333eAVq@nongnu.org
X-Gm-Message-State: AFuF++n/jRqShOZFOOBaocRfU3reAj6r8P5lamqxoiqiX8EBlzGqiLcY
 8KUCn4TOqPxjwIkWrIOhWrOtWtIimg/he0zBEDDjE6uk96ebOC9q7GIKrR34Cag+AtA=
X-Gm-Gg: AYBFou2oVV+UYZEkov1CzUbLuwRjX01661Zs+mZPI3C/U5roM8VExZvW+JPpTT6N7e+
 8phuOTlXE9DSKvikryPmi7y1z2KrrZS9zf91R4RoHanAskqi7otvZi3/vYVcDzOvM/0KPwR7rHH
 TqUidxgmhDEWfXZV9sg26Mdk+QtN/Ma25MoS1pH+OnxroEXWoBFPd9rvth+pgq+ri4JR8qfalXn
 OrGYR3E/+KMy41QKaNKicO85VzXs25H6lCWIu2jEkjM6fo2ZKkjQpR93PR8Wa2h6tParQ10s4pu
 5+FQINJrkiO/ALH2xu4VAV8xX7K2tpQeezocJmqJN+yQhGujeqC15L0F//cYhHT4z+3YkGQC96v
 INiRVYu7a99K+MHJf8ZVf2C51BmykcY06/KtWvBfSOFoKzhGsRBbQj7PHQS388k1H2C0cSJzQb/
 FZ4V3mZpCUqr/VOKZtQ/yWPpjhVrbGnPtIWaI1l/PZDrLQf1Ntb+3LwyhANsGONt2GDXyeyim41
 p+sGagyL+y2+ICiVTmvPjcjm80IaSYkSsFnbD0ICTFcLriad0NPI1l1Lmtstg==
X-Received: by 2002:a17:90b:5291:b0:39d:e54c:a28a with SMTP id
 98e67ed59e1d1-39e54bba9e8mr812124a91.8.1789678274228; 
 Thu, 17 Sep 2026 13:51:14 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:5a4b:653b:1dce:569f?
 ([2603:800c:7900:ed00:5a4b:653b:1dce:569f])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af4f0bsm20571690eec.24.2026.09.17.13.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 13:51:13 -0700 (PDT)
Message-ID: <48d3cf9d-4d76-41c8-aa73-e1cc57db3f40@linaro.org>
Date: Thu, 17 Sep 2026 10:51:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tcg/riscv64: Set vtype before whole-register vector
 moves
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>
References: <20260917133755.1049697-1-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260917133755.1049697-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/17/26 03:37, Max Chou wrote:
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
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
> index 2ce9d47a633..e3cfedb579d 100644
> --- a/tcg/riscv64/tcg-target.c.inc
> +++ b/tcg/riscv64/tcg-target.c.inc
> @@ -778,6 +778,10 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>           {
>               int lmul = type - riscv_lg2_vlenb;
>               int nf = 1 << MAX(lmul, 0);
> +
> +            if (s->riscv_cur_type == TCG_TYPE_COUNT) {
> +                set_vtype_len(s, type);
> +            }
>               tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
>           }
>           break;

Do you have a reproducer for this?  I ask because I still wonder how 
this can occur.

Given that

(1) all vector registers are call-clobbered, there should be none live 
across tcg_out_call_int (which clears the remembered vtype),

(2) the first vector action with no vector registers live must be a load 
or movi (which will initialize vtype).

Performing a move between vector registers when all such registers must 
be dead is... wrong.  It indicates that there's a bug elsewhere.

I'll throw an assert in here locally and see what happens...


r~

