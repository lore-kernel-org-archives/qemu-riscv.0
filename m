Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0GP-0006cB-D7
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 09:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34237)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0GN-0006YL-2s
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:28:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0GL-0000Cs-Ra
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:27:58 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45888)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0GL-0000AZ-GH
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:27:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y8so24791177plr.12
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AeYQ99I0ZNzvORClQ/VunoCYa+uAza8hxjARLVddn+g=;
 b=dktL4PafqHaYhKVS8jJxXCmbHP2YESh5KwEvAMb1/ZZommqyBc1vOsrbyTCSM2j9pw
 X/ca0xg5y+GQw8RrPABfFBhas+gWY3ovdSnUZPi09+tQvJRWPKoYNM23mQQ+hV/wvbDO
 gwtef88zaAe3hMfkuLv9hh3NJWTV6tP8OjGcOibDuFtdhv+rdjJBq7Ex3UD4kW1ssjdk
 FouDJEBBFixPrAArLBKBJk5T2IYQt0CSPj5KTpfYOxJ4DLJVahmNf7fJkjRQIaF0mHGx
 oTesPPOsPmlmYm0LLBFHw81H6Z4h3xWKakZWVBYoru3C28bLq2NZqGx1FNBYYHrTGr7m
 Dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AeYQ99I0ZNzvORClQ/VunoCYa+uAza8hxjARLVddn+g=;
 b=KyA8yVf4RZT0y876TddjuaRH7A7rtk2GC+zp6tYid4NRwxJ6PQ6vCXNPB6xpynLXai
 sj9EguI+08/WmjUmGRr7gkUexQJnEldfSsrvRvVd3EGq4x85MoMpldlwv3GdnJWmUqh5
 z1WDN1O9cRWMcYlPM8tRbJAjN9cvK2vL7P+inWDhkEQNVXbCfH4lpNU5xo961utX8Njk
 QT4MMSLm6SzliC80k+zGWdOx8r5+JxLrag8P+UwkEkETixYXwCnCu8w924VWL+twLuHD
 /G8uAaNDwWPcPKo1dzHlYSihopEL02VH/SVFyVGApiEGkQgpI7XzAt5cl9rHMDWCkHPJ
 P0XA==
X-Gm-Message-State: APjAAAWeodbsCsRGlPviRoC1maQGQpK8740jSQl6frl1fwvPvxZ9Rh4R
 DH5Z3SkpCE4pIgiw/OCD+nw0Fg==
X-Google-Smtp-Source: APXvYqzMuiPdu0a1ET9u0yVXYjubdIm2B+x0TxdG8ctpS6rFLKtu2eTOYpwoJkSyarIir3DezWqGsQ==
X-Received: by 2002:a17:902:e20c:: with SMTP id
 ce12mr99544562plb.130.1564147676257; 
 Fri, 26 Jul 2019 06:27:56 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id z4sm85049697pfg.166.2019.07.26.06.27.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:27:55 -0700 (PDT)
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
 <1564123405954.22175@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ae38e1f7-ee8c-8263-6e91-9a3dd1425ead@linaro.org>
Date: Fri, 26 Jul 2019 06:27:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123405954.22175@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 01/15] tcg: TCGMemOp is now
 accelerator independent MemOp
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
X-List-Received-Date: Fri, 26 Jul 2019 13:28:00 -0000

On 7/25/19 11:43 PM, tony.nguyen@bt.com wrote:
> +#ifdef NEED_CPU_H
> +#ifdef ALIGNED_ONLY
> +    MO_ALIGN = 0,
> +    MO_UNALN = MO_AMASK,

You need the configure patch got TARGET_ALIGNED_ONLY that you posted separately
as patch 1 in order for this to work.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

