Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0Ud-0006v8-S1
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 09:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40097)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Ub-0006q3-Kc
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Ua-0006Hn-Ju
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:42:41 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46283)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0Ua-0006Gu-Dg
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:42:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id k189so5774968pgk.13
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zh2aZm5p0BwjIlcTt9PEUjKiq7QQhQfo9/KW4Xdq0VI=;
 b=CWTsu+jVC9jhSW3punasuRaYvEWV5lviiNiVkHgtRd+7WgB5IaQexbNa+NViBhtPxb
 Acsc+PcQ2BLmzPk1WgaDWF4V8AVRAx3tzvxBVWXbvM132I/wMawq3rrV9PM8HZ5aRDBv
 FwXvLxIpDo0GkF43PSm32NNHAA31b+6mBV0x/ALB42Z44qHHFy+tSI4Yn3v1AN86KQC2
 BzKcJJBPcP/XNB90yRclsbtAfmjH1L0/zAkf6YVyLg7Wxw1H4r3FVhWaCP7ndUSnzTwf
 hFQ80fJTb/fhr2D2wIrQ4cSGL9tLihVRMEnKb4VUFQtDIruzZAluvhbi4eVuxgGzOLqu
 PLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zh2aZm5p0BwjIlcTt9PEUjKiq7QQhQfo9/KW4Xdq0VI=;
 b=BEx0LpWv8zZrQpPokH/scFZEo95p3shGsJK/MbeU9xI+K3LHmG9+JnvIUpwsIWIP6F
 Ms3iLvVV6zIWDxmXYPwn7k0IGcCzAF8M47ZBISp5hY1Oy8PFz4yEGsAUl1GuLlJFfsdr
 dDB2yv4H2JbMSy/DqqZWt1FqamCDGQ1ISmaH0mC2EKgbnTc6bJwaPJRt7KNmAJ0ngGIx
 zCDLwY1XxnUM+nV7p9rlQ/Zvuex3FaGLRnyiuaqYrBfHfaTfJmwR9LJxrf5o9WAvyneS
 JFD7KYJEB3ikL7Efs196Ui+5N4JdxWEI/a6J4/is1weSd09Hwp1XBQnMoD6hJMJIkyv1
 SuFA==
X-Gm-Message-State: APjAAAVqtTTjeDhu4SCejR6sIIWFEjWN/qqb9z6HIj3VLp6viPzQ6g4e
 Z88bcl1VW2GjoTClxg7G2Or4rw==
X-Google-Smtp-Source: APXvYqyqOGVKu9/PuyrTlY21Panci4AfsFPa6xYIzWCdXjrhprr3q9aF+5DwdBN4FLgvofuV9DU4SQ==
X-Received: by 2002:a62:e20b:: with SMTP id a11mr22576753pfi.0.1564148559329; 
 Fri, 26 Jul 2019 06:42:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id q21sm37248736pgb.48.2019.07.26.06.42.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:42:38 -0700 (PDT)
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
 <1564123494194.79744@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fb4ede1d-fded-6d36-3b88-af3aa32647d4@linaro.org>
Date: Fri, 26 Jul 2019 06:42:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123494194.79744@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 04/15] hw/s390x: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 13:42:42 -0000

On 7/25/19 11:44 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/s390x/s390-pci-inst.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>      for (i = 0; i < len / 8; i++) {
>          result = memory_region_dispatch_write(mr, offset + i * 8,
> -                                              ldq_p(buffer + i * 8), 8,
> +                                              ldq_p(buffer + i * 8),
> +                                              SIZE_MEMOP(8),

MO_64, eventually.


r~

