Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr1Wl-0002Du-DK
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52491)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Wj-0002Cx-Bf
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Wh-0004wT-Bo
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:48:57 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39145)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Wf-0004t7-CO
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:48:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id f17so20645084pfn.6
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
 b=JhJjCHD10gsgmX/2XjtoOgFJef8Y65lBbTFsRrM70sYWF4vV4k5FEL46+Tea/hgfYr
 IDbmKvK5hWzs9PzEv0n65B6Y40IDybg6RDB8y46RtBP84fTJ3yBVv4tEjQ3OT5mlMpUX
 dRkXD3a9zQ1xlHP/G5pNteqFWX/my7RWBnhNqaJzEuPUUtevgVmcaIi68mdDxeYbqRL3
 oyeA0LCJaGi5Yw/flTECnj42Rnfi7QWBYbx3Yv++KeJUQRceV90lCI2Iqk/phNBCqXE0
 tOMCiYwVoDNrgdPjJ+QZgFwAD9ykFcQIYiEi3Hd8ku2mfmTRKZlY3ynWWPwYupNzdzof
 VGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
 b=VyCv+dDArYSFKYZiLTY/wiog15+rnHpfwsISggfgOc40YH4Re0ylHqCObEoD1mfeIY
 X1tuoJqlS130HwOncR0N7BO7jSB4PxVaa3eT02ZfbuGR/xbI6GKXJ3kTFxRiC0AvIQqP
 TJz8mCjBUBFKWAjDDSL9yshixmXU052p69BE6IDTPPweVpOUEl6TaXF+x8tSdwmDj0ds
 MGSGUo0jtoKPQe313idTRiONRTeB0gAygZqIZi61zEHmnmz4zjPwadujlBAAaMq3Rm/l
 p5GdL2B9nmzOEm9zuFzipBf+M4HJc9qtuC4zgkkZt9lbPLh718VlNsDWismyvtps7L6q
 FpAQ==
X-Gm-Message-State: APjAAAUsehTRgz9sR5aoMX3xbhxeYA2amGftxhxSbFBybxgET+PTfTGK
 3picgJimI+L3F0/VNNsNmG+TCA==
X-Google-Smtp-Source: APXvYqzL9ELBFHlkZ2Zw6UMoraOzMhzM/hDqxHfhCCDYDRDxotRZWSNE1KM0zV8pwMYH0CSWWA3bZA==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr92713232pgc.115.1564152531555; 
 Fri, 26 Jul 2019 07:48:51 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id f3sm83570723pfg.165.2019.07.26.07.48.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:48:50 -0700 (PDT)
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
 <1564123690507.53193@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b0d92bab-8302-4fe5-d7c2-16c7193ffd7e@linaro.org>
Date: Fri, 26 Jul 2019 07:48:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123690507.53193@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 12/15] cpu: TLB_FLAGS_MASK
 bit to force memory slow path
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
X-List-Received-Date: Fri, 26 Jul 2019 14:48:58 -0000

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> The fast path is taken when TLB_FLAGS_MASK is all zero.
> 
> TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,
> there are no other side effects.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/cpu-all.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

