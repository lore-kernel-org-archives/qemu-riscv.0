Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqwho-0007rL-GM
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 05:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqwhj-0007kE-Sf
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 05:40:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqwhe-000485-RR
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 05:39:57 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqwhe-0003w0-Ka
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 05:39:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so47145559wmj.5
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fSfrGrRhjJEug1iM2o0JkpzkU95zBrleqMeDoDm1YlU=;
 b=HgPD7yrMoMwfOArwSCBJZt8y2Mvx7B5F6mNEQoiYipB5rBPBE8IVWw9DJZfErFoNjU
 t++6Wbl8ewHhRsgiHIsP8R634jS3uC1Bc0v1rS1MK2bKgkUMVajrZA51VQhvkdohtluE
 feqSHAkO1WutnElY/ZlYt9ghCFTgKG+oVBubx9j6z5VxIRUuaCotoc6SB95oT4QyK9Vk
 IA6m96uLj1Bu4Or9pNWvrCKCOe6/fANQEAUc14kSV52CZjliqR8bh+QjtHkEr3v4gPSU
 qONjgJsgKKHVvonjs0fkwqp23ojJU08b4q/gzaOf9puvWqdXWAzJxZaIhJazoyO1OOQO
 zgUQ==
X-Gm-Message-State: APjAAAVPhduF+ed9AwtkbqJ/jOXoDlA4SsYnCFWWsTVl/r0Kczf4EVNl
 fyP0W5ciw9DIvjBXhRuZxR5jDQ==
X-Google-Smtp-Source: APXvYqzlV/1DKFivxacazGTydJt0YU/GPPbguaon/bVKYgHKpFk955pWjIYP5RnuPKMYMUaSrzjLgg==
X-Received: by 2002:a1c:228b:: with SMTP id
 i133mr84279148wmi.140.1564133991298; 
 Fri, 26 Jul 2019 02:39:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cc23:f353:392:d2ee?
 ([2001:b07:6468:f312:cc23:f353:392:d2ee])
 by smtp.gmail.com with ESMTPSA id b5sm43505459wru.69.2019.07.26.02.39.49
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 02:39:50 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com,
 sagark@eecs.berkeley.edu, david@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 edgar.iglesias@gmail.com, arikalo@wavecomp.com, mst@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2159ad69-4c4c-24dc-6759-039e39f952d3@redhat.com>
Date: Fri, 26 Jul 2019 11:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123667210.66446@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
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
X-List-Received-Date: Fri, 26 Jul 2019 09:40:04 -0000

On 26/07/19 08:47, tony.nguyen@bt.com wrote:
> +static bool memory_region_endianness_inverted(MemoryRegion *mr)
>  {
>  #ifdef TARGET_WORDS_BIGENDIAN
>      return mr->ops->endianness == DEVICE_LITTLE_ENDIAN;
> @@ -361,23 +361,27 @@ static bool
> memory_region_wrong_endianness(MemoryRegion *mr)
>  #endif
>  }
>  
> -static void adjust_endianness(MemoryRegion *mr, uint64_t *data,
> unsigned size)
> +static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
>  {
> -    if (memory_region_wrong_endianness(mr)) {
> -        switch (size) {
> -        case 1:
> +    if (memory_region_endianness_inverted(mr)) {
> +        op ^= MO_BSWAP;
> +    }

Here it should not matter: the caller of memory_region_dispatch_read
should includes one of MO_TE/MO_LE/MO_BE in the op (or nothing for host
endianness).  Then memory_region_endianness_inverted can be:

  if (mr->ops->endianness == DEVICE_NATIVE_ENDIAN)
    return (op & MO_BSWAP) != MO_TE;
  else if (mr->ops->endianness == DEVICE_BIG_ENDIAN)
    return (op & MO_BSWAP) != MO_BE;
  else if (mr->ops->endianness == DEVICE_LITTLE_ENDIAN)
    return (op & MO_BSWAP) != MO_LE;

and adjust_endianness does

  if (memory_region_endianness_inverted(mr, op)) {
    switch (op & MO_SIZE) {
      ...
    }
  }

I think the changes should be split in two parts.  Before this patch,
you modify all callers of memory_region_dispatch_* so that they already
pass the right endianness op; however, you leave the existing swap in
place.  So for example in load_helper you'd have in a previous patch

+        /* FIXME: io_readx ignores MO_BSWAP.  */
+        op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);
         res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type,
SIZE_MEMOP(size));
+                       mmu_idx, addr, retaddr, access_type, op);
         return handle_bswap(res, size, big_endian);

Then, in this patch, you remove the handle_bswap call as well as the
FIXME comment.

Paolo

