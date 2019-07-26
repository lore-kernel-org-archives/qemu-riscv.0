Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr1dI-00086o-8W
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39833)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1dG-00082W-Fr
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1dE-0005lU-Rq
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:55:42 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46781)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1dE-0005jX-FG
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:55:40 -0400
Received: by mail-pg1-x542.google.com with SMTP id k189so5863965pgk.13
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Odfgxg7vIXjw/Iv/5NARPcAT/tZ6lO+gPqDya16oOQ4=;
 b=u0YrwrijpB6FA7Cga6XnQQeIHcroFf8ygXeNB02hz9a1VnnMQubvQGMPjObIS7biyN
 69KtH1dqHycTjA4dTcAD8FEy0b5dhVrSLpD29wZ7qB0XyaITpokk2vBEjKV7ePuGPWbw
 wAf9nsZmgH5yhmfZU5K04mkYGJip/ubasv1FPBu6t4ClVTXfE03oNEP6tO/8KPMKunuC
 RZJhT7lwi2b6ogDl+oenX3kKnJakbObLGejqnF5GSaNpFm8G5CVUK2TDX9RR4UVG7sa/
 rv5XaHgyQEcAT/QA5aNkOkmX1eKruqwHyj0Q9LHlEaX5/TcpsGyrjsgmXGtN3ZGwSErk
 cWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Odfgxg7vIXjw/Iv/5NARPcAT/tZ6lO+gPqDya16oOQ4=;
 b=pVtmaxNBB/XOo45F1Z+hNOEy6NgiCnlkBSWcvYZfu1JN+JS786LHTZBfi2egaEM8MI
 OrcSj22mGEFbsV4Lq9YdfnBVwGAw1bXMbLYZIl0fDbG+BMK/gLXLEyD4vXBzkAY38Los
 HWjbr0IAaiem4FR4jo11Zs8pE9oWTm6Nj6gpv2cvvqnZOXqFco3Z9WPEvoZWpA/GESv2
 3TF/oQdlB9dxzS/8XkabdPFTfYPykJUSas4UeG6D0oAJ1GVLRopo15aV0lAhovDcB3pN
 +Rg42whJHl9m2jzCjnJLZYQwJXhsuF0tqsG37XrXRZZLNlEC++Tejw8Q+wubviEFMFIE
 PWUA==
X-Gm-Message-State: APjAAAWK9/pXQSuneGDhdGSGZC9Ql5GoU+/OWoOXsii805yG2r9hZOJi
 8VV+Faa3bIRqBFdX4eoEfjYp0w==
X-Google-Smtp-Source: APXvYqxHP3A+az/tb3/Ex2/ugET3pE/toCX8uSZ0qv7LoYoPMUw15icDo/Fh8Ra+2FoGKjMLkB6zHQ==
X-Received: by 2002:a17:90a:9f08:: with SMTP id
 n8mr99311338pjp.102.1564152939279; 
 Fri, 26 Jul 2019 07:55:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id b68sm68532990pfb.149.2019.07.26.07.55.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:55:38 -0700 (PDT)
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
 <1564123735589.34363@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1d9a2b2b-625c-f7d6-cf3c-97b5b40d366a@linaro.org>
Date: Fri, 26 Jul 2019 07:55:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123735589.34363@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 14/15] target/sparc: Add
 TLB entry with attributes
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
X-List-Received-Date: Fri, 26 Jul 2019 14:55:43 -0000

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> Append MemTxAttrs to interfaces so we can pass along up coming Invert
> Endian TTE bit on SPARC64.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/sparc/mmu_helper.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


