Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0VX-00028p-KA
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 09:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0VV-0001ys-6A
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0VU-0007Ii-57
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:43:37 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0VT-0007Hi-SS
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:43:36 -0400
Received: by mail-pf1-x442.google.com with SMTP id g2so24561109pfq.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+rE+b7U3Gi0cBQ0TBvpFajlfZCgG2WHm1fCLfIQbXfs=;
 b=sXpjXxs0Tv6bK6ES5gJQqu0UgIaBRfU9QYcBTHzOdjOHX7AQHuMQ27e3d5P+r0Me2p
 LPbD4ATkPqCVSnmKVPNXrqjrvEgw/x5ONFexJZMiFHmu7X6ADB34uhsWUY9Uy/b0a1IV
 PVZKSDDsokQrzh0qx7LxPwfj+Iatp0zg4Pn8Y10KEeNKtUP6Pi2+53JY6/pVr+AhyvCx
 peLeKUY0xn4krgohSE6YqV8e7Eyhg8J71TELlF2Dsa4tMa5cQbws7is8tiHOA6iczLXy
 DJ8ITwVwVaKPmkt5eBUs/y+8IJCH0CraZjmw4sjqslIZBkTWMeQW/qf7oA+tlGTYcSiC
 ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+rE+b7U3Gi0cBQ0TBvpFajlfZCgG2WHm1fCLfIQbXfs=;
 b=PdCFHFO2DKRB6zIyccbxVUq+Cbnom6JzxPOVmry8oBuNSaN2czNGBwjSj/oD2uu7P/
 WJpLEH2lfZl4TuNOE0tny93+aE7SWt6SnrV8U0BuDALw3Hfy0u3yazcjMjc7sDgRo+8X
 /7S4SEUona3EEdwCnZg1v9AWBJ1+JgDhHoosAf+UWDd28QJn65Yzn6jd5XkKvb5Gpo7S
 WCarN+pjyL0RYVsbT6l94fNDbgdqS5McXiIxolezoPUlIt2n3phExdGaus4tHTqe/jdY
 bQQYUFDQTd6KRZdJTzIbghoI1NkAm6/G8kx2VBVnb3Q96XQZQ9bd0jVMEPy6P+Kuy+K1
 68OA==
X-Gm-Message-State: APjAAAUTE1caBuDtNS0v8SjjTIeKsJWMCObF5ujgy091NwQS5p8kQtr/
 qcx72vXVO2wBom2GmZTtBz98oQ==
X-Google-Smtp-Source: APXvYqwtVhbd6jbOZdHtrMpkYpk7ZkBWFU0N4q+4yU5nrFIVIG41a6U38IM2A9IdTecAp0G9KfjnpQ==
X-Received: by 2002:a17:90a:21cc:: with SMTP id
 q70mr101134325pjc.56.1564148614922; 
 Fri, 26 Jul 2019 06:43:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id i15sm57408791pfd.160.2019.07.26.06.43.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:43:34 -0700 (PDT)
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
 <1564123545422.59810@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <425e4d5b-984d-3b30-9b0b-a7d35516cf62@linaro.org>
Date: Fri, 26 Jul 2019 06:43:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123545422.59810@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 06/15] hw/virtio: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 13:43:38 -0000

On 7/25/19 11:45 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/virtio/virtio-pci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

