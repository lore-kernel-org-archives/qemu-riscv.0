Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB8AC54788
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 21:31:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcu7t-0006hA-RB; Wed, 21 Feb 2024 16:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rcu7m-0006QY-4t
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 16:27:31 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rcu7j-0003GI-GU
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 16:27:29 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5d81b08d6f2so5633124a12.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Feb 2024 13:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708550846; x=1709155646;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mjv4bxLkrZRB4FbQtX61briJZD7pgF7JlPE3YnVgUAc=;
 b=S/CrLG6na+tJ+N2XvKUoLL41dDIu0eJdbtjNIfjrcPPeeoe5jfAOiwFBNVLelxUEc7
 z9u+G7evtXvVIZoHOjH+SGjmo2iS3t4FQJ9jielUt0WzqQP326D59uQy8ONLCK9II8f5
 an+4YRRaJVzstBAP4C7uZpf/fqdRwzOiHvSjvgzMplLRreIecpfaWd+JJXlrGMCgXMMU
 pgtZrXixeHhvUwbWhzQQM7qO6ZPIDaYtvzBH9R0h7309ENST7uoVOG3pwHJnVFd7HshA
 A9ujArLC/LzU1/cCuyahwQr7sTZG08g6UyP7My+0X0gxQbc5ubSDycykCz5doGGts7o5
 MF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550846; x=1709155646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjv4bxLkrZRB4FbQtX61briJZD7pgF7JlPE3YnVgUAc=;
 b=qPZZiKkmsbnwT9ABIJO3zWshCsiZJva7N/gcXytSGFEqwFZ7+16sKX3SfFRbCFj8AS
 e6pygl6qlwF5Vt3qEctpb/aRJBeJE3SStq9vJSBDr3CzlhwXipssLZ1LlFmQ8SeEbots
 +BLPqCzh96yygasunOOmXAIpysRpTNVWT0FkiW5vAhGl0asbZAvm3p/wE/tK0VBgdZeN
 vptFZceFl5t/DgJIv/tVYxzeAdgqvHiopaLmmhkIIz5NtpU//gqQmNqYlT5j5RVuozBl
 bJLnDypYasqU9i1WlosvF73huPeQhwIWrnxo7x+pB61+j2I11CqiD6U9rWDCcQtw1tux
 kPUg==
X-Gm-Message-State: AOJu0Ywt5FsbBDQP4b7+LScKwYS62B8fosPoicyOPe5WP1lU5ZKYLx4X
 QviSKGpeowZJmKViLRwotFLY/ryaWWCJ33BHzW3pvk2hAdHmKQQhf+kpI+aoVp4=
X-Google-Smtp-Source: AGHT+IEdxUqiZXt5mSpIZK6c/fbmXmAsdWH9qFobV1eGVFmlkMaxcimpweODCsMRe1vgThEmW3fn5g==
X-Received: by 2002:a17:90a:4381:b0:298:c136:2ffc with SMTP id
 r1-20020a17090a438100b00298c1362ffcmr14648869pjg.45.1708550846133; 
 Wed, 21 Feb 2024 13:27:26 -0800 (PST)
Received: from [172.16.0.69] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a17090a5b0200b00298ca131c75sm2310792pji.24.2024.02.21.13.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:27:25 -0800 (PST)
Message-ID: <56f06a67-3e8a-42e6-a828-f2c833c74ec4@rivosinc.com>
Date: Wed, 21 Feb 2024 13:27:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Add missing include guard in pmu.h
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240220110907.10479-1-frank.chang@sifive.com>
 <9df86826-44c2-4816-ae59-189773c51d95@ventanamicro.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <9df86826-44c2-4816-ae59-189773c51d95@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/20/24 08:20, Daniel Henrique Barboza wrote:
> 
> 
> On 2/20/24 08:08, frank.chang@sifive.com wrote:
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> Add missing include guard in pmu.h to avoid the problem of double
>> inclusion.
>>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
>>   target/riscv/pmu.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
>> index 505fc850d3..7c0ad661e0 100644
>> --- a/target/riscv/pmu.h
>> +++ b/target/riscv/pmu.h
>> @@ -16,6 +16,9 @@
>>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>>    */
>> +#ifndef RISCV_PMU_H
>> +#define RISCV_PMU_H
>> +
>>   #include "cpu.h"
>>   #include "qapi/error.h"
>> @@ -31,3 +34,5 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum 
>> riscv_pmu_event_idx event_idx);
>>   void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char 
>> *pmu_name);
>>   int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>>                             uint32_t ctr_idx);
>> +
>> +#endif /* RISCV_PMU_H */
> 

Oops. Thanks for the fix.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

