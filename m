Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1470CC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 19:23:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAEX2-0001Mx-W4; Mon, 04 Dec 2023 14:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rAEX1-0001Mf-5m
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 14:23:03 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rAEWy-0000h7-Ln
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 14:23:02 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6cde104293fso3770586b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Dec 2023 11:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701717779; x=1702322579; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yIP8fs67fotIoLV1ptQcgNjuB9zFjI71zcnNjZ/K4Ow=;
 b=X4lkVNv+D7IUznM8B7G/PQNR01cqJjVpJxhAYbBuT6FeaFemg00KaerMyUeg2UoKDm
 z8i6btroJcoMAzYRWnGeM/PUtE3Ul978NxmFc9ssRkNNjMWa7ySK0jn2l0jq/72UmJHm
 UO8CrmufsI9Lo2BNs1XFKmDKs22oin3Lb4fbz+euUgyU0iQ2iaKErvaWg/5eysOoa61g
 7Zx9Jr1gv/LIcq5DeUqdGOv2znkgwXfBQtFb8x8cJE9v4txFBgZOy7LRUrAK5ckLIYJH
 WjWCoa5SswJUFAoiTScaBQRx923vtT57mplhe6bOXL9+RK2YCJ8iCNX/4Za5AEyOZyqY
 k2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701717779; x=1702322579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yIP8fs67fotIoLV1ptQcgNjuB9zFjI71zcnNjZ/K4Ow=;
 b=A669tefjNPNoXFo6GLj+0M5R+gB3wLzxfAiZ4RDoVH8FN9u2/Uvk/sLDPeo3aYpAqS
 yTky5l6DnqtQH80BFAqvRQwrMPChf2uaNnQgMNTVDrLONSpjiqmfR4A0dSOycW4xqfuT
 yG3ZLsqgVKFvj7GZ8mh4OG2oNSZTKNtBNxye/UaHJnhIsn0jcZBNdTOJS7RbK5djLQEa
 omuW4Q2xR0l31qKjNsc5MHzbtmTvQSCSznxmYFZ5wfmdJ27V0ed4c+FeE9niGW2sqVY+
 9vzZXKY+AaJAIv+jZ71g7IxpDyB2GXqiV6gz8FBKtm0kiE4oJ3hbKHF+daVKxUwjZ+Vs
 ifxQ==
X-Gm-Message-State: AOJu0Yy95hs1M6S5ezUHujxqHYBHb7wRiFbNI2UqmI35k2u16G6TUypO
 CuCMm5L3nTQaB1JPIqc0xTzoSQ==
X-Google-Smtp-Source: AGHT+IH6+iXjq9JCwQ8srPbXSI/Tg4uXBiN0AxwO9fSDqeLv6OTaEeGrWhb6CtXeuy8tmHxPuDO4iA==
X-Received: by 2002:a05:6a20:42aa:b0:187:9ff3:98ac with SMTP id
 o42-20020a056a2042aa00b001879ff398acmr2621113pzj.4.1701717779028; 
 Mon, 04 Dec 2023 11:22:59 -0800 (PST)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a62f201000000b006ce6878b274sm142218pfh.216.2023.12.04.11.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 11:22:58 -0800 (PST)
Message-ID: <f9aabef1-8b8f-441e-9593-4ca4b7fd5904@ventanamicro.com>
Date: Mon, 4 Dec 2023 16:22:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: Add vill check for whole vector
 register move instructions
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
References: <20231129170400.21251-1-max.chou@sifive.com>
 <20231129170400.21251-2-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231129170400.21251-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
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



On 11/29/23 14:03, Max Chou wrote:
> The ratified version of RISC-V V spec section 16.6 says that
> `The instructions operate as if EEW=SEW`.
> 
> So the whole vector register move instructions depend on the vtype
> register that means the whole vector register move instructions should
> raise an illegal-instruction exception when vtype.vill=1.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 78bd363310d..114ad87397f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3631,13 +3631,14 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>   }
>   
>   /*
> - * Whole Vector Register Move Instructions ignore vtype and vl setting.
> - * Thus, we don't need to check vill bit. (Section 16.6)
> + * Whole Vector Register Move Instructions depend on vtype register(vsew).
> + * Thus, we need to check vill bit. (Section 16.6)
>    */
>   #define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
>   static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>   {                                                                       \
>       if (require_rvv(s) &&                                               \
> +        vext_check_isa_ill(s) &&                                        \
>           QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
>           QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
>           uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \

