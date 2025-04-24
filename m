Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B51C369C2
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 14:08:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7xFN-00079h-1t; Thu, 24 Apr 2025 10:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u7xFJ-000794-SZ
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 10:08:09 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u7xFH-0008Jm-TZ
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 10:08:09 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22401f4d35aso12958845ad.2
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1745503686; x=1746108486; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9tahpk73ppmh24PnzW+ffR8codgjFeo60OqgUX3EAQo=;
 b=WSr0W7FAOKMs5YXVQzZiNFGi3oq6CpLobu2fHL38pSJs07dKpeSu34U57jTARlOJBj
 AKFk5mg01l5nSAwLsPdz9QbfOvbT4iSX3QXeQeuIxpNIjisDxsdVReJ62K/WIdXhCr3V
 FdcboAsgQ+2tCRU1ZMKFXJtSoCbSI/NgYENXC7yYzSe7kagHXZ3KTwqKXX0pogy/8VhR
 A1BBbw+UTCz4vr7nrKBsSG1J/dfA3kdc+U9AkszW2Zdno1TCkYGL4uQXJi4uPaVZky0I
 5GbDclEKvqUd0cKV2PkDuHjWeRhsBQpmKQzw5WaRUH+BUPvagHtJhF+2s7g92iAl3uqZ
 TUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745503686; x=1746108486;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9tahpk73ppmh24PnzW+ffR8codgjFeo60OqgUX3EAQo=;
 b=NA3Chq4QedcX3Nwp/Ut3q7UOw+3seTF1f1LAq7uHA9T9zX8B6Nb+GDopkzpleoNjwY
 9cla7TSfqrGyUY3hB/x4NQht91N6IHppzI+30sjosHi6asmcNeLRiZAEiP6gcgUsNDFm
 kGMQcyJkjd3aP/e0xexcleysgWSXgw3obs2S7sfHxIdlYm9aW0Sc3ITIOGU4cOIjIB6+
 erLbvBvv5n6BzOR+0kXQYgxnlR/K14stdB+Qj8hwSr46d3wkOyG3/AwOfKCwDz6RpzOS
 kd/l4TXyv+z8vlGHUIXERBw9n2dLG6RXEYjqy6DcyzM7KJRgZ/7jmliIewLGcjudyHS3
 mZDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzGM3dJUtD/r8ShfYs8cBVy6pcqb5jWiKzLzaCvkx/SKOUm12EZH1svjo0v2yCF2t5Fxt/fJ8ijyCI@nongnu.org
X-Gm-Message-State: AOJu0YzESR7nXeeQ2n40iVLWu00eiStYCdfEVe5q1SXvJCf5T3+e74Eg
 vfNGM5eypQL0LA8sLr+hGbMp3hpsFjbGvDCFo93QSjkHKktlEGxbUr0HKaaU3VM=
X-Gm-Gg: ASbGncvnJLYRHZS2Zyiv3tFseHCNlCKPA2Y2tUI+TnWXll+vjsA/9CfIYnQaW+mBeCX
 1wVmq6Lajzq1WC7KqZwGYvvPUL9uVWV7kwlo1p/CszX8qJnBJg2AN+w6zJ7QYS93erjWgDX0wbi
 6W1IbHnaEniClmtmDtn8DDx28hH4s3pBaO+IIazFrjj9ug4EzHQZE2KWewlwWK8zFQ/I/F/T/2u
 uOr2u5dF3zLN5lqZqwOfuSGNmO79hEMgJtDoasQDiF8ubh28YRPAnwGHHWTaM3ryNn9ehoUhQmg
 FCfva/vQkra+312v02DU8gw+D35CK+EG/GbzRIVWbEzxbzk5U7mzeQ==
X-Google-Smtp-Source: AGHT+IEOAjAOhtQFJv+gNnkFHkVkEu0VQTvUtSk5adRYtd4YNxTSyp5J20EdC8j8TnmbGhBQlqGITQ==
X-Received: by 2002:a17:902:ce04:b0:223:5e56:a1ce with SMTP id
 d9443c01a7336-22db3d77706mr43988555ad.32.1745503686130; 
 Thu, 24 Apr 2025 07:08:06 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.240.169])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d76c96sm13522995ad.38.2025.04.24.07.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 07:08:05 -0700 (PDT)
Message-ID: <6ed633a0-52cc-4b84-a721-e04ce1983e87@sifive.com>
Date: Thu, 24 Apr 2025 22:08:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: rvv: Apply vext_check_input_eew to
 vector reduction instructions
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.or
Cc: dbarboza@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
 <20250415043207.3512209-3-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250415043207.3512209-3-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62d.google.com
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

Hi Anton,

I think that we will need to handle reduction_widen_check function here 
for vwredsum[u].vs and vfwredosum.vs instructions.

On 2025/4/15 12:32 PM, Anton Blanchard wrote:
> Handle the overlap of source registers with different EEWs.
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4ba6de65f7..8f90f00aa3 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3009,6 +3009,7 @@ static bool reduction_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> +           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew, a->vm) &&
>              vext_check_reduction(s, a->rs2);
>   }
>   


