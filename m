Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CADC982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 18:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x954m-0002eh-Qw; Tue, 22 Sep 2026 14:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x954B-0002VK-JU
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:18:11 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9548-0003wg-AD
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:18:06 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d93ff61046so818665ad.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790101082; x=1790705882; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3mv3cHPFYGWMTe3QgAlNG3N5P4lUzLqmm56Bew9LSX0=;
 b=E5x4XRy25CdJXcaha7zd7pmJe8cSDAG7Ix3+q6PGB5ms4sfyGxCTAXexlyvQta8U+0
 D7oE/saBcFcHNaifsZPDq7rWmi7u9SK7RLX9Td2DSN8xMEsBhjkcUP98vwnOVM5kYijk
 6ITWUAw8XfN2R90F85RYnfJeKlxKjkhCjR6Ca5N9qzvd6HBuHKNhtTU5FFCnywwPcUhC
 m7N9wRkdtykxJXFH8Kh0qbo5Aavff2znj+nXkZr4NJSzIBUP/4n9bNCOC/aEUknj1XM5
 aIpEyQNs80TDL0R4ED3lJN2R479Q47vVKpNkMLdGOX6F3fgfE1MK3mP6xSEA54Lli79J
 88OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790101082; x=1790705882;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3mv3cHPFYGWMTe3QgAlNG3N5P4lUzLqmm56Bew9LSX0=;
 b=y4jZ1979j8po1vFwyJGbi9wwYLsFr6qectfZODTMMvIUkccKRMEIroLMxzBI9THIyP
 k9pnqE/j1hLnuQEZvATF+dWp/foHMZ19NYBocvz0NpfhUm2EsusRTOxpa39auEwjfcgi
 pV1z5oYpQvXS436ihnQvjlzH+cqWZPdyskNLEp1JlqMGfBPJj6m3YZiHTJsWy25MU2pE
 XIxVwsg303NFAMnz+MuqQ8RDJjpLdVIW5YNigyBPeA7Vt/TD8UjoaXVfY41wwenMN4D9
 KdL5xwf1+MfXR79q1sV5XkJ+83Nnsm/dlwDXPn2qmkph+HS3qNbEGdqU6R7dNdwsQhn6
 RFFQ==
X-Gm-Message-State: AFuF++lsDetXYMd3Y+HixRwy96VVxPdLouuje6QMXTm0W2tD0vm9Dak7
 0xxK3nztTyYD8LFnYmiiww8ohf5l1MUDGsKHbZMgLKcd8eJPVRdmKAahRbEiYdb5TC0=
X-Gm-Gg: AYBFou3LPk2xAFrfQuLL2Qpze8HMujtTNywisnIEGINAl+fJFD44RE2VVEF3tvjR/E9
 fqV+M6mQO3atkS8kI208SMwxmfmGM/uaf1+DFm3HWQRqigBNFOjY5wQh0t8EnPwRJPin2T5SrWV
 ObQuS63e8YEZiSMcZzGcGHVK4mnQACtlWkpRaKi/qu5i3htNtiOUmk0rg35TsTloCNU0yRDEVpV
 dLZgrfMK8PiNx1Ms7R4OOyoEA9gvI4NbGDkAM2T1jH5ha0/urn1u9A6Wz7tIyPR/5obHADyX9Y1
 tuZ4Q8qnNJ2KUxMnrod8A5KZRbA6MG1RHZRauxgsWNQ6u+SawdC6TH8yLxT09SLLbNrJ6WkPKmZ
 6oz2HHa4JHZKp5wwvV19aj/mfkROnfVeilwjjoTw4U+HugUbFrd1BGUg69O91lr9J6dZiXYKbgN
 2IBChMpp686xo9YfrW57PLCPvW6QXb6uVlHvg+8LkFjnc60n/Rc8OUY7flWTpdKqfPDHJ6/6RqL
 8Iz8fFKyHa4tC76LrOSWhKNndxO5lbnPjyi3Fu0eHqZ5VCg+74=
X-Received: by 2002:a17:902:db06:b0:2dd:c054:197d with SMTP id
 d9443c01a7336-2df69db61bamr1840665ad.34.1790101082320; 
 Tue, 22 Sep 2026 11:18:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a0a6661sm497205ad.37.2026.09.22.11.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:18:01 -0700 (PDT)
Message-ID: <17bba942-cefc-4e17-92ba-92e64de4311d@linaro.org>
Date: Tue, 22 Sep 2026 11:18:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] system: Document has_work() synchronization
 requirements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-2-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> Document that has_work() may be called with or without the BQL.
> 
> Require implementations to remain idempotent and avoid consuming
> work, and to synchronize state shared with other threads without
> acquiring the BQL unconditionally.
> 
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/hw/core/sysemu-cpu-ops.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

