Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0zW-0000jR-Ie
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46188)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0zT-0000en-S1
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:14:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0zS-0003v5-Pn
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:14:35 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0zS-0003tx-G7
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:14:34 -0400
Received: by mail-pf1-x443.google.com with SMTP id q10so24583724pff.9
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/DvQrYQ97Yl8oYvdth1hdR4PNbJOpdRc88CoWxTHyU=;
 b=Wq22dtUwz1A7TMF5HCdO/SyYzbc29Tl0JYbsG/psMJbG9xEKYBFeLPKMIV6q86OU5t
 tnnkgjrqp6V5WXxcDNm8hlWK79RJI8H362lbhAxUcf2e9cVioZlWmTXNCSkuqF3Eqlof
 7rml1TW1VevDsAG7SAhxu6bUmTXy17ytYaZbn8EAvg0+RGAjvY6qSrzraIhoOxpk6ZJw
 5BTMQnN1NrqYKsjx1bl2CNOaoQUXVHc/9mZJ3wzWl3nRy6qFIkXwB+J3f1MohgJTRt9x
 i9abbHwK4PAfvzcXmuWi/JhDV+T3MmebY5cjX10tLUk5y7WhO7+fQn07xtvBKnnyEBIB
 X45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/DvQrYQ97Yl8oYvdth1hdR4PNbJOpdRc88CoWxTHyU=;
 b=EMrwXdeib6EOaQCBxm7aVPwogAAE+8Yb7BKIkdh3BUh9JGPFNKDVrN1U5Rd+4QTmP5
 Pnw2KRFERxjLYlF/ZJrPtnsWvfVF49zem38xrfxujnTABuW7WP28Qks0Fgm1mrThA2HP
 r8WepLp7Hq7NTpSv9rfkIs4fK93daNLq2w1cpRcOzaTh9Pw21LjCfACWHBMlPo8RVFlt
 axf99Xr5nU3j2Zr7RgLPJImhSbcPQ+/PrqzbjUk+soBc2qXAUbQPFDzWi8bgryWmbkZ8
 hgYtGjr/IT6bxxmUXDdJh+zTb9DRz5aLBPQKvedOTjQOqbRNwz4UZnH1rodt7D7NmasW
 5Syw==
X-Gm-Message-State: APjAAAWtdMtzroDyfyx5DOorlWXCSfBXk88noxv4cSlX4m2q4NxOrMKr
 8J/2/n0kIDhjChpPL4TxI1VZ1w==
X-Google-Smtp-Source: APXvYqxDQAwXwyxw7nkYt1JtGRrNBEaknYYcz3WpCna5A0OARV6Nwpwuz1lnUaab5n4jyZR8B8TXGQ==
X-Received: by 2002:a62:1597:: with SMTP id 145mr21675793pfv.180.1564150473241; 
 Fri, 26 Jul 2019 07:14:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id x13sm56422483pfn.6.2019.07.26.07.14.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:14:32 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com,
 sagark@eecs.berkeley.edu, mst@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, Alistair.Francis@wdc.com,
 edgar.iglesias@gmail.com, arikalo@wavecomp.com, david@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com,
 alex.williamson@redhat.com, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123618147.19868@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b5309b86-edbb-2b23-78e4-7657f6b05da5@linaro.org>
Date: Fri, 26 Jul 2019 07:14:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123618147.19868@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 09/15] cputlb: Access
 MemoryRegion with MemOp
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
X-List-Received-Date: Fri, 26 Jul 2019 14:14:37 -0000

On 7/25/19 11:46 PM, tony.nguyen@bt.com wrote:
> No-op MEMOP_SIZE and SIZE_MEMOP macros allows us to later easily
> convert memory_region_dispatch_{read|write} paramter "unsigned size"
> into a size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 523be4c..5d88cec 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
> 
>  static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                           int mmu_idx, target_ulong addr, uintptr_t retaddr,
> -                         MMUAccessType access_type, int size)
> +                         MMUAccessType access_type, MemOp op)

As I mentioned for patch 2, don't change this now, wait until after patch 10.

> -    r = memory_region_dispatch_read(mr, mr_offset,
> -                                    &val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);

So size_memop here,

> -        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access_type,
>                                 mmu_idx, iotlbentry->attrs, r, retaddr);

but no memop_size here.

>  static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                        int mmu_idx, uint64_t val, target_ulong addr,
> -                      uintptr_t retaddr, int size)
> +                      uintptr_t retaddr, MemOp op)

Likewise.

>          res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type, size);
> +                       mmu_idx, addr, retaddr, access_type, SIZE_MEMOP(size));

And when you do come back to change the types after patch 10, at the top of the
function:

-    unsigned a_bits = get_alignment_bits(get_memop(oi));
+    MemOp op = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(op);

and then pass along op directly.  Which will fix some of the weirdness in patch 11.


r~

