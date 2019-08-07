Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvPtj-0005it-Ew
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 13:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56639)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvPth-0005fM-7G
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:38:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvPtf-0000Ef-KZ
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:38:49 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvPtf-0000BB-BG
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:38:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id b7so41905645pls.6
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
 b=qKntDSdMHrPkk+J4UwBLYb43bMqF9cNsmBdbtO0FK8JganyV7uyTQ8or9BAogOmaro
 pga5jjzH1qGtSpHdpxvq2oB7RYGMiyslKp9kHAEBGErVqDVqocpyhVv2Nod0voV8ff84
 SY6MT11IbZ8/SpjtnTg2+3ZNywYLl3+vIRChQpDQBiw06QLyYmw/eC896UH9umWOpX6y
 oEFGMIHkr8kBjvr8aD9hoV2T/yCNdY5AEwcNv4DO/tnu+C9k8jy9YydwN/nL1Vd9Is8g
 qg1v7NJsMJGWr4eOTVKqHjvcZvF/04lucLcGFb9Oc8o1N84TJxpua/YiYrAU54tVwKKk
 majA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
 b=hpxry+M8fyxA4SWMWWeb/1A0agPmO4ToApzDdzBva4obUicxQLr0OruhRw13HMvcQf
 fgfAuoUbYdwplmudlNF+SWoh1wCh6Ckg9ypwb1VxfYdvLuHmVcu4TDj6i52dkvtbYJSJ
 XLnE5XK6oBWryP7c7/rShaZbRko2RS+M1xYJ+zC0p0v73augNwz65LYDATWrbN9vphEO
 s3ysN1IXqTm01PxHsxjnHqJFb/ZLkMx7Zl4gI0mReb/APYWVV4fSDz47jq9My6nW7QeO
 batCIvEKMYOQsIDYuPLGr4XgKMw7lBAtmZrnt81sjGoJFqI8ZZ5dekaEWr7hobMmwMN+
 LqdA==
X-Gm-Message-State: APjAAAVsQvJPddjMcB7npsKdho4S3egwIL2bufN/AEyhmFE9q3EYYrzr
 qmLcALO0BFO2WiIdNvQUeTjriw==
X-Google-Smtp-Source: APXvYqwqmCPo/smyD47WHlQMbe+H96vmsz+ljj5kBopE78f/Xl5o/xo4bT3nHsJiUOP7TbKuiz8wIw==
X-Received: by 2002:aa7:8555:: with SMTP id y21mr10575549pfn.104.1565199525861; 
 Wed, 07 Aug 2019 10:38:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q7sm105394539pff.2.2019.08.07.10.38.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:38:44 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com,
 andrew@aj.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166819111.14515@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2f24c92-d210-7e0e-b787-3986123824d4@linaro.org>
Date: Wed, 7 Aug 2019 10:38:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166819111.14515@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 21/26] cputlb: Replace size
 and endian operands for MemOp
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
X-List-Received-Date: Wed, 07 Aug 2019 17:38:50 -0000

On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
> @@ -1246,7 +1246,7 @@ typedef uint64_t FullLoadHelper(CPUArchState *env, target_ulong addr,
> 
>  static inline uint64_t __attribute__((always_inline))
>  load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
> -            uintptr_t retaddr, size_t size, bool big_endian, bool code_read,
> +            uintptr_t retaddr, MemOp op, bool code_read,

I assume the code generation is the same, or nearly so, for these functions?
It seems like it should be, since we're replacing one set of constant arguments
with another, and the compiler should be able to fold away the same set of tests.

But we should at least have a look...

> +    switch (op) {
> +    case MO_8:
>          res = ldub_p(haddr);
>          break;
> +    case MO_BEUW:
> +        res = lduw_be_p(haddr);

I don't like mixing a bare size with size+sign+endian.
I think you should go ahead and pass MO_UB.

> @@ -1605,30 +1605,27 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
> 
>   do_aligned_access:
>      haddr = (void *)((uintptr_t)addr + entry->addend);
> -    switch (size) {
> -    case 1:
> +    switch (op) {
> +    case MO_8:

Likewise.


r~

