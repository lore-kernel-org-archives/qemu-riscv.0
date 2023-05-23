Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40198C7EE2A
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 20:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Yfd-00059D-7l; Tue, 23 May 2023 16:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1YfZ-00050s-6d
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 16:31:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1YfN-0004Zo-1d
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 16:31:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2536e522e47so143721a91.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684873891; x=1687465891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MaLiREynf3GjguZchcZJ7k9uz1ZuPF/xk6IMqfU8wVo=;
 b=fdG+1xQMA5U5MKB23jg2FuDGfeQndxcsne9rK6hDW2nnlASpxoeqwg8UGKIxucX+sg
 UU7a38S8vSAsBBShd6iERYsQMxJvQXgf95TgKhJgi48gurYd0vrmcAwEb2tDwxnMjhHO
 ZPGVZW7fquQCXySj2+a8tpMkqzUQHFN+sIY+4aDuwfuzRQyynO+zVNWF9J4CjusTJi/e
 dv2SztXsWDVsmzPS+m/9m9U7ud+egSE9tfs0vzV7SdMDjQ9vbhRtCanv9G0aTG+iow2H
 20Sd/H3tfS1gsMnOwsVSwOorHbJkH2ZqMYO2+QvF788xnbmGqToFGI9tc5jSwX8HF+7d
 5QLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684873891; x=1687465891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MaLiREynf3GjguZchcZJ7k9uz1ZuPF/xk6IMqfU8wVo=;
 b=JBk3onAuX3INi8c1F5s0k3GBEyEnLPVrgsBW3zTLsC7xNWHF/NNcDm8FObC4yUfpN5
 32q2+imKGoRQgJj06PcnXEnwctiSm4z1YKp0az1xx5BOUSrT5uhhI3VBNk7GRLIMgNNk
 Bjm1txu28JN+GVnV4OilVWZHs5MWPgun0aTF9C6JWApkhGIaw1wnofjCYLqcBwtqmrwV
 +StLi5Aa+AUyK6/WqAhac+/HsmTAND4Mfon8j4icCsyDORN/CQxUSZxTUVtKR14fy4QJ
 wT0kDSdtkw6TfK1yomPSYSI1xZt0kAA10pX7rA8aiPocb/IyfW8O2S3L7GNYVVBXho26
 VyEw==
X-Gm-Message-State: AC+VfDy+ELhW4CKf6J/QjdQHACTXepTYPmlyuYVE969VHEaR7b0rTCLW
 fIghFCJ/E9bEeiO9bcwprtUgWQ==
X-Google-Smtp-Source: ACHHUZ5tqzeJi0Kujg7intj2i7+ijbT+dqBDcQm7tI63+G+pv4oWS55+V6hR0HGXWfmDx8f36K+zWw==
X-Received: by 2002:a17:90b:374c:b0:255:9038:fe0d with SMTP id
 ne12-20020a17090b374c00b002559038fe0dmr4728082pjb.38.1684873891510; 
 Tue, 23 May 2023 13:31:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c13a:d73:4f88:3654?
 ([2602:ae:1598:4c01:c13a:d73:4f88:3654])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a3b4700b0025374fedab4sm8605678pjf.22.2023.05.23.13.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 13:31:31 -0700 (PDT)
Message-ID: <5d0dacba-fe52-ee12-7f9a-5350f58a4a0a@linaro.org>
Date: Tue, 23 May 2023 13:31:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/7] target/riscv: Change gen_set_pc_imm to
 gen_update_pc
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230523135939.299246-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 5/23/23 06:59, Weiwei Li wrote:
> Reduce reliance on absolute values(by passing pc difference) to
> prepare for PC-relative translation.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_privileged.c.inc |  2 +-
>   target/riscv/insn_trans/trans_rvi.c.inc        |  6 +++---
>   target/riscv/insn_trans/trans_rvv.c.inc        |  4 ++--
>   target/riscv/insn_trans/trans_rvzawrs.c.inc    |  2 +-
>   target/riscv/insn_trans/trans_xthead.c.inc     |  2 +-
>   target/riscv/translate.c                       | 10 +++++-----
>   6 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

