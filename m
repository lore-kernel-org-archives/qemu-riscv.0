Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C2DC982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 18:47:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x95Wh-0007Kw-Vz; Tue, 22 Sep 2026 14:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95W8-0007I6-CH
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:47:08 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95W6-0006uo-Nl
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:47:00 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-396ccd66bb4so150303a91.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790102817; x=1790707617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZPr2IhXOs52SApaCaIdBa32t3L64syR+CdMKnh1S4Wk=;
 b=ztu5amWLnzFpR8t+CyJD+hIppt9xqx2e5uI1viM2kxG54Xl5u+efNle+02HLcha9Z3
 9T6uQgoNO4biRz6dqciM5Avu20B2DUhYUmiiOP/mWCgJrp1GaBFvZoAj+0YwDE6Uvob6
 +2JtsrRoWoWhE796O3REhZMeirERb2gWwnSP+nQhpsEq6DgWNYh9ygqJInbR5pxi9S/4
 lauOl8S9Ien4hX+1ypv1SXS/iulgdyzCGucJC9t7o0HHIythCTpLH8RdpszDVHnURuhT
 cf6mVo4q/WHBBtreF2NKjLko215GNnSg9BqhhAz3dV6zGkTLx9nylrJr0u/FyUxNUMg4
 fP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790102817; x=1790707617;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZPr2IhXOs52SApaCaIdBa32t3L64syR+CdMKnh1S4Wk=;
 b=JSenVjNdt4RiOpz5u97CG2qFDQ2N3TLcIMJdRbFXdvdejJWeJ4OVUuoeDuLA+iF9dr
 uR+DRKSnDji95sa6RN4I3/URbNF3vZ7CC6dqrH4I/Fbn6G46RjnpEW04A1LdCHF+23IQ
 K8IsejGhmV6DQB0dOFd0q0RPe7zYLXXWY7Z6GrlHB4+YP8hL+UswHorcxl4FKQzGFliY
 vPvJ/Zrfs+tVUkTfFjbpFXVTeBKPvU+QJ8gh7r4qDi7Mplh4xB8zs5YBJxaMOhTe5cqt
 bn36PNqys3dS5wJSjrxNg91fPqWD2yP6cAvMYd2rTH8+PnNFc6qGc9fw5hlJB2tfj5UC
 gMJQ==
X-Gm-Message-State: AFuF++lqc0W5eh28n9eoQpmutq0IQfi6dd2u+oyCYSIi43g6HqhYco7G
 l5YiqKaQVzgtWPA1n4Cz1+cUcSrkCHPPalkncnxNbzerPnf/Lfhm3Ai3saL+9+iAMn8=
X-Gm-Gg: AYBFou25+Ps45RQA2xQl6pNwX5tR269fvnxv5kS1HXXK1ENbctc6Ka9TzcsiLnOg1WG
 47RoH15/DkaE6kWOkolzmNbkdZyQjKuaTGJo/wMTirlSbvjEgZ5y49M4dCCsFC8cOgE88yjvqh5
 p7uEWniLSaxekfGNNoCFr8FlVaCb+FduFdhQzzgSm+/eAZD5ENFJIbVV/BQZYWOWp02p1fi454U
 CZm8emWfBvL/GJd5YNWtO5qDXlZm2SZ8Dd/U7tR4fQ5xYiGkyfI3YaL6gCEdtPBAbjSweHdJTyR
 bjgAIBKk5vw4Pcti/qNWTTQXhmXRqt9Od/bog8amw+LSmu3b6GZ0J5vA2tSp3RQyy9weG7tA3+r
 qm8b+iew9KBfSkxXw06tbNm1t1i4FHvw2jOG8OM3dL1CjfVDvyupcj4yB54+k68ZaDjG9cqsSzG
 DqgkoXhsoLBs2bNYfQOLbg4ugB69g0qnGVdo1fbNgH18MwEESeAjU+exKLi9KbhBYiKpKMZOh9A
 njQqmO1fYU2g4lfwqzPPO9XH/MBke3gQ70aNRidtg==
X-Received: by 2002:a17:90b:2b43:b0:39e:4717:7cd9 with SMTP id
 98e67ed59e1d1-3a07e313fcdmr311361a91.0.1790102817074; 
 Tue, 22 Sep 2026 11:46:57 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a07dc2b2fdsm691515a91.12.2026.09.22.11.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:46:56 -0700 (PDT)
Message-ID: <74d4fc9e-66ff-44ca-b4b3-7dcaa350cfd0@linaro.org>
Date: Tue, 22 Sep 2026 11:46:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] target/arm: Access PSCI state atomically
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-9-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-9-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> Use qatomic_set() when updating ARMCPU::power_state and
> CPUARMState::halt_reason. Read ARMCPU::power_state atomically in
> arm_cpu_has_work(), which can run without the BQL held.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/arm-powerctl.c | 5 +++--
>   target/arm/cpu.c          | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

