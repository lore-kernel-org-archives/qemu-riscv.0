Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr1Dn-0000jw-0V
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43805)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Dk-0000fO-Pw
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Dj-00084k-Lt
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:29:20 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33653)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Dj-00083Z-BV
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:29:19 -0400
Received: by mail-pl1-x642.google.com with SMTP id c14so24778856plo.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HYkm/+YuRwdgQlTX7h7Sc0MGkhzdaPPqGlIAQEZn/Mg=;
 b=X6hNyy43iImL1gGlKELMROj/8QrOqZyK1sMdpynJjRT38vf77tB43nVRDOoAERpjZL
 iS98ML3FmCC+DGPOH/Z1jm2CBBwH2b134trIacB8iTyad+B4th2ziW6epN/yrt6S+oSr
 Yt6yXv6wWqwocQPlbfrRIFaDsO6qOZtbkze73y4bl8P+EFZx0u4BXaqZN/z55qMiLy2l
 vqHibOP/tB0+OxDG0o/7zSqjeegtFe0gnGswJNo6wFMBRaOzYWOHAwaxTP797wwIg/RB
 zitQBxa6aT7OYxmwCIbTvNy+JGxUSv54bTlrduPiz5EnJRd70TxnfxoftAhNC/GDgs0C
 xlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYkm/+YuRwdgQlTX7h7Sc0MGkhzdaPPqGlIAQEZn/Mg=;
 b=DBGmVpaw/DtP/NXnEB+xbd+OZD3AhHeRDprgmRG2w2vCiHs+QZrzCWUnfo0FBvl9D3
 R3N0r8TGivqG115iZcjZf7jjYmTOgk4Y4nFgtZkAGntIVAGQ8YPjovdyimSoItLhqncS
 jz3KNF8pgeOtSsjzx77fgzI5qimWz7AbwHMv/VJchatXZ4gD8yBrp2Y0JhEN05JfMUXF
 hr64QNPTbky2DqRHMjYZlnRWJZ+jh2P63oT5NhMt13yhnMXNXWDqFdvtML/z4pLw4AZE
 xNBxwYpJ/6L1A2ImWd3qurQQp9RkUT9UTmp3Nh7h2xRVef27ftLr4oM2OZYs9toCshWq
 l4Vw==
X-Gm-Message-State: APjAAAVpRzL7RhiZlfXpECQL3zY7Yh2GlOpefRhvu990qRAbE3LuyGJO
 y3VbrDaQ4yVZVUELGVCD/iixyQ==
X-Google-Smtp-Source: APXvYqwfJHX0llJYhPthp+Vyof6h6XXQb6bjuc/14DrJXGVipkBHNgOla6wimefmoyBX+weNmI8ViQ==
X-Received: by 2002:a17:902:aa5:: with SMTP id
 34mr100001631plp.166.1564151358166; 
 Fri, 26 Jul 2019 07:29:18 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id 196sm57357139pfy.167.2019.07.26.07.29.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:29:17 -0700 (PDT)
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
 <3a893408-e864-cb3b-d86c-b6cf7b50cc39@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <51237717-fcfa-0f3d-f635-7d12481a7625@linaro.org>
Date: Fri, 26 Jul 2019 07:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3a893408-e864-cb3b-d86c-b6cf7b50cc39@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Fri, 26 Jul 2019 14:29:21 -0000

On 7/26/19 2:26 AM, Paolo Bonzini wrote:
> On 26/07/19 08:47, tony.nguyen@bt.com wrote:
>> +        op = SIZE_MEMOP(size);
>> +        if (need_bswap(big_endian)) {
>> +            op ^= MO_BSWAP;
>> +        }
> 
> And this has the same issue as the first version.  It should be
> 
> 	op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);
> 
> and everything should work.  If it doesn't (and indeed it doesn't :)) it
> means you have bugs somewhere else.

As I mentioned against patch 9, which also touches this area, it should be
using the MemOp that is already passed in to this function instead of building
a new one from scratch.

But, yes, any failure in that would mean bugs somewhere else.  ;-)


r~

