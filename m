Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvQF1-0003ic-K8
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 14:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33109)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvQEz-0003gb-Gb
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 14:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvQEy-0007xs-HO
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 14:00:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvQEy-0007vK-9J
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 14:00:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id t16so2147126wra.6
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 11:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnNcTkcEY3ZbfGxsdEEUpb9QGclJr+HC6jfSpFEWpCc=;
 b=rkt0zPXQaAX55lS1EBZUPS36Q7jCT8lP2DW7wymfLmSHrT+ud2hm7nlliF3YP3up1Q
 pU+tpEBA6A2sIZfCI04dZWjIuqn/T9XRJgX/7ssTjHHbNSEINvJpxf8D9UVQkPhjWkSL
 gRIAfVBN1K2FV84sF/8TpUZAjWKBWlJk3sSd2SejFZu1dWaVVed4i+qtNjNLjB7myeSE
 LG6SoBdJxInl374h8AjwwYbgnTcA3UztMw9bd5RRRCqPxTE7/uybWVSvFaqIXeUXf4AR
 KftAq2L5twFKofbJf/jQwB7bJAhnCMwXNSHmP69tqAF0byKIrdKbwN1bzQLamPgWhyfh
 tr3A==
X-Gm-Message-State: APjAAAUAPfcQQeppE88bYvRa7V92Bgts/zLv+iU+oJ4IycfQkRa1LNm+
 fTSerAcqz4UM7LA25bUhAV9o4A==
X-Google-Smtp-Source: APXvYqyYoV6gvukGjStjYXXYOxG2iT1OUTlYjsb5W/KdyagD9b54ohMavaSsDHFf998uWCLRMeYzRA==
X-Received: by 2002:adf:8bd1:: with SMTP id w17mr12968197wra.50.1565200846958; 
 Wed, 07 Aug 2019 11:00:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id a19sm6155981wra.2.2019.08.07.11.00.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:00:46 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
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
 qemu-riscv@nongnu.org, proljc@gmail.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
 <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
Date: Wed, 7 Aug 2019 20:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
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
X-List-Received-Date: Wed, 07 Aug 2019 18:00:50 -0000

On 07/08/19 19:49, Richard Henderson wrote:
> On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
>> @@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>          /* As length is under guest control, handle illegal values. */
>>          return;
>>      }
>> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>                                   MEMTXATTRS_UNSPECIFIED);
>>  }
> 
> Here is an example of where Paolo is quite right -- you cannot simply add MO_TE
> via size_memop().  In patch 22 we see
> 
>> @@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>          val = pci_get_byte(buf);
>>          break;
>>      case 2:
>> -        val = cpu_to_le16(pci_get_word(buf));
>> +        val = pci_get_word(buf);
>>          break;
>>      case 4:
>> -        val = cpu_to_le32(pci_get_long(buf));
>> +        val = pci_get_long(buf);
>>          break;
>>      default:
>>          /* As length is under guest control, handle illegal values. */
>>          return;
>>      }
>> -    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>                                   MEMTXATTRS_UNSPECIFIED);
> 
> This is a little-endian store -- MO_LE not MO_TE.

Or leave the switch statement aside and request host endianness.  Either
is fine.

Paolo

