Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771DACA1011
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 16:54:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utqkM-0004Zu-0l; Wed, 03 Sep 2025 12:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1utqkJ-0004Wr-CF
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 12:54:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1utqkH-0007Vw-7J
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 12:54:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b4c53892a56so19707a12.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756918442; x=1757523242; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cG220IvrBBzohe0nehbLIOrLF79QlAXgJztfBX0aUaI=;
 b=bkMrb3r4zUwnliJ1jIt2vBo03Qm7o+PeYZCXfGcb+yuyA4Wi/XGczEl8kDq3R+8y3H
 3T7+umzqTfL23cvYYaxzjSHXpOT6DBvWfvD96ZJeZihCUj0FwfYoI0Llapz98hM38vj2
 SfGueiCPkK/qJ/njvKBzYA9SdnXN23pokElLDmwLMM/teyS3/7qFNSE+1SUw0m+6PiZr
 zb8/SBQnvDIqifRzqCdIujr99d47WIGfABVAE4kHU3//lF1ukbtWvALpVrX+Yol8cBCD
 rUdTGds+udIxDjKi84vnznjFZDyiuVnlsW5AUVWNFlyWKrFQ6SGNQxHkxHDTSDDL2MCv
 s7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756918442; x=1757523242;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cG220IvrBBzohe0nehbLIOrLF79QlAXgJztfBX0aUaI=;
 b=YUtjayNbK+zvo/WTe4x0NOh7sHPO0xYMf+YXqbjYxcw3DGs/IFwxshRYvVArVF+OyV
 EO+eudBd7QaaDfhd16Zj5O7acWUDdMwxq1hEIYjojT9Uce1B/5+9LtH0/bMHZkDY0pon
 bc5oUfRh5Xo4QH3fETwEp1RmzSu8NQtlK+VnKNyrYhXFTNLA6F2EXN15+tt6EqHed7vb
 W24EEy3prWcHn+jkQ6ZZirfbMFkx5G59rYRxl/AhhcFy/zhbycB8lSI496eR/9VQ0ORl
 nW7qH82V1x+/qVW79rvZPsZqpegcXStveojkZktQ4e/yg1nE3OfVUxS4f3M+Z15XqVmZ
 nx2A==
X-Gm-Message-State: AOJu0YzTWdEjoSF+GSL+bLNh8FW4nQj46x4Cv4oBFRXgM7KImKN3IfwW
 NWrkEmuB4OcZPmujTNfslzFfuTx0e+KbHuC31+asKvZO8SbRQbToY2YNe3NF5FpwlT4=
X-Gm-Gg: ASbGncsNyl6na7gBfFbqS7wmr2+9MfbIrroJvsfaKGe1mF8dKqxBho1X9TuvyD5BN2p
 ixdPeWNg5Yk7TNwhs0DT4b1MkQENEebLzw8Ow0AHyX3vIt3f0pHhC9K/ypUV+AkgE718BzyYYrq
 6xwk3v2bKIKaFmWSjxZTj8A2qdCUEgyFStrlc0CIOor5QSjbmVSk5mJhdrekTcq7jeJ+8OTEtOx
 i3GSbQR//cU8as9djB6DHgbWcuo30e+KZZGeM9y3ElZoj70oZOHoksUEQI6vlCJLAQKGgkn0bDI
 gfvi+ufzPi5BVK3P+ykEnCgnCf4D2/Wo9kqY8dKpYbEEJ6RiwECYxySytceVnvb0Iyv9xO9Hcj1
 fwK8h9rwdDNXjm1cdVlxYgqWMv8k3jWaKPL4G
X-Google-Smtp-Source: AGHT+IET0Ex2z+54XMERVVU5wklWhDExaXCBqppEL9wzmJ3T8j/q2uyo+al8FL4KXQA2C+gGGV8RVQ==
X-Received: by 2002:a17:903:18b:b0:24c:9a51:9a4b with SMTP id
 d9443c01a7336-24c9a519e27mr32419245ad.21.1756918442412; 
 Wed, 03 Sep 2025 09:54:02 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da183asm162888425ad.74.2025.09.03.09.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 09:54:01 -0700 (PDT)
Message-ID: <db0b750b-b4c9-4d10-aec8-7ad6412a0c74@ventanamicro.com>
Date: Wed, 3 Sep 2025 13:53:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: implement MonitorDef HMP API
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20250703130815.1592493-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250703130815.1592493-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52a.google.com
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

Ping

On 7/3/25 10:08 AM, Daniel Henrique Barboza wrote:
> The MonitorDef API is related to two HMP monitor commands: 'p' and 'x':
> 
> (qemu) help p
> print|p /fmt expr -- print expression value (use $reg for CPU register access)
> (qemu) help x
> x /fmt addr -- virtual memory dump starting at 'addr'
> 
> For x86, one of the few targets that implements it, it is possible to
> print the PC register value with $pc and use the PC value in the 'x'
> command as well.
> 
> Those 2 commands are hooked into get_monitor_def(), called by
> exp_unary() in hmp.c. The function tries to fetch a reg value in two
> ways: by reading them directly via a target_monitor_defs array or using
> a target_get_monitor_def() helper. In RISC-V we have *A LOT* of
> registers and this number will keep getting bigger, so we're opting out
> of an array declaration.
> 
> We're able to retrieve all regs but vregs because the API only fits an
> uint64_t and vregs have 'vlen' size that are bigger than that.
> 
> With this patch we can do things such as:
> 
> - print CSRs and use their val in expressions:
> (qemu) p $mstatus
> 0xa000000a0
> (qemu) p $mstatus & 0xFF
> 0xa0
> 
> - dump the next 10 insn from virtual memory starting at x1 (ra):
> 
> (qemu) x/10i $ra
> 0xffffffff80958aea:  a9bff0ef          jal                     ra,-1382                # 0xffffffff80958584
> 0xffffffff80958aee:  10016073          csrrsi                  zero,sstatus,2
> 0xffffffff80958af2:  60a2              ld                      ra,8(sp)
> 0xffffffff80958af4:  6402              ld                      s0,0(sp)
> 0xffffffff80958af6:  0141              addi                    sp,sp,16
> 0xffffffff80958af8:  8082              ret
> 0xffffffff80958afa:  10016073          csrrsi                  zero,sstatus,2
> 0xffffffff80958afe:  8082              ret
> 0xffffffff80958b00:  1141              addi                    sp,sp,-16
> 0xffffffff80958b02:  e422              sd                      s0,8(sp)
> (qemu)
> 
> Suggested-by: Dr. David Alan Gilbert <dave@treblig.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.h            |   1 +
>   target/riscv/riscv-qmp-cmds.c | 148 ++++++++++++++++++++++++++++++++++
>   2 files changed, 149 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 229ade9ed9..487884c42c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -576,6 +576,7 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
>   extern const char * const riscv_int_regnames[];
>   extern const char * const riscv_int_regnamesh[];
>   extern const char * const riscv_fpr_regnames[];
> +extern const char * const riscv_rvv_regnames[];
>   
>   const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
>   int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
> index 8ba8aa0d5f..2c8c74bbe4 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -31,6 +31,10 @@
>   #include "qapi/qobject-input-visitor.h"
>   #include "qapi/visitor.h"
>   #include "qom/qom-qobject.h"
> +#include "qemu/ctype.h"
> +#include "qemu/qemu-print.h"
> +#include "monitor/hmp.h"
> +#include "monitor/hmp-target.h"
>   #include "system/kvm.h"
>   #include "system/tcg.h"
>   #include "cpu-qom.h"
> @@ -240,3 +244,147 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>   
>       return expansion_info;
>   }
> +
> +/*
> + * We have way too many potential CSRs and regs being added
> + * regularly to register them in a static array.
> + *
> + * Declare an empty array instead, making get_monitor_def() use
> + * the target_get_monitor_def() API directly.
> + */
> +const MonitorDef monitor_defs[] = { { } };
> +const MonitorDef *target_monitor_defs(void)
> +{
> +    return monitor_defs;
> +}
> +
> +static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
> +                                 target_ulong *val, bool is_gprh)
> +{
> +    const char * const *reg_names;
> +    target_ulong *vals;
> +
> +    if (is_gprh) {
> +        reg_names = riscv_int_regnamesh;
> +        vals = env->gprh;
> +    } else {
> +        reg_names = riscv_int_regnames;
> +        vals = env->gpr;
> +    }
> +
> +    for (int i = 0; i < 32; i++) {
> +        g_autofree char *reg_name = g_strdup(reg_names[i]);
> +        char *reg1 = strtok(reg_name, "/");
> +        char *reg2 = strtok(NULL, "/");
> +
> +        if (strcasecmp(reg1, name) == 0 ||
> +            (reg2 && strcasecmp(reg2, name) == 0)) {
> +            *val = vals[i];
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static bool reg_is_u64_fpu(CPURISCVState *env, const char *name, uint64_t *val)
> +{
> +    if (qemu_tolower(name[0]) != 'f') {
> +        return false;
> +    }
> +
> +    for (int i = 0; i < 32; i++) {
> +        g_autofree char *reg_name = g_strdup(riscv_fpr_regnames[i]);
> +        char *reg1 = strtok(reg_name, "/");
> +        char *reg2 = strtok(NULL, "/");
> +
> +        if (strcasecmp(reg1, name) == 0 ||
> +            (reg2 && strcasecmp(reg2, name) == 0)) {
> +            *val = env->fpr[i];
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static bool reg_is_vreg(const char *name)
> +{
> +    if (qemu_tolower(name[0]) != 'v' || strlen(name) > 3) {
> +        return false;
> +    }
> +
> +    for (int i = 0; i < 32; i++) {
> +        if (strcasecmp(name, riscv_rvv_regnames[i]) == 0) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
> +{
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +    target_ulong val = 0;
> +    uint64_t val64 = 0;
> +    int i;
> +
> +    if (reg_is_ulong_integer(env, name, &val, false) ||
> +        reg_is_ulong_integer(env, name, &val, true)) {
> +        *pval = val;
> +        return 0;
> +    }
> +
> +    if (reg_is_u64_fpu(env, name, &val64)) {
> +        *pval = val64;
> +        return 0;
> +    }
> +
> +    if (reg_is_vreg(name)) {
> +        if (!riscv_has_ext(env, RVV)) {
> +            return -EINVAL;
> +        }
> +
> +        qemu_printf("Unable to print the value of vector "
> +                    "vreg '%s' from this API\n", name);
> +
> +        /*
> +         * We're returning 0 because returning -EINVAL triggers
> +         * an 'unknown register' message in exp_unary() later,
> +         * which feels ankward after our own error message.
> +         */
> +        *pval = 0;
> +        return 0;
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(csr_ops); i++) {
> +        RISCVException res;
> +        int csrno = i;
> +
> +        /*
> +         * Early skip when possible since we're going
> +         * through a lot of NULL entries.
> +         */
> +        if (csr_ops[csrno].predicate == NULL) {
> +            continue;
> +        }
> +
> +        if (strcasecmp(csr_ops[csrno].name, name) != 0) {
> +            continue;
> +        }
> +
> +        res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> +
> +        /*
> +         * Rely on the smode, hmode, etc, predicates within csr.c
> +         * to do the filtering of the registers that are present.
> +         */
> +        if (res == RISCV_EXCP_NONE) {
> +            *pval = val;
> +            return 0;
> +        }
> +    }
> +
> +    return -EINVAL;
> +}


