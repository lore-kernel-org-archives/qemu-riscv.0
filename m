Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECA3C5B549
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 14:17:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMovK-0006b2-Pd; Wed, 04 Jun 2025 10:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMovH-0006Zh-Sq
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 10:16:55 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMovF-0003WM-HI
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 10:16:55 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-af6a315b491so5718005a12.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749046610; x=1749651410; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=91CSEGpuWTGEwrNZTiP/RIeMSz/gKpPRsK9PPutKk90=;
 b=SjjEyK0XoLbagx9ez1uceHwya+t1kH8xQjZUsd8xVpzK1UqbWoSgC+BEEqYjVdkJs8
 oKmCVWlCtK2XJbPOrd8IC0XW+SkHNyTgL3D9mfgCC92Y8OyZwh+KHutBX5uEPD7r0J0X
 6ivtUbyrXMa/5pwMlLwFFLWPOve8x6XeDlYdszn6hZpt/uPwJoq1H8nlxFqIkiC14iJS
 LoQT5k5S9i8ZDZ2XjpkT8a5/hLkMbrgsv8yfUYkIkf8I25rBKgxg0O39iUXzXpeoKpHH
 NK2wQh3OxDVCjx5dtdjq1mrf+ozIERRDAQrloBU3mMZ2H6QihjLY6CWmnDHi9McjsQRC
 fdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749046610; x=1749651410;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91CSEGpuWTGEwrNZTiP/RIeMSz/gKpPRsK9PPutKk90=;
 b=M5CNsCMJW6YT9vLi5JT8iBQww+4x2CQSV2IOnHjyTNqkC2n3M/LBC+emu7ZSL66Ev8
 FMZcWwxvtZkz6+IV1fOtlM+2+v+bMRZoKFyDMwk88clDOtZqe9SSRD2qXvWQdeX5b+1b
 djXzgHra23v3XhAstMMZhFym9+q2AKjKj7au7+LJZtR71NDkwcWtjP685o9Qj3cF62sk
 i0DC8ohJOkea3jY3ezOc83XWGDw9M8z1xxFNzGKldH6DKPLqIRQH9NgcxSBTQjjOp6II
 H91bdIRZmtYOG4Wp0Jime495K8IjotNK3A4RieEs4whVmoTbyCZqbX/OOx5e65AwC6hM
 SP2g==
X-Gm-Message-State: AOJu0YxHlyzfkjMA8ghe2k666kukzGcdn2dtkMYvXDv6mEhJLE1avhii
 qedK+Md673evBfqjm/WOiiLrx9n5f87yBV+0p1l6Zr6dg49bS2O61FKz23UnAUOcCBc=
X-Gm-Gg: ASbGncudjKmoqEjkhxMji3ZtBiy6l+p9mljVDH7qqGm7s2rIOAfszE3Q5SAy3eNdJFp
 Jqaxa1t5nxWuDdVwHu6qksW1SYvPYqwKhnFbGehyNGUxebzmgVI1xbtV/HQL645GmXE3EkHNJ/B
 YFWT9V2bh6zZHGVMZwvmOzyK/KOgG85/VHr0qGl37L6bU08TAoNJOx7fdagzdIUFbFFc0uU2Es8
 5lO8Q14qzYn4URDye22BFHvzw7sARJyVwPrPrp8Ii++yFC5bCQBm7XD8jCY/z3o0sYCc9rqSXhy
 gv2uMOM0Oq3/7cqSpkXLn/0JWeMZLBYtIf2VanwJD9WIbbW8FSAlu+rerh1ZUUUQRsE=
X-Google-Smtp-Source: AGHT+IHkLsxFEVYGWtmffmXCQGKgmqJ5BguFuuzF5k3sp58ADicj0JXCWi+hZ+Q3RAZL3l3vI5bNMg==
X-Received: by 2002:a17:90b:3d8a:b0:311:a4d6:30f8 with SMTP id
 98e67ed59e1d1-3130ccce9c5mr4841233a91.13.1749046610151; 
 Wed, 04 Jun 2025 07:16:50 -0700 (PDT)
Received: from [192.168.68.110] ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313156df664sm1087186a91.29.2025.06.04.07.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 07:16:49 -0700 (PDT)
Message-ID: <4b5f47bd-b9f1-4207-adb0-ab46ef4a25eb@ventanamicro.com>
Date: Wed, 4 Jun 2025 11:16:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [qemu PATCH 0/3] target/riscv: add missing named features
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52f.google.com
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

Alistair,


This series is breaking bios-table-test on patches 1 and 2 because we're
adding more stuff in the default riscv,isa and I forgot to update the
bios table.

I'll send a v2. Thanks,


Daniel

On 5/29/25 5:23 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> These simple patches add two missing named features in riscv,isa.  Third
> patch is a doc change I figured was worth doing.
> 
> Drew, as far as Server SoC Reference platform goes, we don't have
> 'sdext'. I guess we'll have to postpone the Server Soc Ref work for now.
> 
> Daniel Henrique Barboza (3):
>    target/riscv/cpu.c: add 'sdtrig' in riscv,isa
>    target/riscv/cpu.c: add 'ssstrict' to riscv,isa
>    target/riscv/cpu.c: do better with 'named features' doc
> 
>   target/riscv/cpu.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 


