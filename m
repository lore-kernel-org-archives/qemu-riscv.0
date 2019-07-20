Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hom0M-0001Mm-TB
	for mharc-qemu-riscv@gnu.org; Sat, 20 Jul 2019 05:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hom0K-0001LP-IL
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 05:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hom0J-0000lG-BU
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 05:50:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hom0J-0000j2-3t
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 05:50:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so30802453wme.4
 for <qemu-riscv@nongnu.org>; Sat, 20 Jul 2019 02:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBvvIds/Inv1c8yRvQ7ogbqHxT3QbeRbtueGqhCyP5E=;
 b=KIeQQH2qbDQiJZlnC+Fr9JGX496+sR9RtUSupINJYeonZMShUIa3ecguYvEHm3WzQP
 g+09VEViabkqNGEeMQRywt8Bs4/o/8MNj/35YZbfnQMy/0Ea+ZGLaGku+5o5IsNt6bC9
 zudM2ESEPcFpI1Dwe3btNb5DtCAzyMvyNSaR4b8s5D86MjjoL9/DqaDnlrhG5HeZ2Gon
 2r7K3ILlOg8SGYY0dM+ux6cJkKmLqMX1NoQ4wGL2epyOeSCCojZXPfG5EHnxmUX/NxTN
 mbO85bCmIcLYwyrYYSMZ8MHnMe2pt64eOBMTp38Xr14q1eGPOs/1QwIedEJIfOyo7wHv
 Lycw==
X-Gm-Message-State: APjAAAXZdVKLhsoXbULwbaOkrsEbUw0UbMRwmpNrgIu9WmWIZRxURbrL
 jO5JFWCCuxb1LOFPKgOwp5+wWg==
X-Google-Smtp-Source: APXvYqzMOQvveAK9wTAklGUsxeXLKzTVp8p1UpdEokqR9f8a6LHe6vbd4OLFED1Jb8LZUYmdCbhYSg==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr54335691wme.177.1563616209999; 
 Sat, 20 Jul 2019 02:50:09 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id o26sm56631152wro.53.2019.07.20.02.50.08
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2019 02:50:09 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, palmer@sifive.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <1563603512-5914-1-git-send-email-frederic.konrad@adacore.com>
 <70060fbc-b79f-6385-2b1e-0cebb45ca03e@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1f427dc9-deb9-f900-470a-84b79ab32a2a@redhat.com>
Date: Sat, 20 Jul 2019 11:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <70060fbc-b79f-6385-2b1e-0cebb45ca03e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
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
X-List-Received-Date: Sat, 20 Jul 2019 09:50:13 -0000

Cc'ing Stefan

On 7/20/19 11:44 AM, Philippe Mathieu-Daudé wrote:
> Hi Frederic,
> 
> On 7/20/19 8:18 AM, KONRAD Frederic wrote:
>> There are some debug trace appearing when using GDB with the HTIF mapped @0:
>>  Invalid htif read: address 0000000000000002
>>  Invalid htif read: address 0000000000000006
>>  Invalid htif read: address 000000000000000a
>>  Invalid htif read: address 000000000000000e
>>
>> So don't show them unconditionally.
>>
>> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
>> ---
>>  hw/riscv/riscv_htif.c | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
>> index 4f7b11d..6a8f0c2 100644
>> --- a/hw/riscv/riscv_htif.c
>> +++ b/hw/riscv/riscv_htif.c
>> @@ -119,7 +119,8 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>>      int resp = 0;
>>  
>>      HTIF_DEBUG("mtohost write: device: %d cmd: %d what: %02" PRIx64
>> -        " -payload: %016" PRIx64 "\n", device, cmd, payload & 0xFF, payload);
>> +               " -payload: %016" PRIx64 "\n", device, cmd, payload & 0xFF,
>> +               payload);
>>  
>>      /*
>>       * Currently, there is a fixed mapping of devices:
>> @@ -137,7 +138,7 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>>                  qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported\n");
>>              }
>>          } else {
>> -            qemu_log("HTIF device %d: unknown command\n", device);
>> +            HTIF_DEBUG("HTIF device %d: unknown command\n", device);
> 
> Generally, please don't go back to using DPRINTF() but use trace-events
> instead.

Oh, now I see that HTIF_DEBUG() is just an obscure way to report
crippled log trace-events, not portable to all trace backends.

It is only used in 2 files:

- hw/riscv/riscv_htif.c
- target/riscv/pmp.c as PMP_DEBUG()

I'd rather remove these macros and use trace-events the same way the
rest of the codebase use them, usable by all backends.

> However in this calls it seems using qemu_log_mask(LOG_UNIMP) or
> qemu_log_mask(LOG_GUEST_ERROR) is appropriate.
> 
>>          }
>>      } else if (likely(device == 0x1)) {
>>          /* HTIF Console */
>> @@ -150,12 +151,13 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>>              qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
>>              resp = 0x100 | (uint8_t)payload;
>>          } else {
>> -            qemu_log("HTIF device %d: unknown command\n", device);
>> +            HTIF_DEBUG("HTIF device %d: unknown command\n", device);
>>          }
>>      } else {
>> -        qemu_log("HTIF unknown device or command\n");
>> +        HTIF_DEBUG("HTIF unknown device or command\n");
>>          HTIF_DEBUG("device: %d cmd: %d what: %02" PRIx64
>> -            " payload: %016" PRIx64, device, cmd, payload & 0xFF, payload);
>> +                   " payload: %016" PRIx64, device, cmd, payload & 0xFF,
>> +                   payload);
>>      }
>>      /*
>>       * - latest bbl does not set fromhost to 0 if there is a value in tohost
>> @@ -180,6 +182,7 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>>  static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>>  {
>>      HTIFState *htifstate = opaque;
>> +
>>      if (addr == TOHOST_OFFSET1) {
>>          return htifstate->env->mtohost & 0xFFFFFFFF;
>>      } else if (addr == TOHOST_OFFSET2) {
>> @@ -189,8 +192,8 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>>      } else if (addr == FROMHOST_OFFSET2) {
>>          return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
>>      } else {
>> -        qemu_log("Invalid htif read: address %016" PRIx64 "\n",
>> -            (uint64_t)addr);
>> +        HTIF_DEBUG("Invalid htif read: address %016" PRIx64 "\n",
>> +                   (uint64_t)addr);
>>          return 0;
>>      }
>>  }
>> @@ -219,8 +222,8 @@ static void htif_mm_write(void *opaque, hwaddr addr,
>>          htifstate->env->mfromhost |= value << 32;
>>          htifstate->fromhost_inprogress = 0;
>>      } else {
>> -        qemu_log("Invalid htif write: address %016" PRIx64 "\n",
>> -            (uint64_t)addr);
>> +        HTIF_DEBUG("Invalid htif write: address %016" PRIx64 "\n",
>> +                   (uint64_t)addr);
>>      }
>>  }
>>  
>>

