Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqbz0-0004lR-AC
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 07:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50075)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqbyx-0004cw-5Z
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:32:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqbyv-0007iw-R6
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:32:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36040)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqbyv-0007iA-KH
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:32:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so50462045wrs.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2019 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Pv32FVpU5zV0ZEDRiftCp/cKWy6ZBt/RMwUu782exw=;
 b=LT6Y+/VuDncvAZdoG1RRI1VXYFch8vkUNdRpPEixMhIM4S8V4+HvWXv+YFFSm4ddjw
 CChwC8x3le3xQ3FsFkp0zfQMxSdAcRxQLZg9EZNcwCRXbN+pRIP8en2DuHpVpMsJlxBQ
 bfGt3YiGARgac/fuglbdqEt8ajlbUM+/nqK4cFS/vR+IvZcE1kJ8/yGX1yDjQZh+8ZH5
 2oDktNehx95eUH+gSTqsmF652IbPulaohBBXO0LmD/rEIIHLGAZyIK9hgocVGlWUrwyY
 WhbYf6JI2Wh3zpkswp8Z9kvM51boI9U9or5xvBD37AmatGwucZ9X31DYXvB6fI4iTiaw
 WGnA==
X-Gm-Message-State: APjAAAUp8PNnRNbGktNlvxtmtrcCngzGEu7rsJLSq2rJb3nRkFogiTbX
 2TmHsZexi8FN2PzravpY9ZohNg==
X-Google-Smtp-Source: APXvYqze6CP51ZgyCHFw2fG+vqun5rCwL8wRppYwNVomGzbn2Rc3y8yIeg5TYC5GTEYfHXR9d9fuyQ==
X-Received: by 2002:a05:6000:145:: with SMTP id
 r5mr14988733wrx.208.1564054340693; 
 Thu, 25 Jul 2019 04:32:20 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id c4sm39050957wrt.86.2019.07.25.04.32.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:32:20 -0700 (PDT)
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
 <1564048510876.64711@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <35669616-b61d-a76a-86d7-fbc3beb5050c@redhat.com>
Date: Thu, 25 Jul 2019 13:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048510876.64711@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 08/15] exec: Access
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
X-List-Received-Date: Thu, 25 Jul 2019 11:32:24 -0000

On 7/25/19 11:55 AM, tony.nguyen@bt.com wrote:
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  exec.c            |  6 ++++--
>  memory_ldst.inc.c | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 3e78de3..5013864 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3334,7 +3334,8 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>              /* XXX: could force current_cpu to NULL to avoid
>                 potential bugs */
>              val = ldn_p(buf, l);
> -            result |= memory_region_dispatch_write(mr, addr1, val, l, attrs);
> +            result |= memory_region_dispatch_write(mr, addr1, val,
> +                                                   SIZE_MEMOP(l), attrs);
>          } else {
>              /* RAM case */
>              ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
> @@ -3395,7 +3396,8 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>              /* I/O case */
>              release_lock |= prepare_mmio_access(mr);
>              l = memory_access_size(mr, l, addr1);
> -            result |= memory_region_dispatch_read(mr, addr1, &val, l, attrs);
> +            result |= memory_region_dispatch_read(mr, addr1, &val,
> +                                                  SIZE_MEMOP(l), attrs);
>              stn_p(buf, l, val);
>          } else {
>              /* RAM case */
> diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
> index acf865b..e073cf9 100644
> --- a/memory_ldst.inc.c
> +++ b/memory_ldst.inc.c
> @@ -38,7 +38,7 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(4), attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == DEVICE_LITTLE_ENDIAN) {
>              val = bswap32(val);
> @@ -114,7 +114,7 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(8), attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == DEVICE_LITTLE_ENDIAN) {
>              val = bswap64(val);
> @@ -188,7 +188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(1), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -224,7 +224,7 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(2), attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == DEVICE_LITTLE_ENDIAN) {
>              val = bswap16(val);
> @@ -300,7 +300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
>      if (l < 4 || !memory_access_is_direct(mr, true)) {
>          release_lock |= prepare_mmio_access(mr);
> 
> -        r = memory_region_dispatch_write(mr, addr1, val, 4, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), attrs);
>      } else {
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
>          stl_p(ptr, val);
> @@ -346,7 +346,7 @@ static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
>              val = bswap32(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, 4, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -408,7 +408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
>      mr = TRANSLATE(addr, &addr1, &l, true, attrs);
>      if (!memory_access_is_direct(mr, true)) {
>          release_lock |= prepare_mmio_access(mr);
> -        r = memory_region_dispatch_write(mr, addr1, val, 1, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(1), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -451,7 +451,7 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
>              val = bswap16(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, 2, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(2), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -524,7 +524,7 @@ static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
>              val = bswap64(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, 8, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(8), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> --
> 1.8.3.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

