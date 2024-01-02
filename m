Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F6CC46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 11:41:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKd8l-0005AJ-RQ; Tue, 02 Jan 2024 06:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKd8k-00059h-EY
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 06:40:58 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKd8h-0005Pp-Gt
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 06:40:58 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6d9ac5bd128so2095603b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Jan 2024 03:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704195653; x=1704800453; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/D9RXVtUGUvypPb23ej2EvWHBg+LtAi9dKXPwv2JqhY=;
 b=oK++d8KQSaZxgeFUq3cma6Oso61oRNNkS4GQoI8VBvaYGmTc87yJmTCPjQM1ZKMhxm
 FfDejFioEJ+CfOS8JzGIIDqOrHTrOLWs5l37SSLhbktnodMhewy05ERS5J54WhGXBZQ4
 eVwl1KSeOm5Y4HkvFkkhdxaHVWQHxOc3f8TPZhuWxhmDCEtOJqUgMSkVW6Js0/e5cLHP
 miH51MwOKQdXpXSozXt2X4KS4z8wYBLkcq8LyVvZU4PZwKaXc/BOk4CBNGdsR5Q5tDp/
 4HDkS8OHSJmudSr1IquAf3ITtn6m7bKLnatfwG3xRpB3Snq39QnE16sFG9i/rIB5DbSL
 xjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704195654; x=1704800454;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/D9RXVtUGUvypPb23ej2EvWHBg+LtAi9dKXPwv2JqhY=;
 b=myYPG2pYO2BRmIL7ruypdFJudnHQwtzBlujPUvrbBkEo6SnqZ3ZtzMKv+z7R0vNshK
 Qcm665OaGLZY4ZqZNUmGKdzbAiJlHPgqaZ7xKawUIP1Imsn06eS4Qt7AXsH8+p/zEQm2
 u3eQIXe8LhEL7Eq58ZA9Wb72zyUjNx68WCzsdM0XadNH5WDQhFGzonGhlJUlw1DOXw5D
 R+iaeT/lJlagF0yXQnDhTODongoDKBWA6VAI0vmOyyRYyZsLuAQ7PXwn0JrXVmd9O0g1
 RPddhVOrmkXihMvn38D2Fz1IMXok+LYlaxH2sxGXmz/Gm8H8jAYuotIYvncctSegQmiC
 gIEQ==
X-Gm-Message-State: AOJu0Yyu3T3klt9hYHpz5W0npt5H3awYhYsiRDfn1gJ8u0cxZqS4QVNm
 U5odZT6/deeQ8kNuTqRRwpYd6ws8QGwNbQ==
X-Google-Smtp-Source: AGHT+IFRAlafM2IcPA/b5bfVw6DAzJTH9ElPIevIuQ4OVkIb/stP7ALsYgxPs708fytv4m6isjJNBA==
X-Received: by 2002:aa7:8b4a:0:b0:6d9:b92b:833c with SMTP id
 i10-20020aa78b4a000000b006d9b92b833cmr4735605pfd.55.1704195653660; 
 Tue, 02 Jan 2024 03:40:53 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a62e716000000b006da105deedesm9565035pfh.197.2024.01.02.03.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 03:40:53 -0800 (PST)
Message-ID: <a3f0392c-6a1a-4d48-8d55-13348457c345@ventanamicro.com>
Date: Tue, 2 Jan 2024 08:40:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/26] riscv: RVA22 profiles support
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x430.google.com
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

Drew brought to my attention the following post on the tech-unprivileged mailing
list:

"Architecture Review Committee meeting minutes, 12/19/23"
https://lists.riscv.org/g/tech-unprivileged/message/611

Second paragraph mentions:

"In response to some recent discussion in the Apps and Tools HC about how profiles should
be represented in GCC/LLVM, the ARC provides this answer: compilers should use a single parameter
for an ISA string.  An ISA string begins with either a base ISA name (e.g. rv64i) or a profile name
(e.g. rva23u64) and is optionally followed by additional extensions (e.g.  rv64imac_zicond or
rva23u64_zfh_zicond).  If the ISA string begins with a profile name, it is equivalent to
replacing the profile name with its mandatory base ISA and its mandatory extensions; any
optional extensions in a profile must be explicitly named if their inclusion is desired.
ISAs are sets, and concatenating strings takes the union, so redundancy is legal (e.g.
rva23u64, rva23u64_zicsr, and rva23u64_zicsr_zicsr are all valid and equivalent)."

The takeaways from it:

- this implementation is compliant with how profiles are interpreted, i.e. a profile is
considered a set of the mandatory base ISA and mandatory extensions, and any additional/optional
extensions must be explicitly named;

- our ISA string format is also since we use the base ISA name + extensions format already.
This series don't  change/add anything in this regard.


If we have enough demand for it, I can do a follow-up to add support for the ISA string
profile format. I.e. this:

$ build/qemu-system-riscv64 -M virt -cpu rva22s64 (...)

# cat /proc/device-tree/cpus/cpu@0/riscv,isa
rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt

Would become this:

# cat /proc/device-tree/cpus/cpu@0/riscv,isa
rva22s64


Feel free to comment here if you, as a toolchain/application developer, thinks that this
ISA string profile format makes it easier to deal with profiles or if you're fine with
just parsing all the extensions in the current ISA string format.


All of this relies on this series being upstreamed first, of course. Alistair, let me
know if we're missing anything.



Thanks,


Daniel



On 12/18/23 09:53, Daniel Henrique Barboza wrote:
> Hi,
> 
> This is a merge of the two profile series:
> 
> "[PATCH for-9.0 v12 00/18] riscv: rv64i/rva22u64 CPUs, RVA22U64 profile support"
> "[PATCH for-9.0 v2 0/8] target/riscv: implement RVA22S64 profile"
> 
> I'm sending them together since the second series is dependent on the first.
> 
> Quick summary of the major features added:
> 
> - A new rv64i CPU type. This is a CPU that has only RVI enabled;
> 
> - 'rva22u64' and 'rva22s64' profile flags. They were designed to be used
>    with the 'rv64i' CPU but can be used with other generic CPUs like
>    rv64;
> 
> - Two new profile CPUs: 'rva22u64' and 'rva22s64'. A profile CPU is an
>    alias of '-cpu rv64,profile=on' and it's the most convenient way of
>    using profiles. E.g to launch an rva22s64 'virt' machine:
> 
>    ./qemu-system-riscv64 -M virt -cpu rva22s64  (...)
> 
>    To test an application with an rva22u64 profile with linux-user mode:
> 
>    ./qemu-riscv64 -cpu rva22u64  (...)
> 
> 
> The series can also be fetch via:
> 
> https://gitlab.com/danielhb/qemu/-/tree/rva22_v13
> 
> Patches rebased on top of Alistair riscv-to-apply.next.
> 
> All patches acked.
> 
> Daniel Henrique Barboza (26):
>    target/riscv: create TYPE_RISCV_VENDOR_CPU
>    target/riscv/tcg: do not use "!generic" CPU checks
>    target/riscv/tcg: update priv_ver on user_set extensions
>    target/riscv: add rv64i CPU
>    target/riscv: add zicbop extension flag
>    target/riscv/tcg: add 'zic64b' support
>    riscv-qmp-cmds.c: expose named features in cpu_model_expansion
>    target/riscv: add rva22u64 profile definition
>    target/riscv/kvm: add 'rva22u64' flag as unavailable
>    target/riscv/tcg: add user flag for profile support
>    target/riscv/tcg: add MISA user options hash
>    target/riscv/tcg: add riscv_cpu_write_misa_bit()
>    target/riscv/tcg: handle profile MISA bits
>    target/riscv/tcg: add hash table insert helpers
>    target/riscv/tcg: honor user choice for G MISA bits
>    target/riscv/tcg: validate profiles during finalize
>    riscv-qmp-cmds.c: add profile flags in cpu-model-expansion
>    target/riscv: add 'rva22u64' CPU
>    target/riscv: implement svade
>    target/riscv: add priv ver restriction to profiles
>    target/riscv/cpu.c: finalize satp_mode earlier
>    target/riscv/cpu.c: add riscv_cpu_is_32bit()
>    target/riscv: add satp_mode profile support
>    target/riscv: add 'parent' in profile description
>    target/riscv: add RVA22S64 profile
>    target/riscv: add rva22s64 cpu
> 
>   hw/riscv/virt.c               |   5 +
>   target/riscv/cpu-qom.h        |   5 +
>   target/riscv/cpu.c            | 201 +++++++++++++--
>   target/riscv/cpu.h            |  18 ++
>   target/riscv/cpu_cfg.h        |   4 +
>   target/riscv/kvm/kvm-cpu.c    |   7 +-
>   target/riscv/riscv-qmp-cmds.c |  44 +++-
>   target/riscv/tcg/tcg-cpu.c    | 450 +++++++++++++++++++++++++++++++---
>   8 files changed, 672 insertions(+), 62 deletions(-)
> 

