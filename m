Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOAX-0005vA-0x
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58903)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOAV-0005n4-3E
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOAU-0007wj-3d
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:48:03 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42959)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOAT-0007v9-Ph
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:48:02 -0400
Received: by mail-pl1-x644.google.com with SMTP id ay6so41465099plb.9
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
 b=RVLg7BWv3CBJVe/avUoZpspK3GJNIJez1Z7w54GHlzZZOmRSlrkq/tPS2PNChBVLr8
 8pjmcInx1bE7xvrAEp6rua26vBSKahPj07l/M3gEk7Zz8G6naD9CYzr8MTTPaLI2awUr
 djak9esVAfjo8Wo1CvikhrDoypacMR0MwiNSDckmKpiQRnxXqRehZgpzONjiT05hUox3
 BuCUI/nMdt1d9U4kCpWnMkHG94zlXmngtUNmPasvKOFudsVEh4gDlM4y2AF84Xtx612H
 5+pQz31asGe+NRyn7AIyc36mAbRO4Q1W16i4pFdAEGekwTm4skbMmxer2GRt0xQGGUfY
 SADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
 b=HZLYH2SvqBgH/w+lReN7z8wLZNmIrIv+tZ1K4QwHlf3+O6wzspymqwh+wlSXxVI53j
 c8cMGt2xho2PJ2+VdsP7GmapfV9bGdv8qlFCof7emw1OIuOmCoTk+fq+Aiqu2d5mPSQJ
 z9mkbgol5lWJIszmePxidNAwtMFvMjyPURFLlugBlC72n5fxWQWkgvvkSBw8H4lzqYPn
 NRdIh0o8Pi92x89MUcfO5XA7JG3zC3NbEjDQohfZpBXvWgUUw1tSwQxbGAID7v8Kqvmk
 9hXN5WbvHwsAM9Ld6Y+z0qa+lVq37FeU5lJWEoaENbSRz4KiQT1uyZoduQIAmriAou2N
 rHyQ==
X-Gm-Message-State: APjAAAXoQuHIpSK3a0stxzz9vyMDbztAVyQcAlGHEmwC3lSrmfD3oDDH
 43sDkQO141lC42B8gj4K/Swo7g==
X-Google-Smtp-Source: APXvYqybocu4flPeVmJWnkfdg+h4qK9Xs4NK5mlXbh8VvAvaeF0v60yuh9bLWnxQJYUgpDIh08u1Ow==
X-Received: by 2002:aa7:8383:: with SMTP id u3mr9983779pfm.175.1565192880884; 
 Wed, 07 Aug 2019 08:48:00 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a6sm91814707pfa.162.2019.08.07.08.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:47:59 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com,
 andrew@aj.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166627824.57868@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <febf733f-d671-9c0e-8adc-7578254b9a6c@linaro.org>
Date: Wed, 7 Aug 2019 08:47:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166627824.57868@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 13/26] target/mips: Hard
 code size with MO_{8|16|32|64}
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
X-List-Received-Date: Wed, 07 Aug 2019 15:48:04 -0000

On 8/7/19 1:30 AM, tony.nguyen@bt.com wrote:
> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with
> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/mips/op_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



