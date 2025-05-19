Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E629AC2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 12:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uGzut-0005DU-LS; Mon, 19 May 2025 08:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uGzur-00058x-LW
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 08:48:26 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uGzum-0008Rc-VK
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 08:48:25 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-52c54b4d68bso1403868e0c.3
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747658898; x=1748263698; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fuzWbFcRhLb2YxQqI9UvK1P+c54lpB0j2QHrbT7BLhE=;
 b=lYRM0OiPUy8g6o7J/py4a3JeR4I+qJsaJlyjmUxGjrqIZgLeawYxw0Gj+Al0UzWGfo
 PrwvVvoRlmClPRMqNmHOrBu1v0sQ9mFNeIFYBhwsc92lTB073tPZftHvvrQ4cSQ+/aW7
 1gethDsxIygZ/0VW9uRRBVLIST2y/C02dxqxDEyl/+CA2UZDzxGOf4J2MWs8n9KHnXk1
 hAOxjqlG8rHjET15dfDgbYhjKvfPu3lq+MdsJ+NJukeXM/Z/c2wrmUzUldjTZ0sgfqJP
 HtwNKSLQEyQDnyX4TfwNXMjbBabBuEWVVt3vv7n+oSgKPUG+DluTtYU9J5i+XCnzdTBO
 d64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747658898; x=1748263698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fuzWbFcRhLb2YxQqI9UvK1P+c54lpB0j2QHrbT7BLhE=;
 b=lrSJCE1PfC/Mbic9yxxKT5+BYkBZkm7qc0e+8qHuozhPzkzwMW7FtQy41NFm6E7m3N
 Na3CkmQemrcwXCqLZZQh6BKn7LXHb4gbrjL95grozi1685W6ZSrAXzkn6XNhjn5Uc+Im
 xGPyzB3owPFtVhcB3sWAAZ6cberGP+QWe/Jr0Rx0tO7i6BYy6GhUYda+cd3KkoT09i/Y
 VGNJ1nygbHT82mKDEOrgQmYxYR6K2QMtgzN2TRLWkaIiqis3y93R0AkB9B2BupmqAgQ/
 G91eChOrEjvqWvCN7U0mpNIaxmaZprM1BpbWCU21bGDZxol0mT1Y948eAQVXp0fJCUy+
 Ne8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEYS/Qc28q6ANNbUWnuuiEdhH6sOZsZH11z2iArp2PGitex+s/lAbduKyoYvNWxA/z2/zCtLeBNbFD@nongnu.org
X-Gm-Message-State: AOJu0YzCdKrObEhPHeM8xkh2Z4FEIzzUA4SUMW/I1oJACt3jIq4COGqZ
 FaaED3cW2TD0rrfCffcU/1VBrvTj1dExF85uJGuWZXymLsGACYUVyWaOdYksBYwWMhh9Uc4hG++
 7SijG
X-Gm-Gg: ASbGncuN5ZTmX+8YAJ6YUQwijyMeYSQefe4nMlGhT7pe/xXeoUtorK+sEFE+Q02Glsg
 BrykTCHRdjcr+jemobrhTqJSg280TiZycaNGFd3iQ2OorYNBtRrHV04jCp8GVGmWbndsTrk+2Nc
 7xFzmkOHeAId+GDK8AKd3MewRXmGm5WEexx761P0KXLAJROoe8d/tf3ZYkFMAmYwc0jP2Fe9rc7
 sytlfmvUTlG+SXXYwpL0iClMglfvERThJbSoxojKySkSZjvszDEbkSDG9M1rJ0cLcUwFdV3pAZA
 rPf7a/LFgLuApkG5mfMwwbBEnqmaQlyeqlpGmMy2wHtCude8eoQP+wXojll4MikTtrI=
X-Google-Smtp-Source: AGHT+IE5wQAZnxgje0AJwV07zZvKQd3kwT7hNQRKmOqiCCYe57UpctIIGnw0r6jZmI+0Cj53A6mT1Q==
X-Received: by 2002:a05:6122:d19:b0:529:2644:8c with SMTP id
 71dfb90a1353d-52dbcdfccb7mr8564891e0c.8.1747658897968; 
 Mon, 19 May 2025 05:48:17 -0700 (PDT)
Received: from [192.168.68.110] ([152.250.131.100])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab4e983sm6534167e0c.31.2025.05.19.05.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 05:48:17 -0700 (PDT)
Message-ID: <e86af5b2-7d8a-4503-8a5c-5ee2147aa850@ventanamicro.com>
Date: Mon, 19 May 2025 09:48:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] target: riscv: Fix satp mode initialization based on
 profile
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20250516122319.4100121-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250516122319.4100121-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa32.google.com
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



On 5/16/25 9:23 AM, Alexandre Ghiti wrote:
> The satp mode is set using the svXX properties, but that actually
> restricts the satp mode to the minimum required by the profile and
> prevents the use of higher satp modes.

For rva23s64, in "Optional Extensions" we'll find:

https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc

- Sv48 Page-based 48-bit virtual-memory system.
- Sv57 Page-based 57-bit virtual-memory system.

So in theory we could go up to sv57 for rva23s64 (and rva22s64, just checked).
Changing satp_mode to the maximum allowed seems sensible.

But allowing all satp modes to go in a profile defeats the purpose, doesn't it?
None of the existing profiles in QEMU claims supports sv64. Granted, I'm not a
satp expert, but removing the satp restriction in profiles doesn't seem right.


Thanks,

Daniel


> 
> Fix this by not setting any svXX property and allow all satp mode to be
> supported.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5aef9eef36..ca2d2950eb 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1232,9 +1232,6 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>   #ifndef CONFIG_USER_ONLY
>       if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
>           object_property_set_bool(obj, "mmu", true, NULL);
> -        const char *satp_prop = satp_mode_str(profile->satp_mode,
> -                                              riscv_cpu_is_32bit(cpu));
> -        object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
>       }
>   #endif
>   


