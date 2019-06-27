Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgZ3c-0000Bb-A3
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 14:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46249)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hgZ3S-0000A0-64
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 14:23:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hgZ3O-0000oO-Hy
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 14:23:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hgZ3O-0000mt-6e
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 14:23:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x17so3618748wrl.9
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XHp8+tIwjJe2/rw2N5bKvIwg8l7AbHaMGD1fdKFN1To=;
 b=PT5RJwExb2hmI8hTSpr3GMwgePtG4LfagySi2VEmyfn+h9UW1WRzZ2Bb5Xz8s4G8Nu
 lHGU2lZzv+TEWLLvxwBWmMvgAoJz5R9aH61p4HhErADwsjRDak1pvmcK09sGk65/3/bD
 8gBxzi4lmDmFNQQrAzeA8uCqIQ4Ap9g7a6MMiiD4ukJS1riTVnUVFDrxF5MINbX3cSZK
 kQbce57yiqyMh8mF5uc5sGCMRl8Gzzq80+G5/iB+wtM2xzfMqigv9KG+29XgRYEqyqBZ
 TA42/PJeHZDXa5v8LDo1FBdmqmy3k9R4eF09YMTCtonX2s1QcaXJQEJ7rm9Y/teQadgz
 LRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XHp8+tIwjJe2/rw2N5bKvIwg8l7AbHaMGD1fdKFN1To=;
 b=p8UQIOuJknthPfjyK96nkiVFat+MNoNtI2ke0s7DLayH6r0W39Y5TmstY91jivc6We
 7zBrvIE/VTCPa4fW31YJdXc1RTZzfQ9okgVNgaDMgbuqSLgcERXuljFlFd7bUVddi9a4
 DgX8UbR0WXdc3g9faOQ1K9C9jmPPnTQUXXlRL9t+fr0OaUR7ve2IybtUb/kyfQR4v0Cp
 wo3fIyZGAyzas2jvyPfpGtCvioqhVZPuek5I7MUpcVUF3wQbzD7Qab5CcXTUYlbWG099
 AizHNwbuU03kdxJxBtfcdhQ+meXW99YYbcZBp5ZxEOm0v+miDJXJszLrqC3CdDqE51wP
 wuoQ==
X-Gm-Message-State: APjAAAUxgfRkE71a2L5Drx9HritoyUGseSt6nma+9jqqew0uUHutnwjP
 PqkSpIdH+GJsFYjYarYxlfUTgw==
X-Google-Smtp-Source: APXvYqxrze6QECLRx0XiGOz9FifEdePGDqx7OdhULsAGe4wngSxq6jRF8Cxet7cVeN3Qfpka/pHB9A==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr4166449wrn.223.1561659803147; 
 Thu, 27 Jun 2019 11:23:23 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id a2sm12152895wmj.9.2019.06.27.11.23.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 11:23:22 -0700 (PDT)
To: Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-11-palmer@sifive.com>
 <CANnJOVF3F_k1LpSYp8OdxSx6LtQR5p-XR5fMKCsXg_0pxySg+Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c64fa0e8-fd9c-8e86-418c-0553f56a0f34@linaro.org>
Date: Thu, 27 Jun 2019 20:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CANnJOVF3F_k1LpSYp8OdxSx6LtQR5p-XR5fMKCsXg_0pxySg+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 10/34] RISC-V: Fix a PMP check
 with the correct access size
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
X-List-Received-Date: Thu, 27 Jun 2019 18:23:32 -0000

On 6/27/19 7:44 PM, Jonathan Behrens wrote:
> I think this patch is slightly incorrect. If the PMP region is valid for
> the size of the access, but not the rest of the page then a few lines down
> in this function the entire page should not be placed into the TLB. Instead
> only the portion of the page that passed the access check should be
> included. To give an example of where this goes wrong, in the code below
> access to address 0x90000008 should always fail due to PMP rules, but if
> the TLB has already been primed by loading the (allowed) address 0x90000000
> then no fault will be triggered. Notably, this code also executes
> improperly without the patch because the first `ld` instruction traps when
> it shouldn't.
> 
>   li t0, 0x0000000024000000 // region[0]: 0x90000000..0x90000007
>   csrw pmpaddr0, t0
> 
>   li t0, 0x00000000240001FF // region[1]: 0x90000000..0x90000fff
>   csrw pmpaddr1, t0
> 
>   li t0, 0x1F0000000000989F // cfg[0] = LXRW, cfg[1] = L
>   csrw pmpcfg0, t0
> 
>   sfence.vma
> 
>   li t0, 0x90000000
>   ld s0, 0(t0)
>   ld s1, 8(t0) // NO TRAP: address is incorrectly in TLB!

Nice test case.

> I think that the proper fix would be to first do a PMP check for the full
> PAGE_SIZE and execute normally if it passes. Then in the event the full
> page fails, there could be a more granular PMP check with only the accessed
> region inserted as an entry in the TLB.

This feature looks to be almost identical to the ARM m-profile MPU.

The fix is:

If the PMP check is valid for the entire page, then continue to call
tlb_set_page with size=TARGET_PAGE_SIZE.

If the PMP check is valid for the current access, but not for the entire page,
then call tlb_set_page with any size < TARGET_PAGE_SIZE.  This change alone is
sufficient, even though the full argument tuple (paddr, vaddr, size) no longer
quite make perfect sense.  (For the arm mpu, we compute some 1 << rsize, but
the actual value is never used; setting size=1 would be sufficient.)

Any size < TARGET_PAGE_SIZE will cause TLB_RECHECK to be set for the page,
which will force all accesses to the page to go back through riscv_cpu_tlb_fill
for re-validation.


> Unrelated question: should I be sending "Reviewed By" lines if I read
> through patches that seem reasonable? Or there some formal process I'd have
> to go through first to be approved?

No formal process.  More eyes are always welcome.


r~

