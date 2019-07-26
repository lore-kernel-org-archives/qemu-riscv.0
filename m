Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0Yt-0006WH-43
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 09:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46795)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Yq-0006SJ-AI
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Yp-000264-9x
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:47:04 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38687)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0Yo-00024V-Ur
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:47:03 -0400
Received: by mail-pl1-x644.google.com with SMTP id az7so24779991plb.5
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Wl2fd8LNoOtVLHHwm3Cw6JvAU+/r1OMbSAET3sQlpg=;
 b=JGsCJKMYLFoMirpfC2sTloOeN3k0TG4QTGL7ol0QHNYkF0DEEMtu/fC0upIceTKK6m
 eEfeHwwZwb9BH8YMqz0vvOQth57xKRuDVTdk6cR/EvwrK+Ni2FgfnliUPF/RA5ZhX02q
 mH/GcbLO9EzjqXun+rHwkKw0+Tz746owORQNl8py3QKfbh5nLKJems7uopiLNf1L5ku6
 pc6MnY2Q5qTsW5p/jRdZDeAkConPGel5aC6+RxEDVsrnVX6T7G/AuQShw3URh3fRGtQ7
 lf6YaRb6dQzB2iC5zx7hIaqG9vUj98dDkrU2zCHPmy2RPhMG9YilisATodsUydOyLZAW
 kUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Wl2fd8LNoOtVLHHwm3Cw6JvAU+/r1OMbSAET3sQlpg=;
 b=mV3fAOgrGvP0L4+6uW9NrHPgp7Cu5GbgkyiBa3g/+cuPvgzN5ogUGo/kXpebGOGY4F
 1CpB3mtcJOvWL6RzT5PW0KeOv+KPk4m2S8nmn8geNtu2SGYFMvPMWVGW1iT1RjZnqyQN
 JdMgV3KKLKQlwiHrQ+bUrNS/PwNP6nWANV+ra4lkalMu5qYwYy1U9CtLUpZEa20DjhLc
 R2pTpQhJz7OYC/CCeUQXKAgcCjEKMQDlkO0a23J16e1Z7mJo7ndr+WUL2tTSJ/nl+t14
 swKcWFIJf18E/tcdex4xBno1Wi9gEqokWZP7SAAY4k1vTLGumN4zITwf7ogyI+j6zcrc
 f9Ng==
X-Gm-Message-State: APjAAAW0RLrLLESBdT9mze5XcHJdIghJTLX4V4/U2/rwyFFcbQUyPM3/
 yRxaUCWd6Jq109zCOsMZQNFkXw==
X-Google-Smtp-Source: APXvYqyVFMI4IvnFQ5f9RQocCniS99cmGbQTPGhkEo6WzaLH/QMMMhm6dDgs+5z32F0+M461dyFIGA==
X-Received: by 2002:a17:902:8a8a:: with SMTP id
 p10mr98334346plo.88.1564148821743; 
 Fri, 26 Jul 2019 06:47:01 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id x26sm68868804pfq.69.2019.07.26.06.47.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:47:01 -0700 (PDT)
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
 <1564123592639.10426@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1016f328-46bb-f2fd-c7de-964945199b9c@linaro.org>
Date: Fri, 26 Jul 2019 06:46:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123592639.10426@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 08/15] exec: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 13:47:05 -0000

On 7/25/19 11:46 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  exec.c            |  6 ++++--
>  memory_ldst.inc.c | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 11 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(4), attrs);

MO_32, eventually, as well as

> -        r = memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(8), attrs);

MO_64

> -        r = memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(1), attrs);

MO_8

> -        r = memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(2), attrs);

MO_16, and so on.


r~

