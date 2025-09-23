Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95162CAC5A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 13:47:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v13Mk-0003MB-UA; Tue, 23 Sep 2025 09:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v13Mi-0003LC-Iz
 for qemu-riscv@nongnu.org; Tue, 23 Sep 2025 09:47:32 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v13MX-0002qz-TN
 for qemu-riscv@nongnu.org; Tue, 23 Sep 2025 09:47:31 -0400
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso42500775e9.2
 for <qemu-riscv@nongnu.org>; Tue, 23 Sep 2025 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758635232; x=1759240032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hrotYaLfyFIj7/OzG5wU90oJ4hm1EH6YmlMOUeqVldk=;
 b=aKoH2R5WHEbDyDGmhtF1e1M2rf3UjzB13sILdDMAmzL6veYVsT/4KEOspG9XknwTaO
 ZACZCE/f7ZO4Jgh9DeQlNy2c6+I7CORXhkkrmKPO6M49VmVMZThxwJY0pUpML9yPVUXj
 myie4nYsAVW2Ehspqq+lsi7mF2gpQlzyhq6sEW7MLhKixwSutKyHh/tCp3VEUiOflR0v
 I/IA5HCWS1zsUpjWlCl06srt8DG6u1BnUDNEihgwfrKFKAHds30idfAZTGXDbrI1IKYQ
 WiYoE6j2aZ1EJd7TQyki47c5dHGDg2vy3NRRzI1xfLUXQQgpjFdDTA1vUSLBibYasWwr
 6YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758635232; x=1759240032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hrotYaLfyFIj7/OzG5wU90oJ4hm1EH6YmlMOUeqVldk=;
 b=pZfDCf94toTo1w9Gw25nRkegRvOdzfZP2zD+Smt5yWtcoD/Exn5QX4VWfIGa3DvRQ0
 LxMnnkwRQiaxVhAqkggD6aziJSqXScuBZG9MRIkQb1o37KReO4MQk2ziCTqLY4dsF0+T
 PpNuVjNr8vlud6Kv5sUg4xNuGbs9LXFKKANDfcOvSO3YABIqQNkwRLoKSawmqvkYmxZ4
 UG4x2dqO+gcv9BvlMP5H/MCdcoV/tuEmQVZq1EbLr+eD3z3/xLItESAEAhPG5qCprWp9
 oT7DT/CWDAklQI4ViY7sy0nLdOYGpjF7WIqRsYLasEP+/HayaaeNq9nN8zaIByKNdwZ+
 TULw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMyRmQCTCtoZEzXDMG4IvlNCCkej/1GJYjX1yfh5zsBidZBYVL9LlcRtfUB7+xdDrk5W58SUZ9c/h/@nongnu.org
X-Gm-Message-State: AOJu0YxkN+tJKRh0AsclvGPPfbcm177K33fLFTv2oFLBhL8zO3tDT3z+
 LB4lZ2ppwD1+ZqeYGrIjzU/G2Ja1/R5MW1YLXzcwrBpF9NeRiku4CmhNocal2YpRoaA=
X-Gm-Gg: ASbGncvswDmYt/iK6VrpksIGvqwQn0HbxgT05r05r4UKhHsPv1fgn/YtoI2D8qdLM9C
 oX2g0/SU5nnYQmtYGnucMwdvqgIfAtE+ueF5oSq8NJNseBIBPQaZ09lpHZ/kQDzT5POhtHsLkD9
 ISfigT16zyisaWQA/Nc415Z/dyUhMZRmZxPzqruwZsdi/IagBHZz0C+3Bmvb8qcOy3HistkOm6Q
 1QuKGv/LB51QGjhQ0A5ExcSXmt2pKdP+Kp92ng0Gr/pDUjXZVFPt3yUL7orI3BJ+7uVDJwjTOv1
 emgCCvO0yHAL2W43bu8/egvztCiJlW8amUz21YKt58zhJFc3FAeKi8aXrpy7NMSkhBXmIJa3pci
 KLR4JW9QhYr6au5cfHNNj/Jmq2CVTAkycveyEH9Dke4cOFXwEiBXXVqXBHwmr3qqaNg==
X-Google-Smtp-Source: AGHT+IG4HaBObqW7FabkjPiUJyc0GH9fvtJWyK+JqCHzxkhwpCoIYOfhiA6hsVREJH+trG7sic12DA==
X-Received: by 2002:a05:600c:8b35:b0:46e:1d07:5cac with SMTP id
 5b1f17b1804b1-46e1d8fe32emr26374345e9.0.1758635231740; 
 Tue, 23 Sep 2025 06:47:11 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46139122cb5sm280544905e9.8.2025.09.23.06.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 06:47:10 -0700 (PDT)
Message-ID: <498b3a87-e3dc-4a4f-b5e2-1bd79700e8c0@linaro.org>
Date: Tue, 23 Sep 2025 15:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] Adding partial support for 128-bit riscv target
To: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org, alistair.francis@wdc.com,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
 <c5c8566a-fd0d-48d1-8ed1-e52f0bb4f210@linaro.org>
 <CAKmqyKN51+jriKkSL8V5EFc9hBSFoEHYKp-70uP6RvO_K6a=pg@mail.gmail.com>
 <9ae32149-fe18-49d3-a689-60ee6752c20d@univ-grenoble-alpes.fr>
 <CAKmqyKO4GYqJ5GcvEc+yL4d01ONzDLR=2Ava7Disw2aSOZVFsg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAKmqyKO4GYqJ5GcvEc+yL4d01ONzDLR=2Ava7Disw2aSOZVFsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

Hi Frédéric,

On 7/4/25 01:25, Alistair Francis wrote:
> On Mon, Apr 7, 2025 at 4:24 AM Frédéric Pétrot
> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>
>> Hi Alistair, Phil,
>> well, I'm trying to keep the thing alive, checking from time to time that
>> the current QEMU still runs the 128-bit tests that I have, and on which
>> I continue (slowly) to do stuffs.

Are you able to share your tests?

Otherwise, could you add a simple one in tests/tcg/riscv128,
based on tests/tcg/riscv64/?

> If it's being used then I don't see any issue keeping it

With no guest test code, it is hard to make distinction with
dead code... We'd like to be sure we don't bitrot this, while
doing heavy refactorings.

Thanks,

Phil.

> 
> Alistair
> 
>> I hope this can stay upstream for experimental/research purposes, but the
>> 128-bit riscv community is, I follow you on that, scarce for now.
>>
>> So, your call.
>> Cheers,
>> Frédéric
>>
>> Le 04/04/2025 à 05:26, Alistair Francis a écrit :
>>> On Sat, Mar 22, 2025 at 1:09 AM Philippe Mathieu-Daudé
>>> <philmd@linaro.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 6/1/22 22:00, Frédéric Pétrot wrote:
>>>>> This series of patches provides partial 128-bit support for the riscv
>>>>> target architecture, namely RVI and RVM, with minimal csr support.
>>>>
>>>>
>>>>> Frédéric Pétrot (18):
>>>>>      exec/memop: Adding signedness to quad definitions
>>>>>      exec/memop: Adding signed quad and octo defines
>>>>>      qemu/int128: addition of div/rem 128-bit operations
>>>>>      target/riscv: additional macros to check instruction support
>>>>>      target/riscv: separation of bitwise logic and arithmetic helpers
>>>>>      target/riscv: array for the 64 upper bits of 128-bit registers
>>>>>      target/riscv: setup everything for rv64 to support rv128 execution
>>>>
>>>>
>>>> I see this series has been merged as commit afe33262585, with
>>>> 332dab68785b describing:
>>>>
>>>>        This patch adds the support of the '-cpu rv128' option to
>>>>        qemu-system-riscv64 so that we can indicate that we want to
>>>>        run rv128 executables.
>>>>
>>>>        Still, there is no support for 128-bit insns at that stage
>>>>        so qemu fails miserably (as expected) if launched with this
>>>>        option.
>>>>
>>>> Is this code tested? 3 years passed so I wonder about possible
>>>> code bitrot here.
>>>
>>>   From memory at the time there was some momentum for RV128. So this was
>>> merged with the expectation that it would continue to improve.
>>>
>>> That doesn't seem to have happened, either software or spec wise though.
>>>
>>>>
>>>> (I reached this code by looking at targets not supporting MTTCG).
>>>
>>> I'm happy to remove the CPU if it's blocking you, it's experimental so
>>> it doesn't need to be deprecated or anything fancy.
>>>
>>> Alistair
>>>
>>>>
>>>>>      target/riscv: moving some insns close to similar insns
>>>>>      target/riscv: accessors to registers upper part and 128-bit load/store
>>>>>      target/riscv: support for 128-bit bitwise instructions
>>>>>      target/riscv: support for 128-bit U-type instructions
>>>>>      target/riscv: support for 128-bit shift instructions
>>>>>      target/riscv: support for 128-bit arithmetic instructions
>>>>>      target/riscv: support for 128-bit M extension
>>>>>      target/riscv: adding high part of some csrs
>>>>>      target/riscv: helper functions to wrap calls to 128-bit csr insns
>>>>>      target/riscv: modification of the trans_csrxx for 128-bit support
>>>>>      target/riscv: actual functions to realize crs 128-bit insns
>>>>
>>>>
>>
>> --
>> +---------------------------------------------------------------------------+
>> | Frédéric Pétrot,                        Pr. Grenoble INP-UGA@Ensimag/TIMA |
>> | Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
>> | http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
>> +---------------------------------------------------------------------------+
>>


