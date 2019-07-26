Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr1Zx-0005xw-Ny
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Zv-0005sl-7X
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Zt-0001BM-UV
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:52:15 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Zt-00018a-I7
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:52:13 -0400
Received: by mail-pl1-x644.google.com with SMTP id k8so24874752plt.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DKUk+JMDa/GVguAaQpilVBEyiY8Tss0uUjUAv7GcFHM=;
 b=yki7t2c2O4EFurbmFQvEdyp2l1LH67UUZpAvAa7DIzE4KYmj2UiYgbEoM+rp/7qIag
 Ter5W0Sr3Q4gwYajCgiyzqNzEbKIQ2GUDW4wSnM9/MsnmlMnsJtcGyPXfV8mp+CJVsZE
 Yf8hY8d53BhxQ1EQnlKxafogK2rb+yDeoU5FPVzdfCMfP7hQQfTHOZwOyoswqPpmwKya
 cA4ppEZQpv6rgbpY6NTN5LX2PaVuQWjb0Y3lU9/jTghcs48k3osinKmCl9oIw6r6SAhG
 a8dvKbqpx+8LzOU45SFiNV7i6X90NGn+GS8/qZmXBy35Y29FdotUaZEYRJzFjRb6OJ9y
 TvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKUk+JMDa/GVguAaQpilVBEyiY8Tss0uUjUAv7GcFHM=;
 b=LmCACzkXlkxkR56lUtimVkLC8mfuNxZEBNaJUrp8yq4Y3yIDXTpZnJz9ZKpAKcQcB1
 muRxtVO5HRJ/3LyBEJzww0c/gdx8FEjGR7L3B4S6v4mad34hMzrKEiY6fcN9Z2VhzI2L
 UObSQGg6m8oJiJkO+PL+qmaVtNpJMaWzABDc1CSBF4B1Xa+aQpmRdyjWgb2rqiDJygea
 1IRdMwo/whmtyx3Im704qiXdUr+P51Gpt1mmh2ZYs/Gk9ggMRIYrDGY8nTEi3SLHWmzq
 F0qyRXGPC3jDr9BTQlqI3UrBK4eDm4dSM4rsPjCPfc1auD9tbPSl9uASz4wAERSwyBPj
 vrnw==
X-Gm-Message-State: APjAAAUY2L2mDk/rJnL4ydAfRHrb7ugEue4J7Y0YselHm8HInAJ98SUe
 yEVlHBhH/EPQwYoKwMmWkumSBg==
X-Google-Smtp-Source: APXvYqyW2Y6moDKoLE8PJJQ5EyiC+GeWzUfz/CwC/vTwWMMAiAsJX2gMbQoO9yOrrgOoQH5PzI0Xlg==
X-Received: by 2002:a17:902:d90a:: with SMTP id
 c10mr94535077plz.208.1564152732290; 
 Fri, 26 Jul 2019 07:52:12 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id a21sm60770923pfi.27.2019.07.26.07.52.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:52:11 -0700 (PDT)
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
 <1564123712210.75919@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3342e044-607c-0aaa-fe63-27500db68e71@linaro.org>
Date: Fri, 26 Jul 2019 07:52:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123712210.75919@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 13/15] cputlb: Byte swap
 memory transaction attribute
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
X-List-Received-Date: Fri, 26 Jul 2019 14:52:16 -0000

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> Notice new attribute, byte swap, and force the transaction through the
> memory slow path.
> 
> Required by architectures that can invert endianness of memory
> transaction, e.g. SPARC64 has the Invert Endian TTE bit.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c      | 11 +++++++++++
>  include/exec/memattrs.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e61b1eb..f292a87 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -738,6 +738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>           */
>          address |= TLB_RECHECK;
>      }
> +    if (attrs.byte_swap) {
> +        address |= TLB_FORCE_SLOW;
> +    }
>      if (!memory_region_is_ram(section->mr) &&
>          !memory_region_is_romd(section->mr)) {
>          /* IO memory case */
> @@ -891,6 +894,10 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      bool locked = false;
>      MemTxResult r;
> 
> +    if (iotlbentry->attrs.byte_swap) {
> +        op ^= MO_BSWAP;
> +    }
> +
>      section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
>      mr = section->mr;
>      mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> @@ -933,6 +940,10 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      bool locked = false;
>      MemTxResult r;
> 
> +    if (iotlbentry->attrs.byte_swap) {
> +        op ^= MO_BSWAP;
> +    }
> +
>      section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
>      mr = section->mr;
>      mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index d4a3477..a0644eb 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -37,6 +37,8 @@ typedef struct MemTxAttrs {
>      unsigned int user:1;
>      /* Requester ID (for MSI for example) */
>      unsigned int requester_id:16;
> +    /* SPARC64: TTE invert endianness */
> +    unsigned int byte_swap:1;

Don't mention Sparc here, otherwise it seems like it only applies to Sparc,
when it is really a generic feature only currently used by Sparc.

Just say "Invert endianness for this page".

With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

