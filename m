Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2ACC531DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 07:29:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1serOF-0001BW-U4; Fri, 16 Aug 2024 03:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1serO5-0000f3-R6
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 03:28:42 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1serO3-0004uv-6x
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 03:28:40 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-70945a007f0so1042526a34.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2024 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723793317; x=1724398117; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YGZmjbI1TKAFBmHm9mAvv+PwdWnWaHfgix/3VwWYDYU=;
 b=ufXP1Bqr9wGH+96sxmzIWRMowYiPRuWkM3fqQSJB/zbTkrY4dBV62KWGP9GpKviLHC
 Bqlna1nlkP8PRrzONjtQQtkT140zpmd1CHTXXxlpthtcrNitu/qMQiGJVMv9gkgqadcC
 Sn0prjG46G3yKtEXxRCK6C043FJjp/kslHgnbzmMELouDJvQPqalRhR/amqPe2Vz/lob
 cLhEBrXnKu0qKgIEYZ4qRl6WzwAH0m43Ycp++O+8XVX8Bw23Kso0Id7IP6E0zRa20G+U
 32ya283muGDZmc6W3pTnMwJcLM82nQwyyOoklkhGYlY+6uHc4bhwP0bdyomzq0J4Hajr
 Qllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723793317; x=1724398117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YGZmjbI1TKAFBmHm9mAvv+PwdWnWaHfgix/3VwWYDYU=;
 b=Pr9VjfUmVuoiFNJp4gFaM+M19vJnGwEET1nSRp6H5Ta6vmtshXj6BOyOIKq+DSZJIk
 Cur0YwiD6PagKiljv+9/1kBbEEnNB8WJ5Ffm1FbIeecjHla/+HME2xlVWCE0aMadrGEI
 ForxH3cOQc15zRLimULsPer/9lsYi1BAdn6+SrK93jaabRCakg8puM5iKeKwkvXaUes4
 fynzqPeHl7YQkgA8bGPC9jvoxab22c8b9BZBtnje7wwPFh0IelnZ9W+bUEpAjlyEK7dx
 ajBmB8P3gHSd1Cpe4m7RqpcApbawESwUjSrTIqEFKzZVF866m2NIkA2kRQfuzi42FJT8
 GyJQ==
X-Gm-Message-State: AOJu0Yz3TRnBuvyzZfPUFx+A/O5GyTQdoOdXMkS+l25gdsSJC9I5/y+x
 GQNx1uLisZssHewFXObkchdEE8rSBG0J8C9l0M/rPqjskcYwHGpJndIYhu47kJs=
X-Google-Smtp-Source: AGHT+IH6GhqzBDPZvkYZQuwUhK0OlANBfbqxd3KQyfZe0gJn8tQbmOEHi8sRe5T2oRG3bDY+CSzGLQ==
X-Received: by 2002:a05:6830:25d5:b0:703:6076:a47 with SMTP id
 46e09a7af769-70cac8a3b99mr2020383a34.23.1723793317498; 
 Fri, 16 Aug 2024 00:28:37 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:1b6b:8c7b:90f9:144f?
 (2403-580a-f89b-0-1b6b-8c7b-90f9-144f.ip6.aussiebb.net.
 [2403:580a:f89b:0:1b6b:8c7b:90f9:144f])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61c60ebsm2047882a12.30.2024.08.16.00.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 00:28:37 -0700 (PDT)
Message-ID: <6e236767-a1a1-41ca-8f7f-10d6247656b9@linaro.org>
Date: Fri, 16 Aug 2024 17:28:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/16] target/riscv: compressed encodings for sspush
 and sspopchk
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 pbonzini@redhat.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240816010711.3055425-1-debug@rivosinc.com>
 <20240816010711.3055425-14-debug@rivosinc.com>
 <794021c3-02f2-4b64-8d1c-a56125e09462@linaro.org>
 <Zr74Axtj/871L5Nj@debug.ba.rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Zr74Axtj/871L5Nj@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 8/16/24 16:56, Deepak Gupta wrote:
>>> +  c_sspush        011 0  00001  00000 01 rs2=1 rs1=0 # c.sspush x1 carving out of zcmops
>>> +  c_sspopchk      011 0  00101  00000 01 rs1=5 rd=0 # c.sspopchk x5 carving out of zcmops
...
>> This indirection is pointless.  Have the decoder invoke the proper insn in the first 
>> place.  Identically with how we're treating 'addi', for instance.
>>
> 
> I was getting compilation error. How to reconcile with arugment sets between
> insn32.decode and insn16.decode. Earlier I was doing that and didn't need it.
> But after removing indirection in arguments and using single use format, type for
> structs instruction arguments ends up conflicting and compiler complains.

Ah, for that you need to use named argument sets.  In this case,

sspush     .... &r2_s rs2=1 rs1=0
sspopchk   .... &r2   rs2=5 rd=0

in both insn32.decode and insn16.decode


r~

