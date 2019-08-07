Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdZ-0006FB-Bv
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44125)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvJAb-0006Si-K6
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:27:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvJAa-0004X8-Jy
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:27:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36528)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvJAa-0004WQ-D8
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:27:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id g67so75334754wme.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 03:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/LJjhzk0pzvPz9qFfoMgQKRDTJEZj0sV+l+GJ63ac0c=;
 b=a7f4PdLKYXTYiJOjKPp1SRtXNi4WC1UT5yzZPO6rRtLrKQ5ANfZxjjuFqGgjvofpT+
 4OktOPIZspkj+kufqzq0c5DXEOzWsSf/DN09kXBZGDfW7uOIQql8fAvxEl1lYbHvXzEV
 cHf1m/AHur46DBZk2FYDiDdaGMAzBTnRIalU9u3V2Nb2TBqacdtT2gRt/+Ss+X3Bpw/k
 DbDVN9bKIatVdRKtufoUnh8QTr5uZ4dGhhHm1okpWpyZugPte2vrvnusB6qLSj/45YiQ
 a+eXo0VKHTPeMW1g987KIca4Q3QQrRVNZDtcF+ugOn8EZ5isr+hixhYstmUgKUVclT5W
 ctkQ==
X-Gm-Message-State: APjAAAWE1t+iZQlE3VNrSdDi0KdbkbvyBWa2jFjuDQlaKri8/MX9SWvk
 6JzIcicqgL5jUnIYL/lGXimYyA==
X-Google-Smtp-Source: APXvYqz4iLX1VO1K4HM5uTH5Oz0mkyqdb3kYfynHu7N486VbbAEvU1tohn3vbMZ99+4swNbqoqYynQ==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr4445252wmm.70.1565173667357; 
 Wed, 07 Aug 2019 03:27:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id z25sm93483780wmf.38.2019.08.07.03.27.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:27:46 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 lersek@redhat.com, jasowang@redhat.com, jiri@resnulli.us,
 ehabkost@redhat.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com,
 palmer@sifive.com, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
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
 huth@tuxfamily.org, jcd@tribudubois.net, stefanb@linux.ibm.com
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <089fb8b0-c5ad-00ab-ee85-437b022b54eb@redhat.com>
Date: Wed, 7 Aug 2019 12:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166794966.57397@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 20/26] memory: Access
 MemoryRegion with endianness
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
X-List-Received-Date: Wed, 07 Aug 2019 10:27:50 -0000

On 07/08/19 10:33, tony.nguyen@bt.com wrote:
> +#ifdef NEED_CPU_H
> +    return ctz32(size) | MO_TE;
> +#else
>      return ctz32(size);
> +#endif

Please use two separate functions for this, for example size_to_memop
and target_size_to_memop, or even just add MO_TE to the callers that
need it (only cputlb.c?).

Paolo

