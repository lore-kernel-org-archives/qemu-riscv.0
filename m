Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr0Vu-0003kF-5c
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 09:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Vr-0003X3-2z
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Vp-0007fi-TG
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:43:58 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46291)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0Vp-0007e4-Mz
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 09:43:57 -0400
Received: by mail-pg1-x542.google.com with SMTP id k189so5776458pgk.13
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VErsMOJrJsbZB59YG3aE240P/hZISZ5QmUyEKYzm9ZI=;
 b=e8/u+UwUoAmX3gBOogCXhZTz8MaHjeBjHb0fQCgiBYqHiy3Q+mMRJOFizS1dcZcr4E
 OYHx3yL3jm+F5+gf8SPd0DHCeU9ZxoG6h37ZkSxOy/KekcCQzu3igasGHvzoipIeupDm
 o0AELlmBw/r4197Y0+/kqBFOafcwDsUCoKBRzTOpmu/5MccRjoxwu7roYK4Z70u/aDTm
 u/ReskFJqsMoWNE4v5XDirCcwdUbUqw+wEZQoSoc0x6Il+qF8RhfZCDyVbZ7I+qVZxjJ
 SBvtIe4dkM8GKh7nZuTB4p5mWsXVmVAqWU7FpPG3xaxNpZV3oZtC+HgOwgow+9cju+lt
 /VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VErsMOJrJsbZB59YG3aE240P/hZISZ5QmUyEKYzm9ZI=;
 b=IJogeT7j/Iw6at6/K8jWN6SlOiBLcnSuLbiCQHALr5Q1eVR55MiiQDcuLqs8fgwxAv
 YgBHTwx9JfJiBmV16JkuDamIZ9KNEmdgKEXLXdtV0+GRohEtCKgcgtVqqBBubtf8M2wN
 gpchjIbEwhT4/MX7B8jvc2lqxcL9BAzv+FMcTidWVF18fbO1e4l5+a5/bSiwu+hFM/nw
 DRIsE2LnXY/3M4OHOeMVNYWHYchimCoc9tOFNGXGECkpz42WTQoEQXZPzbkfx0L/GRpY
 O9GEQNFkwe0WZgGNBsy2EhdBhhQaybm5+Mo5DdztilBqRC4zMOEP4nP9Chk1HNdCDQ2U
 eNuw==
X-Gm-Message-State: APjAAAWFOgv2rIh1xN+sl1qDO/obJUa0Wpdc+2bbiSmNQZcxDaiq+Osg
 eHnbr7ea900HkYrJoe1yzg4YcA==
X-Google-Smtp-Source: APXvYqwB9jpneHQc5pVISeujqRuO8pTvs4lRDNaMfMuWBsuan09I9Z0V9KOFG5r7MMFhHZtiNiAnvw==
X-Received: by 2002:aa7:8502:: with SMTP id v2mr21799279pfn.98.1564148636344; 
 Fri, 26 Jul 2019 06:43:56 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id u134sm51392165pfc.19.2019.07.26.06.43.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:43:55 -0700 (PDT)
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
 <1564123571442.48536@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <055d6faa-fd5d-482c-7356-e48ab40089d3@linaro.org>
Date: Fri, 26 Jul 2019 06:43:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123571442.48536@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 07/15] hw/vfio: Access
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
X-List-Received-Date: Fri, 26 Jul 2019 13:44:01 -0000

On 7/25/19 11:46 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/vfio/pci-quirks.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

