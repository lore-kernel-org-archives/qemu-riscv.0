Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqwVE-0008Es-GD
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 05:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqwVA-00084w-Nq
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 05:27:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqwV9-0006Oh-P3
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 05:27:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51620)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqwV9-0006C1-Ig
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 05:26:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so47406231wma.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 02:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+oWH/lOElaqbnOZuAMvJ1Z4i+kZvaUG2j2o1tOHmT0=;
 b=dToN7litrY19tBQ6/q29rRuWXOUMH6BGM+uANeJU0KGm3/r6BR+at/dN+F0TS9qhyt
 5jcHKm4AATVQjOt8J+L5ggPBhndYaidgytJMYsjAFJUx0wixZdz7RwDSOnkxzSC74WuK
 ymvHYIhW4JYD3xD6Esf8/bV7r0MHVB0dEemgV7By3fACRa2vURQ6uSNXuY/g9tlfkdeZ
 P98+Z1nOkCE/pmhedcZYukUVYQiAfhZ1zsHaB250lKTmvz+d5fXInrjE7isDkZrsJkw5
 t5MnmP+7oO1dXfEpLKz3tans809BzPYrtztoy+dIyHAMtBzOEZqRtP9XR/VlloM8Vwu9
 sOVg==
X-Gm-Message-State: APjAAAUL8aJ9SYsvDSe4gFFLpsOpzF1pXmBhcN7OLs5YCugGhu6JX88M
 gLHOOxsiIFnNNQj2xLJVWz36oA==
X-Google-Smtp-Source: APXvYqw2+hcxm7wpeRltK02IoL3BIPdrJlanITRwYpQ5R38VFkZSIFn3j6NS5d8RddAFEVEzSV+8Bw==
X-Received: by 2002:a1c:ca14:: with SMTP id a20mr42211047wmg.71.1564133215103; 
 Fri, 26 Jul 2019 02:26:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cc23:f353:392:d2ee?
 ([2001:b07:6468:f312:cc23:f353:392:d2ee])
 by smtp.gmail.com with ESMTPSA id b15sm67878742wrt.77.2019.07.26.02.26.52
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 02:26:54 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com,
 sagark@eecs.berkeley.edu, david@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 edgar.iglesias@gmail.com, arikalo@wavecomp.com, mst@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3a893408-e864-cb3b-d86c-b6cf7b50cc39@redhat.com>
Date: Fri, 26 Jul 2019 11:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123667210.66446@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 11/15] memory: Single byte
 swap along the I/O path
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
X-List-Received-Date: Fri, 26 Jul 2019 09:27:03 -0000

On 26/07/19 08:47, tony.nguyen@bt.com wrote:
> +        op = SIZE_MEMOP(size);
> +        if (need_bswap(big_endian)) {
> +            op ^= MO_BSWAP;
> +        }

And this has the same issue as the first version.  It should be

	op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);

and everything should work.  If it doesn't (and indeed it doesn't :)) it
means you have bugs somewhere else.

Paolo

