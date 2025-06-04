Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D151FC5B549
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:45:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMsAu-0006hB-4D; Wed, 04 Jun 2025 13:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMsAT-0006a6-3x
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:44:50 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMsAQ-0004NQ-QH
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:44:48 -0400
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-234d2d914bcso950285ad.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749059085; x=1749663885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EEsPwnubASzkmTF/k7nd0dK924OU/Me/6bPKPn791UY=;
 b=LSaqVFU9aKeVFzMJW8R9CcfaRVPSqmQLUv/MoC85beydIDY/6rXzO8Bj4TunXIYZPa
 mH4CPJEpxdCosr7YXZr4tB9nGnQHp7ewQZVPrbuSwlRZYYXrxmBreJsEJPrR03vGiibM
 WCDCG0zlJLJa2ur7F5sPIK6kY3yE1cu+/gy/MlPUL/4PMqlEJ1hTXiSANlFNbwPcxL9w
 NnosDlHkvReJFGemMvKE4CHUD4aXtOUufgk8avph5C+V4DU7OYLhrW0zZl9123S2qxpt
 fwpIqmmApgaEzBe1A8Dcc0AtoIP3RnXlLT5WMot5EN6kEyQctLp6/9L2n0EofkJDwj8O
 j6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749059085; x=1749663885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEsPwnubASzkmTF/k7nd0dK924OU/Me/6bPKPn791UY=;
 b=AwCDK2u1umtm4FfRbspmpEK49QboyMS8Dgdz1pHgHHbcoBGhUl5wxP2ShCzDRHvCuD
 g8sPG8f/+i6Y73Hvm6HwLbRAAzg97nGww1HmfCWhJ2SK2QPJ9Wmt9oedjbI+kNeVPoLH
 oHokrurlB6budw7mXlG/KeMovaOWqY1xkOqQCZ4a9ML9KcQCM6aoGS4oIALfYvD0TazB
 nTLZluLaMpECu3yYd+2tzjk2eSmvciRpIP9b4fMvjqM1dMWcqTbKAzWEBv6ut/XM3+Gg
 Q4Z63fQPlrkOziZczFxyIo4N4k77EzmUuYt59mlzDal9sI+fsiB8P7BRuTdXQtZEYmy6
 EprQ==
X-Gm-Message-State: AOJu0YytK0OIxX94ABUiches+n272FVUQAxm7oojWqMQNiOmRGB0kQNx
 88pFpCZM2AukdvfmS53KZypWYpQwxgsxJJdSeGYHl5WL7bba10GGC/RuAAFfBqQ6w3oO3ROK0p6
 b6RYmn3YfQA==
X-Gm-Gg: ASbGncsPHWOs/5zfeaW4n1i2h7jlGPeRtO9htxiKNuOTIcKMd622x1wQIVMogI15gLk
 x735nsj+QpKzOcRPr4F05vrZZUPK6oj3pCcJK+b99Puzo1hUDWuyuRj88b22IVxjXyNC+DZkjOD
 wUzlBDl6Ys/y1sq8x4kvxSe6Ju4E2MJYZ9/mBqaGVRV4asHYMMLMzrUtrcgsxs3zQOONlcO7X54
 iTXh9FrMeV/pOa3/yitjg3jBuCTXGMUtcqIwdYB1sxEXgXgJjZG9fbChyaGadTy+pFeVtvc2MF/
 W+kAhRBmf1ciPPwDNnJhasXneVF1r/bKuZUutW7X36NorNbLUzzVDmlR2HV1KV5vT4pxcNlyEGi
 +Zw==
X-Google-Smtp-Source: AGHT+IEzOZ4w9rbx4VWYVKmGQQvL1Py1SCsyh6g6feEkW3pogZACN85YnVQRnI63Ec0tZzl8Ht4EzA==
X-Received: by 2002:a17:902:f64a:b0:235:ec15:592b with SMTP id
 d9443c01a7336-235ec155a5fmr24948425ad.21.1749059084756; 
 Wed, 04 Jun 2025 10:44:44 -0700 (PDT)
Received: from [192.168.68.110] ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235eaa077aesm7418565ad.7.2025.06.04.10.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 10:44:44 -0700 (PDT)
Message-ID: <e9cce3b5-1e8c-4200-b63c-c3e897620cbf@ventanamicro.com>
Date: Wed, 4 Jun 2025 14:44:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] target/riscv: add missing named features
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x642.google.com
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

Please disregard this post - some old patches were left in the dir when I
pressed "send" ...


Thanks,

Daniel

On 6/4/25 2:37 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> In this version I fixed the problems caused in bios-table-test qtest by
> patches 1 and 2.
> 
> A small change was also made in patch 1 to avoid spamming "Disabling
> sdtrig due to priv spec version" warnings when running vendor CPUs
> with priv spec < 1.12.
> 
> Patches based on alistair/riscv-to-apply.next.
> 
> 
> Changes from v1:
> - patch 1:
>    - skip the warning and disable of 'sdtrig' for CPUs that have priv
>      version < 1.12
>    - update bios-table-test
> - patch 2:
>    - update bios-table-test
> - v1 link: https://lore.kernel.org/qemu-riscv/20250529202315.1684198-1-dbarboza@ventanamicro.com/
> 
> 
> Daniel Henrique Barboza (3):
>    target/riscv/cpu.c: add 'sdtrig' in riscv,isa
>    target/riscv/cpu.c: add 'ssstrict' to riscv,isa
>    target/riscv/cpu.c: do better with 'named features' doc
> 
>   target/riscv/cpu.c                |  16 ++++++++++++++--
>   target/riscv/tcg/tcg-cpu.c        |   9 +++++++++
>   tests/data/acpi/riscv64/virt/RHCT | Bin 400 -> 416 bytes
>   3 files changed, 23 insertions(+), 2 deletions(-)
> 


