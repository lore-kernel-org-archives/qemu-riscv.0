Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqc4p-0008AJ-5N
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 07:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqc4m-0007x4-8b
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqc4k-0004HT-4T
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:38:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqc4i-0004DA-A8
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:38:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so490472wrr.9
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2019 04:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmaq7xj5aFDq5kkR9Wh85IkW/nR3gZ0zq9+Xe5JGZRM=;
 b=NLHYCbdhlaqjGt2Vk2fqeZO3a2pYP9THWg5iMjAhsw7P6cKsA3SnjGt0L8bKX8ofZQ
 JkaeSky5sce4vUigXrnRaRjdaWdjs3CS7UeePRXl8qMrfgwl7SKLjpvcAO+7iGRoM2Fh
 NTNcVSltbKzfsTEfvmG5Lv9dwnPl0nrtSRnq+bXKOXVPJ4sFzY9A8JzLfsHYASlJ5vBB
 UQYRcVX8TG7hWDQtHfQO2YrcEKKIQ35TMgomSU6u5gEyBEq7w0TWREACfxXNOhJeyqlJ
 QIVJvzqJYseW9UajKVIPLLvWbbYMwNxyyVVGepoM7VYftJNOuuVhwjMnuKuWZkYMBlc3
 IyvQ==
X-Gm-Message-State: APjAAAVm2IIO+vtwR4IY/yLxad8eQTPQMsUl1BwQ3vYuEDJ/IlmnGmp+
 UHuM9g8Ey00IKoyOQAIUvlAKiQ==
X-Google-Smtp-Source: APXvYqxEuFXXL31zRvrk7QrEMvdWAxy0+D36E5yBSChteKfojcWBSI+j9dCpZqR1cBjDCU0zNiei1Q==
X-Received: by 2002:adf:e446:: with SMTP id t6mr95530933wrm.115.1564054697306; 
 Thu, 25 Jul 2019 04:38:17 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id d10sm59151725wro.18.2019.07.25.04.38.15
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:38:16 -0700 (PDT)
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
 <1564048532722.5565@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c35579f0-2a7d-a2e6-ff18-65c5013e1684@redhat.com>
Date: Thu, 25 Jul 2019 13:38:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048532722.5565@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 09/15] cputlb: Access
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
X-List-Received-Date: Thu, 25 Jul 2019 11:38:25 -0000

On 7/25/19 11:55 AM, tony.nguyen@bt.com wrote:
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 523be4c..a4a0bf7 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -906,8 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_read(mr, mr_offset,
> -                                    &val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size),
> +                                    iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
> @@ -947,8 +947,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_write(mr, mr_offset,
> -                                     val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size),
> +                                    iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
> --
> 1.8.3.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

