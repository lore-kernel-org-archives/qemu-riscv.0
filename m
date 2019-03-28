Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Ljs-0006kR-1r
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 23:30:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9Ljq-0006PN-7n
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9Ldb-0006QG-2I
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:23:32 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h9Lda-0006Q6-Rg
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:23:31 -0400
Received: by mail-pf1-x443.google.com with SMTP id p10so10686039pff.3
	for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2019 20:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=h1wasROn9gxBEMeLc5EMxCS8rNscY6t4DVIXvEJv9uI=;
	b=MCzXzu/fbjT9JeHVvnyl0mvoIeNQc2oUu7I7NmArXTnExHsiJ9a7pk7afjFjZqrT5k
	bVgYsqqR5dulLb7IzKAGFZ7hrdy63QaJdUVXu1m4wmTmO9TsPPUVEfRspvWS4jaNHpcR
	RLlk68RW3Z5dtBBGwrkwpYe/XG0uNC59G/XzvFOXnSwRgsbrguVVVAS4ptOckKaEMPIU
	vYWM24xesfFuINrxfhh9HlbRwkRMZkyuLkeIIbkIKpx2vDVF7/C+sp/5s2op/HV6l8yb
	18WiO1V1sekeTZcgrxSPepwTYfGWXRIhOE3Hjzy9apRm6fVP04IVKkyrbQ+gNYdfBTfT
	MnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=h1wasROn9gxBEMeLc5EMxCS8rNscY6t4DVIXvEJv9uI=;
	b=nLPwdLmDTqldPPnNqFRYa6B1EVeYL4tBMJYplIPLDmgukAyVz4An0SOZmu6Elw0xhB
	yGOkGIhySIR+9l9WqBDuXVtbXdpAi/iYV3v8MGKlDMGnTwaEtSllee0IgPFzlq4bzueB
	GiOkMC5Bz0IavcD3cq8yJSGMdg6X4lbmpAGVa9idNrXyZh/fEULI2QsznO+XUl9Wq3hZ
	Cf8+cPhNJOrlHGUPN4UlylqFtlFQ1rSuk6W90Gb7F1T1ndd9IFUXiSDHdvYiBWIRIcNG
	btGOPNVPuOHJVURr6rGK1NPPpLxMqQXa/I8iwP3Qf3WV4pU6IM1HpM4Krbli2FKQEnGw
	OmgQ==
X-Gm-Message-State: APjAAAUBjWxHMnpIjdKqZBYJE1mjSKh0jhpv3onbTyXTpUSSgKYjEJmN
	JWXWWaC+gJd1dmeSqn2LjKslxg==
X-Google-Smtp-Source: APXvYqxBGSGSGjbvszUbooXw8L8KQxZJN1dGo/EzjLe4G8TfL8/5XufcNpyUidOxIWHTEOeMHkd6Bg==
X-Received: by 2002:a63:5659:: with SMTP id g25mr38128416pgm.436.1553743410018;
	Wed, 27 Mar 2019 20:23:30 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
	[2001:b011:7001:168c:9355:f21f:1416:8b19])
	by smtp.gmail.com with ESMTPSA id
	a3sm16929292pfn.182.2019.03.27.20.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 20:23:29 -0700 (PDT)
Date: Wed, 27 Mar 2019 20:23:29 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2019 20:23:14 PDT (-0700)
In-Reply-To: <CAKmqyKOwK0gBUv3cn7RYAgbwhhUbfc1OBmmyNXnqwwWJj0HKxA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-4124294e-6cf2-47a2-b0df-35e223045553@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v2 2/2] riscv: plic: Log guest
 errors
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2019 03:29:59 -0000

On Wed, 27 Mar 2019 11:52:53 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Mar 27, 2019 at 11:51 AM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
>>
>> Instead of using error_report() to print guest errors let's use
>> qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> I dropped Philippe's review in this series.
> This should be included from v1:
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I got it.

>
> Alistair
>
>> ---
>>  hw/riscv/sifive_plic.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
>> index 70a85cd075..7f373d6c9d 100644
>> --- a/hw/riscv/sifive_plic.c
>> +++ b/hw/riscv/sifive_plic.c
>> @@ -262,7 +262,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>>      }
>>
>>  err:
>> -    error_report("plic: invalid register read: %08x", (uint32_t)addr);
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
>> +                  __func__, addr);
>>      return 0;
>>  }
>>
>> @@ -289,7 +291,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>>      } else if (addr >= plic->pending_base && /* 1 bit per source */
>>                 addr < plic->pending_base + (plic->num_sources >> 3))
>>      {
>> -        error_report("plic: invalid pending write: %08x", (uint32_t)addr);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: invalid pending write: 0x%" HWADDR_PRIx "",
>> +                      __func__, addr);
>>          return;
>>      } else if (addr >= plic->enable_base && /* 1 bit per source */
>>          addr < plic->enable_base + plic->num_addrs * plic->enable_stride)
>> @@ -339,7 +343,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>>      }
>>
>>  err:
>> -    error_report("plic: invalid register write: %08x", (uint32_t)addr);
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
>> +                  __func__, addr);
>>  }
>>
>>  static const MemoryRegionOps sifive_plic_ops = {
>> --
>> 2.21.0
>>

