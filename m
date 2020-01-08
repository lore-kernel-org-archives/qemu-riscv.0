Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ip0lo-00086H-R6
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 21:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip0lm-00082O-5s
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 21:08:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip0lk-0000v3-TC
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 21:08:26 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip0lk-0000uE-OE
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 21:08:24 -0500
Received: by mail-pj1-x1042.google.com with SMTP id bg7so381546pjb.5
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 18:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3fuuhX0eJM0s+kyXhD/xA6Ut4i7rclacySX8jl6CuB4=;
 b=ph9Ysv0twycmmUpyXjw4eNsE0I4aJon4eXE9gFHW5mSF7CCOwVAhQq4iqOMgaabcT5
 v13Q2Hfx9n1AisSD9oUuMzhKRIUatHvdn5c1/4cAkngv8nv8f34wrVxwfUXvnhctre8Q
 avSWqO+QxcFcNzJI5tiYeNZ4+16gPMeIIKNJFL7CSjXTgQT5nZrjlOpslscDceJSc/a5
 Kludwddhs2kXp3Q4noTs0+4C3ibDqP4h/v7xucHXr4RQiceuAyYZIOEq62Am86w3k0dn
 ngY+kCzgMNicPF8ZDDb/yNJKHmo/D5InwTH/a58nhbuo4p7OimbAKipEOcdnjxGcBZ3h
 F67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3fuuhX0eJM0s+kyXhD/xA6Ut4i7rclacySX8jl6CuB4=;
 b=eCMLEKZV82h4u2OhRP/RA7oUMZe4K/mmaxZevuqf/7Cextx/AuFH7E9qPYb45BFb5/
 Uy6kc38Tt3wK5/FJrGrQsh4PWe2KX2DxaiaOBm3IT3JyWhLYb44uV1I9j1+bWsQq7ed4
 xw0V2CJXDo8XZOL7F4Y/v/GWOo2/axr9FFXo5J+aaeSlNxr2U8MmTJKLRIIpGjKZNV5y
 iIS4b+FzT/M0JUbNFWJ5kxD20duI4E28Y3d7U//o96aLb61iMHhn+QDLWEyHUBxRSabI
 V0/0T0fA6oq6mUebpU4w045iBwAQN9L8c8cXZ4kao5kviTHJ6PybCseNNsaoksUp8Dsw
 p+fA==
X-Gm-Message-State: APjAAAXTIw5IvqQsdI6fsDcCmgCsda56KbSH8PFLMqxpyCqVVnDEcOV5
 Fl5nlqU5uaCqTI6PYwEqUFKny0byOe3Itw==
X-Google-Smtp-Source: APXvYqxwzm8yecKqfZJ8RcKzbUlP95DbsDwr/XEYafYFdFyr/YzlSRyukoSrmi3yYvU2vL4Z9L7JNg==
X-Received: by 2002:a17:90a:ac18:: with SMTP id
 o24mr1792794pjq.33.1578449303170; 
 Tue, 07 Jan 2020 18:08:23 -0800 (PST)
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id n4sm1025409pgg.88.2020.01.07.18.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 18:08:22 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 05/17] RISC-V: add vector extension load
 and store instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, Chih-Min Chao <chihmin.chao@sifive.com>
Cc: wxy194768@alibaba-inc.com, wenmeng_zhang <wenmeng_zhang@c-sky.com>,
 qemu-devel@nongnu.org, Jim Wilson <jimw@sifive.com>, qemu-riscv@nongnu.org
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-6-git-send-email-zhiwei_liu@c-sky.com>
 <4da4da5b-afb8-c9be-99af-0544c6eeb233@linaro.org>
 <b927f28a-2057-ed1e-c426-63cf9fade27f@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a10c873-f293-a37b-e98c-f1964702efe8@linaro.org>
Date: Wed, 8 Jan 2020 12:08:15 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b927f28a-2057-ed1e-c426-63cf9fade27f@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Wed, 08 Jan 2020 02:08:28 -0000

On 1/8/20 11:32 AM, LIU Zhiwei wrote:
>>> +            switch (width) {
>>> +            case 8:
>>> +                if (vector_elem_mask(env, vm, width, lmul, i)) {
>>> +                    while (k >= 0) {
>>> +                        read = i * (nf + 1)  + k;
>>> +                        env->vfp.vreg[dest + k * lmul].u8[j] =
>>> +                            cpu_ldub_data(env, env->gpr[rs1] + read);
>> You must not modify vreg[x] before you've recognized all possible exceptions,
>> e.g. validating that a subsequent access will not trigger a page fault.
>> Otherwise you will have a partially modified register value when the exception
>> handler is entered.
> There are two questions here.
> 
> 1) How to validate access before real access to registers?
> 
> As pointed in another comment for patchset v1, 
> 
> "instructions that perform more than one host store must probe
>       the entire range to be stored before performing any stores.
> "

Use probe_access (or one of the probe_write/probe_read helpers).

Ideally one would then use the result, which is a host address, and perform
direct loads/stores using that.  The result may be null, indicating that the
operation needs the i/o path.  But in any case, after the probe we are
guaranteed that the page is mapped and readable/writable.

Note that probe_* does not allow [addr, addr+size) to cross a page boundary.
So you do have to be prepared for the vector operation to consist of 2 pages,
and probe both of them.

> I didn't see the validation of page in SVE,  for example, sve_st1_r,
> which directly use the  helper_ret_*_mmu  that may cause an page fault
> exception or ovelap a watchpoint,
> before probe the entire range to be stored .

Yes, this is a bug in SVE that will be fixed.

Note that you should not use helper_ret_* anymore.  I've just introduced
cpu_{ld,st}*_mmuidx_ra() that should be used instead.

> 2) Why not use the  cpu_ld*  API?

It's possible to use cpu_ld*, but then you need to store the results into a
temporary, and copy the result to the register afterward.

But I think it's better to probe first and avoid a second copy.

> I see in SVE that ld*_p is used to directly access the host memory. And
> helper_ret_*_mmu
> is used to access guest memory. But from the definition of cpu_ld*, it's the
> combination of
> ld*_p and helper_ret_*_mmu.

This is all changed now, FWIW.

> I will take it.  However I didn't have  a big-endian host to test the feature.

You can apply for a gcc compile farm account, and then you will have access to
ppc64 big-endian hosts.

  https://cfarm.tetaneutral.net/users/new/


r~

