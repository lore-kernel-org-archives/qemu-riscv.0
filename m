Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5A4a-0006ja-Md
	for mharc-qemu-riscv@gnu.org; Tue, 03 Sep 2019 10:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5A4Y-0006hm-9g
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 10:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5A4X-0001d0-8J
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 10:46:18 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i59gJ-0004RZ-N1
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 10:21:15 -0400
Received: by mail-pl1-x641.google.com with SMTP id 4so7951967pld.10
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2019 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kwa56529Zjje0zeoMctHFAL42a3hldvw+9VS4Mjnzwo=;
 b=mRn3k6b2lDmJ+I0u887CgYUQhKm8nnqyC2jN5+tt4XZrWnqgb61pSxGppPl7pF9Xwd
 UYs23HzwAp3lx/YDVUwsjLKCfYFUVoQJxn6zOpIh9WzpdvPXSMbkejoHgRHtAwPdlSum
 /4AM/KaT5qmt36pcxooVflVmWOAuvi8PQB+9NgceiI6GRbdJbUFPJvf1IN9mzBvfDP8G
 7ejoHmH8JoRAI+NWPLfG1GIX9MoMcVMW3O2FlgpiVRBw9k8JmETzYrzqjsNvS4wkUK0i
 C8WCkGP0kKhU20s/RYIS4i82J+ascM0ARJUD6mFH8w/K0ajkOvcGKzX4APIevY8725xl
 MttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kwa56529Zjje0zeoMctHFAL42a3hldvw+9VS4Mjnzwo=;
 b=DR3uf/dnjH98mz6lk5Ax+r5fU7Ldczhd7oOuN2Xt9zU9MLSOic8wLwv804nRyyRH8U
 D70A8NUqGfw8Tja3UZQNBtD/6A0QG4zJAk8dnTk4ZwFYo3l5XVZ6f4re1WzFq8O3pCK8
 cQFFfpe69SVxMaZ67KdP88BiIHyDSuRj49IEFRYPWCBPrgk7C7ULdbMDs1oU4OPP4Z8c
 kR2CncvcDn3yb7/4H4yx0XLijLxFDT/zYiA/2vnZFlV4Y7JbRw4q9GREW8w3x57z4Baj
 fm9fzxSFHyDewE54S0T3d+TFn0RJUInY+tppwQgYvY5J5v6Wv+RFULdJ/HnL9Y2r3JWn
 iz4A==
X-Gm-Message-State: APjAAAVC4FAJKpGWzhhTrPf84Wx7fQNA/ZDmfX3OdqbhKZ4m+cxR9WwQ
 7voW/aX60Au+OqyK9PScVJYu5w==
X-Google-Smtp-Source: APXvYqwP+icEhekKSbaiIsp6uKiMz3SYsdywMQGtvFBvQczlH7oR6DsAOLMCsGu6KvQcMxKck6RfWg==
X-Received: by 2002:a17:902:465:: with SMTP id 92mr8103536ple.65.1567520473948; 
 Tue, 03 Sep 2019 07:21:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id br18sm15626010pjb.20.2019.09.03.07.21.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 07:21:13 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: peter.maydell@linaro.org, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 Alistair.Francis@wdc.com, alex.bennee@linaro.org, aurelien@aurel32.net
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
 <39fe5b33-86b1-cb42-9733-5d8e1ea08127@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7eaaf1cf-6e9c-62d1-773a-4ad09a404877@linaro.org>
Date: Tue, 3 Sep 2019 07:21:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <39fe5b33-86b1-cb42-9733-5d8e1ea08127@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISCV: support riscv vector
 extension 0.7.1
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2019 14:46:19 -0000

On 9/2/19 2:43 AM, liuzhiwei wrote:
>> This is most definitely not the correct way to implement first-fault.
>>
>> You need to have a look at target/arm/sve_helper.c, e.g. sve_ldff1_r,
>> where we test pages for validity with tlb_vaddr_to_host.
> Why should  test pages for validity? If there is a page fault in running time,
> it just the case why it must use the fault-only-first instruction.

So that the helper does not fault for the Nth access, N > 1.

You test to see if the page has a mapping, and if it doesn't,
you end the instruction, without going through the exception
path that I have objections to.

Except for gather loads, you don't have to test for every
access, only at page boundaries.  And then you may also arrange
to use direct host access to the pages that you've validated.

Again, have a look at sve_ldff1_r.

> A single array is a good idea. But vreg[] will be better for understanding as it preserve the register concepts. 

A function access to the registers would be just as good for that.


r~

