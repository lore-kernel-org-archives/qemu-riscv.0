Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOj5-0000Bk-2d
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 12:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41373)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOj3-0000BA-9S
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOj2-0005Fm-1E
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:23:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOj1-0005ER-Ok
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:23:43 -0400
Received: by mail-pl1-x630.google.com with SMTP id m9so41406941pls.8
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4apiCbiHeuX0AenKySgOMQa0zMkcp3aC9oI0N5dnMd0=;
 b=fSGMVc3CoPP+9MOYEXHyAwcORIXCCmaq7Nv6zcjo7HCIoK9K5iXXo+aVsOLWsfAE63
 kxNtr2NbOaya47/3XOLszH+MtxslXA6ls+xJcJTAd8kgM10Aof4+kB0N8rd7Jky78pTX
 HXhKVXiH6fLv841k26QbqIfg37n4iX1yfuNbu/2R6YSEzZAd18uOTawnvnSMe+dQEEzE
 2WT+b7XLe9VSEDwMZXM250ASOtxmEKs8q746H9gWQlgNXv9pqNItEhJtRMHZaEL04Tfk
 VJNrU4jXaJpGUZnBE+pY8Kt3VcZA5MPmNrXfb/PprwGqWrd/BOMWXua3bLTFF5FOiomg
 xDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4apiCbiHeuX0AenKySgOMQa0zMkcp3aC9oI0N5dnMd0=;
 b=iaPdZ3HuSPqT/Pv88gK0/Y9NhDLUeRVDYm8J2LzAKZAXwMD2vTYtsnd4IUoOyyXAu+
 Y4H08i0wiE9s0ERDGZrDUmtFgEhVcr4nAwTQr0LUnS3OT+/rRWLw8fA6A/OSLRnj1Vfk
 xebgSKk2wqI0HfgO4dzXJsddh3iOkpg5xwwOCV1ylkoB0UHIJV3UGVAn8Ai6vMm9MtOi
 3uEUTssR2k2QrYwGyYrtRawwOUeH3yegyhehooeYok9SXojdA6J45Ngubwxv/zrGAei1
 QzgJ1LV3jJ2nVDWe47w6wFRgoSoX0R0NJDb3iNdIWFcSrAwU1ExNYxb1t6CxLuxlsDHB
 zUkA==
X-Gm-Message-State: APjAAAV5iRzVtA893h56zFN5mDvQr/TGP52Fbz6HHmy5HXTtiLESopWz
 R446KVD+5HnoGe4IzwRUFgkYIw==
X-Google-Smtp-Source: APXvYqwDnK8/bYyxH+UVEZz17ysgwghpMF9hOWob3p6ybRQ0JVOaW65tPejEu01/JP+CoD/QM4ciOQ==
X-Received: by 2002:a63:f94c:: with SMTP id q12mr8342553pgk.10.1565195022628; 
 Wed, 07 Aug 2019 09:23:42 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i124sm171005832pfe.61.2019.08.07.09.23.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:23:41 -0700 (PDT)
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
 <1565166709139.77390@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3de18435-b9fd-24d1-1352-d1086ea224a1@linaro.org>
Date: Wed, 7 Aug 2019 09:23:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166709139.77390@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::630
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 17/26] exec: Replace
 device_endian with MemOp
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
X-List-Received-Date: Wed, 07 Aug 2019 16:23:46 -0000

On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
> Simplify endianness comparisons with consistent use of the more
> expressive MemOp.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


