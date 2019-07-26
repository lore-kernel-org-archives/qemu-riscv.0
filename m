Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr1eF-0002Re-Q4
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42238)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1eD-0002El-79
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1eC-0007PH-8t
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:56:41 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36263)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1eC-0007NY-0Z
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 10:56:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id l21so24906197pgm.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pQDFBSwsYIydUY+TzvjuDb7i3I61Qwr/Ai6uGnN+5dc=;
 b=A8IogMerOKkjEb3ZeQgo0a3/blo1UmoiJ9biLr18rlvMOz737NJ1Dl/IYkEl1xRk8i
 3EHuW3XJ8M8kZgxT+Eiwbt2plfTLsSsf+VL/CA6cbUSLeIGWALdB5AqhJfaOJAfsRjRM
 bdlakpf8wtDXOTvAOXkjtBxMqN+q6kKmqtOpDb5YuUlDoxHmKgrJqOlWrbTqNf1mCNV+
 swIHAjrFhIOIXze2joj0AdtsI8pnaQq3WhXtht/NZK0mIzdcTvUg4rMGuS+h3jBwQJS/
 vkV3iJv7zD3LtbYRkahX+aeifzHCEAvN26C68rpDnUx50uUjpIiBb7rv2X2NOjwJLHMu
 3Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pQDFBSwsYIydUY+TzvjuDb7i3I61Qwr/Ai6uGnN+5dc=;
 b=kQGDhKb/Ng9vqoldthj4lQp0unOGFJ9DyXIIjTFtMiuV4D7KkL9TFQKswXvYGvtq6R
 +qIr0qknhHW6sy15l8QWeCGrw7OAKCuNPPZPE88F3jWBsYleneOCEdXmhQc6c0JRXNwF
 oRhcxAN9pDMrnRb2fZMWmtkXYhWDsaTDzFBsvGV5SOcN4NugD+vEf0FfImsSBh46Sm0+
 d2oU72sWsdOX/1nzPXAn/SWrx68wtYcPEsHjV4m/JmHmF3DAbRlAOj7+FWAtQlstpAEp
 iIBjcsz1kFw5f/agYAKvpXPM7nffgBcvZYhiybyXNt6nK68PkOshdr3Trw3i3Mve7cFo
 Tm6Q==
X-Gm-Message-State: APjAAAXELAcYl6XExh47qRkmL44LF4ND6RPT4skTfcoygeMk+LE34rrv
 rdRV78tnfXvv6ixkkvoCavO2iQ==
X-Google-Smtp-Source: APXvYqzwI4dmhyNaKeyCpPYbAalf+lDGTOtqgmfWZCLn1dwG8XS2UvGVZ9DLiv0YnNdX7CARxJSExg==
X-Received: by 2002:a62:8f91:: with SMTP id n139mr23132118pfd.48.1564152999052; 
 Fri, 26 Jul 2019 07:56:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id u1sm50177390pgi.28.2019.07.26.07.56.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:56:38 -0700 (PDT)
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
 <1564123758372.45776@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7ab88ef1-55cd-fbe0-e25a-7449b8a3ffc3@linaro.org>
Date: Fri, 26 Jul 2019 07:56:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123758372.45776@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 15/15] target/sparc: sun4u
 Invert Endian TTE bit
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
X-List-Received-Date: Fri, 26 Jul 2019 14:56:42 -0000

On 7/25/19 11:49 PM, tony.nguyen@bt.com wrote:
> This bit configures endianness of PCI MMIO devices. It is used by
> Solaris and OpenBSD sunhme drivers.
> 
> Tested working on OpenBSD.
> 
> Unfortunately Solaris 10 had a unrelated keyboard issue blocking
> testing... another inch towards Solaris 10 on SPARC64 =)
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/sparc/cpu.h        | 2 ++
>  target/sparc/mmu_helper.c | 8 +++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

