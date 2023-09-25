Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0E0CE7A89
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 09:09:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkhan-0000SO-6U; Mon, 25 Sep 2023 05:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhal-0000QK-HA
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:09:23 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhaa-0003na-Fg
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:09:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c0c6d4d650so52713705ad.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695632950; x=1696237750; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TUOyRvFz0Uq6QmykwiynVZGJFxnOGpbfWLz/pWC/TgA=;
 b=S15mIbLSeBYbihcUeUCjcfeiSq4bas5J4he1LnYU+WxHzG42eKK0uGdZfaxyhR9UWQ
 nxu1/fpUYK4D1jCGQSgkubyC/M3MLOkWUAM9u7jqmdYuElE77NWLAp54WeQDujpnUD6B
 0By94zvlhuJ+lIm68uC8500znJY7oGauF/MFdLQ94zZSzb9R1b5/mErsoBwutsZgsSvU
 Vu4gh2qYSeAqXNzFLsmk4YJF+IihAdEQw+wnxkOFP7qochHlY0JZi2TSKmnkWFyJEMyx
 nxGWll0BPbSEGIjVABPIDX323ZFf6Y3Y7/pE0gkBD9mScMXQ8WP0J0aztOarbN3/zb5j
 UzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695632950; x=1696237750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUOyRvFz0Uq6QmykwiynVZGJFxnOGpbfWLz/pWC/TgA=;
 b=DSierENuf35anY+QiqIDt2NF8JsTwRNSFsgZuLXjZPu5j5rU79Ggw5jVDcllxKuBWS
 sHvmABekKqoXPr4rIy2EoPVPyYEYqo+4P8EHxBBRHRjZoxJqZysC2uc3Ob2kk1eG6qnU
 s6ndCmLe7O+culKpTh2Ak4u7x+HktWkvtm7PDmfyDXpv9sQ9IU0wRSJObCIPr6WHGcCz
 8Rc4RJjEei++noCBwVLIxlVr7DnPJjCJuSf4iMeyaD5ljSDhqL5koJsvV6Mz5quxnNnM
 8PCeaHrpjBavpdyVvTrFuMlz/wA0YJXvjkwIspQwFY5I7h+82PD/A8Iw6l2on73aI1nx
 lx/g==
X-Gm-Message-State: AOJu0YzCA8maf0uSfOpSoC61YemM+hmAEA1qugyrWFxw3KqXdKWNncu4
 XEsrwR6T0S6rnobQkt7LsZs9pA==
X-Google-Smtp-Source: AGHT+IFxNDRx7aRRAfZObV2lJXzTobsta0AyZuvfxEsr3HP+RXtIVhd8thsfMwqJtA9yl2l9RceS+g==
X-Received: by 2002:a17:902:dac2:b0:1c3:d9ed:a410 with SMTP id
 q2-20020a170902dac200b001c3d9eda410mr7537908plx.59.1695632950253; 
 Mon, 25 Sep 2023 02:09:10 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.59])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a170903234700b001b86dd825e7sm8307514plh.108.2023.09.25.02.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 02:09:09 -0700 (PDT)
Message-ID: <dc274a6c-a285-d718-775c-1962914c849b@ventanamicro.com>
Date: Mon, 25 Sep 2023 06:09:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] target/riscv: cpu: Fixup local variables shadowing
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 liweiwei@iscas.ac.cn, Bin Meng <bin.meng@windriver.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
 <20230925043023.71448-3-alistair.francis@wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230925043023.71448-3-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/25/23 01:30, Alistair Francis wrote:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Bugs love to hide in such code.
> Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
> on polling error".
> 
> This patch removes the local variable shadowing. Tested by adding:
> 
>      --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'
> 
> To configure
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index eeeb08a35a..4dd1daada0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -699,7 +699,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>               CSR_MPMMASK,
>           };
>   
> -        for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> +        for (i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
>               int csrno = dump_csrs[i];
>               target_ulong val = 0;
>               RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> @@ -742,7 +742,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>                       CSR_VTYPE,
>                       CSR_VLENB,
>                   };
> -        for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
> +        for (i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
>               int csrno = dump_rvv_csrs[i];
>               target_ulong val = 0;
>               RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);

