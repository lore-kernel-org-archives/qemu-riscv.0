Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr19T-0006AC-Ji
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35871)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr19Q-0005w6-1p
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr19O-00041i-R7
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:24:51 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr19O-0003zs-I4
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:24:50 -0400
Received: by mail-pg1-x544.google.com with SMTP id i18so24871436pgl.11
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ch7GhX8r4Ua0ued6sWDZ5gUIVhUso0uIeEsP69b2pZY=;
 b=MN835LS0CPkIR+fLKbEAD32Q6aOiotryzACHWZFmTtEGv3TTD+xkck5wPvj0KshTkE
 j0ZUJC0KtpnAzkMiLulHHUnfbr+Ul3br6lb/amGB4hTvnF1h0h6anllyp40/ZogTH5JC
 +Hcc1egomrLtt2+xz5gJMVV3QHBWdDW6wkswEYEQCRDbUMqESEf1BI7L9+OKeRZjJM51
 pgyP7+CUALIsQqEoEU0feN5VVs3TMfL9T9eGc3Bf5ng8wDozqPhKmoVp9XdXztSVJXrB
 O3x3y1h8sqtAwsH02jJ9FpEGvx6rpOBr01Rn3AxVqS9wsi+KKHn6W5NX2/UriM6sWjde
 gbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ch7GhX8r4Ua0ued6sWDZ5gUIVhUso0uIeEsP69b2pZY=;
 b=GkWl5Xm6lrdYo+MMiSFUnSJIJR914iZsZN2fG1jjn1ucRsS06v6Cg8E18mgLZFn6p3
 nfCHT6aFh5SdqtpTlkbXIvPojO7Jwcy/fNi7snpSQMFi8iwXn5sD1b5gQcghkAAxFUMV
 3ZsE/3+u4BPDB5KMdIxpvJQYEgrcebxlRBglRnqwiTVy8jkpf0wBNA/kuqOL1npAsI+6
 RgksLxAlyOdvtZdCs7n1fZC1CIbpvLYMnyfcfM7/x3twRcpkuqREby8l/Jo5YC7PDsc4
 UKeTc+lVMmAq/JwYnTQ0NG+Fwl8LTU2myDlV2EtUH1Dzt+NzFvREpVhl+Umn5b4G/Eij
 /mdQ==
X-Gm-Message-State: APjAAAV3t13PPxNzvwOQ68/9bnumc+y0hSuNT+iYne+H6tZrvsKv8AR4
 hHleqskZLl2iMG6DnkaDGSWo8g==
X-Google-Smtp-Source: APXvYqxYVOIHTr2gCt+HQcM1RO77K5A274NtPVrH3K42rvV0YtePwhEPd5oYYyyy984/qZnj0t1yWg==
X-Received: by 2002:a62:b60e:: with SMTP id j14mr22759183pff.54.1564151088872; 
 Fri, 26 Jul 2019 07:24:48 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id x26sm68965119pfq.69.2019.07.26.07.24.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:24:47 -0700 (PDT)
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
 <1564123643791.27023@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <182cfe57-bd92-77e4-2b8f-9c4f543c6661@linaro.org>
Date: Fri, 26 Jul 2019 07:24:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123643791.27023@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 10/15] memory: Access
 MemoryRegion with MemOp semantics
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
X-List-Received-Date: Fri, 26 Jul 2019 14:24:53 -0000

On 7/25/19 11:47 PM, tony.nguyen@bt.com wrote:
> To convert interfaces of MemoryRegion access, MEMOP_SIZE and
> SIZE_MEMOP no-op stubs were introduced to change syntax while keeping
> the existing semantics.
> 
> Now with interfaces converted, we fill the stubs and use MemOp
> semantics.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/memop.h  | 5 ++---
>  include/exec/memory.h | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 09c8d20..f2847e8 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -106,8 +106,7 @@ typedef enum MemOp {
>      MO_SSIZE = MO_SIZE | MO_SIGN,
>  } MemOp;
> 
> -/* No-op while memory_region_dispatch_[read|write] is converted to MemOp */
> -#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
> -#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
> +#define MEMOP_SIZE(op)  (1 << ((op) & MO_SIZE)) /* MemOp to size.  */
> +#define SIZE_MEMOP(ul)  (ctzl(ul))              /* Size to MemOp.  */

As mentioned, I'd prefer inline functions.

I think it wouldn't go amiss to do

static inline MemOp size_memop(unsigned size)
{
#ifdef CONFIG_DEBUG_TCG
    /* power of 2 up to 8 */
    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
#endif
    return ctz32(size);
}


> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0ea4843..975b86a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1732,7 +1732,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner);
>   * @mr: #MemoryRegion to access
>   * @addr: address within that region
>   * @pval: pointer to uint64_t which the data is written to
> - * @op: size of the access in bytes
> + * @op: size, sign, and endianness of the memory operation
>   * @attrs: memory transaction attributes to use for the access
>   */
>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
> @@ -1747,7 +1747,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>   * @mr: #MemoryRegion to access
>   * @addr: address within that region
>   * @data: data to write
> - * @op: size of the access in bytes
> + * @op: size, sign, and endianness of the memory operation
>   * @attrs: memory transaction attributes to use for the access
>   */
>  MemTxResult memory_region_dispatch_write(MemoryRegion *mr,

As I mentioned, now is when the actual interface change to these functions
should occur.


r~

