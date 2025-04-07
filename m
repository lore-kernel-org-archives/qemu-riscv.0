Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53512C36010
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 08:32:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u1huT-0000Qg-F1; Mon, 07 Apr 2025 04:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u1huA-00081M-Mn
 for qemu-riscv@nongnu.org; Mon, 07 Apr 2025 04:32:32 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u1hu8-0003e9-9c
 for qemu-riscv@nongnu.org; Mon, 07 Apr 2025 04:32:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so3159580b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Apr 2025 01:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744014744; x=1744619544; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Py2YLOI/LR4P+ympkg5MHgMcFhTzlQZRVWRybkAr0+Y=;
 b=HejS5lXdnzarfOkq5MwHTuVd0kJJWBkS8RmhNzNXf/RPKHb5R0pwUv/ok1pO2Zvuyr
 IXgiNu8KEz09+r2IA3BezAaFLWY5PJ5Z2kONo0F6EAJAc+/1LCT8n/4eac13pHB5/r5q
 Q7JAsr7WdY1lEAzUZTRBCxC7DpRrsynbqgFkFUGSxl4vPCMTFcNejnmgZm2MiW3FtXwT
 DAKVpIU5KT97ZW1AvYR6Z0dTZo4hzaPrbYF2Wif6+2RtKDzNk2n16nbWMGenLZk4Xsc+
 3Ij+A3qNlKk+w35lVSJ6u25rEPyoMSO7QxKJXFbSSZ5KbaD87DV/8KLX5g7IjA0Gypz7
 8a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744014744; x=1744619544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Py2YLOI/LR4P+ympkg5MHgMcFhTzlQZRVWRybkAr0+Y=;
 b=PlML0DBN5NWNgUhzDNc37P0xeYb4LOhfneTeipkQ7t/Te/ew8lvdwzZ/3eEWXv4aj/
 /g3EHMBXYLST8IONI+X1RzR2q27cDeFGig43EGRYJMsEUX3cnILe3sYbIHW3vPoWWSp4
 xQbcF11AsHgv1thl9B/bcGuzoCi7r6DTm40uk95JZM8HJLWm6zkSSehVU2TQ7/iiltzm
 vB1j5RNMflC0vZ88PNYtTWff8SlACVGjj0tjTEgi9Cs6j2zmh/2fpY7BC6F7mB22M3Lt
 O923K6VE2POuXNJg1PftbDu5so4mlPCOlH3tN1GExXNSims0+x2q0qytdwodDXJjI2iZ
 duSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYb2N1IAydIB4QkL0InsJsfvuSeHo/guOBqv0/9R/v3rtzNOjMWHhoISOHF6O9I7rmd7kp31hIJ+F2@nongnu.org
X-Gm-Message-State: AOJu0Yy1FhKFGOLvZL2p1YiyKSxP5Zjt9qFX6IU3Sn0IoIcspHm7zqWK
 FReLsU4yVnobulHD7p/kCxPCs/no3FzSpoLzg9cNJ7YpTDWriHWZKyIIcC8eV+o=
X-Gm-Gg: ASbGncunlfvpzzexrRCLM/5xEcgxaP5SvjFChBpmguZJWIW28izKvq/6jX3a4ptuUzN
 DOXn8c+PqO1UIwi0oMPwYgUefwsh+qMjCpBXshqetWgJWNDzkJcv6zROcN0fJ8ywapvS7tzj/U+
 LTtpDQMz1e+2bkjC47NIOxpWqrDjUu0CxyzLBeFUBOrN3i+9C/dvkImC1NbjcsxEhYMlY7ZvKxC
 WifMxBndfiMRZc1f/3IFxqnhj1qXnDsUJNjLDMEQinNSUvoW6TcUcx/CWs8Wm3RujJg6JkEAlup
 27uWbf/+pucA0AtBHaabDlQkKtMLRkQikBJzIePVBw1WxHZmzU7DhTq2Ww==
X-Google-Smtp-Source: AGHT+IHP5AugSZa7VzLg138sYcDdJ7GpyAzon0gmfbp0IVMEhxMY2Z3scIVamTfESfLcKnaS7JNs1w==
X-Received: by 2002:a05:6a00:2985:b0:736:69aa:112c with SMTP id
 d2e1a72fcca58-739e6fdb491mr13908480b3a.9.1744014744212; 
 Mon, 07 Apr 2025 01:32:24 -0700 (PDT)
Received: from [100.64.0.1] ([147.161.192.170])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0b2f71sm8124198b3a.130.2025.04.07.01.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 01:32:23 -0700 (PDT)
Message-ID: <114ae937-8e8c-433d-8958-2ba57346948e@sifive.com>
Date: Mon, 7 Apr 2025 16:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] target/riscv: Add vext_check_input_eew to check
 mismatched input EEWs encoding constraint
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-4-max.chou@sifive.com>
 <b554b45e-50c2-41e9-af73-5074bdfee0ee@ventanamicro.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <b554b45e-50c2-41e9-af73-5074bdfee0ee@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42a.google.com
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

On 2025/4/5 5:09 PM, Daniel Henrique Barboza wrote:
>
>
> On 3/29/25 11:44 AM, Max Chou wrote:
>> According to the v spec, a vector register cannot be used to provide 
>> source
>> operands with more than one EEW for a single instruction.
>>
>> Signed-off-by: Max Chou <max.chou@sifive.com>
>> ---
>>   target/riscv/insn_trans/trans_rvv.c.inc | 29 +++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>> b/target/riscv/insn_trans/trans_rvv.c.inc
>> index e630f8661e1..70c19c49ae4 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -379,6 +379,35 @@ static bool vext_check_ld_index(DisasContext *s, 
>> int vd, int vs2,
>>       return ret;
>>   }
>>   +/*
>> + * Check whether a vector register is used to provide source 
>> operands with
>> + * more than one EEW for the vector instruction.
>> + * Returns true if the instruction has valid encoding
>> + * Returns false if encoding violates the mismatched input EEWs 
>> constraint
>> + */
>> +static bool vext_check_input_eew(DisasContext *s, int vs1, uint8_t 
>> eew_vs1,
>> +                                 int vs2, uint8_t eew_vs2, int vm)
>> +{
>> +    bool is_valid = true;
>> +    int8_t emul_vs1 = eew_vs1 - s->sew + s->lmul;
>> +    int8_t emul_vs2 = eew_vs2 - s->sew + s->lmul;
>> +
>> +    /* When vm is 0, vs1 & vs2(EEW!=1) group can't overlap v0 
>> (EEW=1) */
>> +    if ((vs1 != -1 && !require_vm(vm, vs1)) ||
>> +        (vs2 != -1 && !require_vm(vm, vs2))) {
>> +        is_valid = false;
>> +    }
>> +
>> +    /* When eew_vs1 != eew_vs2, check whether vs1 and vs2 are 
>> overlapped */
>> +    if ((vs1 != -1 && vs2 != -1) && (eew_vs1 != eew_vs2) &&
>> +        is_overlapped(vs1, 1 << MAX(emul_vs1, 0),
>> +                      vs2, 1 << MAX(emul_vs2, 0))) {
>> +        is_valid = false;
>> +    }
>> +
>> +    return is_valid;
>> +}
>> +
>
> Code LGTM but the patch won't compile on its own because there's no 
> callers for
> it:
>
>
> In file included from ../target/riscv/translate.c:1182:
> ../target/riscv/insn_trans/trans_rvv.c.inc:388:13: error: 
> ‘vext_check_input_eew’ defined but not used [-Werror=unused-function]
>   388 | static bool vext_check_input_eew(DisasContext *s, int vs1, 
> uint8_t eew_vs1,
>       |             ^~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> ninja: build stopped: subcommand failed.
>
>
> We want each patch to be "buildable" and with test passing to make our 
> lives easier
> when doing bisects.
>
> You can merge this patch with patch 4 to introduce the new function 
> and add its first
> callers. Thanks,
>
>
> Daniel
Thanks for the suggestion. Will fix this issue at v3.

Max
>
>
>
>>   static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
>>   {
>>       return require_vm(vm, vd) &&
>


