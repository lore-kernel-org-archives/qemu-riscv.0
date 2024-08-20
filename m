Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F945C5320E
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:00:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgKjJ-00069l-MP; Tue, 20 Aug 2024 05:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgKjH-00068n-Af
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 05:00:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgKjF-0000Nb-NN
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 05:00:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2021537a8e6so31160245ad.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Aug 2024 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724144436; x=1724749236; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/PlHyrBRnyy8hdHAYFFG8VzgtmJPIdrbn20Njpj5x1A=;
 b=LJLHrIuzbrz90OgWL9oH9NLEmZaOvCsRtfyv7DazUgygZRO2LGkMDa9I7WvVAQa9O2
 RjZiHL9o7/0RW47ycYRNiDrWOM0DpH0r+3C4AZeIWXmFg+1dUH7c4xhMHLUTCMDczvKE
 SVAX+0BOPcBBrz+30YuSoxwZeq+4t+gmegD7kzwNCfM4CVwbEd+o5W+ySAcf3yhqM4/p
 R2s5YUSMT2m7GS/DTqNMrdCW0GRempEfyxqajMJ0zdpNJU8/390EKix1WOzJOa/8XsgZ
 lPXlt0sOjnGcMrq3Rfho2hLtrRpvBL+JW2OD3lrQ6lJeqIO+7D8fXV5tE91vMydUT0Qg
 27aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724144436; x=1724749236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/PlHyrBRnyy8hdHAYFFG8VzgtmJPIdrbn20Njpj5x1A=;
 b=chE1N5X2SiMuTJW+Q/+wiXIREu2EOXF4f3DMr5o76suz1ow25SIGXk66RQKegsvyVf
 QhYsaA7X8qGRP+TBKurDOTqh7PEZpwW9eIbIr9r6bF/PE79UhszvYRL6J2J7ETqrNMHo
 BbPt/czj8UxiSohxy0yIu3dm+rLOx85B9HGtV7a6hJa2x6ltepm//XMCCQB5uCbvGUgX
 FNyHsk7tmgnDgZocXuYZXp3ygRveQsFVdnHKTdbZHOBtRdSIL/s5IkhvZWd7V/SItccv
 IYCbzWQd4OWMXKsTRLz9mEwDZtj2sSU2ePxd+CC4dY4RVjSarCby19ghTTSB3SqYHR75
 4Y+Q==
X-Gm-Message-State: AOJu0YyudhP7Cag38do1e8a1TGAvuwsyCV8NmBFP04xTh2PcfjBn48n5
 CcCj7SDT1C8vkdGkWjfNbh/4dtyqYXzzI1yC4C17AWvtRFUs7gG/tj92h+mbvV0=
X-Google-Smtp-Source: AGHT+IHTdSMDdRG8h5+4W05JgFdfaLD6NuWE4zzDN8dY/dHCWimKjeXi2FaOEf9RgVAlI+afaKH+bA==
X-Received: by 2002:a17:902:d503:b0:201:f5e3:e36d with SMTP id
 d9443c01a7336-20203ea05d2mr156343885ad.25.1724144435767; 
 Tue, 20 Aug 2024 02:00:35 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.3.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f03a5633sm74166015ad.295.2024.08.20.02.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 02:00:35 -0700 (PDT)
Message-ID: <1c5bb9a6-ddb0-4aed-9150-ff4031b4c2d5@linaro.org>
Date: Tue, 20 Aug 2024 19:00:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] tcg/riscv: Implement vector mov/dup{m/i}
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240813113436.831-1-zhiwei_liu@linux.alibaba.com>
 <20240813113436.831-8-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240813113436.831-8-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 8/13/24 21:34, LIU Zhiwei wrote:
> +    case TCG_TYPE_V64:
> +    case TCG_TYPE_V128:
> +    case TCG_TYPE_V256:
> +        tcg_debug_assert(ret > TCG_REG_V0 && arg > TCG_REG_V0);
> +        tcg_target_set_vec_config(s, type, prev_vece);
> +        tcg_out_opc_vv(s, OPC_VMV_V_V, ret, TCG_REG_V0, arg, true);
> +        break;

Is it worth using whole register move (vmvNr.v) for the appropriate VLEN?


r~

