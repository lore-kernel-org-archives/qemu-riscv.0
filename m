Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdY-0006CG-HP
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvJKU-00045B-NM
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:38:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvJKT-0001c3-CP
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:38:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvJKT-0001b6-5A
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:38:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id q12so563358wrj.12
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 03:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xGIMuvKiRWGAighMeIoXICvoM84+mSRh6SCMOKg4t50=;
 b=KT6xSuJw0iHWBk7k2e51oVRGsIPNHXfkmNH2umpfI/hnUYRSPsQOdKaNkNP6bRy8WU
 rUA32tfS01VkD7R3nKW4Gf3JXqxQjRjO8ud1Bzd/7PAd1yBSBqh5pfctyl3KXbeNevSS
 k1h6gQyrcf+QJk61Y4Frl+y1884mg7lVC+PcyUmunGHSenLdxik+EBjuosXl+PD1qz/F
 K3ux1xsDkoGC3arbnI2on4urUlV8gTsqQc4nNf+P7hOfkp8lsIXgxy2b44+etYW8eNAI
 s5pMJghiO9W4Qj2rggG+YE9Dxujcr68qegl2NMovMCMvOKedWly4Ehj52h6I/vlnnz5L
 AMUQ==
X-Gm-Message-State: APjAAAWIq1D/gWgAl3iDcOu3w5+muKuU7+q1TQfe1HxWJjfYU3Qq0q/u
 sg1OuXT9Y9/UEIBj7wHqxTAanQ==
X-Google-Smtp-Source: APXvYqy4PVePIQDOvyWhEAtzNmLdItuCVcldRUW9KfALbPXIzDY7t2Ssr5gwLrhAtbji1xjO4Hfrdw==
X-Received: by 2002:adf:f481:: with SMTP id l1mr3615709wro.123.1565174280079; 
 Wed, 07 Aug 2019 03:38:00 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id c187sm4719394wmd.39.2019.08.07.03.37.56
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:37:59 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: rth@twiddle.net, pbonzini@redhat.com, mst@redhat.com,
 imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 xiaoguangrong.eric@gmail.com, alistair@alistair23.me,
 peter.maydell@linaro.org, b.galvani@gmail.com, clg@kaod.org,
 andrew@aj.id.au, joel@jms.id.au, i.mitsyanko@gmail.com, robh@kernel.org,
 peter.chubb@nicta.com.au, sundeep.lkml@gmail.com, jan.kiszka@web.de,
 balrogg@gmail.com, eric.auger@redhat.com, kraxel@redhat.com,
 michael@walle.cc, kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 keith.busch@intel.com, marcandre.lureau@redhat.com,
 Andrew.Baumann@microsoft.com, edgar.iglesias@gmail.com,
 antonynpavlov@gmail.com, chouteau@adacore.com, frederic.konrad@adacore.com,
 huth@tuxfamily.org, mark.cave-ayland@ilande.co.uk, hpoussin@reactos.org,
 arikalo@wavecomp.com, balaton@eik.bme.hu, gxt@mprc.pku.edu.cn,
 david@gibson.dropbear.id.au, deller@gmx.de, ehabkost@redhat.com,
 sstabellini@kernel.org, anthony.perard@citrix.com, paul.durrant@citrix.com,
 aurelien@aurel32.net, amarkovic@wavecomp.com, berto@igalia.com,
 magnus.damm@gmail.com, minyard@acm.org, pburton@wavecomp.com,
 jslaby@suse.cz, jcd@tribudubois.net, andrew.smirnov@gmail.com,
 green@moxielogic.com, jasowang@redhat.com, dmitry.fleytman@gmail.com,
 sw@weilnetz.de, jiri@resnulli.us, crwulff@gmail.com, marex@denx.de,
 lersek@redhat.com, proljc@gmail.com, shorne@gmail.com,
 yuval.shaia@oracle.com, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, walling@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, david@redhat.com,
 fam@euphon.net, hare@suse.com, atar4qemu@gmail.com, stefanb@linux.ibm.com,
 alex.williamson@redhat.com, jcmvbkbc@gmail.com, laurent@vivier.eu,
 stefanha@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
Date: Wed, 7 Aug 2019 12:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
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
X-List-Received-Date: Wed, 07 Aug 2019 10:38:03 -0000

On 8/7/19 10:23 AM, tony.nguyen@bt.com wrote:
[...]
> v3:
> - Like v1, the entire TCGMemOp enum is now MemOp.
> - MemOp target dependant attributes are conditional upon NEED_CPU_H
> 
> v4:
> - Added Paolo Bonzini as include/exec/memop.h maintainer
> 
> v5:
> - Improved commit messages to clarify how interface to access
>   MemoryRegion will be converted from "unsigned size" to "MemOp op".
> - Moved cpu_transaction_failed() MemOp conversion from patch #11 to #9
>   to make review easier.
> 
> v6:
> - Improved commit messages.
> - Include as patch #1 an earlier posted TARGET_ALIGNED_ONLY configure patch.
> - Typeless macro SIZE_MEMOP is now inline.
> - size_memop now includes CONFIG_DEBUG_TCG code.
> - size_memop now also encodes endianness via MO_TE.
> - Reverted size_memop operand "unsigned long" back to "unsigned".
> - Second pass of size_memop to replace no-op place holder with MO_{8|16|32|64}.
> - Delay memory_region_dispatch_{read,write} operand conversion until no-op
>   size_memop is implemented so we have proper typing at all points in between.
> - Fixed bug where not all memory_region_dispatch_{read,write} callers where
>   encoding endianness into the MemOp operand, see patch #20.
> - Fixed bug where not all memory_region_dispatch_{read,write} callers were
>   collapsing their byte swap into adjust_endianness, see patch #20 and #22.
> - Split byte swap collapsing patch (v5 #11) into #21 and #22.
> - Corrected non-common *-common-obj to *-obj.
> - Replaced enum device_endian with MemOp to simplify endianness checks. A
>   straight forward sed but touched *alot* of files. See patch #16 and #17.
> - Deleted enum device_endian.
> - Deleted DEVICE_HOST_ENDIAN definition.
> - Generalized the description of introduced MemTxAttrs attribute byte_swap.

I'm confused I think I already reviewed various patches of your previous
series but don't see my Reviewed-by tags.

