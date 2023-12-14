Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFFC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 11:42:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDk6P-0004hT-4l; Thu, 14 Dec 2023 06:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rDk6N-0004hB-QV
 for qemu-riscv@nongnu.org; Thu, 14 Dec 2023 06:42:03 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rDk6F-00043B-1M
 for qemu-riscv@nongnu.org; Thu, 14 Dec 2023 06:42:03 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5c66bbb3d77so4603631a12.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Dec 2023 03:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702554112; x=1703158912; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vz1xZ+6REjcIuixVy7PR8caf3Kl3SULQaA/vVQxjm74=;
 b=NFHY6EFQd97ZGrSREUyWCQvp1RJ1RyNs0ay7cVdW6UvXvCh9lSL+fxbJUjt9gDUDlb
 5+EIysrhfaYj55xTDEX+4rDFg7ttmyvMj5gJNBwQBp2I55m4QGGOKwJ/qp4ukqUuh8d3
 pE+2bY/jFSyi+tTa+36jkEyawPPxAahMRKIUHvt/mEGleF1B4dlDDzqlIHHxKeuNX7oc
 bmGed0A7EAmKU6oZ9yAXdtQg0dcyOaNLPlXXk5c3xzOms5nga4LB3knVCVES5JOMrdX5
 aEWTHzf2hbkS9DEzx+slsV+erDMbzIAWHbRQm8CS+Rnynz9GFUxKMOGEy4P9h+2APsQO
 rDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702554112; x=1703158912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vz1xZ+6REjcIuixVy7PR8caf3Kl3SULQaA/vVQxjm74=;
 b=lO0W7FSb923iZGP2CPGljN9LR8f67cgegcNwM0DDm4Q2LSaFtql+uopHZI16E9NY6y
 TOWw9i4TvQUvgClkEgCMckeXCJwSnYp/I2iW8vDRWTGcRvA45nmEW+pfojD7bK9BQTbV
 zoFkQlEYrkUq6oB9LFrx8LXH30ULwmBMrJtYGPUt2zf9tWyCJ9s9KJssvCvOo9YZ+mR3
 9n8E6JP4snPTypzh0QYX/VXbFrTXT+KVCOMGBoY6OBjNV10Er0KT+1J+YXaUPcoMqmNB
 eWxGPyp14QLm7lracqmEHykIuvYwlAN1+WIaBhWbbIiq8/qklgpRNeEtj8bF+iVfcsI2
 xUNQ==
X-Gm-Message-State: AOJu0YzXlp3rYPlXXNgIo75Ybr4BWsnjwOWzv5+qq9kxO/hbkFEg9oei
 rNTwpiVFob3Ef2AIh9BYtZeGEA==
X-Google-Smtp-Source: AGHT+IE2yH2/fhHVANrhhs0iGRjCtgar9Iao4IwASeIFqHpic53sSyqfdCqj31wCTpXeWhfo3ul6yA==
X-Received: by 2002:a17:902:7845:b0:1d3:529a:83b6 with SMTP id
 e5-20020a170902784500b001d3529a83b6mr1030000pln.17.1702554112433; 
 Thu, 14 Dec 2023 03:41:52 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:ddec:9d1c:476f:1886:86ae?
 ([2804:7f0:bcc0:ddec:9d1c:476f:1886:86ae])
 by smtp.gmail.com with ESMTPSA id
 jd21-20020a170903261500b001d347c435ffsm3587162plb.36.2023.12.14.03.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 03:41:52 -0800 (PST)
Message-ID: <e94fbd47-6a75-47f6-b585-173151626d56@ventanamicro.com>
Date: Thu, 14 Dec 2023 08:41:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: Clear vstart_qe_zero flag
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org
References: <20231214111851.142532-1-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231214111851.142532-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 12/14/23 08:18, Ivan Klokov wrote:
> The vstart_qe_zero flag is set at the beginning of the translation
> phase from the env->vstart variable. During the execution phase, some
> instructions may change env->vstart, but the flag remains the same as
> at the start of the block. With some combinations of instructions this
> causes an illegal instruction exception. This patch simultaneously
> updates flag and env->vstart and to avoid inconsistency.
> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---
>   target/riscv/insn_trans/trans_rvbf16.c.inc |  6 +-
>   target/riscv/insn_trans/trans_rvv.c.inc    | 88 +++++++++++-----------
>   target/riscv/insn_trans/trans_rvvk.c.inc   | 12 +--
>   target/riscv/translate.c                   | 12 ++-
>   4 files changed, 64 insertions(+), 54 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
> index 4e39c00884..2867bbc2bb 100644
> --- a/target/riscv/insn_trans/trans_rvbf16.c.inc
> +++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
> @@ -86,7 +86,7 @@ static bool trans_vfncvtbf16_f_f_w(DisasContext *ctx, arg_vfncvtbf16_f_f_w *a)
>                              ctx->cfg_ptr->vlen / 8,
>                              ctx->cfg_ptr->vlen / 8, data,
>                              gen_helper_vfncvtbf16_f_f_w);
> -        mark_vs_dirty(ctx);
> +        finalize_rvv_inst(ctx);

"finalize_rvv_inst()" is not the best of names in this case. Why aren't we
"finalizing" all RVV instructions?

mark_vs_dirty() is already doing a lot of ctx updates. I would just put any updates
to ctx->vstart_qe_zero inside of it.


> [...]


> -        mark_vs_dirty(s);
> +        finalize_rrv_inst(s);
>           gen_set_label(over);
>           return true;
>       }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0be79bb16..d4147e2dd7 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -670,8 +670,18 @@ static void mark_vs_dirty(DisasContext *ctx)
>           }
>       }
>   }
> +static void set_vstart_eq_zero(DisasContext *ctx)
> +{
> +    ctx->vstart_eq_zero = true;
> +}
> +
> +static void finalize_rvv_inst(DisasContext *ctx)
> +{
> +    mark_vs_dirty(ctx);
> +    set_vstart_eq_zero(ctx);
> +}

Did you check if every time we're marking VS dirty we're setting env->vstart = 0?
I was taking a looking into it and so far I'm not to make this assumption.

IMO you'll need to read the current vstart value (probably via cpu_vstart) to see if
ctx->vstart_eq_zero is true or not. If it's false you can also mark ctx->vl_eq_vmax
as false since it depends on ctx->vstart_eq_zero.


Thanks,


Daniel


>   #else
> -static inline void mark_vs_dirty(DisasContext *ctx) { }
> +static inline void finalize_rvv_inst(DisasContext *ctx){ }
>   #endif
>   
>   static void gen_set_rm(DisasContext *ctx, int rm)

