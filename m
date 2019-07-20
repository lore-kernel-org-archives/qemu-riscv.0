Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1holv6-0008F1-6X
	for mharc-qemu-riscv@gnu.org; Sat, 20 Jul 2019 05:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1holv3-0008Ah-UB
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 05:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1holv2-0006Lw-5Z
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 05:44:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1holv1-0006LL-Ub
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 05:44:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so31296488wrm.8
 for <qemu-riscv@nongnu.org>; Sat, 20 Jul 2019 02:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IVBrAajxsmPRPefRGL7k6fm2+6YO4yoYXdpkYNQCtd0=;
 b=gjwl3hwJCzW2oyeW5174c+nd6yUDoWYblhyYh2hFwI87rtOA3scg6s4seY28cQteAd
 KftIDznGafUh5eyrWXD/3Sb13y5cCDXbyi/u2gGJqH/6k3kEIF94ivtZvSyOe7H5oSgV
 omLVRixUgKsHj9uz/lP+QLvaNEONb7Ekdy0FiltIwW9u+oOsG9Heb+puQSex5AMMv6wE
 zEXix/7DQvCJ5ZO48RLL7DNtJc8A1LHlqsg0AeD6bMzwIv1DgFuRyF3TYvPoq+DeUyS0
 wTiL4qBQi2jpkPVyibPxQes/+EzFfKBMfX3yGMx5YNozc2pmIEGRcTwiRyyyHlzMLSes
 vFFw==
X-Gm-Message-State: APjAAAXJk5J3hGkodhB7JxRI977gmiLOfZN+y0VFkmOTVTBWXfUGeAcl
 pfN8woAIGT5zquC2yeapIJfElQ==
X-Google-Smtp-Source: APXvYqwuou0VghwuUFAFUqKX2yT7ROj1YRQNUkdWPmyjyTSpIqcVnaCM3c3UHAsmtOvjQV0SeqVxHw==
X-Received: by 2002:a05:6000:145:: with SMTP id
 r5mr32559795wrx.208.1563615882947; 
 Sat, 20 Jul 2019 02:44:42 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id v124sm34112340wmf.23.2019.07.20.02.44.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2019 02:44:42 -0700 (PDT)
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, palmer@sifive.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu
References: <1563603512-5914-1-git-send-email-frederic.konrad@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <70060fbc-b79f-6385-2b1e-0cebb45ca03e@redhat.com>
Date: Sat, 20 Jul 2019 11:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1563603512-5914-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: htif: use
 qemu_log_mask instead of qemu_log
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
X-List-Received-Date: Sat, 20 Jul 2019 09:44:47 -0000

Hi Frederic,

On 7/20/19 8:18 AM, KONRAD Frederic wrote:
> There are some debug trace appearing when using GDB with the HTIF mapped @0:
>  Invalid htif read: address 0000000000000002
>  Invalid htif read: address 0000000000000006
>  Invalid htif read: address 000000000000000a
>  Invalid htif read: address 000000000000000e
> 
> So don't show them unconditionally.
> 
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>  hw/riscv/riscv_htif.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
> index 4f7b11d..6a8f0c2 100644
> --- a/hw/riscv/riscv_htif.c
> +++ b/hw/riscv/riscv_htif.c
> @@ -119,7 +119,8 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>      int resp = 0;
>  
>      HTIF_DEBUG("mtohost write: device: %d cmd: %d what: %02" PRIx64
> -        " -payload: %016" PRIx64 "\n", device, cmd, payload & 0xFF, payload);
> +               " -payload: %016" PRIx64 "\n", device, cmd, payload & 0xFF,
> +               payload);
>  
>      /*
>       * Currently, there is a fixed mapping of devices:
> @@ -137,7 +138,7 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>                  qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported\n");
>              }
>          } else {
> -            qemu_log("HTIF device %d: unknown command\n", device);
> +            HTIF_DEBUG("HTIF device %d: unknown command\n", device);

Generally, please don't go back to using DPRINTF() but use trace-events
instead.

However in this calls it seems using qemu_log_mask(LOG_UNIMP) or
qemu_log_mask(LOG_GUEST_ERROR) is appropriate.

>          }
>      } else if (likely(device == 0x1)) {
>          /* HTIF Console */
> @@ -150,12 +151,13 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>              qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
>              resp = 0x100 | (uint8_t)payload;
>          } else {
> -            qemu_log("HTIF device %d: unknown command\n", device);
> +            HTIF_DEBUG("HTIF device %d: unknown command\n", device);
>          }
>      } else {
> -        qemu_log("HTIF unknown device or command\n");
> +        HTIF_DEBUG("HTIF unknown device or command\n");
>          HTIF_DEBUG("device: %d cmd: %d what: %02" PRIx64
> -            " payload: %016" PRIx64, device, cmd, payload & 0xFF, payload);
> +                   " payload: %016" PRIx64, device, cmd, payload & 0xFF,
> +                   payload);
>      }
>      /*
>       * - latest bbl does not set fromhost to 0 if there is a value in tohost
> @@ -180,6 +182,7 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>  static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      HTIFState *htifstate = opaque;
> +
>      if (addr == TOHOST_OFFSET1) {
>          return htifstate->env->mtohost & 0xFFFFFFFF;
>      } else if (addr == TOHOST_OFFSET2) {
> @@ -189,8 +192,8 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>      } else if (addr == FROMHOST_OFFSET2) {
>          return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
>      } else {
> -        qemu_log("Invalid htif read: address %016" PRIx64 "\n",
> -            (uint64_t)addr);
> +        HTIF_DEBUG("Invalid htif read: address %016" PRIx64 "\n",
> +                   (uint64_t)addr);
>          return 0;
>      }
>  }
> @@ -219,8 +222,8 @@ static void htif_mm_write(void *opaque, hwaddr addr,
>          htifstate->env->mfromhost |= value << 32;
>          htifstate->fromhost_inprogress = 0;
>      } else {
> -        qemu_log("Invalid htif write: address %016" PRIx64 "\n",
> -            (uint64_t)addr);
> +        HTIF_DEBUG("Invalid htif write: address %016" PRIx64 "\n",
> +                   (uint64_t)addr);
>      }
>  }
>  
> 

