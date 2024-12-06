Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA46E77173
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 13:37:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJYVn-0002LX-Ue; Fri, 06 Dec 2024 08:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJYVl-0002Kr-Mf
 for qemu-riscv@nongnu.org; Fri, 06 Dec 2024 08:36:49 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJYVj-0004QD-1o
 for qemu-riscv@nongnu.org; Fri, 06 Dec 2024 08:36:49 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-294ec8e1d8aso2019038fac.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Dec 2024 05:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733492205; x=1734097005; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oSg/56edUmpzX0utB/qODeHxKkHzMREQ/w3flYHLzHs=;
 b=fGYFwAfw58uQLi9fX+5UL1ttYqSCWUclhX8JOhLeDEEjZEAe8y3jp+HzTwnvYTr32k
 7EJu9lKaZQ23A1Cuq1qEFzNz0XzcpICwo6E4+mtyIXTpMCIzofDP2xKi/gtscp2loraa
 5oQUdLtNxYs3fUPn7YvtPGrvoa21PBXIMt3tX51SoeGEbJ3KuFW6vvs74Q+vUhF3z3ZZ
 rYzgrs6Jo0sbyYkxbJTIwRoMinj4qUKMb8NsxXUQdANh9oR/z/ozXe5p5qxnIgCBK35m
 gKqW6OL2KcvXhHJPFWVGWJcBoyuy5eSygbQO0GZKGz6vENKvJ7ezKUpzZgH5MeB4W5Qk
 TV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733492205; x=1734097005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSg/56edUmpzX0utB/qODeHxKkHzMREQ/w3flYHLzHs=;
 b=v9W/Bye/jsjHh1TmOXvOpXIr+ukkuv6agoVcPZ0yV6Cq2brLw3DM5Cin+oYstMCJ8k
 v5sR0ehYZrJU1tZ2JK6Pr+sRtA5gI6ViKAKXzu/NezT6/ANVn3Eo27i45n2OBI1vKVzn
 YCR3wejbD9IEY+bAXHy2LHlE3RxpIjjlL67oStWveQV/OjFY8ag9pBmg548wthYIVU/9
 xawKH2M9PYN5b2liHe2E2jIoQst8OMCIa1OIWgoG7A139KeaIrMvbWtP+VHu9hzzuaQZ
 2mJrEo09fiT5uhyAsBfNVzeSliUpi2SwC65J1Wasl1Su+Xl8tW6ekquM+zEa60KGeEDb
 lLLA==
X-Gm-Message-State: AOJu0YxK9BGb1LU0fFnyxJERdGXIbBL74tGoh89B1K37IoXibZfDVSa8
 /pR2r23QEIMrHCA33xrbWLDMrek1rRuZQbLfp8RPJ/thmyHOdOpyogOllBKc8d4=
X-Gm-Gg: ASbGncsHjy3UVv1u/l9lTzwG+0q6/PPtkZW6Pmhe3izN8dAdRsWIwIqUFZNJkvjW0m5
 qUODKR+PfTgTiLLutGjlmRVOANjSSthC3V6RWZbAsCYg1K7y8MFyP+S4uQWgtwIpgOS0SPK9tD/
 71QDIGQnG/so6LHTS2jM8ViRx50rmxnxm1J/4d9z8ETOA+pAr+i8YjbcZtjNJp8Omjow2bA3U5w
 dI3kqz/IzoukGVcyt7JL+znZMn9UhtifHqAVPJai4JTDQtNqDOgaeqo5NnfNCn/yZmQgWezvBLX
 GOaU/+UW9UPR79u0U+zeJXnA+sSY
X-Google-Smtp-Source: AGHT+IHsGJ0g+wQFK7PNnVKQQp2CvvbxHhwwpcLYMH9Scwhb0JlpzjzkcYDDtJjCfnVGmd04PEke1A==
X-Received: by 2002:a05:6870:9e86:b0:297:285e:f9f4 with SMTP id
 586e51a60fabf-29f7353fff0mr1213884fac.34.1733492205071; 
 Fri, 06 Dec 2024 05:36:45 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f567602f5sm825943fac.23.2024.12.06.05.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 05:36:44 -0800 (PST)
Message-ID: <bbd8f614-f967-4f7f-82c1-eafdd9fbba68@linaro.org>
Date: Fri, 6 Dec 2024 07:36:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] disas/riscv: Guard dec->cfg dereference for host
 disassemble
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com
References: <20241206032411.52528-1-zhiwei_liu@linux.alibaba.com>
 <79a76786-9ba7-4c04-8c11-52c92376e6df@linaro.org>
 <5536d7c4-c3df-4cac-900b-bbb3cb2a8c4d@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5536d7c4-c3df-4cac-900b-bbb3cb2a8c4d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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

On 12/5/24 22:39, LIU Zhiwei wrote:
> 
> Both zcmt and zcmp are not compatible with Zcd, as they reuse some encodings from c.fsdsp.

Ok, fair.  A comment about conflicts at that point may help.

> 
> Zimop or Zcmop also overlap with other isa extensions, as they are maybe-ops. Other extensions
> such as zicfiss will reuse their encodings.
> 
> I think we had better disassemble them to zicifss if it has been implemented on the target cpu. Otherwise
> we disassemble them to maybe-ops.

My point is that they are only belong to zimop until they are assigned, like zicifss.
At that point they *have* a defined meaning in the standard isa.

So, yes, disassemble as zicifss, but always, not "if it has been implemented in the target 
cpu".

>>> +        if (((i == 0) || cfg) && guard_func(cfg)) {
>>
>> This should be i == 0 || (cfg && guard_func(cfg)).
> 
> OK. Although I think they are both right.

  i = 0
  cfg = NULL

    (0 == 0 || NULL) && guard_func(NULL)
-> (true || false) && guard_func(NULL)
-> true && guard_func(NULL)
-> guard_func(NULL)
-> boom.

Or are you saying it won't go boom because we happen to know the 0th guard_func only 
returns true?  There's still no reason to call it...


r~

