Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA23C48BC3
	for <qemu-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 09:52:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rbHMs-0001Dj-2n; Sat, 17 Feb 2024 04:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rbHMq-0001Cw-8P
 for qemu-riscv@nongnu.org; Sat, 17 Feb 2024 04:52:20 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rbHMk-0004Gl-LL
 for qemu-riscv@nongnu.org; Sat, 17 Feb 2024 04:52:20 -0500
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1d731314e67so21726865ad.1
 for <qemu-riscv@nongnu.org>; Sat, 17 Feb 2024 01:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1708163533; x=1708768333; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZbkOm6aXkg7hhi6iv5vyw74Orx60sJF9prnl587PeQM=;
 b=cxtwriQy/ms2Gh9i7tkUiXFPXlSC38ox6PmXyHBod3W+00T5Acn05cIWeqHxoEmbFU
 bS1iQPvo/9Ah+HfKPjnkQMmfudzmlJZRWRwMBFSp5zbLnYDKFU5NAwnLhgf+CVyOH4mR
 fD1Lttv3ZW/nitcMMaIZUDEocNPeg1w5nvoELPlOKpgH7l9wy65ZbPnY/9Zr35izNKPf
 QKIIPXAkOhgfa4fD663GCgOpXlaHwkBjXoq3M8uYIF5gdmYoGPFIR7GtKRLyNhROlEwN
 oKglPP7VP7balPt6vMkxI2SwQTm7srquT5AoY7Y2GS0lo0XlQmpBgHMFf2QpF66uQgfU
 KwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708163533; x=1708768333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbkOm6aXkg7hhi6iv5vyw74Orx60sJF9prnl587PeQM=;
 b=fxFRYdZRSKF7GYdUujTdyX99nPPoqjnp0If30pabkOmljdesGrFbzYdouKB2Pk9uMb
 60K4BQCeteY/KNVCs/RoSFBhrIPP1cOhUp+Eb1aIhMcZxnhCGamE5nEOFnzFf3MQJiFy
 NK0IjZYfXCMgnyBizFpm7s4KUiw3HPrSc5Fufd7dZ0OGD2S4nYxj0pCAeY9NtKie/uj9
 NY3u2dtOztmf9COzKL3Ehw+Zn5dPtSvPZjwvQjxrYwxDwC10pxHBnTqesbrIdN4Rn5jO
 Gy7UeiYvCOJ9WI5ZDM4/Wyewl6f58fTjvgmOFjhsxscSQ1VRN33lbPKecrdKZ7fgB64k
 UBXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR7BUzBEhVabtMqmKgxzsDV/wenFQ8Gwb4dsSbQuKIryloxELAWIA93Ueg1+YE/x8REZJyrwQkEGvft0515XV1iWO19lc=
X-Gm-Message-State: AOJu0YxUqEFogsbp48b5MUgjwehPBATri8g0XbnDQStPFY+yBjsiv8G6
 r+4aokZSGMzrXcpjc/2jRttnL5xakqyliGd1ogT7lLy99F2NbBW5RbRNagYblEI=
X-Google-Smtp-Source: AGHT+IFCV2HPMbvD59WEINoR2TjncwHe3fCweIyTolX4pcIIGuV37p4igrHzLd6fYMHuQN2+xuMrTw==
X-Received: by 2002:a17:902:ea0e:b0:1db:6de7:f053 with SMTP id
 s14-20020a170902ea0e00b001db6de7f053mr7510191plg.66.1708163533076; 
 Sat, 17 Feb 2024 01:52:13 -0800 (PST)
Received: from [100.64.0.1] ([136.226.240.197])
 by smtp.gmail.com with ESMTPSA id
 li4-20020a170903294400b001db7e3411f7sm1123990plb.134.2024.02.17.01.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Feb 2024 01:52:12 -0800 (PST)
Message-ID: <69a38a78-1fb4-ff9f-deee-ff6e56957910@sifive.com>
Date: Sat, 17 Feb 2024 17:52:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 0/6] Improve the performance of RISC-V vector
 unit-stride ld/st instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com
References: <20240215192823.729209-1-max.chou@sifive.com>
 <82a9a26c-290d-48d0-8d77-500e79b29f7a@linaro.org>
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <82a9a26c-290d-48d0-8d77-500e79b29f7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.399,
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

Hi Richard,

Thank you for the suggestion and the reference.
I'm trying to follow the reference to implement it and I'll send another 
version for this.

Thanks a lot,
Max

On 2024/2/16 4:24 AM, Richard Henderson wrote:
> On 2/15/24 09:28, Max Chou wrote:
>> Hi all,
>>
>> When glibc with RVV support [1], the memcpy benchmark will run 2x to 60x
>> slower than the scalar equivalent on QEMU and it hurts developer
>> productivity.
>>
>>  From the performance analysis result, we can observe that the glibc
>> memcpy spends most of the time in the vector unit-stride load/store
>> helper functions.
>>
>> Samples: 465K of event 'cycles:u', Event count (approx.): 1707645730664
>>    Children      Self  Command       Shared Object Symbol
>> +   28.46%    27.85%  qemu-riscv64  qemu-riscv64             [.] 
>> vext_ldst_us
>> +   26.92%     0.00%  qemu-riscv64  [unknown]                [.] 
>> 0x00000000000000ff
>> +   14.41%    14.41%  qemu-riscv64  qemu-riscv64             [.] 
>> qemu_plugin_vcpu_mem_cb
>> +   13.85%    13.85%  qemu-riscv64  qemu-riscv64             [.] lde_b
>> +   13.64%    13.64%  qemu-riscv64  qemu-riscv64             [.] 
>> cpu_stb_mmu
>> +    9.25%     9.19%  qemu-riscv64  qemu-riscv64             [.] 
>> cpu_ldb_mmu
>> +    7.81%     7.81%  qemu-riscv64  qemu-riscv64             [.] 
>> cpu_mmu_lookup
>> +    7.70%     7.70%  qemu-riscv64  qemu-riscv64             [.] ste_b
>> +    5.53%     0.00%  qemu-riscv64  qemu-riscv64             [.] 
>> adjust_addr (inlined)
>>
>>
>> So this patchset tries to improve the performance of the RVV version of
>> glibc memcpy on QEMU by improving the corresponding helper function
>> quality.
>>
>> The overall performance improvement can achieve following numbers
>> (depending on the size).
>> Average: 2.86X / Smallest: 1.15X / Largest: 4.49X
>>
>> PS: This RFC patchset only focuses on the vle8.v & vse8.v instructions,
>> the next version or next serious will complete other vector ld/st part.
>
> You are still not tackling the root problem, which is over-use of the 
> full out-of-line load/store routines.  The reason that cpu_mmu_lookup 
> is in that list is because you are performing the full virtual address 
> resolution for each and every byte.
>
> The only way to make a real improvement is to perform virtual address 
> resolution *once* for the entire vector.  I refer to my previous advice:
>
> https://gitlab.com/qemu-project/qemu/-/issues/2137#note_1757501369
>
>
> r~

