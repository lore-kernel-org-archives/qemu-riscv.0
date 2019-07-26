Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqtRN-0007Uc-Sm
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 02:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40599)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqtRL-0007Mc-6G
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 02:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqtRJ-0004tl-Q0
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 02:10:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51220)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqtRH-0004oZ-4x
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 02:10:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so46907361wma.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2019 23:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+CKSmJY/FGQYHMgYVWAkMOHJmJzWL/EmlEhTzHXyM3Q=;
 b=JnABEpU1Dm5NCZggMAtq3t3CfzwZzlRcLxTRqY77GAOPj/pOYaeaZ+JW+JOWkSyGSH
 tZwrUv+iXQXVzJjJTtGd46psBGeZOmUKr/k//EkqWQTbkTyiC0+ZrylOb3Fv4BOmZX+h
 /RFADtML6Bt4iganwZWkSsG32WYu9Y1aHlcsdFdnM6TJ5f3rZ9P5g2cOvpNlXkOqMx9C
 mn9PC/naJXEvBkEPPKPTA7FzK3hPF50bQJ0WA8pcR2eDr56b/IlCoArNCd6CqAe91lho
 7MEryw1NVdHIam2ala+4s1+jB9LSZIIDyYT5OFhh04P4m0APtAjpEVo0ftABo6tSom5U
 5Vjw==
X-Gm-Message-State: APjAAAXZl6EDEFLGrxVVZCyndkqMmrZrGYj5zAqZ9tbCmV7ekeWE1ood
 hF3bGFEls1+md4kwpdT5U35Prg==
X-Google-Smtp-Source: APXvYqxJMwICgwUyS/ulsPRRZbVOKZPXuCCTLNHKyWkVZhE5Re2jX1aTbLSktZegaAnZHgaOVRLe9Q==
X-Received: by 2002:a7b:c84c:: with SMTP id c12mr80806507wml.70.1564121442118; 
 Thu, 25 Jul 2019 23:10:42 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id z25sm55374341wmf.38.2019.07.25.23.10.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 23:10:41 -0700 (PDT)
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
 <1564048354001.54262@bt.com>
 <ee5949da-4457-0560-4525-40e4d4aaef4a@redhat.com>
 <1564120985317.14967@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dbc40cd4-f252-6b05-4edf-ae43143248b2@redhat.com>
Date: Fri, 26 Jul 2019 08:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564120985317.14967@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 02/15] memory: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 06:10:52 -0000

On 7/26/19 8:03 AM, tony.nguyen@bt.com wrote:
> On 7/25/19 9:45 PM, Philippe Mathieu-Daudé wrote: 
>>On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:
>>> Replacing size with size+sign+endianness (MemOp) will enable us to
>>> collapse the two byte swaps, adjust_endianness and handle_bswap, along
>>> the I/O path.
>>> 
>>> While interfaces are converted, callers will have existing unsigned
>>> size coerced into a MemOp, and the callee will use this MemOp as an
>>> unsigned size.
>>> 
>>> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
>>> ---
>>>  include/exec/memop.h  | 4 ++++
>>>  include/exec/memory.h | 9 +++++----
>>>  memory.c              | 7 +++++--
>>>  3 files changed, 14 insertions(+), 6 deletions(-)
>>> 
>>> diff --git a/include/exec/memop.h b/include/exec/memop.h
>>> index ac58066..09c8d20 100644
>>> --- a/include/exec/memop.h
>>> +++ b/include/exec/memop.h
>>> @@ -106,4 +106,8 @@ typedef enum MemOp {
>>>      MO_SSIZE = MO_SIZE | MO_SIGN,
>>>  } MemOp;
>>> 
>>> +/* No-op while memory_region_dispatch_[read|write] is converted to
> MemOp */
>>> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
>>> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
>>
>>SIZE_MEMOP() is never used until patch #10 "memory: Access MemoryRegion
>>with MemOp semantics", it would be clearer to only introduce the
>>MEMOP_SIZE() no-op here, and directly introduce the correct SIZE_MEMOP()
>>macro in patch #10.
> 
> SIZE_MEMOP() is used, and is the main change, in patches #3 to #10.
> Perhaps you
> meant MEMOP_SIZE()?

Eh, I inverted the macro names... :( Thanks for correcting me.

> Either way, you have raised an issue :)
> 
> There is a lack of clarity in how the two macros are used to update the
> interfaces.​
> 
> 

