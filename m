Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689DDC54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rn2J4-0001i9-4I; Wed, 20 Mar 2024 16:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rn2J1-0001hO-PM
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 16:13:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rn2Iz-0006Ct-LH
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 16:12:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e6aaa2f02cso261749b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 13:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710965576; x=1711570376; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I14NnKUCI2Kh2IkS1ZZ75SLaYL5sOhAwSCTXZTFPW1Y=;
 b=jrysah9K/7iAyo5G8BPw/RrcNL51YSGzTveOHvo1UIYG7NsG4iP6OUF94sCH1txxuY
 2NX3ArHet0X0AmkT8YECEuwqmMFBVTzlMcIf2uSbBFwRsZpfDrQZNYcUz63A+uvYMBnz
 KT4uo4yy82RLyqlRrbZ9XHeo5eewFkndvIQ1SMei5Wmtu3pK4Le5+6sfEzXm2+k1wjsz
 fl78AudS3kCaQCvanaGW33Mj27DOt4R0G2FzRMevfbIqlFJbx1faaSD8FkPI4nSy5kzJ
 AJEX8+RbR5RIcdw19Ne3eJ5SChzSfKeLECZ3JpNFLKZhog+G9n4A57ktbnSc/Wac+CRN
 w1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710965576; x=1711570376;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I14NnKUCI2Kh2IkS1ZZ75SLaYL5sOhAwSCTXZTFPW1Y=;
 b=H7jkKu7ejS+R2Vr2IIhn6hPD54IzxlKcZajExIE1THJ8Rxt73l9Ek4FG55rCK+9MA7
 3IoXt7OcuOsSjJsluglPl9KDIeJlz+VylGK2WYNghcWAfkrL0l9s2AJuRTJuUtofDA1+
 dz1PUMfYJdSTWS5FdwU6t8wPs6l075rEmwzqXn9AymVUap/GxY90shc7jRodGhVw8z5K
 zulsPT2Kuix8CGQB47vEg19LB+qvI3fdj3q8mIIXhwvARR5fFJc1Aae76/YzbWHUhrtT
 HQE/mFDB8J3tIncEovzQ2oQ6GTqbinYwO7cBKTrF8/pYUiNkKsy7Yvaf4gJmZIEkm0jf
 RcNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1slF7elFtrzo4zaRt+VXImHYBvfTIvsd+ZkPwQ8QheSiYFJJDqAaC39r2JoY1HR6aWpfIBFQCMGT6TiEuD+F0nfZlMfE=
X-Gm-Message-State: AOJu0YxIXSGyP29Pt2/oT3quO08oC7gV+JPg9xz4/0KfQr15N1AZoinz
 ILoCJZNHTnUxFFf1lpWbhG8h5+Z8kNQSR8EPTuapKR6F2cDOdg3zdV/GhbRHiCA=
X-Google-Smtp-Source: AGHT+IHrx9x5UpyjEdBs8fNWsgRZi/uNNXxIPwF7OdEVE96KqvMeMIT86k5goWp6zmIZEW2lv1wtng==
X-Received: by 2002:a05:6a20:438f:b0:1a3:59ac:a626 with SMTP id
 i15-20020a056a20438f00b001a359aca626mr3862094pzl.41.1710965576086; 
 Wed, 20 Mar 2024 13:12:56 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a62e908000000b006e731b44241sm5360312pfh.42.2024.03.20.13.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:12:55 -0700 (PDT)
Message-ID: <f76abdaf-964c-46e9-a5de-ada65f166598@ventanamicro.com>
Date: Wed, 20 Mar 2024 17:12:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: rvv: Fix Zvfhmin checking for vfwcvt.f.f.v
 and vfncvt.f.f.w instructions
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240320072709.1043227-1-max.chou@sifive.com>
 <20240320072709.1043227-2-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240320072709.1043227-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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



On 3/20/24 04:25, Max Chou wrote:
> According v spec 18.4, only the vfwcvt.f.f.v and vfncvt.f.f.w
> instructions will be affected by Zvfhmin extension.
> And the vfwcvt.f.f.v and vfncvt.f.f.w instructions only support the
> conversions of
> 
> * From 1*SEW(16/32) to 2*SEW(32/64)
> * From 2*SEW(32/64) to 1*SEW(16/32)
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 7d84e7d812..ef568e263d 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -50,6 +50,22 @@ static bool require_rvf(DisasContext *s)
>       }
>   }
>   
> +static bool require_rvfmin(DisasContext *s)
> +{
> +    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
> +        return false;
> +    }
> +
> +    switch (s->sew) {
> +    case MO_16:
> +        return s->cfg_ptr->ext_zvfhmin;
> +    case MO_32:
> +        return s->cfg_ptr->ext_zve32f;
> +    default:
> +        return false;
> +    }
> +}
> +
>   static bool require_scale_rvf(DisasContext *s)
>   {
>       if (s->mstatus_fs == EXT_STATUS_DISABLED) {
> @@ -75,8 +91,6 @@ static bool require_scale_rvfmin(DisasContext *s)
>       }
>   
>       switch (s->sew) {
> -    case MO_8:
> -        return s->cfg_ptr->ext_zvfhmin;
>       case MO_16:
>           return s->cfg_ptr->ext_zve32f;
>       case MO_32:
> @@ -2685,6 +2699,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
>   static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_widen_check(s, a) &&
> +           require_rvfmin(s) &&
>              require_scale_rvfmin(s) &&
>              (s->sew != MO_8);
>   }
> @@ -2790,6 +2805,7 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
>   static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_narrow_check(s, a) &&
> +           require_rvfmin(s) &&
>              require_scale_rvfmin(s) &&
>              (s->sew != MO_8);
>   }

