Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B38C3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:40:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbpKV-0000vO-9w; Wed, 07 Aug 2024 18:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbpKS-0000uJ-Dn
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 18:40:24 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbpKQ-0007ku-Hj
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 18:40:24 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ff3d5c6e9eso3698345ad.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723070420; x=1723675220; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2V16sMFB1RaRMBD2wL/6AH5VRh1gdvosaHId079BLw=;
 b=cK0ScIAaI4HlGvf1lAzV3t741OwsYPzRjUp+KNLlSV2lrXxj3Q3Yj9jOmC1D9/fkeX
 6NwG90UwKpKyHJBtGhFXMHCnmnAWKg3gsXcm+ndOVrSftyo+iVdmpUK8g7DkxzPce0AB
 OKpoihidGOSNZd6x98mp7OPhyYDDQawiYS6uNQ/1utDzwlmHQAjKLcjDwdCTyVaszudw
 2bkACKYxLqD8FBx6nXLRYtJRbiMXrNS0WYWEaHPkWzWbftWw6k+WXMNPDsQUWfdwj3aD
 w0hptA+tqkEFo4A73dHdQKvs1SH6HdT4KOFmW/uMNqsbqxF3Xuk2yaijTPzj2JLtFLuu
 kGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723070420; x=1723675220;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2V16sMFB1RaRMBD2wL/6AH5VRh1gdvosaHId079BLw=;
 b=MPLkJn9gDt0jCym4SBHQb9Z3F8qZUL1QAUEsGncv7sAjfZDshUtll+7Y/vG7av4T6d
 PUx6+cmkGA3EaWoOQQ4bpj47JryVg5+/jQb9IHoZeuREn1F3zgsDjL2Y/OGtjt+HgdGT
 Y1MXVm8MSjhssHcQuLJLpYisIsVXEmri/USRHtKfWSfU4sZE/NdF4NuG5Hp3ub/ArWrY
 pmVIUYYNMsj+gF9RF7oK/G0diAWUbb0Kl8ybXgmlQHywF/FmHDLO6iNQvlfem+OU0JfP
 tDMJcEGn8irNwrbKR2O2B3JRDYSEgwAJBFsyP1C1WRTTpy2h4Wti3gJS4r0ilPd918p3
 mNNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdS66YOEsL/xFq6kp6yAcI7GoP5/alUt85fJKKDK7yhe/qqHFvIj6ZE+UY7IvPvHmL8SkIE9jNTO2/SvnBMHkRzyG/HEo=
X-Gm-Message-State: AOJu0Yz8aJyOW5lGGRNRkEaNrOfSvcaWKlj/FinuYg19FMbrt9gcTQzM
 tVpQ82IM9OfD3G026tBuWcvhiuc2M71Nfhaj01qfFsPB/5YXYMtg5URt0x+fYac=
X-Google-Smtp-Source: AGHT+IFLJyZkJ0mMugjXvEvTWk8e0Cl4GP/QJ7/1+v/acd5mZTXW1WeeiBvTWxn6bZKv1e4iG/+y8A==
X-Received: by 2002:a17:902:e843:b0:1fc:4bdc:d413 with SMTP id
 d9443c01a7336-200952d4129mr1116815ad.60.1723070419769; 
 Wed, 07 Aug 2024 15:40:19 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff590608a7sm111388015ad.141.2024.08.07.15.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 15:40:19 -0700 (PDT)
Message-ID: <0f68fb8e-9821-4639-a934-ca1f4a668e4c@linaro.org>
Date: Thu, 8 Aug 2024 08:40:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] target/riscv: save and restore elp state on priv
 transitions
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Jim Shu <jim.shu@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-5-debug@rivosinc.com>
 <e2d6dfe2-0c99-4caa-bba9-ce9b1225d0c4@linaro.org>
 <ZrPU3fwHGV8l0gDT@debug.ba.rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZrPU3fwHGV8l0gDT@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 8/8/24 06:11, Deepak Gupta wrote:
>>> +    /*
>>> +     * If forward cfi enabled for new priv, restore elp status
>>> +     * and clear spelp in mstatus
>>> +     */
>>> +    if (cpu_get_fcfien(env)) {
>>> +        env->elp = get_field(env->mstatus, MSTATUS_SPELP);
>>> +        env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, 0);
>>> +    }
>>
>> The spec is perhaps poorly written here.  I read
>>
>>  ... if xPP holds the value y, then ELP is set to the value of xPELP if yLPE is 1;
>>  otherwise, it is set to NO_LP_EXPECTED; xPELP is set to NO_LP_EXPECTED.
>>
>> as xPELP always being cleared, regardless of yLPE.
> 
> Yes that's what code above is also doing. restore elp status from SPELP field and clear
> it at SPELP.

No, my point is that the text doesn't seem to be

   if (enabled) {
     restore elp
     clear pelp
   }

but

   if (enabled) {
     restore elp
   }
   clear pelp

I.e. the clear is unconditional.


r~

