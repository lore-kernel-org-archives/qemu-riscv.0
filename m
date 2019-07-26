Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr1TE-00054V-5a
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1TA-0004qu-Hr
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1T9-0000Zw-6U
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:45:16 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1T8-0000Xi-QQ
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:45:15 -0400
Received: by mail-pl1-x643.google.com with SMTP id az7so24836272plb.5
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=09dyhl6G3S8lsTRL7xnnyHEtd3ZZs9GS0a/kT0/mLtU=;
 b=QleSDlFDDiYzT+oyVC55dvfV+ZtmPEGOVZ7D3MljjMdjR32IVE/zEdl9NPw0mDwDwd
 6XSJQobRZDeTqjaNpXqwEPoY8yKvmb3vZ1tKYNEmhxfWPfbhVr42lBLKzF3/eMoBB/L8
 lzR5ZgfYRGNKemIYzaSeLcLHOMhxhVYoKcmpUdzJnVJdiRyF8Es5+mV3yfQXO1np/l0c
 93Hqn3rvpMXgH10Gk0QrPrwb3dVIAdn7nND6FIhNC6oxSw7TK0hk37y16pCjtF6nUUdt
 s/sZauVim1mqwXaKxGkQZnRJ0eGOYZExFeT6p8j15j4fPlJ+8WzUB+8DoMc2y+k/E59T
 MrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=09dyhl6G3S8lsTRL7xnnyHEtd3ZZs9GS0a/kT0/mLtU=;
 b=QuzxXkQQO91gvh8MuZzVZjv7LvdfXdkM2DfVLHtskTfoxfS/DaAaPEOs4n0sAuyHPp
 D5axaZYULmED3DIROnxjhlAD3z5kbdx2SAhM57gBvlQUGPePqwJ7NeaI53E/BCFBf1I0
 SmG0P6dYVDgf2ho6OdXul5KsO/Bcssn9wDBG/U7JfQB8JZIcUWga5u1GjxswJD3MHHac
 3MfQqaQ95EEnwvFBBCNVXT6PgKft1SmPTqu5ySdXrwp97X8ebzXZ+Fu7jX98nJzL1IT1
 R++O3/6ESxPGTA208YPBcP+iXXRzt0vwYTtzXFtnFsdnrkNaRkNTcKFCp3MJaCbSKLeh
 lMNA==
X-Gm-Message-State: APjAAAWa27jVoixWZ7dSmIJnpW/lKKj4eOxVdeLuVF5Ds8sSGUGBm/7y
 AfpBvUC5ijjmti4etd5FRROpjg==
X-Google-Smtp-Source: APXvYqzcZ+tk3moJfUmceuVRb3y5u7IOWS4gwoY1zJ/fy05qZbf074AXJ7u7DIztQZwta2ZoA1eQ4g==
X-Received: by 2002:a17:902:8c98:: with SMTP id
 t24mr99056689plo.320.1564152313581; 
 Fri, 26 Jul 2019 07:45:13 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id f8sm11113172pgd.58.2019.07.26.07.45.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:45:12 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
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
 aurelien@aurel32.net
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
 <2159ad69-4c4c-24dc-6759-039e39f952d3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5b7df6eb-2ccc-f921-3a94-00d0f55b6d4d@linaro.org>
Date: Fri, 26 Jul 2019 07:45:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2159ad69-4c4c-24dc-6759-039e39f952d3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 11/15] memory: Single byte
 swap along the I/O path
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
X-List-Received-Date: Fri, 26 Jul 2019 14:45:19 -0000

On 7/26/19 2:39 AM, Paolo Bonzini wrote:
> Then memory_region_endianness_inverted can be:
> 
>   if (mr->ops->endianness == DEVICE_NATIVE_ENDIAN)
>     return (op & MO_BSWAP) != MO_TE;
>   else if (mr->ops->endianness == DEVICE_BIG_ENDIAN)
>     return (op & MO_BSWAP) != MO_BE;
>   else if (mr->ops->endianness == DEVICE_LITTLE_ENDIAN)
>     return (op & MO_BSWAP) != MO_LE;

Possibly outside the scope of this patch set, I'd like to replace enum
device_endian with MemOp, with exactly the above enumerator replacement.

In the meantime, perhaps a conversion function

static MemOp devendian_memop(enum device_endian d)
{
    switch (d) {
    case DEVICE_NATIVE_ENDIAN:
        return MO_TE;
    case DEVICE_BIG_ENDIAN:
        return MO_BE;
    case DEVICE_LITTLE_ENDIAN:
        return MO_LE;
    default:
        g_assert_not_reached();
    }
}

With that, this would simplify to

    return (op & MO_BSWAP) != devendian_memop(mr->ops->endianness);


> I think the changes should be split in two parts.  Before this patch,
> you modify all callers of memory_region_dispatch_* so that they already
> pass the right endianness op; however, you leave the existing swap in
> place.  So for example in load_helper you'd have in a previous patch
> 
> +        /* FIXME: io_readx ignores MO_BSWAP.  */
> +        op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);
>          res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type,
> SIZE_MEMOP(size));
> +                       mmu_idx, addr, retaddr, access_type, op);
>          return handle_bswap(res, size, big_endian);
> 
> Then, in this patch, you remove the handle_bswap call as well as the
> FIXME comment.

Agreed.


r~

