Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzKa7-0000oI-A1
	for mharc-qemu-riscv@gnu.org; Sun, 18 Aug 2019 08:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKa5-0000nb-Ek
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKa4-0003Rt-Bz
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:46:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36585)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzKa4-0003QR-0m
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:46:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id r3so5911429wrt.3
 for <qemu-riscv@nongnu.org>; Sun, 18 Aug 2019 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
 b=NFdyZjYeAZNqNaLC48b0zxqT4ew0cYYqgiA7yrp97QLfmtvO+ZgMF10JEnSzxPt27n
 2gTEmdztH2Z2nIfQrAkbPMNuVh1fIWw9RCjeFBkdCdquJik5n8PLsyHocdtWCV27JyVQ
 QX9hzgFLel3K5xlO29rrs0/AnLhkf1tkhEiNMcC6IJ+uHdc1AHkK4VAfGxoH270aoFiW
 jhPmktd1panEyPf1lhzi30D5LtUGZkTzN5K9ND0UGMARBYZKgYMda93vbqZyFk62bHGC
 6VyaP9AJ0HTezxkZgWUZ8C1eitZedl/FAJbdS4/uRxX4kDPgbeWwcccZjtnmQKty3WVJ
 PLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
 b=TbUonYJ0R4VpVZjV8Yni10b8RlZwCEVtmY4JFRyDPiuJomiQpeMhjb/gtpo55HWaPk
 j2yrpE5wrRUAb4PLipG7TaCJDVWxBb3FVjzGvSTBdwp7dcXQLazFJcELzx1lr3HwzCdE
 KSB9ENvQDPKtyNsB3NGgIXhBQBmpaBL8dNPRaAJQPd4fR7QxphUKzYnYR393vmGdn6gH
 MHnGeTYtb4wRO/6vroWDA5g/e1LUWqlwcJEIAb5HcqL0/y9graUm933sg3hUF6mUZ4/i
 XANzAaXtg0gpAPCHVzQC9q2F9K1yBhvGITcOo9KpfUu9Yd0HU+8mCbF9WcOpziAgpD/Z
 Vu3w==
X-Gm-Message-State: APjAAAUnwixS1/Eh2/AyAHW/kWOUKU9d1Iw1Hy8gNh1SW83sPLyivjIr
 uFBKeo9a03J2/h11L6VLmxn8yA==
X-Google-Smtp-Source: APXvYqxRKFMqLQ6mapF4AYE2P66DlsLoG3YnAiriMHGTZEIR3kbgRt+Iz9YK8++iYKEOelm0ymJakA==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr21186547wrn.197.1566132402599; 
 Sun, 18 Aug 2019 05:46:42 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id o16sm13231720wrp.23.2019.08.18.05.46.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:46:41 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 lersek@redhat.com, jasowang@redhat.com, jiri@resnulli.us,
 ehabkost@redhat.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de,
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org,
 i.mitsyanko@gmail.com, cohuck@redhat.com, philmd@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz,
 marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com,
 david@gibson.dropbear.id.au, xiaoguangrong.eric@gmail.com,
 huth@tuxfamily.org, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941122698.46462@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a8ecb15-e03d-c6fd-e9bd-38b4abc7b316@linaro.org>
Date: Sun, 18 Aug 2019 13:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941122698.46462@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 38/42] memory: Single byte
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
X-List-Received-Date: Sun, 18 Aug 2019 12:46:46 -0000

On 8/16/19 8:38 AM, tony.nguyen@bt.com wrote:
> +static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
>  {
> +    if ((op & MO_BSWAP) != mr->ops->endianness) {
> +        switch (op & MO_SIZE) {

You'll want to use devend_memop() here, as previously discussed.

> @@ -2331,7 +2322,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>      }
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, size_memop(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> @@ -2366,7 +2357,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
>      unsigned i;
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, size_memop(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {

To preserve behaviour it would appear that these need MO_TE.


r~

