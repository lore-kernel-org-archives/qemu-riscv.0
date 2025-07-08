Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C08C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 19:42:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZEBt-0002WE-EI; Tue, 08 Jul 2025 15:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uZBMA-0005sc-Tn
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 12:40:28 -0400
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uZBLH-0007ay-0w
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 12:39:24 -0400
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-6118b000506so1185064eaf.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1751992377; x=1752597177; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1X4IAeA2O2T066BMmgQNMiWh7XnPFYJbke9bUDYN7EM=;
 b=Vw3kpzxzzmg3ttRj5shN0a64Lv69/8IDi8C/co9mFg7utnTIgedvObmXAaJrK93tKf
 WFjOFJU8fvmBoXuGB5wFJw8vqyzx75yvVRmvJXzel39WWDqRdw5D0CrPlHnhp2MledNY
 KkklXP6wTcIUlHqUEiYG5qcWeDKOGaSyFrCu2kWacb94iAm64n5WMnEmriS+JXcHCFUf
 4aZSmiVEiUbzoXwDPtPS12oSmlQhed1Kubq+pAZWhD9lWZIfBNzodtM62RW5nyopKvVs
 Ng4+zgHbipquSql8X+/fBD4+IVXiyv6FkIo8tGH/3T8z8q9vxra5CE0/xsIRjE6BnA3S
 Ne8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751992377; x=1752597177;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1X4IAeA2O2T066BMmgQNMiWh7XnPFYJbke9bUDYN7EM=;
 b=vEgE8iL1F7gzODdPdlaTRto7blJjdWzzCkUcGIZfO9aHNCiIFII5DM26/NWCIGF0nF
 KDDslYF0We/x1LTzQ3AqwyqjJnOhbZwFnXEvCIz5Bq+2w6yrazW9gPNUf+8LSRQcRj3G
 mqVz0giTYueLqoSbieeKw1fMFEt3V6dPmqWv/mMu3etgxDwMtIJh7pqmzp6OSNMOPyzw
 H34Q32BhSGLCguh4OQBtXqRDE3J/X+CvH+83LO1mckflG9D9+tz9JQ+5oTz0kVD/78rN
 2h1t7se1PTWNwyVUwJz42U8n7lkJ6KbYkBbGPZ70wYhYTYfMgEagsr8PIIQipuB541jn
 aKNQ==
X-Gm-Message-State: AOJu0YzQZTKlhmttczRQ4r4TwvsKxLnzVmNlHyi3gFfJoaOt8rouxicX
 BhOEiE9RS+MwnozYR7ZPAoQP5LRC0StVasg8Xq2kyMCyTyUuMNylb97wmK6smclsQf4173bZqsV
 oqdIE
X-Gm-Gg: ASbGnctr8+d22x+s5gSuYmMMkqecZhSsaKK3YgntjYmpgdZs2+xxPBMmseFL4hNhPah
 H/EbJvxF+SVbZnsRzladK2pE3D9FE8poLhLyzVRRdmHSaihJJgPnj/XN2W55AwBt4yxXtXFXwod
 0/uJSJ15YSvjWGrzL6O7FASg09tK8rK7SkYiyPm2GKlZmwbb/9DRJY67zA2CvF43dHm0W/e83no
 uOhO7ILOazoqX3a3aFxIn2ySKfUMRy26r4stotcpc2b2yaupaO9Bk0bdccX5EOE0d5R8XooeTMF
 aNxov1CrBR0LzGj2a90pn2PnymtzYYrFuUP2cb5fuueROn1hAIilp0IoVxR2uqBQc3t+w1uAb7V
 tXw==
X-Google-Smtp-Source: AGHT+IE1RAIpgU7PfYmnyNhZFs+JOB2uhU0+u5Bzss/zroThLGY4tIyQjh/pcBTd+I7qj4plzcvEUQ==
X-Received: by 2002:ae9:ec01:0:b0:7d4:3c5d:3256 with SMTP id
 af79cd13be357-7d9ecdfaea0mr403667685a.53.1751971708033; 
 Tue, 08 Jul 2025 03:48:28 -0700 (PDT)
Received: from [192.168.68.110] ([189.110.107.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d5dbe8f844sm754423885a.82.2025.07.08.03.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 03:48:27 -0700 (PDT)
Message-ID: <b9e539ee-cf63-4a64-a3f2-03dfe7bc82a5@ventanamicro.com>
Date: Tue, 8 Jul 2025 07:48:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: add all available CSRs to 'info registers'
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20250623172119.997166-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250623172119.997166-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.161.53;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-f53.google.com
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

Ping

It would be nice to have all CSRs for 'info registers' for the next release.
We have one week before the freeze :D


Thanks,

Daniel

On 6/23/25 2:21 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> The output of HMP 'info registers', implemented by the cpu_dump_state
> callback, returns way less CSRs than what we have available in the
> default rv64 CPU with default options.
> 
> This series changes the callback to add all available non-vector CSRs
> when issuing 'info registers'. The vector CSRs are being handled by
> another patch [1].
> 
> Patches based on alistair/riscv-to-apply.next.
> 
> [1] https://lore.kernel.org/qemu-riscv/20250623145306.991562-1-dbarboza@ventanamicro.com/
> 
> 
> Daniel Henrique Barboza (3):
>    target/riscv/cpu: add riscv_dump_csr() helper
>    target/riscv/cpu: print all FPU CSRs in riscv_cpu_dump_state()
>    target/riscv: print all available CSRs in riscv_cpu_dump_state()
> 
>   target/riscv/cpu.c | 107 +++++++++++++++++----------------------------
>   target/riscv/cpu.h |   2 +
>   target/riscv/csr.c |  18 ++++++++
>   3 files changed, 61 insertions(+), 66 deletions(-)
> 


