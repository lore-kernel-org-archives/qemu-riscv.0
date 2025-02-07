Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C02CC02192
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgKkF-0002EG-P2; Fri, 07 Feb 2025 04:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKkA-0002DY-D1
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:33:50 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKk8-0007th-Qs
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:33:50 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2f9d5f8a4b9so2940665a91.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 01:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1738920826; x=1739525626; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2UB0wiYF2aVCMiDOhMi8m3wPICIprNTVkOp1ZB6qjQ=;
 b=muYUlAP/fqBOs6ADPwBGDR8eYEwADjJwb8Z8s09MbDIhRN+r5yieleFmZDpJbb9Q7X
 K/6f80ZXJ/u/I4MlxADQBu0xfcdRQzs4nqCAOegG1MLh+4bfdFf6T/3VEyGtKeaXAs7D
 msI9uvwMXOsBLLG9Mw2immpTnox5Rexu1q96PvcBUh3RUIk0eBAjP/UzSffhqU0qcWzi
 Oo7kzZH4CfhwxALnJmaeBAFXXwuL6pXvEriHZMWNNdBansW+cCSw2qGfX1xo0kE2p/LZ
 RrFPLPW1XE7KJFkk1EJWQ2hvHpodp9NU9Q9I/IG6++YChR7zysH1ZZCyHvzi4A+nlDu3
 xonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738920826; x=1739525626;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2UB0wiYF2aVCMiDOhMi8m3wPICIprNTVkOp1ZB6qjQ=;
 b=QGl1vckWQHjbyipHnZ0sVnmebM62GX3uyfalh91oJjxHmIj2+EHbLmuLbkK0E+Z8Kf
 1a/DlKbxfv6cBtW/Vfm/B0AoAAShwAc8cuWhQSnwtg6Ekx0nMmlBtKLdXZs0z4dmg6y6
 +MqFYCgLE5uZqn49mdlSJK67XPypkePlrlAdO/QC0uJS4xH7e+oTzZeXOFt4JBemRw+6
 bYOx8MiWLFV0NbfRLF8nec0OynzTPq87xOWNy4gqP7QFnrz8VvfoGanXcS/KhSWk6Ljd
 PfZJklnQntaH1f20/YhbzUi3jP+iRHIdUBG0mpii9yJhYwSDAa3q/qdMWn3hfSNfDhQ9
 kgaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbGARy3fFKU+tuIYE9oYVshZCjUNmDm0MHrCS/DYe8de2pkGYP8RgwcvUeyS2AnDqSieolXTf5Y/XB@nongnu.org
X-Gm-Message-State: AOJu0YwMSveL4B/zdWLRn+2xShh6C7V2ZXhrJpRuebnu1Sge60A8/mpu
 q4naqoE0r6WydbOshXn6JlL7BAnWZXgtII7A0AFGuJsFK9F5aOrzFnzEvgPc/+8=
X-Gm-Gg: ASbGncu/opBMlX6VNWunQd9Ka9PsULxIe5OvH9i7UYv4zDqSjEELwetlytF37JiAVUR
 pbprGbEidqp2OGYnrBnIP/Xrk9fMPvUYVHPhDqaQkXAGA1JVnLUuVkD5JmBMf9ke3zQfYFbaphP
 67SSlgdbz6oiO+cLpU7mzY/XV86zgESQFjCb292i/R446Wb3lsPuyi5jo+guOH9ckKhKKclK3jk
 kDyqLiK3zch9nQSgf+LLdxoTlNLJtx+4noCIcc7TyejNFk1hHiKuBtbKnDkNvPUIHo2UyT/eVA3
 2WfUYn9baxZKxI2R6WiVtyVDV+w8WrRm2c+2C4K7OmfF1KeIeSpe/TOxLMjbMCpDLQAe
X-Google-Smtp-Source: AGHT+IFiFrnAdEyqKUwFpUbibQkPV4ZCjhd0XL1wmq2Uk1xFj/wUMuGw0eevni+UCZL87lJ0V9hutQ==
X-Received: by 2002:a17:90b:3e8a:b0:2ee:a76a:830 with SMTP id
 98e67ed59e1d1-2fa242e74fdmr3938902a91.24.1738920826666; 
 Fri, 07 Feb 2025 01:33:46 -0800 (PST)
Received: from [100.64.0.1] (218-166-198-8.dynamic-ip.hinet.net.
 [218.166.198.8]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee47sm2878514a91.39.2025.02.07.01.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 01:33:46 -0800 (PST)
Message-ID: <4ffc3760-7115-4686-9ca4-b9f21f20e457@sifive.com>
Date: Fri, 7 Feb 2025 17:33:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] target/riscv: handle vrgather mask and source
 overlap
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
 <20250126072056.4004912-3-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250126072056.4004912-3-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102e.google.com
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

Hi Anton,

You might need to extend this patch or provide a new patch to handle
the different EEWs source operands checking for the vrgatherei16.vv
instruction (when SEW is not 16).

Thanks,
Max


On 2025/1/26 3:20 PM, Anton Blanchard wrote:
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 20b1cb127b..c66cd95bdb 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3453,7 +3453,9 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
>              require_align(a->rs1, s->lmul) &&
>              require_align(a->rs2, s->lmul) &&
>              (a->rd != a->rs2 && a->rd != a->rs1) &&
> -           require_vm(a->vm, a->rd);
> +           require_vm(a->vm, a->rd) &&
> +           require_vm(a->vm, a->rs1) &&
> +           require_vm(a->vm, a->rs2);
>   }
>   
>   static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
> @@ -3470,7 +3472,9 @@ static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
>                             a->rs1, 1 << MAX(emul, 0)) &&
>              !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
>                             a->rs2, 1 << MAX(s->lmul, 0)) &&
> -           require_vm(a->vm, a->rd);
> +           require_vm(a->vm, a->rd) &&
> +           require_vm(a->vm, a->rs1) &&
> +           require_vm(a->vm, a->rs2);
>   }
>   
>   GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
> @@ -3483,7 +3487,8 @@ static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
>              require_align(a->rd, s->lmul) &&
>              require_align(a->rs2, s->lmul) &&
>              (a->rd != a->rs2) &&
> -           require_vm(a->vm, a->rd);
> +           require_vm(a->vm, a->rd) &&
> +           require_vm(a->vm, a->rs2);
>   }
>   
>   /* vrgather.vx vd, vs2, rs1, vm # vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */


