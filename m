Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvQbO-0006r8-CG
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 14:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38145)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQbM-0006py-6X
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 14:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQbK-0003tY-VI
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 14:23:56 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:32829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvQbK-0003qV-LY
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 14:23:54 -0400
Received: by mail-pl1-x643.google.com with SMTP id c14so41936502plo.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
 b=Sfk5+alwu1VCU0qrulKu6QmaIsYdKxIU7Gg69SUf6UnahW78yEvPIcfLCY4kSDNXMq
 f4WymZm+Doh+AICi8mIVzgHEDU0rk9qd7RKt04rG8f+IhrZsp8Bf49iJNYEBZ3PN1lu8
 WMZp7duBLer60rzUM5QJpc44UkEmKYH3GCppCxHQYJJFjopiEku84fRjo83FdwueRLYl
 IMxR4+iqzD0yqZSMsGwkNYKbg2rwyP6LSkwZRHkL3azdqJ0J5NePyNBVYiojjJM5pB2i
 Pk7TEOzV5+PlvYyiEd4k+Q2XlHH+0AqyvWllLRUz9wgva39L6j9er0haVzJ57gmopyCP
 puQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
 b=TGk/lDm53Qm7CyMWE15dcSjSrKlI7XonnGpnRMeVIoZ0DWqOeE2a6q2X3ngrcA91Cm
 +V0/mB5u02RfYkDrkDL94Tm6oVC+o+SmZVb3npEQDydf/Ed4PtRRdK2b3oxafaRgZm5Z
 RApO2CTMzapkpT00Z3zxGVRp5orQK4RYizP31Y15BXdfqQZw55Jqr/yfnQVWe6yk5HFZ
 NPVb/FYo6Gvcw3WQ7zhLAEkHGFIjXs56oVbnPhKVV+IZW3nLNYvViA26LHvBtS83agsm
 qStT6wghzPWbu+sbaj1MfmCPt6oRXLL8gkHv0yN0Aq/xJw034wRTFxz2YpP5faK4FTFf
 Lz8A==
X-Gm-Message-State: APjAAAUDLxHI4ZxqN4/Zp4xWf668rQIKetzl9x8IY11hqiXM6QM61ZJy
 iNYlcrpCmyouUil31iihvamRqA==
X-Google-Smtp-Source: APXvYqxDnUiT2rafpEFrD9HngKcg+IeotfqUm0tJV4yP2eo54JFJv3aC6EECEHSGCSIObNhiKzxfzA==
X-Received: by 2002:a17:90a:a404:: with SMTP id
 y4mr1264188pjp.58.1565202233346; 
 Wed, 07 Aug 2019 11:23:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h14sm121761477pfq.22.2019.08.07.11.23.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:23:52 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
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
 <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <92720e5e-5bb9-a4be-a652-39e710071db1@linaro.org>
Date: Wed, 7 Aug 2019 11:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Wed, 07 Aug 2019 18:23:57 -0000

On 8/7/19 11:00 AM, Paolo Bonzini wrote:
> On 07/08/19 19:49, Richard Henderson wrote:
>> On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
>>> @@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>>          /* As length is under guest control, handle illegal values. */
>>>          return;
>>>      }
>>> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>>                                   MEMTXATTRS_UNSPECIFIED);
>>>  }
>>
>> Here is an example of where Paolo is quite right -- you cannot simply add MO_TE
>> via size_memop().  In patch 22 we see
>>
>>> @@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>>          val = pci_get_byte(buf);
>>>          break;
>>>      case 2:
>>> -        val = cpu_to_le16(pci_get_word(buf));
>>> +        val = pci_get_word(buf);
>>>          break;
>>>      case 4:
>>> -        val = cpu_to_le32(pci_get_long(buf));
>>> +        val = pci_get_long(buf);
>>>          break;
>>>      default:
>>>          /* As length is under guest control, handle illegal values. */
>>>          return;
>>>      }
>>> -    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>>                                   MEMTXATTRS_UNSPECIFIED);
>>
>> This is a little-endian store -- MO_LE not MO_TE.
> 
> Or leave the switch statement aside and request host endianness.  Either
> is fine.

The goal is to minimize the number of places and the number of times that
bswaps happen.  That's why I think pushing the cpu_to_le16 into
memory_region_dispatch_write is a good thing.

However, leaving a host-endian might be the easiest short-term solution for the
more complicated cases.  It also seems like a way to split the patch further if
we think that's desirable.


r~

