Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F4C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:12:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc10-00024Q-9J; Mon, 10 Feb 2025 17:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0f-0001dr-8N
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:12:11 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0d-0001EU-Dh
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:12:09 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2fa19e1d027so6156771a91.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225525; x=1739830325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QqmxHfGf1ujzhqbDSxyygIhwXCXDJev2LskftYaJDcY=;
 b=pLasVdPfAuglQdcCfLcNoMXIsEnplbKTAUG2d0QkTjhmISP0wy2LW4dbATzPneLNb5
 Wi5bGMPI31k2V6CbmipE1wJIpLHjiaVZrVFAmRx+G5SI5vZLCUk2Y+7tpmiO5VQBm6V2
 JtIRsnB8zM0rqLI86488XJiGkpAWr0ejGZBa9gANVdo1Ww+G9xx17uLClIbsHLqUbNNA
 rvC381DCc9c0xQ82kJAAbdpHcyp+h8wbQX/bbksg0lpjCpdsxW0fQianzuVJzG1BssVg
 4QHRVIlPYgBwaBJ2TwvsswP7RDjqPKj09gOOaHBpACncPs0vdWTIZ7kD7zpICqv90/sp
 n3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225525; x=1739830325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QqmxHfGf1ujzhqbDSxyygIhwXCXDJev2LskftYaJDcY=;
 b=MtVUBHxOcj6vw4cXtLQ2wYvDOAzLn6yOJwG6IK/IdomfeaF9zhtj3VCAmvyV1hKdTF
 R/C4r52pSmOPdi9O1TBJgpSfp7riuj5SC5o+U5MS8W3BQYDpUjDVCQbxK7TOXLqRiiBm
 R7sMlIBHy5rewAI0xKGI6Pxxz2MDezGO8ysZvE1nB4n+aETyuZtKnYO4OM9ej4+8i7Kw
 MAHT7HmzIdtQ6BlGLMQao2nsS4F3AKzsTeHYGHqYJ93J19oL2oDXsKXgUn1eRF2fpHhV
 1kxOe40ovZldB8JYDVpjSEcC/G6321fDdUf1bx8p3zJFSHaIMDk+JkJ2RSHZmsAFeCQA
 YAPw==
X-Gm-Message-State: AOJu0Ywvq9Vur1ZSjBGTIPOAunnZFoVFvJLZvSOo3IxBc6m80vLQ6Fa7
 iVzCvtGHBDaAFOTOBYBf+L2aUi5wdWARnJvAsMK4tyRNb1BABFy52iucSnPmw5DRpwWFJJUjAGB
 a
X-Gm-Gg: ASbGncshxZflbro735SZ9c6qHquxvjQAjxEZ9HH5hPVgYMNMhBZXoNRRIISCnJk/sYC
 oTHNMGNAbrcp9tRK0xOITmD/QPATl5JLImPGVJPZwTdOG6TJg0uceriHvv1+a7eYCzGBWmmZWGB
 QdjVsZyJ0oA3TbOh5B5cEDuL7F1diwwakGYW2xSTumMwafEAAwflDwcuw3Y2ymw0Q0QX2m+2dqz
 obvRewv0YaFrdpYFwZvUulLityQCU5bK/3aeULWIqUQ2+4hhmjWtJKN2Von0uakzyBSd6H0GMjJ
 FA3rjAq8oaZscJlDkC6aDL0H1WGxtZJcVrZ5lmgxAN9vRduCuu8DMIY=
X-Google-Smtp-Source: AGHT+IGugWr1GoxPCxVbHDwVXDU0LtlrYPIXrm2BNdCG2VIeN117F9rX3cF5HMh3upEqa7oAblB1cw==
X-Received: by 2002:a17:90b:2252:b0:2fa:1a8a:cff8 with SMTP id
 98e67ed59e1d1-2fa243ed2efmr22680571a91.29.1739225525308; 
 Mon, 10 Feb 2025 14:12:05 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa20eba0dasm7782809a91.45.2025.02.10.14.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:12:05 -0800 (PST)
Message-ID: <fd3fba28-ea24-4ecb-84a3-2c9a84bab68a@linaro.org>
Date: Mon, 10 Feb 2025 14:12:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] target/mips: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have theCPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/mips/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

