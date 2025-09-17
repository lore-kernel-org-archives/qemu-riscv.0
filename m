Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2BCAC599
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 11:37:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uyqTA-0004EP-Po; Wed, 17 Sep 2025 07:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyqT3-0004Ch-OY
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 07:36:58 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyqT2-00084d-2X
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 07:36:57 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-633a2be31daso1219289d50.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Sep 2025 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758109015; x=1758713815; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+0fIO5QYep8ESCFZccAhR1SrpA2963VFE92xZX3msdY=;
 b=B2Ggz1SAlBMHY9TCpqCqU7RXx+OA9s9DIwjKsoS9RWKpNORKrZ8gtdCx5S7OG7WhpW
 4BtLB+V6eorUYtVJmCVny2TrF+/d7y4oi9PgESp7QO44ZmBoiYdLM1zvbjpwfxUAYdww
 EE7CLD5f3ZEzWOjUQvZrcdxODdTB2mEiBDbNMJux7T7doXJhHk9GU+iCWqTfeWqVg8bK
 Qz/3KK014oi2QNN6OgPt9ibNShVCdxB6bL6beDRvn7norozI3evEQKxJ/rbfZS1XlSod
 ihTpa/LHOiO+7tH+seqoWN8nT3qzenDoUks64KHKbBNGrYU0loHGAQaQu5U7I6CKv+lY
 tFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758109015; x=1758713815;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+0fIO5QYep8ESCFZccAhR1SrpA2963VFE92xZX3msdY=;
 b=VJOm3ZUd9skkz9Fp9E+8X7hY36MJ7G3kkXYqkW+04gTJC/4QH/eKiwJ5nVW9rA00lP
 1BlxbBfmg/7sku/vi+EocpEQU1eqlHePcsNOH+uOys50TCucCGTmUoiCFrsOFDyqsrXm
 gscBXygP7hMsWfDmP6lvjIZgaUtiUz3cg5Ohoi62Oguv6TX8emvgDBBFbuWOxC3dXzzH
 gcy2ASRp2Os+OJOSxRelHkgb9Mzrw9cEOsO1vIA1oS79Y4T3ftw/PzP/q0/lv4UATNlu
 KgLQabZvCS8adNDJqxsI/ZtgFOia2wzejzb5cPVy/nqPlOB+97brQ2o4Ys7slF3rl/Gi
 YqmA==
X-Gm-Message-State: AOJu0YxwjYAYkm/ddqYZPnzIN6p3wyc1BexjRUtcDrltZTsUC3fr/58e
 lNCX1dQBz0Tcxck49ppwQSE89TRNeMgbiEPhxuGPsujOVafBnyMAmEgD2dLE5c/YDcC7+PzjfT2
 IA0Fh
X-Gm-Gg: ASbGncvbcdSsQs+3eERV/Y1jD0vubUmnO7lpSuyqGw9o8UH1/LaNhanY2RaVdP2ra30
 rgR7UtxVjwhnD/xyDaspovZkvPJna+7mAlrovk2VFsiDsrjFI9g9hce9LlCerJGMeXY2Il3YpM7
 Hw+Gsnq0V1pfyhXmu9LJzSEYdku+X9EDOsc4mxbIlwZtPLJkD4V0XSEmmw5Grc69EYLU9nnEM/D
 JhaCxbdM1g+aL1VVpOKbzv9yCs6GOQr+iQPMpeYULonMfsSIareKkFS+gcNqqBYo/8kqtacgoZn
 WbKP/srRzxWwmotdrekQJNdoRWJ1ygZJUd7DkYLzVktddbdsoTaDhS7p4ezX2HlkHoiYVMUE/eL
 MoqXDvrDr6W6cFm308UiIW7kIh/dZ9piWVo0SABJz0khLg4aPjkkb/Yuhq5/NdAPkBLeTvdi1NM
 ot
X-Google-Smtp-Source: AGHT+IEptVo9o6olaU9LNWCyaCw8yx4uyh+s1YUENrc1kTTpOXdJcWbPvSzbEcgjO/Fz5TLDnq62rw==
X-Received: by 2002:a05:690c:f03:b0:732:f9d3:53b5 with SMTP id
 00721157ae682-73892f4a5e0mr11929337b3.38.1758109014540; 
 Wed, 17 Sep 2025 04:36:54 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:ba1a:8719:7c4c:526a:fdea?
 ([2804:7f0:bcc0:ba1a:8719:7c4c:526a:fdea])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f7632ed5csm47699057b3.6.2025.09.17.04.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 04:36:53 -0700 (PDT)
Message-ID: <f7ffd3ff-ed18-4c92-8fba-690ca1c59aeb@ventanamicro.com>
Date: Wed, 17 Sep 2025 08:36:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] target/riscv: Implement SMMPT fence instructions
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, Huang Tao <eric.huang@linux.alibaba.com>,
 TANG Tiancheng <lyndra@linux.alibaba.com>
References: <20250909132533.32205-1-zhiwei_liu@linux.alibaba.com>
 <20250909132533.32205-5-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250909132533.32205-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yx1-xb136.google.com
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



On 9/9/25 10:25 AM, LIU Zhiwei wrote:
> This patch completes the SMMPT implementation by adding support for the
> new fence instructions: `mfence.spa` and `minval.spa`.
> 
> According to the specification, these instructions act as memory ordering
> fences for MPT updates. In QEMU's TCG model, this is conservatively
> implemented by flushing the entire TLB, which ensures that any subsequent
> memory accesses will re-evaluate permissions and see the effects of any prior
> MPT modifications.
> 
> The instructions are privileged and will cause an illegal instruction
> exception if executed outside of M-mode.
> 
> Co-authored-by: Huang Tao <eric.huang@linux.alibaba.com>
> Co-authored-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn32.decode                    |  2 ++
>   .../riscv/insn_trans/trans_privileged.c.inc   | 30 +++++++++++++++++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index cd23b1f3a9..cf58f1beee 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -120,6 +120,8 @@ sret        0001000    00010 00000 000 00000 1110011
>   mret        0011000    00010 00000 000 00000 1110011
>   wfi         0001000    00101 00000 000 00000 1110011
>   sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
> +mfence_spa  1000011    ..... ..... 000 00000 1110011 @sfence_vma
> +minval_spa  0000011    ..... ..... 000 00000 1110011 @sfence_vma
>   
>   # *** NMI ***
>   mnret       0111000    00010 00000 000 00000 1110011
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 8a62b4cfcd..5ec6bf5991 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -160,3 +160,33 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
>   #endif
>       return false;
>   }
> +
> +#define REQUIRE_SMSDID(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_smsdid) {      \
> +        return false;                     \
> +    }                                     \
> +} while (0)
> +
> +static bool do_mfence_spa(DisasContext *ctx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    REQUIRE_SMSDID(ctx);
> +    if (ctx->priv != PRV_M) {
> +        return false;
> +    }
> +    decode_save_opc(ctx, 0);
> +    gen_helper_tlb_flush_all(tcg_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_mfence_spa(DisasContext *ctx, arg_mfence_spa *a)
> +{
> +    return do_mfence_spa(ctx);
> +}
> +
> +static bool trans_minval_spa(DisasContext *ctx, arg_minval_spa *a)
> +{
> +    return do_mfence_spa(ctx);
> +}


