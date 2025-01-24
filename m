Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BB1C0218B
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:14:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNFe-00016i-Mf; Fri, 24 Jan 2025 12:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNFX-0000zd-UV
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:13:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNFV-0006K1-44
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:13:42 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-216426b0865so40273885ad.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738818; x=1738343618; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RAGetrQXd5TI6vEj4fo4gqVGkT6q9EYVtyevmM3r/N0=;
 b=B5hU/x5DACSv4k5PVXYhooNxajxn5t7nlLmUswEnYtUVIHwaKFZWbAfG/9uViQSHR6
 7NIkoBX/iUVBkQ0OXJF6ZCfXe5Ll1Uh2EcKTPqzDL7+38bsFdG74SwjLupsC9FRr+118
 ipkQGjFqWcbHelJvMvTG4r526QBKZOfysl0pAN9UE9AyWLWaBbaz6ezPgcCa9UsUU9Rt
 gSryEzGSCO8v2n36V/2HEZVhg+VggIG/3R2gPfXH5t7scxMQD6JnZ/HlYDq7luHpXEIG
 80bckihUo4Y5IpAk2NJZBjlRHuzQ6jXfq8/LYYLNTU9C0E0C5D8cV8oIy/Eim8v/ohVJ
 qVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738818; x=1738343618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RAGetrQXd5TI6vEj4fo4gqVGkT6q9EYVtyevmM3r/N0=;
 b=VExRKpzPHirVrFKNfe5UMay5rRnS05AIdGJbY48qeGiMTLRwIVEe0gyo3KGhh5CDs1
 ikHycuUr/xNP+mOc4w5hxHMp2nhMh/YbT+yJGCy5v4WnHBOX/MEah1NK3+Nuzdi9kray
 j42iK8aeIPB3ZP7S7XvlwwSainjd7I8XzFu0hOakpetZC/rvGSi0BDyqZ0vSPYBMS1wJ
 UWsr0QFqWnLhtMPxJJKaH3xzc6bnxkySO1QRK0161FKr4TA74cS0Dt6oSybVcVpaie1K
 8SUFGQpLiOkwHRGGTKG+fg+jMSF94laMGpbOAwnc6zrPjenNBl1Cv4n9P2AwvWEvRnKv
 L2fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx/IMjFyHRGlajJG2q/jX6ipXglsvt26RIAvUSMIlPKrWQF7PDeAOot0es76D6rNOlbjO4n2WbYmIy@nongnu.org
X-Gm-Message-State: AOJu0Yw13aArFYWpF4SPkUToG1XleJDO2mfaC31INY5FMnPzbqEhRPr/
 53aLKRh7f7Y+xKoRl/fUTCB9LEg+LpKuC2hdqpSUgAPtHJuAu7ATyYCo9ppbv3s=
X-Gm-Gg: ASbGncsPtOxO9xfumxk8wtLaEofsD03DwysE90MFt5ShmicZAmLBNg1mff1xzva8Rns
 PxvrWpdpJgZ3ccKIAFPStEcEQu/HhfdSi4xtRst3as8PzXvHHmVtr4+TYgJXf+NQ44n+O8jcwXD
 5kP2/O+R9wkv8Pa0Lis26kQ73L5Fde3Zh50WH65/C9TZxXHOPcgDWk14KBiM19CqFShleDCOSWN
 nkM4RO+dXKNkuQwEsxCDrcHN9Ju0+AuoDlouNcjpF+Tg/+yW28dP2ZSFcIcQJ6ajdvi8TYtabZf
 jPC3BMx3o701j9FanrJwDIqec3j9
X-Google-Smtp-Source: AGHT+IGnWLkt7PJLpJAoQwSWsoVrsHUK8KbBypgbOnoEXf4AvkxMqq5o7So/myue36JTeVohskK1lw==
X-Received: by 2002:a05:6a21:78a5:b0:1e1:9fef:e96a with SMTP id
 adf61e73a8af0-1eb2145dc72mr47003917637.6.1737738818646; 
 Fri, 24 Jan 2025 09:13:38 -0800 (PST)
Received: from [192.168.163.227] ([172.56.200.253])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a69f411sm2099365b3a.6.2025.01.24.09.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:13:38 -0800 (PST)
Message-ID: <ee99afc8-9ab9-49de-938b-c76e5442393e@linaro.org>
Date: Fri, 24 Jan 2025 09:13:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/28] target/openrisc: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/openrisc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

