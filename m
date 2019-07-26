Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0pz-0000cM-4n
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55051)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0pv-0000YX-FJ
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0pu-00036C-8Z
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:04:43 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0pt-00034k-WC
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:04:42 -0400
Received: by mail-pf1-x441.google.com with SMTP id p184so24575080pfp.7
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nKa24evqf5xPcn+k8W5NyW7GQh08fTUnIlUWImNcE4I=;
 b=pUrqwjbOtgCRBOtjOlCCyA53HeLU6Ec+IvNjrDsAxgBKPBUVDAU3zOnsMV6RSqCQU/
 9/NY0FmP3h9Ae4tJE8BkzNfl2y/BoBmi0LPBUTGzop95vVWDGQ0/5GdGr4CQkrzCYPaD
 vmvAN88SUcyPxZ5MeYUDFU3/HXZe4vlYk/9qowCId4Mr/KnmHD6AALACo0A023viVJzV
 NJPul29FbkgGnwwEwpPGN6Lp3NveIYyICrVUj5pIbmmxk+N8kSq4HJZvZrGg0/7q+GWt
 CT7cO6nBJ8x4ar4E7gY9xwiGPFQiUqPAbr/pwWBT9XWLySUnd2b5rtn3pF+MAoHK+VC8
 lADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nKa24evqf5xPcn+k8W5NyW7GQh08fTUnIlUWImNcE4I=;
 b=MjeeSj6Qz5YDSQ3t+vMW+HfmfiW96A03rX3+0wpRTY3if4Q2y37iHiXU2Iq3bXqIbl
 MyIL6QvxTKJ63oTOgoN2yqYpiFy6w1K2vQs21H3VWbWchVVYoHihQrarIYE53orYMT3V
 zIrWNPTyEoXdh912bW1E+C2fjKG4jN1hAfe7df+j24TdbLX38fwSMzSPDrqVTwDkM7k3
 BjpQDdw6OUbrf5rR3Hm7nvuFydw2mF9F0lx1Yb9mPyPM5f8SjjkgmT+svM2ZB1e3CKVw
 TFBvgzzTtEm+b3feifmKW+kiKfFdSbZLysTXMMU+IR10sUuw2do4A5aFalTpZ2C87i9p
 m7jw==
X-Gm-Message-State: APjAAAVA8fg4THMPUfmu6EuT0ppumfj93sBKfVkRl36fMsmAh2Eyofsy
 eVUhwcqaiCmrgPnQc+71m3LMDg==
X-Google-Smtp-Source: APXvYqxwGxrwjdRcxVad4EFkN1249leocRBb+DvD1AgR/Ayl+/s8z+MNpVLn4sEBCAV377KEkOb3xQ==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr97990476pjv.95.1564149880644; 
 Fri, 26 Jul 2019 07:04:40 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id o24sm103707061pfp.135.2019.07.26.07.04.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:04:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
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
 pbonzini@redhat.com, aurelien@aurel32.net
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123434793.89101@bt.com>
 <2e89740b-58e7-ed7b-834a-f94fa76f3cd3@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1335cf86-c27b-6aa6-cc47-6e986d270518@linaro.org>
Date: Fri, 26 Jul 2019 07:04:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2e89740b-58e7-ed7b-834a-f94fa76f3cd3@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 02/15] memory: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 14:04:44 -0000

On 7/26/19 6:36 AM, Richard Henderson wrote:
> On 7/25/19 11:43 PM, tony.nguyen@bt.com wrote:
>>  } MemOp;
>>
>> +/* No-op while memory_region_dispatch_[read|write] is converted to MemOp */
>> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
>> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
>> +
> 
> This doesn't thrill me, because for 9 patches these macros don't do what they
> say on the tin, but I'll accept it.
> 
> I would prefer lower-case and that the real implementation in patch 10 be
> inline functions with proper types instead of typeless macros.  In particular,
> "unsigned" not "unsigned long" as you imply from "ul" here, since that's what
> was used ...
> 
>>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>>                                          hwaddr addr,
>>                                          uint64_t *pval,
>> -                                        unsigned size,
>> +                                        MemOp op,
>>                                          MemTxAttrs attrs);

Actually, I thought of something that would make me happier:

Do not make any change to memory_region_dispatch_{read,write} now.  Let the
operand continue to be "unsigned size", because it still is, because of the
no-op macros.

Make the change to to the proper type at the same time that you flip the switch
to use the proper conversion function.  This will make patch 10 about 5 lines
longer, but we'll have proper typing at all points in between.


r~

> 
> ... here.
> 
> With the name case change,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 


