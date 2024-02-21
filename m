Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E5BC48BEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 18:06:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcqyb-0001mh-Kp; Wed, 21 Feb 2024 13:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rcqyY-0001dG-W7
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 13:05:47 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rcqyX-0000FU-1m
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 13:05:46 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6e08dd0fa0bso28810b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Feb 2024 10:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708538743; x=1709143543; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKKLptDSdqzkckguYJTH6juMz0piBQqZbgHWd2D7gsc=;
 b=RzU5/pVzMsjqeUpxBRgmUfb2puIyUSB7o6MqtedeCxcA+mpJtaUxH0lfBKzrltGVKU
 UGq43NdMOWNhxllI2FEWPE4U+JIG5FHh70Tqf/I2sCqFyRNX5t/ZtFaDTfHVkg+u1PoH
 x8fydQ4hVB8KMuikE4jN6C0jfNsFw6WZdXRpTz5oqHl+KjN1Dzc3C7f3yO9Ibc/r1E1d
 FJTWiVCBcKQRQuv+Ube12uxqiGCv7CmR6YmSSt+y9V/C5Ko55/hxgc3k7pKIOqeyUcBV
 LKPhLdqjJQZfPVSDnGJCCAeqpvlk/uIefzllLZlYRMStmuzSrEjF8bntEochMQoR7IXn
 zj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708538743; x=1709143543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKKLptDSdqzkckguYJTH6juMz0piBQqZbgHWd2D7gsc=;
 b=Di7+hnIodIq+0FFjQ+Sk7OZwZyZ7lu8a37T51dGmMJq2A9f5cilsl0+jGpLNMw9OKh
 ugHp24VJWkiAmjCBQo2oX7uX+epj2i7dzHWdWvPXU55vVFoFgd/7hLFG9fGFCoATOp1O
 RE1jRVpgV0WmVXXCxxDT51V4KaR4X/4qB+9OKOn/xydINNH2lWrKYbOQ9TyzM9jpWZzd
 AcLH+b02DeS0Ztb3PHJJFjs0Z2dCS93rIurpTU8tykudcxsA60msUoJHcOf2E/h1R7iF
 M0cYJRFMMCx8voqQAMzTal2Vek3nDTIe4l809VXzaYYuTnowir6jWm86yu6jpU5nWTgm
 rV5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZFtvZq9lryD9ekWDDNCzdsme0Qqkb5FVYfwLGEOLF/ZWrT2gBp7NqSkOM2+mirO303xRe5iHzt4f52NX2Unf5PWvIkIo=
X-Gm-Message-State: AOJu0YxTrO7QeWvNhPFim4reUW3xMeaEtPw80UbuNPR4S0UKGS9+VLws
 +XVv5pVVLVLaMctOO3oAmz+I8f/6/WBUrx0A719kC3I3KVaptkHl7nfJ3fTYBz4=
X-Google-Smtp-Source: AGHT+IFV8Zft/HEd0ZZ0Sqs3GE02GOjtOYWps9GcAdWCAGezCPoGChys0Cq19iS0rzx9cDKs4tYtUA==
X-Received: by 2002:a05:6a00:4585:b0:6e4:bc7f:ba39 with SMTP id
 it5-20020a056a00458500b006e4bc7fba39mr277365pfb.17.1708538743337; 
 Wed, 21 Feb 2024 10:05:43 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a62e706000000b006e3f09fd6a5sm7571751pfh.163.2024.02.21.10.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 10:05:42 -0800 (PST)
Message-ID: <094d7589-09f6-4515-ae8d-72acbd3ade58@ventanamicro.com>
Date: Wed, 21 Feb 2024 15:05:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/riscv: Apply modularized matching conditions
 for icount trigger
Content-Language: en-US
To: Alvin Chang <alvinga@andestech.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20240219032559.79665-1-alvinga@andestech.com>
 <20240219032559.79665-5-alvinga@andestech.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240219032559.79665-5-alvinga@andestech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x430.google.com
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



On 2/19/24 00:25, Alvin Chang wrote:
> We have implemented trigger_common_match(), which checks if the enabled
> privilege levels of the trigger match CPU's current privilege level. We
> can invoke trigger_common_match() to check the privilege levels of the
> type 3 triggers.
> 
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---
>   target/riscv/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 67ba19c966..de996a393c 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -624,7 +624,7 @@ void helper_itrigger_match(CPURISCVState *env)
>           if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>               continue;
>           }
> -        if (check_itrigger_priv(env, i)) {
> +        if (!trigger_common_match(env, TRIGGER_TYPE_INST_CNT, i)) {
>               continue;
>           }


Looks good. Shouldn't we also change riscv_itrigger_enabled() to also use
trigger_common_match()? riscv_itrigger_enabled() is remarkably similar to
helper_itrigger_match() so I believe we can also use the new function
there.


Thanks,

Daniel





>           count = itrigger_get_count(env, i);

