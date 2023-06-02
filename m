Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AC6C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 10:21:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q51tx-0007xf-Mu; Fri, 02 Jun 2023 06:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q51tv-0007vd-BH
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 06:20:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q51tt-0001JB-Gz
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 06:20:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6da07ff00so18874675e9.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685701252; x=1688293252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8UC1dM6wPXiZWlcVnQURZq0K/mVvLzt6OuQbnqZttg0=;
 b=XSJkyd5hxWvfUc0i4j5WqmeJZ6dmYSKcRr+MWUMpBxIqxVzXGE8Vj4BeM2vpZ4y/Xb
 rov66m13C5jonzn8fYm53VBO49/AhlX7NalOXNnyznc18EjSZ6fepBkl/2IKIFvFNbkg
 V7VKBHtlUSgmixEs3MwK8ve9NceaV/7k4muHp7O2g1yV44Mw+ow7x0vLwpPP5yIiEIW1
 qpPoe4SjNsSYMSJv5e/3+hX/hek4FnFxkoMsEoq+icwtHLWKG8gR5GaHnIE423TAu3rt
 vAZ9f6H7agoYVzabTjSkSZX6tQA7smcjY7eegf9/Am9WkD567urHhSV70f//GV0BRZ6+
 qdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701252; x=1688293252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8UC1dM6wPXiZWlcVnQURZq0K/mVvLzt6OuQbnqZttg0=;
 b=RybB3paBzBMpoHRAz6wobjulV6tPvz2qiZjXF5U7c5qumIbsy6YtwSNiTSMGIG+y6P
 QUpWmLJjEn+UJhfFQLTTNI+F2sgio2PXEcdf1HgUM6U/EqjoVIXUKRlTNbyYQrs3mkqG
 rQD29RKti4pZBeGwDuZFI9Gih9ORDZeyv6fFYPMTlj2C12KBg67cYs3hkCDo+26HSWgs
 L9su06NjLVjrDuoeTt81ywFmhsjsRjeDnDPHaID8bsxzpgqqCJGdnIxpla1f2uJCZjjW
 z9z/Jr59/ZEVKAnpq4uAHuuFl55bDjP64DW5mE8QiLQEFAPnFOTc+v4LWWPjc+oRgaN5
 1DxA==
X-Gm-Message-State: AC+VfDz1Vmiz9AnMj8tUGCxMDLvoMj/6ej0g5ISv7a8UDuVp9LbXD+Pg
 Mx9GMOJ55d9Lv3yMehoYX78KzQ==
X-Google-Smtp-Source: ACHHUZ5DDOIhbngNIUXCv7QEJi7aztmom6D6ur47B1U1nDsw428jMVjvBgBOn6ZR0nHBUO93LNOfYA==
X-Received: by 2002:a05:600c:b43:b0:3f5:ffe2:91c0 with SMTP id
 k3-20020a05600c0b4300b003f5ffe291c0mr1702558wmr.0.1685701251789; 
 Fri, 02 Jun 2023 03:20:51 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.218.254])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003f31cb7a203sm1520476wmh.14.2023.06.02.03.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 03:20:51 -0700 (PDT)
Message-ID: <6ed09058-8f9f-0b20-f22d-3b7cde7b97f4@linaro.org>
Date: Fri, 2 Jun 2023 12:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] target/riscv: Add RVV registers to log
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 richard.henderson@linaro.org, pbonzini@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
 <20230410124451.15929-3-ivan.klokov@syntacore.com>
 <CAKmqyKMGxJoyjseobh5J81uUUXbatv9GLYOd5zZG9PwWe=CTjw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAKmqyKMGxJoyjseobh5J81uUUXbatv9GLYOd5zZG9PwWe=CTjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/6/23 05:43, Alistair Francis wrote:
> On Mon, Apr 10, 2023 at 10:47 PM Ivan Klokov <ivan.klokov@syntacore.com> wrote:
>>
>> Print RvV extesion register to log if VPU option is enabled.
>>
>> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> 
> I applied the first patch, unfortunately this one doesn't apply
> anymore. Do you mind rebasing this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> 
> Alistair
> 
>> ---
>>   target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 55 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 5bc0005cc7..cfd063a5dc 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -172,6 +172,14 @@ const char * const riscv_fpr_regnames[] = {
>>     "f30/ft10", "f31/ft11"
>>   };
>>
>> +const char * const riscv_rvv_regnames[] = {
>> +  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",
>> +  "v7",  "v8",  "v9",  "v10", "v11", "v12", "v13",
>> +  "v14", "v15", "v16", "v17", "v18", "v19", "v20",
>> +  "v21", "v22", "v23", "v24", "v25", "v26", "v27",
>> +  "v28", "v29", "v30", "v31"
>> +};
>> +
>>   static const char * const riscv_excp_names[] = {
>>       "misaligned_fetch",
>>       "fault_fetch",
>> @@ -422,7 +430,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>       CPURISCVState *env = &cpu->env;
>> -    int i;
>> +    int i, j;
>> +    uint8_t *p;
>>
>>   #if !defined(CONFIG_USER_ONLY)
>>       if (riscv_has_ext(env, RVH)) {
>> @@ -506,6 +515,51 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>               }
>>           }
>>       }
>> +    if (riscv_has_ext(env, RVV) && (flags & CPU_DUMP_VPU)) {
>> +        static const int dump_rvv_csrs[] = {
>> +                    CSR_VSTART,
>> +                    CSR_VXSAT,
>> +                    CSR_VXRM,
>> +                    CSR_VCSR,
>> +                    CSR_VL,
>> +                    CSR_VTYPE,
>> +                    CSR_VLENB,
>> +                };
>> +        for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
>> +            int csrno = dump_rvv_csrs[i];
>> +            target_ulong val = 0;
>> +            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
>> +
>> +            /*
>> +             * Rely on the smode, hmode, etc, predicates within csr.c
>> +             * to do the filtering of the registers that are present.
>> +             */
>> +            if (res == RISCV_EXCP_NONE) {
>> +                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
>> +                             csr_ops[csrno].name, val);
>> +            }
>> +        }
>> +        uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
>> +
>> +/*
>> + * From vector_helper.c
>> + * Note that vector data is stored in host-endian 64-bit chunks,
>> + * so addressing bytes needs a host-endian fixup.

Hmm we should have a ld/st API helper for that. Maybe something like:

   uint64_t val = ldq_he_p(env->vreg[i * vlenb]);

>> + */
>> +#if HOST_BIG_ENDIAN
>> +#define BYTE(x)   ((x) ^ 7)
>> +#else
>> +#define BYTE(x)   (x)
>> +#endif
>> +        for (i = 0; i < 32; i++) {
>> +            qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
>> +            p = (uint8_t *)env->vreg;
>> +            for (j = vlenb - 1 ; j >= 0; j--) {
>> +                qemu_fprintf(f, "%02x", *(p + i * vlenb + BYTE(j)));
>> +            }
>> +            qemu_fprintf(f, "\n");
>> +        }
>> +    }
>>   }
>>
>>   static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
>> --
>> 2.34.1
>>
>>


