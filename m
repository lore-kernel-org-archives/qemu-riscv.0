Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90947C282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 16:57:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trgQq-0005ne-LT; Mon, 10 Mar 2025 12:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trgQo-0005nM-Vc
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 12:56:47 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trgQi-0006Qj-Jw
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 12:56:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2fe9759e5c1so6646247a91.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741625799; x=1742230599; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZkjkedmykN6Dnae+6hPjYb5eiAU0Rz5li5jIqpcMQ1w=;
 b=iANxVSePFuTsAxE5T2+qhuI/xZZkefBYL3HlXom59t3T2zmykfpnZfWj9h6pbEX2uf
 suuyMRTwxLgZJguXuca7uc9QPREVErlbCIwpJT92wRwz4JXx1gzXb1+7jICv1MB8qUaY
 DEtfZKIPlIYCMuizEVz9eoUiPfm74T/nbjd/B08K+0HS2TpWro59BazcA4A0rW9Rlxdb
 4x9yga02b45t2bkZ6iWfWcrB99EYjAGCDjb4EzW7HCPSOK4Yv+UQsBWWCWwZQPuKcpqt
 eQknCrJCWLpwKs3PNsOskH5MY25MF0afDDeWvEl/yOtG0JXkZHaOAqYmLWTcz9AZ44zq
 hhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741625799; x=1742230599;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkjkedmykN6Dnae+6hPjYb5eiAU0Rz5li5jIqpcMQ1w=;
 b=qT9brdpd4MIbpgGnyf5YfqUaDT3HxAM5bQSfc2LEQRXvfkC/FTyh5vb27xdnxp/v1L
 XZZWIWto1b8tQfdTTDtPi8MrjQbAEYNnIdtjCCFrSrqnazFl68PlhAp2ukHWu5FYvU7L
 Qfer5F2r01f/397u7P5mNQv75UDo5OLuWETyc0ipNjyjvV8XYjLktYSGTyvPoCYL60T8
 M2JKlUFphx46t6oJv9Q+CqLHMfzo8UlmCCttDdG2KIpCO4mS5wm5oE2finpt+8lGKNLD
 W4blkvkgmitHvz5ee3SId6DYjidrx8G+AQffiGxvmvlP9SvP13Fu9EY7HFJRSchX6Par
 I0+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvAcbVKuk+tU4DgUP6Wjgjb8HiSsAghNRsmATNPtwte1NIr4qc1+c/DweMFqBIxgvPdhLHRx4qOcjD@nongnu.org
X-Gm-Message-State: AOJu0YyPHOOVgP6d7vwsHGEeouFvE4JubQ82mI7P7iDDiVKKcJ9xFsjP
 EwAV4hSSsMufLMxrDS1JFQJnmOxg+Lng/3Xfh48HbWDxIh2/O1vjrLMnNWJ/zC0=
X-Gm-Gg: ASbGncvOqlXL0gCqd/g1IPYPvbDqbOGOuQVjkN8dZyHgmE8zSNUYTN6k9dDfYFRTi8z
 Y1xrqQjZM13IU+lVK5ogS6/0eH6iNc4ZzSfeNScdjqNvoDgkT3YaqAYZ8IcWXdUkV06NWwiSeKI
 BLqWpLpT6uGIIqBwbmXZQbCO/xbXfOAJJ6PF2vUKbT6Xb/vK84eT4qC4NJPH+X8fVJbBv5Nv0Bk
 LtaOhWFs1K4i/0qxgrSjQKtJsgWsVwrX1mvlimjCbKLearEEyEZ2m5u/WPbpw7vv1JBLDUetrpG
 tL7nHWt59XsKBUK2uMJYZwADhLt/FfMqoeZYOsvYBUpNKz7DSEsZraFRMQ==
X-Google-Smtp-Source: AGHT+IHIbgCn3Exn+AALN657KIom6PGObNAGMKxJbf0VIqQkDogxhfDXJch+Uz3paJ/iK/pOhThzrA==
X-Received: by 2002:a17:90b:4a51:b0:2fa:e9b:33b8 with SMTP id
 98e67ed59e1d1-300ff10caacmr851943a91.18.1741625798731; 
 Mon, 10 Mar 2025 09:56:38 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410aa883asm80360745ad.239.2025.03.10.09.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 09:56:38 -0700 (PDT)
Message-ID: <a57faa36-2e66-4438-accc-0cbfdeebf100@linaro.org>
Date: Mon, 10 Mar 2025 09:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] make system memory API available for common code
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, manos.pitsidianakis@linaro.org,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
 <f231b3be-b308-56cf-53ff-1a6a7fb4da5c@eik.bme.hu>
 <c5b9eea9-c412-461d-b79b-0fa2f72128ee@linaro.org>
In-Reply-To: <c5b9eea9-c412-461d-b79b-0fa2f72128ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1034.google.com
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

On 3/10/25 09:28, Pierrick Bouvier wrote:
> Hi Zoltan,
> 
> On 3/10/25 06:23, BALATON Zoltan wrote:
>> On Sun, 9 Mar 2025, Pierrick Bouvier wrote:
>>> The main goal of this series is to be able to call any memory ld/st function
>>> from code that is *not* target dependent.
>>
>> Why is that needed?
>>
> 
> this series belongs to the "single binary" topic, where we are trying to
> build a single QEMU binary with all architectures embedded.
> 
> To achieve that, we need to have every single compilation unit compiled
> only once, to be able to link a binary without any symbol conflict.
> 
> A consequence of that is target specific code (in terms of code relying
> of target specific macros) needs to be converted to common code,
> checking at runtime properties of the target we run. We are tackling
> various places in QEMU codebase at the same time, which can be confusing
> for the community members.
> 
> This series take care of system memory related functions and associated
> compilation units in system/.
> 
>>> As a positive side effect, we can
>>> turn related system compilation units into common code.
>>
>> Are there any negative side effects? In particular have you done any
>> performance benchmarking to see if this causes a measurable slow down?
>> Such as with the STREAM benchmark:
>> https://stackoverflow.com/questions/56086993/what-does-stream-memory-bandwidth-benchmark-really-measure
>>
>> Maybe it would be good to have some performance tests similiar to
>> functional tests that could be run like the CI tests to detect such
>> performance changes. People report that QEMU is getting slower and slower
>> with each release. Maybe it could be a GSoC project to make such tests but
>> maybe we're too late for that.
>>
> 
> I agree with you, and it's something we have mentioned during our
> "internal" conversations. Testing performance with existing functional
> tests would already be a first good step. However, given the poor
> reliability we have on our CI runners, I think it's a bit doomed.
> 
> Ideally, every QEMU release cycle should have a performance measurement
> window to detect potential sources of regressions.
> 
> To answer to your specific question, I am trying first to get a review
> on the approach taken. We can always optimize in next series version, in
> case we identify it's a big deal to introduce a branch for every memory
> related function call.
> 
> In all cases, transforming code relying on compile time
> optimization/dead code elimination through defines to runtime checks
> will *always* have an impact, even though it should be minimal in most
> of cases. But the maintenance and compilation time benefits, as well as
> the perspectives it opens (single binary, heterogeneous emulation, use
> QEMU as a library) are worth it IMHO.
> 
>> Regards,
>> BALATON Zoltan
> 
> Regards,
> Pierrick
> 

As a side note, we recently did some work around performance analysis 
(for aarch64), as you can see here [1]. In the end, QEMU performance 
depends (roughly in this order) on:
1. quality of code generated by TCG
2. helper code to implement instructions
3. mmu emulation

Other state of the art translators that exist are faster (fex, box64) 
mainly by enhancing 1, and relying on various tricks to avoid 
translating some libraries calls. But those translators are host/target 
specific, and the ratio of instructions generated (vs target ones read) 
is much lower than QEMU. In the experimentation listed in the blog, I 
observed that for qemu-system-aarch64, we have an average expansion 
factor of around 18 (1 guest insn translates to 18 host ones).

For users seeing performance decreases, beyond the QEMU code changes, 
adding new target instructions may add new helpers, which may be called 
by the stack people use, and they can sometimes observe a slower behaviour.

There are probably some other low hanging fruits for other target 
architectures.

[1] https://www.linaro.org/blog/qemu-a-tale-of-performance-analysis/

