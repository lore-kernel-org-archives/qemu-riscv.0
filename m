Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E722C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 14:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGgKL-0003sX-Af; Fri, 22 Dec 2023 09:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGgKI-0003sD-LH
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 09:16:34 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGgKG-0004Pr-Er
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 09:16:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d3e8a51e6bso15368655ad.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 06:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703254591; x=1703859391; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hRBjIQaX1WxFYXzN7GswkrTFHAiXOnRTzyapnFa0Lcc=;
 b=pm8R8oG1RuOwNAAsttchgm6ocXpR2pS+ZQFKbbpNYNpQas9RX9GyIzE2b3+/1WDdap
 ZZv6KbZoBoK6IP12ANjKvK8lhUOVq9o6H7YnvR2XwsqYSifXbqVmhLAJZmpf1JMQRN74
 OkLdDgKXvo+4I3UCj+RIJcaDTpuk2fW8t90X9fZdLAbsCK7X64k9e5d7DsVrNvoQQ9HE
 lAL9H6mvlDXhcHio7nhujqKuv7ju8XUySfWta0/FTLbHbPpXa90qUALRKXxrrNCpbpTG
 5k/wJost7YCqYAyF1xZWxheP+R3OJIn+8oADq42aDNuH29NVDo8XxxuRuc0Y0PIocQwB
 cZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703254591; x=1703859391;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hRBjIQaX1WxFYXzN7GswkrTFHAiXOnRTzyapnFa0Lcc=;
 b=FZ+h/TPxU2kIpky0ho0yBOJQlbKzjmYDmSS9XF0bLQAHJHkI6H9QgRwMnBy/BOOYnO
 alDaMIOuzW39COquKs6SV6gfH6yvOUc/X3OlHQMAfy/p9YHm9g/VofCsji7uyYGhi+Lr
 ABC4UJcU60g1FfMFfw2TVlfWH4d0IhXiwN2q2g+tx8cBAvqqHTf6hkYSJ7F8Z9CTOl60
 aixs0i68IWCG6bG0x0elj76ipceq81e1tVwTbl66mLINywAaJMlzvB8/47aScsrwnF2L
 RoEMYMm9UnRQ3vC9ftLCTdC41T3zVpRt2iNUUiZdg8a2hwDO8evu/0LqOf3RwF8dI/g4
 5jkw==
X-Gm-Message-State: AOJu0Yy3UntMpeT9qFEe4ygymAVoMGe3i47ATzbEQvmtIN3WptvLjOD5
 RN+LEcGrWH9fkAhdjXInPg+b8yVAW3LT9A==
X-Google-Smtp-Source: AGHT+IEzDixajrv+1rDxeMss7RuPKfWhB+FqLRd1Mw0sx/SH6uiO2jhr/Dn+RCi+IYnIAYAC6rPaZg==
X-Received: by 2002:a17:902:6bc2:b0:1d3:47ba:ba48 with SMTP id
 m2-20020a1709026bc200b001d347baba48mr1050757plt.133.1703254590770; 
 Fri, 22 Dec 2023 06:16:30 -0800 (PST)
Received: from [192.168.68.110] (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 q17-20020a170902dad100b001d3eff0728asm3498423plx.78.2023.12.22.06.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 06:16:30 -0800 (PST)
Message-ID: <846ec319-6026-4b14-b156-9e1f42c6dba1@ventanamicro.com>
Date: Fri, 22 Dec 2023 11:16:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] target/riscv/kvm: QEMU support for KVM Guest
 Debug on RISC-V
Content-Language: en-US
To: Chao Du <duchao@eswincomputing.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, alistair23@gmail.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org
References: <20231221094923.7349-1-duchao@eswincomputing.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231221094923.7349-1-duchao@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

It seems that we still need the kernel KVM side to be sorted out first [1],
so I believe we should wait a bit until we can review this RFC. Otherwise we
might risk reviewing something that has to be changed later.


[1] https://lore.kernel.org/kvm/20231221095002.7404-1-duchao@eswincomputing.com/


Thanks,

Daniel

On 12/21/23 06:49, Chao Du wrote:
> This series implements QEMU KVM Guest Debug on RISC-V. Currently, we can
> debug RISC-V KVM guest from the host side, with software breakpoints.
> 
> A brief test was done on QEMU RISC-V hypervisor emulator.
> 
> A TODO list which will be added later:
> 1. HW breakpoints support
> 2. Test cases
> 
> This series is based on QEMU 8.2.0-rc4 and is also available at:
> https://github.com/Du-Chao/qemu/tree/riscv_gd_sw
> 
> This is dependent on KVM side changes:
> https://github.com/Du-Chao/linux/tree/riscv_gd_sw
> 
> Chao Du (4):
>    target/riscv/kvm: add software breakpoints support
>    target/riscv/kvm: implement kvm_arch_update_guest_debug()
>    target/riscv/kvm: handle the exit with debug reason
>    linux-headers: enable KVM GUEST DEBUG for RISC-V
> 
>   accel/kvm/kvm-all.c           |   8 +--
>   include/sysemu/kvm.h          |   6 +-
>   linux-headers/asm-riscv/kvm.h |   1 +
>   target/arm/kvm64.c            |   6 +-
>   target/i386/kvm/kvm.c         |   6 +-
>   target/mips/kvm.c             |   6 +-
>   target/ppc/kvm.c              |   6 +-
>   target/riscv/kvm/kvm-cpu.c    | 101 ++++++++++++++++++++++++++++++++++
>   target/s390x/kvm/kvm.c        |   6 +-
>   9 files changed, 130 insertions(+), 16 deletions(-)
> 
> --
> 2.17.1
> 

