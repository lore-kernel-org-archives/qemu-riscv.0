Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C845C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNgu-0006OH-Dn; Fri, 24 Jan 2025 12:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbNgq-0006GZ-MM
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:41:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbNgm-00038O-3k
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:41:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43635796b48so15976635e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740509; x=1738345309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a43/7Bt4MW4XTo3TsuSDc+PocOKZb0hbjZ5CqEhuwHg=;
 b=NeMqTW7i9zo51NKZHnyLgInlzOayUCfC93T/Uc5c0UEuDTbqo1+GSSIUPrDRT8L3+0
 fHA+2qYmjrI59EUJEBCwciZEhqK8njAcVCffJzgK15BYp3RHrkeX9Gjim1w+8dzviQLt
 w+GGqAdcIG6PH/5DQ77KaLdg29uehZihUspmVI3rO9AtVQVRxe2MENctWFNF3HB+kmzg
 S7HN2SFQCkEBz5Z3gwbtRzbMjEuy10cfJUvAjU7e1wBHgU/9GlRKNVGHBsQJqkWZ7EPH
 P7kA3HvrouBe4+z4lWWLH0iuINyU4199wXdTUrE1pHpQAAJ0skmvWR7B7sEqZHvm6/Nv
 k96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740509; x=1738345309;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a43/7Bt4MW4XTo3TsuSDc+PocOKZb0hbjZ5CqEhuwHg=;
 b=uti8ycUJ5/nkyTidKFi8KtH9P7HrV365oKgC4wxXXbQ9towNfbZwh2RVoM48CXsj5B
 +j8HzKE7YaNF8PEAtvSjZs9AenknWw+Opdz+nCxmKaATFdDgZEke2aiqllt3n9B1yHup
 8oc8KqxWKlOtmtt+n6AqhJTyTlrw3o/b2IA6LgQxViUFn1L1vmG7dnXyXvOfkcjemZIY
 fexc/XcIgBydtqnTBtKeChxBTWM6SDaW/ZQ9n+lJME3j0WPbyA+TJgQ7wz/aBcNbO+Pt
 38IeXCG9vtA0Zarsy1PZQYV34zqCoddpX+t1aW6/bVVSamAbuTI+ujWQ34wJqoMCeFCc
 3L0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgSJZo7Y1V+Q7Rxw4Sxtl3OdEm+x+6g2O0PLQAiH3NNq81a03Fd6fANvWwxThnLaf9+r5U4gPkuMTz@nongnu.org
X-Gm-Message-State: AOJu0YxqeINiLn9yPRL7we9JFa9+71RlnnI2HLJclUPkeMMuuIhsqBr+
 oZlBDoVbm3djQklKCBHC3BmSQdUWHX8gJugkceeLAdWor1g6y2/CcVHibjXuCPg=
X-Gm-Gg: ASbGncsYbyGJWM/PwMW7mXK4eDUZKTmOwWSopjEqTU/paTNs6Xuq8X2GyJsNcakZ5Sn
 Fc1Q3ptHxfJTC0UrvgSMhJjD4LRS0u8UovDs1CHvpPHKIzYo6V9TuKVXzTHKhHZy7AQOeuRyYr9
 6vMGed1AGZ8p1hBbqSSzAaYo4eqO33lPnTDSGr6CBRsEdk5BLXttXfofnxh2r/3ReRp7SrkQ1Gi
 XDeMQ2pND6UoJK8kNXEjTVKXw0Ye8p4X8jeQYT4ZCIVPyIRaiqHA/dtENqm5/jO75736dLI4sdt
 QHlgTvWzcuI7Li32a1vn8CCiNtDHdOYeFjliPOkh5+jTRC2b
X-Google-Smtp-Source: AGHT+IFUTa6yiieH2+97JGRCM7pOgWWa2duBJ8dPB1EgaVuwSMhss/jpQegG51rDReo5JRFNvSyqvQ==
X-Received: by 2002:a05:600c:1c86:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-438b88511eamr71347785e9.6.1737740509374; 
 Fri, 24 Jan 2025 09:41:49 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0f7sm33208455e9.28.2025.01.24.09.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:41:48 -0800 (PST)
Message-ID: <3672ec62-191d-4e89-bd99-cc10ef588c0e@linaro.org>
Date: Fri, 24 Jan 2025 18:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/28] target/riscv: Move has_work() from CPUClass to
 SysemuCPUOps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-21-philmd@linaro.org>
 <0bd61928-5bfc-44c7-8fc7-333f8e2e0b77@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0bd61928-5bfc-44c7-8fc7-333f8e2e0b77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 24/1/25 18:17, Richard Henderson wrote:
> On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/riscv/cpu.h       | 9 +++++----
>>   target/riscv/internals.h | 3 ---
>>   target/riscv/cpu.c       | 8 +++-----
>>   3 files changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 97713681cbe..32e8e064f36 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -552,10 +552,6 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, 
>> GByteArray *buf, int reg);
>>   int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>>   int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int 
>> *out_rdzero);
>>   uint8_t riscv_cpu_default_priority(int irq);
>> -uint64_t riscv_cpu_all_pending(CPURISCVState *env);
>> -int riscv_cpu_mirq_pending(CPURISCVState *env);
>> -int riscv_cpu_sirq_pending(CPURISCVState *env);
>> -int riscv_cpu_vsirq_pending(CPURISCVState *env);
>>   bool riscv_cpu_fp_enabled(CPURISCVState *env);
>>   target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>>   void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>> @@ -576,6 +572,11 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
>>   bool riscv_cpu_option_set(const char *optname);
>>   #ifndef CONFIG_USER_ONLY
>> +bool riscv_cpu_has_work(CPUState *cs);
>> +uint64_t riscv_cpu_all_pending(CPURISCVState *env);
>> +int riscv_cpu_mirq_pending(CPURISCVState *env);
>> +int riscv_cpu_sirq_pending(CPURISCVState *env);
>> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>>   void riscv_cpu_do_interrupt(CPUState *cpu);
>>   void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
>>   void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index 67291933f84..86def39aec2 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -142,9 +142,6 @@ static inline float16 check_nanbox_h(CPURISCVState 
>> *env, uint64_t f)
>>       }
>>   }
>> -/* Our implementation of CPUClass::has_work */
>> -bool riscv_cpu_has_work(CPUState *cs);
>> -
> 
> Why move the declaration from internals.h to cpu.h?

I can't see a compelling reason, so I'll keep it there but add
!CONFIG_USER_ONLY guard.


