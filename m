Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqbyL-0003aS-5i
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 07:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqbyI-0003TG-Af
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqbyG-0007Aa-Ci
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:31:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33673)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqbyG-00079z-4e
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:31:40 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so50479972wru.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2019 04:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AizYLJUC8/bpkMUR9iyeBUQqrzd2m7arfwncBFdb8dA=;
 b=NVhIWHLTIgk5h4hjFTsIpHyrlrU8/Bs9Iu7+t19jYjs2merlhHjim0NejcTKJ4GVv6
 /N/oKRZ6WjSMy7YRsSQTdvxlD8rCa7ewgmbzRFb6MfgKOa1w2+nytWbJFfVNSgZN6lIb
 EqTqltRb2AwsCSeCtY8T9ZI9NEX/Bh+QfkGjl3uSkqidnlITIbClF7rSZJNkQIyRC9uM
 mP/qm9FjpyjCHQD3jOLPc5Xj4lVgOVk5qB8k8Ak6MTqOr6RBPleTUkjx4/AweGHqiV8X
 gb46FrLAB/cB/EjgrHQcqZjIQsHt3sCBpuvHyznZPvY6KVLzuuwLH2Az5Js2wxM16toJ
 RleQ==
X-Gm-Message-State: APjAAAWzgS4ImO5iH3MNnw6HBtVAIaU5feU0dd9f9Xu35G+y1FjLSO3s
 IlsiuZi6R9pl5e3S5S6QHEOVAQ==
X-Google-Smtp-Source: APXvYqyKBuIHpi3kiAkxqfxMC0+wofSgFhIo0P4HhH21p2zHSnoNYspQ/94R02rVjbd6euOADQFqtw==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr18155849wrj.232.1564054299238; 
 Thu, 25 Jul 2019 04:31:39 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id g19sm89988811wrb.52.2019.07.25.04.31.37
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:31:38 -0700 (PDT)
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
 <1564048432710.98755@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0ca427aa-5a18-785a-0152-bc9948c3970b@redhat.com>
Date: Thu, 25 Jul 2019 13:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048432710.98755@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 05/15] hw/intc/armv7m_nic:
 Access MemoryRegion with MemOp
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
X-List-Received-Date: Thu, 25 Jul 2019 11:31:43 -0000

On 7/25/19 11:53 AM, tony.nguyen@bt.com wrote:
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/intc/armv7m_nvic.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 9f8f0d3..25bb88a 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -18,6 +18,7 @@
>  #include "hw/intc/armv7m_nvic.h"
>  #include "target/arm/cpu.h"
>  #include "exec/exec-all.h"
> +#include "exec/memop.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "trace.h"
> @@ -2345,7 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return memory_region_dispatch_write(mr, addr, value, size, attrs);
> +        return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(size),
> +                                            attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2364,7 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return memory_region_dispatch_read(mr, addr, data, size, attrs);
> +        return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size),
> +                                           attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2390,7 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
> 
>      /* Direct the access to the correct systick */
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_write(mr, addr, value, size, attrs);
> +    return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(size),
> +                                        attrs);
>  }
> 
>  static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> @@ -2402,7 +2406,7 @@ static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> 
>      /* Direct the access to the correct systick */
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_read(mr, addr, data, size, attrs);
> +    return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size), attrs);
>  }
> 
>  static const MemoryRegionOps nvic_systick_ops = {
> --
> 1.8.3.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

