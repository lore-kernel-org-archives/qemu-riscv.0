Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D4DC3DA61
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 02:03:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sYcD6-0002uD-4l; Mon, 29 Jul 2024 22:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYcD3-0002sL-SX
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 22:03:30 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYcD2-0001wI-CM
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 22:03:29 -0400
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-44ff7bdb5a6so18834081cf.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2024 19:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722305000; x=1722909800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7FNqUvF+XJzNco74MQlt6Xl8tIcakoaxeK08Lo7sIw=;
 b=O5oel3pxc+3N+a1uwjyGDjop+fwgANPw6ls5hCZzGpELcL6FGiVqM/U/BOUShXiQ+x
 FidgHECI4As1Dqzl7AKFCQqH4Sxpm/K1Q84rETCVarlkk8XSoadEqvUZd9kZI1bwKp5t
 9JBTkcTE9MaqEVnWc2SrtLFRZ96JI+Be7e7ruoZhJj6Vnl9YHem6LfJRTB6FF44MG8Sr
 UZKtiviy7DNfg7+gVwZt/MOBQLK28CinU81KWKU9yzBkpXR/WHTQX897t7x5AjM0pQRb
 rBpnu+gj9Ab4rSiDADqxvjpNkFQdQlfr0IqXX/g47UniFHw9WT5/GkM3MaHWUYuFzImw
 IMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722305000; x=1722909800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7FNqUvF+XJzNco74MQlt6Xl8tIcakoaxeK08Lo7sIw=;
 b=SsjijS8kYYihhBH5CmjF+vzj8Hf3UuERyuO1jWc0V1uGyY+nvHQDdvbtctlqSnEaZs
 /qzzxSImcCSujn7e0PUJk76xq68qQ3Q/uoeHamttboUw0d03ZAL2Hjb9knVYmQpQN5+Q
 37t0nDI2Yq0DEZU3eSUlK9YinWVzPneqyBCBhk6LPateHyCdKqEJ0Xs7+YPeLcyVOGSq
 K8wl1PCGKTElac9B5/3p8CmFU/pd1zf0RJqiIZNzIl6JTGC0BS81QtkR4f6YavTmJsFc
 zD11Lak3qARWf20uOv4sAiRRETYGCgzf1pfeBEsbpSixerkVTiNyGvF7uvpqgtJFbR6k
 o0lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzfzAlqWR2NdLDSbWOvR513HgTbZmvgt6+ePFeMqlos6LPljEHvlxN1/qATFiMWGXofP3bYTctggxrw2DWJum39twyP3o=
X-Gm-Message-State: AOJu0YwNGP9ecjU2nMnN2ZMPwWSlUX7/7riQxw5+DWbAe71nHA2/yyJD
 2NctHyrGi/XCFDRKPlQS+SjHucShOdjmBqlf5L4qQv87Jy+F3h9cFQElaDtbCr3WpGduKPxVC9p
 fIKo=
X-Google-Smtp-Source: AGHT+IHxaVpnasTBLevsuWtlKoA0IxUJXPaGaErgyId59ZLGqLmmQskc15liu0cTH84jMh32qN1g4Q==
X-Received: by 2002:a17:902:f550:b0:1fd:8c25:4145 with SMTP id
 d9443c01a7336-1ff04809b95mr131361515ad.17.1722294278743; 
 Mon, 29 Jul 2024 16:04:38 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7c8d9a5sm88846875ad.10.2024.07.29.16.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 16:04:38 -0700 (PDT)
Message-ID: <2fea7463-89e9-4fc4-9926-dba304838aab@linaro.org>
Date: Tue, 30 Jul 2024 09:04:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/24] target/riscv: save and restore elp state on priv
 transitions
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, jim.shu@sifive.com, andy.chiu@sifive.com,
 jesse.huang@sifive.com, kito.cheng@sifive.com
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
References: <20240729175327.73705-1-debug@rivosinc.com>
 <20240729175327.73705-4-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240729175327.73705-4-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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

On 7/30/24 03:53, Deepak Gupta wrote:
> elp state is recorded in *status on trap entry (less privilege to higher
> privilege) and restored in elp from *status on trap exit (higher to less
> privilege).
> 
> Additionally this patch introduces a forward cfi helper function to
> determine if current privilege has forward cfi is enabled or not based on
> *envcfg (for U, VU, S, VU, HS) or mseccfg csr (for M). For qemu-user, a
> new field `ufcfien` is introduced which is by default set to false and
> helper function returns value deposited in `ufcfien` for qemu-user.

Why are you using a different field for qemu-user?
Much better to simply configure menvcfg the same as for system mode.


> +        return (env->menvcfg & MENVCFG_LPE) ? true : false;

Never use ?: with true/false.  Use the correct boolean expression in the first place, 
which in this case is just the & expression.


r~

