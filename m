Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqcIE-0007j5-S9
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 07:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55115)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqcIB-0007fT-Ho
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqcI9-0003R8-Rr
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:52:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33142)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqcI9-0003QR-IS
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:52:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so50546608wru.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2019 04:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TYb+D3MfNU/o6PwwWSLz4bH+LBJ9olL56DTJDlFeh+w=;
 b=ou2Ru7jvbQo35oOP+FE4WNfoh/UmJr37E+8TIcgxIIrmSknCOHyBgklCno7jrUMYXI
 D4cF+2Uh5h5lj4zo+bfJnNmMDvaZouKTk/NPX5wkXioMasBMzBxOfYhKbu42NzcIpo/U
 pQ1nOTJms6GzAbNkLkTMh77TaGEU8PYm2nReie3U5W6kvzOGnMdjv8qmDR2N7dHQA0JG
 2yW73u1PQ6ovHmGSGDNQlxe+1bYHo2qJypoUiLnhBy8EDT7DG6bF5a+QHFSDuOTizqlc
 D6XxU/SO0bq+untkAxAJg/d60p92iiSpyUd02S3lIuEc6WUQ/9mnOjOevipTZsh/kmNt
 gA+g==
X-Gm-Message-State: APjAAAXaIxD+UfTdprVY7DskTs4i5gbqNwDvsg+h1lZmGLwA8hxw732Q
 Gb2uhzpuVU7TY7En63xc8CRSsg==
X-Google-Smtp-Source: APXvYqw+yqNtcxz07LbIHEBlTBjFadgHiLrIFkC33Ik7ROpTgvu+qzg0+jaVwRiPe6BQggbIn40m7g==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr6797660wrt.253.1564055532637; 
 Thu, 25 Jul 2019 04:52:12 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id j10sm83960221wrd.26.2019.07.25.04.52.08
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:52:12 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com,
 sagark@eecs.berkeley.edu, david@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, Alistair.Francis@wdc.com,
 edgar.iglesias@gmail.com, arikalo@wavecomp.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, shorne@gmail.com, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, kbastian@mail.uni-paderborn.de, cohuck@redhat.com,
 alex.williamson@redhat.com, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048584882.52438@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2f25f546-03c3-620a-61c0-73d146a19b82@redhat.com>
Date: Thu, 25 Jul 2019 13:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048584882.52438@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 11/15] memory: Single byte
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
X-List-Received-Date: Thu, 25 Jul 2019 11:52:17 -0000

On 7/25/19 11:56 AM, tony.nguyen@bt.com wrote:
> Now that MemOp has been pushed down into the memory API, we can
> collapse the two byte swaps adjust_endianness and handle_bswap into
> the former.

Nice cleanup :)

> 
> Collapsing byte swaps along the I/O path enables additional endian
> inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant
> byte swaps cancelling out.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 58 +++++++++++++++++++++++++-----------------------------
>  memory.c           | 30 ++++++++++++++++------------
>  2 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index a4a0bf7..e61b1eb 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
> 
>  static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                           int mmu_idx, target_ulong addr, uintptr_t retaddr,
> -                         MMUAccessType access_type, int size)
> +                         MMUAccessType access_type, MemOp op)
>  {
>      CPUState *cpu = env_cpu(env);
>      hwaddr mr_offset;
> @@ -906,14 +906,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size),
> -                                    iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
>              section->offset_within_region;
> 
> -        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access_type,
>                                 mmu_idx, iotlbentry->attrs, r, retaddr);

Please move this change in "cputlb: Access MemoryRegion with MemOp"
(patch #9 of this series).

>      }
>      if (locked) {
> @@ -925,7 +924,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
> 
>  static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                        int mmu_idx, uint64_t val, target_ulong addr,
> -                      uintptr_t retaddr, int size)
> +                      uintptr_t retaddr, MemOp op)
>  {
>      CPUState *cpu = env_cpu(env);
>      hwaddr mr_offset;
> @@ -947,15 +946,15 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size),
> -                                    iotlbentry->attrs);
> +    r = memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
>              section->offset_within_region;
> 
> -        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
> -                               mmu_idx, iotlbentry->attrs, r, retaddr);
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op),
> +                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs, r,
> +                               retaddr);

Ditto.

>      }
>      if (locked) {
>          qemu_mutex_unlock_iothread();
> @@ -1210,26 +1209,13 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>  #endif
> 
>  /*
> - * Byte Swap Helper
> + * Byte Swap Checker
>   *
> - * This should all dead code away depending on the build host and
> - * access type.
> + * Dead code should all go away depending on the build host and access type.
>   */
> -
> -static inline uint64_t handle_bswap(uint64_t val, int size, bool big_endian)
> +static inline bool need_bswap(bool big_endian)
>  {
> -    if ((big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP)) {
> -        switch (size) {
> -        case 1: return val;
> -        case 2: return bswap16(val);
> -        case 4: return bswap32(val);
> -        case 8: return bswap64(val);
> -        default:
> -            g_assert_not_reached();
> -        }
> -    } else {
> -        return val;
> -    }
> +    return (big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP);

:)

>  }
> 
>  /*
> @@ -1260,6 +1246,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>      unsigned a_bits = get_alignment_bits(get_memop(oi));
>      void *haddr;
>      uint64_t res;
> +    MemOp op;
> 
>      /* Handle CPU specific unaligned behaviour */
>      if (addr & ((1 << a_bits) - 1)) {
> @@ -1305,9 +1292,13 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>              }
>          }
> 
> -        res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type, size);
> -        return handle_bswap(res, size, big_endian);
> +        op = SIZE_MEMOP(size);
> +        if (need_bswap(big_endian)) {
> +            op ^= MO_BSWAP;
> +        }
> +
> +        return io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> +                       mmu_idx, addr, retaddr, access_type, op);
>      }
> 
>      /* Handle slow unaligned access (it spans two pages or IO).  */
> @@ -1508,6 +1499,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>      const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
>      unsigned a_bits = get_alignment_bits(get_memop(oi));
>      void *haddr;
> +    MemOp op;
> 
>      /* Handle CPU specific unaligned behaviour */
>      if (addr & ((1 << a_bits) - 1)) {
> @@ -1553,9 +1545,13 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>              }
>          }
> 
> +        op = SIZE_MEMOP(size);
> +        if (need_bswap(big_endian)) {
> +            op ^= MO_BSWAP;
> +        }
> +
>          io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
> -                  handle_bswap(val, size, big_endian),
> -                  addr, retaddr, size);
> +                  val, addr, retaddr, op);
>          return;
>      }
> 
> diff --git a/memory.c b/memory.c
> index 6982e19..0277d3d 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -352,7 +352,7 @@ static bool memory_region_big_endian(MemoryRegion *mr)
>  #endif
>  }
> 
> -static bool memory_region_wrong_endianness(MemoryRegion *mr)
> +static bool memory_region_endianness_inverted(MemoryRegion *mr)
>  {
>  #ifdef TARGET_WORDS_BIGENDIAN
>      return mr->ops->endianness == DEVICE_LITTLE_ENDIAN;
> @@ -361,23 +361,27 @@ static bool memory_region_wrong_endianness(MemoryRegion *mr)
>  #endif
>  }
> 
> -static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsigned size)
> +static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
>  {
> -    if (memory_region_wrong_endianness(mr)) {
> -        switch (size) {
> -        case 1:
> +    if (memory_region_endianness_inverted(mr)) {
> +        op ^= MO_BSWAP;
> +    }
> +
> +    if (op & MO_BSWAP) {
> +        switch (op & MO_SIZE) {
> +        case MO_8:
>              break;
> -        case 2:
> +        case MO_16:
>              *data = bswap16(*data);
>              break;
> -        case 4:
> +        case MO_32:
>              *data = bswap32(*data);
>              break;
> -        case 8:
> +        case MO_64:
>              *data = bswap64(*data);
>              break;
>          default:
> -            abort();
> +            g_assert_not_reached();
>          }
>      }
>  }
> @@ -1451,7 +1455,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>      }
> 
>      r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
> -    adjust_endianness(mr, pval, size);
> +    adjust_endianness(mr, pval, op);
>      return r;
>  }
> 
> @@ -1494,7 +1498,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>          return MEMTX_DECODE_ERROR;
>      }
> 
> -    adjust_endianness(mr, &data, size);
> +    adjust_endianness(mr, &data, op);
> 
>      if ((!kvm_eventfds_enabled()) &&
>          memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)) {
> @@ -2340,7 +2344,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>      }
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> @@ -2375,7 +2379,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
>      unsigned i;
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> --
> 1.8.3.1
> 

LGTM!

