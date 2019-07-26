Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0SW-00052w-BN
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 09:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39199)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0SU-00052G-Os
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:40:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0ST-0003JW-M0
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:40:30 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36797)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0ST-0003HO-EU
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:40:29 -0400
Received: by mail-pg1-x541.google.com with SMTP id l21so24813640pgm.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ts3Mb/QRq2ILN8vtchm/lhkfGiLpQyRe8+PoTIb9dQ0=;
 b=a85Vf/nIUsI9sXXDJNG3tcL3bgG3JVY0pJXC1FEc1bRC+MULydSnILIbWvab2csDqO
 eKIDl3vf4E/nD5RaE8ga8DbSkfAxdDi9LpXjnMZDG/5jIHh9aygNhZcFyWRevR7JkLmB
 ZeYvwp0kbBX0htrw2xMKkFv4lJLmVWDXFDV6WaTUmYDntVTwCXfN47XlnmO62S0KOoV9
 K6Zh64/MYMtYwrDTcfBhN00l1dPCPNhu1l/x+uAl4h2GA8tn0qA2Hz7lNaibH3Yi518Y
 Z+bJjTc8BN2oLZduFcA6agwztsCKMX14br+u1f1ipzxM56aOdc1cvQBqeui/PPE7SYrW
 YkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ts3Mb/QRq2ILN8vtchm/lhkfGiLpQyRe8+PoTIb9dQ0=;
 b=Py22oLIsfVLpqJL3H2oCjizdtPjC38SIX4e7AauN20llaJhDoqbCRdwUvK2TScoaa8
 RAe/yQy/D6FzkABvzSPvZykXE19DOz4WJ5vgdZGOEYJWIZoQVYXoQLJqY5zPbpNqsgBz
 AzFuDq4v7hGHL1ihpCMaYletJ7nWmrBzly2TWCmTswyjxOowj5iPtBFetpjFw613ATSH
 8SjqKMnVtAqEHqHvz8UEoP38LP48wMFvpfsibgOikB9EZGxjFIoDgHgp9rpnwWYLwmFz
 /uwSAXTFX6V6NDK7gebyfSuCfACIWjF9vCzUWXcC6UIIWrl0bH5C4QURrqZX1lDtKSEn
 5jnQ==
X-Gm-Message-State: APjAAAVAwt+gBCf0gGg3fQy2nlyGFYXlRh7OClH4sCGU0x7Mzp0e0Ugs
 n3vHkL3kMMQm5e80qhKNDae2ag==
X-Google-Smtp-Source: APXvYqxta0GfTQcJk6xvqb5S/ZAHMt5AoSQnkVau+ys0gr/sc8Zl5dgGAWr1n1WOUtqRS6ScSB+wJw==
X-Received: by 2002:a17:90a:9f0b:: with SMTP id
 n11mr59462892pjp.98.1564148428313; 
 Fri, 26 Jul 2019 06:40:28 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id j5sm64474991pfi.104.2019.07.26.06.40.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:40:27 -0700 (PDT)
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
 <1564123462960.14205@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <164823e2-ae60-e729-84e0-6765b7175cc2@linaro.org>
Date: Fri, 26 Jul 2019 06:40:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123462960.14205@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 03/15] target/mips: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 13:40:31 -0000

On 7/25/19 11:44 PM, tony.nguyen@bt.com wrote:
>          memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
> -                                    8, MEMTXATTRS_UNSPECIFIED);
> +                                    SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED);

As an example of why I'm not especially keen on the temporary incorrect
implementation of size_memop, you'll need a second pass through these files to
replace this with the proper MO_64.

That said,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

