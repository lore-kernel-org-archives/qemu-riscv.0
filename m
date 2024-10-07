Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1379CFB44A
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:25:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sxqXY-0003Xq-31; Mon, 07 Oct 2024 12:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sxqXJ-0003P3-Dx
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2024 12:24:41 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sxqXG-00077r-0Z
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2024 12:24:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-20b0b5cdb57so41919105ad.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2024 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728318276; x=1728923076; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZhTNi0J0LZKB7af7Zb43WsGxxujabzbI10ATH65EwyQ=;
 b=PDAQ+7XDyNXWVQ+VjaqHW6+s331zBzvmUOgp+R5RBOORppork13kElRvdGDtOwpjnq
 u/JRiCYGHs2rxr7r6tdaGnSegE/1jeNv1AuWUHjqLCebQwcdl+ZCbTXNMhaVvMv4oIa6
 rHwNxVpK1J3eVoiQAY3fidd3e8EpDG3ndzpWHDTQ02/N3+Orq1r/yXKCDPkEutennOom
 PDhDuCBCI4cSZkG3OW1GF6z0eWyJjqCQHLIPJ7djiZMIEftnilYLAfwmXzc/DJIOOmcs
 j6MxEfKRSvANqQ0w6wLIhNn8X5GZB+bdFRZIvDCnfIsSgsL6cnqwWY+N7Uz3Xcek2LQb
 xyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728318276; x=1728923076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhTNi0J0LZKB7af7Zb43WsGxxujabzbI10ATH65EwyQ=;
 b=cGOweP3u24JLxWiag8CrSUAWRI68pX/cYIrpIWsymHyQl/9boK05BfidCaAoc/RFTu
 yFRHfBsRs0a8TWV1HTShk5asUPLlnql2bGGvI10WvHizxGdqjB9YeSVgFpB346UCJ9Ns
 ol/THuT4Or6j8rD03nS/DXQej8gxVpqoDEbpLLMa7IrMZGVgwFLOb9MmaRVvoXVRi6o0
 TIW8FT43zW1XA4kFfNcip34PqRvEX75PJ5kcrjr02R5DXubtQPa6F4yDIIEXrmlENL8I
 +70tefou9bwbbFn4uT42JIm3UrTidG1PSqrIQ1S6bByuKBRrslIHG949aUciqvYgLLnE
 GqPw==
X-Gm-Message-State: AOJu0Yw4FlQ/tImsBUNcAw8qJDcdlrIQetYxAlEvjl4c4ccIyE/E1vjA
 TfEmadq49z35WCSMINTIFdLuQtwhNut9WXVwdjI9znQjNA5Ox/bU4E8IsVa9kOs=
X-Google-Smtp-Source: AGHT+IEKyIORfwqOkOmBehKLwE0qdAMn+mXsN+6Wkf2tLiMLc/o194vS7/tfOfQ0ccxc4CfdsFcS2g==
X-Received: by 2002:a17:902:f54d:b0:20b:a8ad:9b0c with SMTP id
 d9443c01a7336-20c4e27a5c9mr2933115ad.3.1728318276589; 
 Mon, 07 Oct 2024 09:24:36 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c138af8ccsm41481565ad.29.2024.10.07.09.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 09:24:36 -0700 (PDT)
Message-ID: <77a9c9c5-9c6c-42cc-821f-1340e06ac685@linaro.org>
Date: Mon, 7 Oct 2024 09:24:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] tcg/riscv: Add basic support for vector
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 Huang Shiyuan <swung0x48@outlook.com>,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20241007025700.47259-1-zhiwei_liu@linux.alibaba.com>
 <20241007025700.47259-3-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241007025700.47259-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 10/6/24 19:56, LIU Zhiwei wrote:
> @@ -2100,6 +2136,30 @@ static void tcg_target_init(TCGContext *s)
>   {
>       tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
>       tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
> +    s->reserved_regs = 0;
> +
> +    switch (riscv_lg2_vlenb) {
> +    case TCG_TYPE_V64:
> +        tcg_target_available_regs[TCG_TYPE_V64] = ALL_VECTOR_REGS;
> +        tcg_target_available_regs[TCG_TYPE_V128] = ALL_DVECTOR_REG_GROUPS;
> +        tcg_target_available_regs[TCG_TYPE_V256] = ALL_QVECTOR_REG_GROUPS;
> +        s->reserved_regs |= (~ALL_QVECTOR_REG_GROUPS & ALL_VECTOR_REGS);
> +        break;
> +    case TCG_TYPE_V128:
> +        tcg_target_available_regs[TCG_TYPE_V64] = ALL_VECTOR_REGS;
> +        tcg_target_available_regs[TCG_TYPE_V128] = ALL_VECTOR_REGS;
> +        tcg_target_available_regs[TCG_TYPE_V256] = ALL_DVECTOR_REG_GROUPS;
> +        s->reserved_regs |= (~ALL_DVECTOR_REG_GROUPS & ALL_VECTOR_REGS);
> +        break;
> +    default:
> +        /* Guaranteed by Zve64x. */
> +        tcg_debug_assert(riscv_lg2_vlenb >= TCG_TYPE_V256);
> +
> +        tcg_target_available_regs[TCG_TYPE_V64] = ALL_VECTOR_REGS;
> +        tcg_target_available_regs[TCG_TYPE_V128] = ALL_VECTOR_REGS;
> +        tcg_target_available_regs[TCG_TYPE_V256] = ALL_VECTOR_REGS;
> +        break;
> +    }

Missing a check for host vector support.


r~

