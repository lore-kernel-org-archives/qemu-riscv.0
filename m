Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FF1C36000
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 15:08:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvdz2-0003KX-Pk; Fri, 21 Mar 2025 11:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvdz0-0003G8-RS
 for qemu-riscv@nongnu.org; Fri, 21 Mar 2025 11:08:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvdyz-0002Xw-2G
 for qemu-riscv@nongnu.org; Fri, 21 Mar 2025 11:08:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-399676b7c41so1184995f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Mar 2025 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742569702; x=1743174502; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n+z4OLsw19c9Vi7ugaiCJN8XIxvp1172oM5gD/tFons=;
 b=ednVqQUKEqSWZwNUd24Z8mTVqASAxrChAryacOwu3nmFFiVhg/EVZzaiBx+N/3iTK1
 FeAE+nqp9gyFYo3RzbVWhrWNywuekZZlGbiZav5t9Q2N2S1RDAMRB8gZ1L9OCtlShGhO
 bnNt7u4W0Gry0kmhChX0MKZVod5qdsmihnEY9txu8JeSQbcYak8XJ8vBiTJuQ7WNe9F2
 24IX5/i1DQKybcX4da5w1p8pKnfpZr2neXxMKfwxTPe+xG3HdOphRV0sVdlBZBOCuPGT
 QPPWn5IZs5GCl/gkncabXFW1t4LZ4nbbQmMvFE683StQf+i+JmtbFpzprSVNWRDYBjWt
 HgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742569702; x=1743174502;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+z4OLsw19c9Vi7ugaiCJN8XIxvp1172oM5gD/tFons=;
 b=f6AAcl0MGniF7OMr4eAo9w+OVKbwkSsVcFJhfua1NcqpsZhYj7rE8DrSFBWegdHXDS
 TD5QN7Fl8M1l5ZYAiJ/fyJs+MIDEJ0d+ozlmol6m97EFBBBF2c5nwK1b7BjF9sYKKsem
 LSQr/w3vL2PkZ8Q0ZicfHb+8y1iPGSE5chS+sdJHVokkT18Gj2dfj4ZWvdkisYmnOf1x
 0c3PXeMjSfdsZzbveEnA+8crmkZFUeSCfNV2yG9SX7uu/7Iqt2w7x7sX/s8Twl4ctxS/
 nyyDw/WJxyLR9EQcHSxfoNR5jl7GFkhNBJh8nc6kCI59inAiYkmFw4U7lcB3Nj9uK+Lm
 4Szg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRqDLZ8pZu1C/kUoPmXV0X4S4IknA06SQDU8xWjD1Y4Vyez6sTBZYzEZzPIuVJ6BvmgKyE6NQ4tEtw@nongnu.org
X-Gm-Message-State: AOJu0YzFb+XSKPMgspTz8n5WUhddgS/zyrYvYp6BhxIAbvOQvh4IaK7x
 8xu5BH388kOOCCUcELVZHOmzhFR8sNhcr2VkzBTtgElcK783YNXqL9Q1OgHeUDriGDiBD/NXllg
 l
X-Gm-Gg: ASbGnctW4vgLhV5PywjO2iEmzOUrKjpAz2rWHxng+R58HjF6534bdL1g2s9luX1ssjp
 wI/Q0Z9ZgFOC1RAvw6czYONXvoROE7kDi755A76KTRW9vtkpEMaRCal5jRx3020d6grLdu2GI1j
 PHqDfOlakH58iDiWMmyAC8Jv0D9rG4BwdJfwIJPIOakegG4jgF6HdlmVx9Xxz4RuXgRIVqbwpOX
 /I3XSwN68ONeqCVoKutPsMA+CeJysLoyeqS9zsxkhjIvRLpJIy8J9UfIeKtdq9ayvREOpv9yb6Y
 Jcda7/wMdfrl5ewZZvBY4iN1ptJxbR/YOprGi1RfB3Gp1oqfMaZUaZizDDwoHGVuorvn3dHCuBq
 EFbOdYTQFVXjI
X-Google-Smtp-Source: AGHT+IEvjHrix7KLJf15/ZZiqdU0yfLVkXYJf2dj9PHooh3wGqZRkaJfQXCkAjrTSld/VkmFP0NuoQ==
X-Received: by 2002:a05:6000:400f:b0:38f:6697:af93 with SMTP id
 ffacd0b85a97d-3997f8eeaddmr3601255f8f.9.1742569702274; 
 Fri, 21 Mar 2025 08:08:22 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3b83sm2648327f8f.33.2025.03.21.08.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 08:08:21 -0700 (PDT)
Message-ID: <c5c8566a-fd0d-48d1-8ed1-e52f0bb4f210@linaro.org>
Date: Fri, 21 Mar 2025 16:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] Adding partial support for 128-bit riscv target
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, richard.henderson@linaro.org, palmer@dabbelt.com, 
 fabien.portas@grenoble-inp.org, alistair.francis@wdc.com,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Hi,

On 6/1/22 22:00, Frédéric Pétrot wrote:
> This series of patches provides partial 128-bit support for the riscv
> target architecture, namely RVI and RVM, with minimal csr support.


> Frédéric Pétrot (18):
>    exec/memop: Adding signedness to quad definitions
>    exec/memop: Adding signed quad and octo defines
>    qemu/int128: addition of div/rem 128-bit operations
>    target/riscv: additional macros to check instruction support
>    target/riscv: separation of bitwise logic and arithmetic helpers
>    target/riscv: array for the 64 upper bits of 128-bit registers
>    target/riscv: setup everything for rv64 to support rv128 execution


I see this series has been merged as commit afe33262585, with
332dab68785b describing:

     This patch adds the support of the '-cpu rv128' option to
     qemu-system-riscv64 so that we can indicate that we want to
     run rv128 executables.

     Still, there is no support for 128-bit insns at that stage
     so qemu fails miserably (as expected) if launched with this
     option.

Is this code tested? 3 years passed so I wonder about possible
code bitrot here.

(I reached this code by looking at targets not supporting MTTCG).

>    target/riscv: moving some insns close to similar insns
>    target/riscv: accessors to registers upper part and 128-bit load/store
>    target/riscv: support for 128-bit bitwise instructions
>    target/riscv: support for 128-bit U-type instructions
>    target/riscv: support for 128-bit shift instructions
>    target/riscv: support for 128-bit arithmetic instructions
>    target/riscv: support for 128-bit M extension
>    target/riscv: adding high part of some csrs
>    target/riscv: helper functions to wrap calls to 128-bit csr insns
>    target/riscv: modification of the trans_csrxx for 128-bit support
>    target/riscv: actual functions to realize crs 128-bit insns


