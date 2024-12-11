Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135AE7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 21:50:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLUb8-0005mw-Le; Wed, 11 Dec 2024 16:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLUb4-0005lZ-8M
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 16:50:20 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLUb2-0007kz-IE
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 16:50:17 -0500
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3eb8bdcac2eso227674b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 13:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733953813; x=1734558613; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zytopXsjfKW0YG03hiqlTIupNrqbCSYJESIoPoUDkmU=;
 b=Km2uRzup76XamzFAQHmYc8J3mmMzl6TenWIvGGyg4Cq8shv11Y9dNFA2ODAXYlyQ0U
 QLCdWBJThN/KDqoJCoW9360/qVsV14FqOYHe0UGONYpoQkNRVBXmWgQNkL5e308++5RW
 HU90Gl7Xih3Dyf3urR1JQYoRxQWgxdi7C/ZD/8F7EE0MvIJY0YJZL47ytV2Xi6gtsoHa
 5WnBm2HZiWVDLjVC4xF1BDv6pNNnobxO7onu0FSlyJOkTYUQcBda6T/yh0SnaHB8FTs3
 vX/uwfxFCqy5dgofJ4S69OnU+DCThxo8qwgQijw7smgT546Bl9rNYBzp2ts/4zBdS0NH
 4jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733953813; x=1734558613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zytopXsjfKW0YG03hiqlTIupNrqbCSYJESIoPoUDkmU=;
 b=N1hmEacv7iuoZMogSHHe5cYPrIwzDZpPJTyxFmMbB7Tc4xELfZ/N0DWEMrn+hnjCf/
 Mq/k68bEIsv1xNIE3unL7c7LrZBGVzkQjkr5SiP8UAZIemto0tZhCcfuKm4e+t2BN3II
 ReW8CZV684JQ/ePzCN3Lv5CoL4KdGQqtPTJsow7CaYZZk9tW33aAcJ38MjTCQ7t88Ytz
 hnaaIyJX5dAY17BKg/+mqCXhJhViRdMIXXIY6oKw0Ic5JJG3KKbdhatB6oOqakOoleAv
 t1bx4ga/IWfV+CrLJ7DpPGJD865txlsPptT+5LVTCqpitbtx5Gf6CDgmF1mhaGnkaBFu
 e74g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxqkCUuIft6WKWgeJVsjP+w8VkIRqON6otaooisHzX81tAaW9vyxVPBj4J1MOtSn65JH26zR8G6z8@nongnu.org
X-Gm-Message-State: AOJu0YywxQWBsZMPYCQa6KHibnQY37Mkm6MCckabMNCFygxS8hEDLP4+
 XXdvROLMFQMKFODgfnU2Wz+jN42DQpicGwLQZGMqDaaNy6f3OKa+nJ3UPwe/SVc=
X-Gm-Gg: ASbGncteiLWUPp78zUibrUsOStXGqUhOHb9xZKBRs4lgiNIaj0bLVHYeoFar3oCXvQX
 AQV37aRQBIWL9Dk5LXTHXelzfM7ByGCB7biwSztdvdDqVsLsjRBKOfhhc8G4IQfwlXlJ23hXZ7p
 gxWdRG2DeGp3CJsBbF3xPcW7aTZlVt8LMcMBeKJRSTjtOO429jAXtqQIvAzWCJiJS5bJamkJ5mU
 8RTyaP0jj4+Ljdto5Ngv0Zoi6+NjK9q9mI7sTZ4hb6ZN38Sjeo0ldXCWs/kcztJgpw8zrfz+iDL
 oGpDvgjf3QEREvGFhr6/TzJawrRqXInG
X-Google-Smtp-Source: AGHT+IG4p1MtyLJMwBx+zn7XHkMwxIVTdEB9/0WqrRKdhmqd47m5dJwl43ymxmO4h6awwNFrFH0gPQ==
X-Received: by 2002:a05:6808:f8f:b0:3eb:5cdb:f47f with SMTP id
 5614622812f47-3eb85b422c6mr2161229b6e.14.1733953813326; 
 Wed, 11 Dec 2024 13:50:13 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb8184b93esm681160b6e.43.2024.12.11.13.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 13:50:12 -0800 (PST)
Message-ID: <19c34ee9-f121-4dc2-8c73-2d06333a7d27@linaro.org>
Date: Wed, 11 Dec 2024 15:50:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: generate misaligned access trap for rvi
 insn
To: Frederic Konrad <fkonrad@amd.com>, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org,
 francisco.iglesias@amd.com, Luc.Michel@amd.com
References: <20241211211933.198792-1-fkonrad@amd.com>
 <20241211211933.198792-3-fkonrad@amd.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211211933.198792-3-fkonrad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

On 12/11/24 15:19, Frederic Konrad wrote:
> Now there is an option to enable misaligned accesses traps, check the alignment
> during load and store for the RVI instructions.  Do not generate them if the
> zama16b extension is there.
> 
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 96c218a9d7..1283207fc7 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -323,6 +323,10 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>   {
>       bool out;
>   
> +    if (ctx->cfg_ptr->trap_misaligned_access && !ctx->cfg_ptr->ext_zama16b) {
> +        memop |= MO_ALIGN;
> +    }
> +
>       if (ctx->cfg_ptr->ext_zama16b) {
>           memop |= MO_ATOM_WITHIN16;
>       }
> @@ -424,6 +428,9 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
>   
>   static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>   {
> +    if (ctx->cfg_ptr->trap_misaligned_access && !ctx->cfg_ptr->ext_zama16b) {
> +        memop |= MO_ALIGN;
> +    }
>       if (ctx->cfg_ptr->ext_zama16b) {
>           memop |= MO_ATOM_WITHIN16;
>       }

I would imagine that ext_zama16b would disable or conflict with trap_misaligned_access at 
startup.


r~

