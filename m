Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D9CEE57EE
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soWgx-00015Q-PU; Wed, 11 Sep 2024 19:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWgw-00014S-Cb
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:24:06 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWgu-0002qU-Md
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:24:06 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-718f4fd89e5so274716b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2024 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726097042; x=1726701842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aryx/y1o0TRMVDLccihpLztGmQrVr44DcI0KYJS2Ggs=;
 b=pXeqpLgFEzcvfO4O2OAnOsLr2HDiwfugpv1iSfIVeXC0/h0xhzBaTDKTB4ppVBxOdX
 GqNhVqKubrvyDq5My0oreX4zoEIiSK6UNn4yE00sULTD7M21fMwSsSPfyCS93OEtQAlB
 3ahlsnThSjUggKkmRdR99nbxoK9oeKdXJ+YAuB1TpjlRInmswiDt1zju4nkFEWiehmKt
 JKn+LEGkXUwxeFE4nLvntjl7Zac4KqJkdoyffp4t92a+qiR74yyjGAkcb8ojvEdUyn0D
 G4bw6lkmo/n2hOCZ7vO9EwOhDh/0gJng8RSCICd4r/zSwLxYL88HspzU+VOu/NnfsS4B
 IzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726097042; x=1726701842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aryx/y1o0TRMVDLccihpLztGmQrVr44DcI0KYJS2Ggs=;
 b=W34S3UWTUurYuqad2sJHmwATuDTDMaPuUp2s5/0gTJqA0gdEvL1W4IDlMilx1q5s0i
 MA0bwMLotmSFGj4dfginE5tXVjHAtY6f2hqShdEYBH4TF+LDT7LRuN7eA8GBwy7ytIxy
 gDW1loY8n6zuCApDwOcr5AuhNAIuWAcODOgJv0/pjQbypt/O/5Qc0DAA8AEyyKbYxqfp
 zD1ekfUyFa55vekQAuhQjBxX6mMOTsczFdwXYSv4hY4/DMLyzPhE2gV8U0wXle8+n7Cw
 xOpp/JiZ1ztykn9U8JbDR6kPooDZRfp3izSEnhfaoVloFEZUM4IzRjDrGRlYgw1yCrTM
 dbJQ==
X-Gm-Message-State: AOJu0YzDwVp23JPYyf8PLh3y2M9oR5tTL9WabZGuSU6yCCJbeHF1JcBl
 NE+dvtu+fDVKGkv3BVqDPjgFdi9IIftTv6VJH4wj9MQ/rbxDlciNhmyGk8u+8xM=
X-Google-Smtp-Source: AGHT+IHiw1KxPUWAS0pYjINkCrDjb7zFodVD5uyRYxB/wvkSunTAa1rDtLUOSYa6+ADTY18+67Yrog==
X-Received: by 2002:a05:6a00:1790:b0:706:a931:20da with SMTP id
 d2e1a72fcca58-719260654f6mr1712414b3a.3.1726097042396; 
 Wed, 11 Sep 2024 16:24:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-719090d0b14sm3483438b3a.215.2024.09.11.16.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 16:24:02 -0700 (PDT)
Message-ID: <b5409783-4f59-4154-930b-35733d5767b4@linaro.org>
Date: Wed, 11 Sep 2024 16:24:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] tcg/riscv: Implement vector roti/v/x ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-12-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240911132630.461-12-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 9/11/24 06:26, LIU Zhiwei wrote:
> From: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
> 
> Signed-off-by: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 35 +++++++++++++++++++++++++++++++++++
>   tcg/riscv/tcg-target.h     |  6 +++---
>   2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 16785ebe8e..afc9747780 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -2494,6 +2494,33 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>           set_vtype_len_sew(s, type, vece);
>           tcg_out_vshifti(s, OPC_VSRA_VI, OPC_VSRA_VX, a0, a1, a2);
>           break;
> +    case INDEX_op_rotli_vec:
> +        set_vtype_len_sew(s, type, vece);
> +        tcg_out_vshifti(s, OPC_VSLL_VI, OPC_VSLL_VX, TCG_REG_V0, a1, a2);
> +        tcg_out_vshifti(s, OPC_VSRL_VI, OPC_VSRL_VX, a0, a1, -a2);

You will want to mask -a2, because otherwise it will always fail to match imm < 32 within 
tcg_out_vshifti:

     -a2 & ((8 << vece) - 1)

> +    case INDEX_op_rotlv_vec:
> +        set_vtype_len_sew(s, type, vece);
> +        tcg_out_opc_vv(s, OPC_VSLL_VV, TCG_REG_V0, a1, a2, true);
> +        tcg_out_opc_vi(s, OPC_VRSUB_VI, TCG_REG_V0, a2, 0, true);
> +        tcg_out_opc_vv(s, OPC_VSRL_VV, a0, a1, TCG_REG_V0, true);

You have written to V0 twice, clobbering the result.
Need to swap the shifts:

	vrsub.vi	v0, a2, 0
	vsrl.vv		v0, a1, v0
	vsll.vv		a0, a1, a2
	vor.vv		a0, a0, v0


r~

