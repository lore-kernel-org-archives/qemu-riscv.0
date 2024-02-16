Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA37AC48BC4
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 13:23:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rayBS-0003tb-NK; Fri, 16 Feb 2024 08:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayBR-0003tC-Qw
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:23:17 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayBP-0004R4-VZ
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:23:17 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e10303de41so627037b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 05:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708089794; x=1708694594; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LyLCivfqZa23nrrykauv9ToagVI5dPGKej7mi0dzbO4=;
 b=QJfylCF0wTDDDfrG51CK16n+7t8wnUMKpx7+NkItufFaxfzdvFqZ88TBMZVLWzCxji
 gbIQr3TNIrjaE5EepYp5vuTi9LGVvqJfZ0K0lnuq4MNMBESt5N80b5/3jK6Q91eSOljR
 0nHMtlZgx50gg5ELtcBYjKHSbeCsFyg17R9OHCsOgwsJViwUuYDLDWtHEt2/coRsS3Bp
 wjadU5Ii8mcOnVe36zvHNx7ubg6q2ge0aHbJTqYLD0gLnpm5s3OuksJpFn/omr/rBTxA
 jMwopYJRtqBzB2TKU3FnM9QvoPfPyZt5qeUhFFvfi7U/e8l0W9om2KL6d2wf/XDsNHRp
 9BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708089794; x=1708694594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LyLCivfqZa23nrrykauv9ToagVI5dPGKej7mi0dzbO4=;
 b=bYTGmKG5rHJXYa0QRHMvZnM9BIiCX/qcXlSSXKpt9o8LRNcGQKs1vjlyaq5XvpcM2k
 NXXoU15F4yCnFkhmnbJdujkghksv5aiq1MP0ZprEtLYvya0MWa8ypfKoCzTITS88qqcX
 OMSF013+h6KUJNf7YrhZh5RNmvopqw9tfdljHYWaiATdYiR7SIkSSq6GRXiUT/3Q33vK
 PbfucbxeJhwbgTBoCivTPZTBjT0p2RUpBMnDmX8aeRZeZ7YGceC+ncJluE5yRm8KXe/x
 uMy1QuFmd8QWVLRLMjTEVR4wFb/M9cKv8oD7L9cc9DCLabZE4SCifOw/UQ6buh5rWwHA
 60YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR6xoxgiygXEcqg/5NRJpbCgWH7t6g1Z068i0iKb/u/TmN2vkVelDQ/b387JsYfzRp7LAOJPUjL/M3xS2+GNU1BtIjl4o=
X-Gm-Message-State: AOJu0Yy/0x60lvwTk3F9ZjobiP1fBq7NXMmYnN95xjJhCFXmIDYJbVNJ
 hUqzgBEf42Y5sVfx9A3oHEvUqm81H/XjxJG9pBaTxjDFSMeSVCPwpl8J9b4rkSE=
X-Google-Smtp-Source: AGHT+IElTz94niM5FMyWuOO+LhIqmLJckvCpypPNvqBs7wLS8Oo9Ox58zZ5s5Rcr+4BYzxcPB4AElQ==
X-Received: by 2002:aa7:9992:0:b0:6e1:1460:1840 with SMTP id
 k18-20020aa79992000000b006e114601840mr4186572pfh.29.1708089794605; 
 Fri, 16 Feb 2024 05:23:14 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a056a001b5a00b006e0e35c1e55sm3054626pfv.79.2024.02.16.05.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 05:23:14 -0800 (PST)
Message-ID: <6c3d27c6-82f4-49f7-b074-73d04274c1b7@ventanamicro.com>
Date: Fri, 16 Feb 2024 10:23:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/riscv: Set the value of CSR tcontrol when mret
 is executed
Content-Language: en-US
To: Alvin Chang <alvinga@andestech.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20240216061332.50229-1-alvinga@andestech.com>
 <20240216061332.50229-5-alvinga@andestech.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240216061332.50229-5-alvinga@andestech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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



On 2/16/24 03:13, Alvin Chang wrote:
> The RISC-V debug specification defines the following operation for CSR
> tcontrol when "mret" is executed:
> - tcontrol.MTE is set to the value of tcontrol.MPTE
> 
> This commit implements the above operation into helper_mret().
> 
> Note that from tech-debug mailing list:
> https://lists.riscv.org/g/tech-debug/topic/102702615#1461
> The debug specification does not mention the operation to tcontrol.MPTE
> when "mret" is executed. Therefore, we just keep its current value.
> 
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/op_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index f414aaebdb..12822b3afa 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -347,6 +347,12 @@ target_ulong helper_mret(CPURISCVState *env)
>           mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
>       }
>       env->mstatus = mstatus;
> +
> +    uint64_t tcontrol = env->tcontrol;
> +    tcontrol = set_field(tcontrol, TCONTROL_MTE,
> +                         get_field(tcontrol, TCONTROL_MPTE));
> +    env->tcontrol = tcontrol;
> +
>       riscv_cpu_set_mode(env, prev_priv);
>   
>       if (riscv_has_ext(env, RVH)) {

