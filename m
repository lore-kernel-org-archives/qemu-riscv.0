Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994F8CED60F
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 11:20:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLJkm-00062x-Id; Tue, 18 Nov 2025 06:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vLJkl-00062P-J4
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 06:20:07 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vLJkj-0003sU-P9
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 06:20:07 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso3634261a12.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 03:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1763464804; x=1764069604; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y82gJCb1WhqG/etTGEMv1Gsg9yYTi7jDcVYkgk6cH7I=;
 b=ex/6KeiC10dAf5KJT44sNJlcZl+Vipev4fvKIWwRqBbs+/huOYe+70wbnl/MhBGHGz
 Mzr6UxpKUBrAQrAqYNeRE15xyFZsOAEKacxfOoyJfDwBzojlQRtU7NrBv560OyQjkUfZ
 e+2LfpmP+nB0xykNIXp5U6ob56Cu1swcHHBN5mlaM5oLNI5QJ+czX1jydU/jqY8MvknS
 ITtXml5wogDAjBy3hEeEcmwz/ZyGcXoVMUFrmYu7mU0j5Et278v3347PkKdTV4DI/IV4
 vYmpn3g3AMdSX0zNz59YP2Ex2MorTe91oQRI9Ed8ZKaUrOtfsbvuEeMByLB5g1VXNKhb
 UvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763464804; x=1764069604;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y82gJCb1WhqG/etTGEMv1Gsg9yYTi7jDcVYkgk6cH7I=;
 b=LiYDiVsnQFigTYLB7xvbVe76rswl/pNadnoNuDHrhPncuFAKEu9o7sXr2JqiABP+yL
 tLDYhp5m4xgbTTjKZ4b2uKnMxBL+mo4kzgF8p83S8NNjZaki3sPGyAkQHS059b0mbp+u
 jwLb8d6GncG4GvbG8eUqHbv7BsJcDS8LeVLV4kiG2uDdtrPU9I9bLWeiscXRpCi+b9Ui
 q2AuDeAuIZQfLgUtUY8ltzKm1TUV4ost+Jw7v672O7ec0G5GndOJjhreBQ0B12DG9nUN
 igyyLUiCNhJVakzV/bwEtbvL3U9pA+7bQvaHOaJaVcQJazeoz7pu2fRBEsBaqvtdmG00
 QboA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWwwDLr9s4++AO7FjTs02zGETXuUbHlGxZEQaGjU0IFT1sRiibNFNHHs3VcEU/Wzm4MwpEBM9WpdtP@nongnu.org
X-Gm-Message-State: AOJu0Yy7DCUfaWlzpvPz34H/SNt9luFLHVzIKYtkgqxblPlABvN/4b2F
 XUCNokzaHir60O8IP6oAwGrbz3PkQgtHDBjpt2QyiK0EwvSA2UutnYzzkmeRyKhPjyU=
X-Gm-Gg: ASbGnct5AhQgCGbvZ5rYJfU8pu9P85FBU0K7u9Mc5K57m9WBamYKHr5KCVwdsUTQGAp
 w876eSPUnKAomf0cpazPQPHRYeadBDaEEWnI3gzNbbSUbQmMpxA+bu0UI2ewwdPyvy+sdXREDbC
 yc/CjQ2tp2tc8yy5lxXYh/436RsQEzqMw7fp2pTwXFJgqP19wVjzeUpdhhPNwdMEfsCUDYtx64F
 QJReTBPvGJmy7OeXdSEcPwpR81rMV9JK+Z3iAWIXePnlFBHugVh1K4xF7S7KVeGd8tf6VBuW3zd
 3rpf5WY42rlKV/JY8epAPxyRcq2wm63YKhC4GlnNMwMWJzdO4+6bbLx6nFh/XBR1rJMJNc85Ydy
 sJn30asCdB/ficC+lRZBIj8psG1j3pXA/VwSkH8TfKt0nUGt6v/fAZNgW/TucmgYauONEKwEwm4
 ptYZdnn7ouXVEBqyFOaIcK+4gm8Bm5R0FR3xCX
X-Google-Smtp-Source: AGHT+IFWDkFXf7R5qiT1nXpTOWN0wu16B3YB5+GY7s0+Xm56F3cjFKUhpMFZrs5vbtRwVmQPzY0UDw==
X-Received: by 2002:a05:7300:570e:b0:2a4:3593:c7c8 with SMTP id
 5a478bee46e88-2a4aba9906emr7337760eec.8.1763464803566; 
 Tue, 18 Nov 2025 03:20:03 -0800 (PST)
Received: from [192.168.68.110] ([191.202.237.26])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a49db4a36asm44104067eec.5.2025.11.18.03.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 03:20:03 -0800 (PST)
Message-ID: <a0c132a0-373c-43b9-b893-eb443644dba5@ventanamicro.com>
Date: Tue, 18 Nov 2025 08:19:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: fix address masking
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
References: <20251118105936.2839054-1-frank.chang@sifive.com>
 <20251118105936.2839054-2-frank.chang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251118105936.2839054-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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



On 11/18/25 7:59 AM, frank.chang@sifive.com wrote:
> From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> 
> The pmlen should get the corresponding value before shifting address.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 172296f12e2..9b3f01144d2 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -203,8 +203,8 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
>       if (!is_virt_addr) {
>           signext = riscv_cpu_virt_mem_enabled(env);
>       }
> -    addr = addr << pmlen;
>       pmlen = riscv_pm_get_pmlen(pmm);
> +    addr = addr << pmlen;
>   
>       /* sign/zero extend masked address by N-1 bit */
>       if (signext) {


