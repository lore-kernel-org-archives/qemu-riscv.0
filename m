Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpajD-0003Ih-2O
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56710)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hpajA-0003EL-SE
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hpaj9-0007lX-Kw
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:59:52 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43317)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hpaj9-0007kQ-Bm
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:59:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id 4so12402484pld.10
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2019 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53qxnmFCQleCgbRBd+QvrrBbXVy7x90TNzmGsFo5nJU=;
 b=iPbss/mK0jszMYof/8qtEi33fitz9HC8eD/BndxwmPj/LtJj21fdl1api2UB53TVJ3
 LiO/y1lhicz2hfPj5jnw3buDx9l0NVfuG8XWs6sgxIxkgeh6ofJg+rI9vKUAUHFyi+c/
 ug5ndyKNnPX6tDf11y2fxK3chMQvVwuXqhlhlvN351ntAyuvxP95hpiQUZdskVFXNm8S
 /+JSbRug7VVg9zxK0h9re0oMGark5HNwNNigLHKEX2GcEoUZzHqsv1alZOVnM1IeNmYK
 eUvzBNFoIl8UsEOqM62/C1mB7Mq4baSo8laFlWCeZ4XMs17DBlLRSW91MabPlGM68JxT
 w6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53qxnmFCQleCgbRBd+QvrrBbXVy7x90TNzmGsFo5nJU=;
 b=fBuePVlfkTB0eWSXjG68MZmgV/nevsdME3Cf+rZqoL4Q8PGBxEOH60TMioYLlvX1P1
 EbLEXGRRHx1MHk4vgHMpLhZRs5m51PwHdmmHwC8vFcSh0JEBUhvTmzwqye5xChe+WCRf
 nTMZIHch1yWR/Wvif3wwe3LOknWQdqZyEPI2rS2r4cSCxucgSESOx1omlXAs/bd3ZSGN
 zez3EeO/LKgP9E2M0tKyRh1tcvM3FyS3ssgtZlgt6uexQrMOSyh/U5msWdzZ4xD+h0Sh
 UCaSk9++CccSs6AW7TYa/bajUTsKuPXxi71OPNqw5j3zMYC8PwMAY1PsRR1rKZsk+6ZO
 q3gQ==
X-Gm-Message-State: APjAAAVrnMZhAC0LAMiW4pYsjnNP/meoMGhPWd3AE+S2CMBd0uoN7oUH
 0f9RYd6MojUxoC0R3KAVlmLbgg==
X-Google-Smtp-Source: APXvYqy/RcnjVKmOcjR9YkoxmsldkT0VMHLcPieshCXhxmcgxnYEhbB1VLUfu3mSkg1P/Zg2xZBPtw==
X-Received: by 2002:a17:902:b582:: with SMTP id
 a2mr77224778pls.128.1563811190327; 
 Mon, 22 Jul 2019 08:59:50 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id y128sm58626865pgy.41.2019.07.22.08.59.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 08:59:49 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, david@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, mst@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
Date: Mon, 22 Jul 2019 08:59:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::633
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Mon, 22 Jul 2019 15:59:53 -0000

On 7/22/19 8:34 AM, tony.nguyen@bt.com wrote:
> Tony Nguyen (20):
>   tcg: Replace MO_8 with MO_UB alias
>   tcg: Replace MO_16 with MO_UW alias
>   tcg: Replace MO_32 with MO_UL alias
>   tcg: Replace MO_64 with MO_UQ alias
>   tcg: Move size+sign+endian from TCGMemOp to MemOp

I don't like any of these first 5 patches.
I don't understand your motivation here.  Why?


r~

