Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7894C282D1
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 14:01:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqBmS-0000BY-T4; Thu, 06 Mar 2025 09:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBmN-00009Q-W4
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 09:00:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBmK-0008Hs-VS
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 09:00:51 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso387336f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Mar 2025 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741269647; x=1741874447; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p8e+aTIsA5BuWm4hBuAs+wicLt1TmHRSHO0rAL2bOs8=;
 b=KZVRO5kzWnia/KIVW7eA4bt+HYcUzgVK6sXxzqbwDsqM2uw/MGYGvoRfX8E+FURJEV
 2A3IBq0IzlMaL67zPeU+ezV5r81Y5F2kd3EC9i7n5f7RXMfFQjjknerD+Pv1XanmryIL
 wD+Bk34D2nn1bqZbelqp80DABUWhfytlX6aedLATeHZcGV/GLdFSIAIzSct3OZaYEdqF
 UnLCRLmETO+wmbhTUm1s+HM+KJ2D/d/tgoaFmiaLZYDDBy0CyB/Kq5yh43R6WOQ6eiy2
 4alBvekatkA4OpfJ8nM3+dd5o/qSVzDFc0DmougSug2/Z29nKGYJ7A24ZexaHIvjtsKv
 seVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269647; x=1741874447;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8e+aTIsA5BuWm4hBuAs+wicLt1TmHRSHO0rAL2bOs8=;
 b=sZdIfkbJftxfuuP2zmHgSNsZddSEU+SHV6jArih0hmc66OoMFX8LcUHoN5HCoqa0Ae
 06iM6pr3YL7s6y8qT66HLtrnCZ1KNcXtsxn+vUupr4bB96pb2M5X3tgyb81yf56kW3X1
 pLe52rjpFSrQMmUJZjXQv/iJDhB6hekAB/FGUX7tvZFYKEi076ue9Mi8MZprrw5Owv5H
 mPXmni4sBa1eadz5ZfvXccTr2TwRECxXf/w5ogDSFe5uwV0IGNn15YEv2PwdCl/gZz+b
 0dbilo+N1mMFeDnLmT/XrqEAYXYJfu8aQc8HL4+I8pfWztMSr7h+f6LIwMx0guG+F7h5
 ORPQ==
X-Gm-Message-State: AOJu0YznGG9G6hIX6g4Oe9ZxHsCDSFL3vfX+8P9/+0+Xt5QeSLOe6NZi
 AT0UOUojuvQEBEoGe/8G/fEpXeFRbCtR2RVBulFTpxaAzhJnxD7sQR2t3HPnOvNhM1Z7NRLrN3M
 pRh0=
X-Gm-Gg: ASbGnctW29gRiwT01ZvarEMJdwVqLE/xioSBauBgUQUPkyzxy+U4aI2eSgAGoLS6uqG
 SgkHy/lxwccYEmbuzkCqrJm27fjg9ELaHZSzF3tFCCR8LxgB4WZTLMqAg126YiQtQ9RK6cD5Djt
 zAq6Wa80TdduX+sQBAQqic995M2z8Du0L1rM67h8/+vZvvDPSS9c3LFD7HEtO0W/2Dh+HT771hv
 W+riXBl9xHZxgh+B/d6u0aPBVO+K+glg8IcDDhIlu9yeW9AbsNnVWbrnZXIG30Aim7TFhWJN5e9
 p3P+4QF+nPRRAdPWKSUcZUmZlG1/uQ2KAhKwFUeafPr6PHE1YVBdJdL5kuCXg6PEeAnrYT1ZecD
 DWxhSVFiR+TLm
X-Google-Smtp-Source: AGHT+IFLrgJiPtO92u/+ke83/gim0qfR6k0KL+HmfBu6+sIyF7p3ILkpsZrKqBJJmt/1DZFz6ZSxGA==
X-Received: by 2002:a05:6000:2cd:b0:390:ea34:7d83 with SMTP id
 ffacd0b85a97d-3911f76f519mr7336775f8f.31.1741269646543; 
 Thu, 06 Mar 2025 06:00:46 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcdasm2104332f8f.23.2025.03.06.06.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:00:46 -0800 (PST)
Message-ID: <d400e5b0-530f-43b3-8a6e-8539672af60f@linaro.org>
Date: Thu, 6 Mar 2025 15:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] disas: Have CPUClass::disas_set_info() callback
 set the endianness
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <8a185083-0459-4108-bd57-4bae75d871c6@linaro.org>
Content-Language: en-US
In-Reply-To: <8a185083-0459-4108-bd57-4bae75d871c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 6/3/25 14:58, Philippe Mathieu-Daudé wrote:
> On 10/2/25 22:29, Philippe Mathieu-Daudé wrote:
> 
>> Philippe Mathieu-Daudé (10):
>>    target: Set disassemble_info::endian value for little-endian targets
>>    target: Set disassemble_info::endian value for big-endian targets
>>    target/arm: Set disassemble_info::endian value in disas_set_info()
>>    target/microblaze: Set disassemble_info::endian value in
>>      disas_set_info
>>    target/mips: Set disassemble_info::endian value in disas_set_info()
>>    target/ppc: Set disassemble_info::endian value in disas_set_info()
>>    target/riscv: Set disassemble_info::endian value in disas_set_info()
>>    target/sh4: Set disassemble_info::endian value in disas_set_info()
>>    target/xtensa: Set disassemble_info::endian value in disas_set_info()
>>    disas: Remove target_words_bigendian() call in
>>      initialize_debug_target()
> 
> Series queued with rth's comments addressed, thanks!

Oops I meant to reply this on v3:
https://lore.kernel.org/qemu-devel/20250210221830.69129-1-philmd@linaro.org/

