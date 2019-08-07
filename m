Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvQ4A-0001CC-LD
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 13:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQ48-0001BI-8f
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQ47-00085R-2v
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:49:36 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46532)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvQ46-00082y-M6
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:49:35 -0400
Received: by mail-pl1-x644.google.com with SMTP id c2so41862893plz.13
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
 b=YSd01dq4KtF6aeZkw5hkDHENoAmzJOdch2P9Xl6k7iJhJOozBH08Xd6X8MdTgN8uFL
 dayMMbNyz7ZSR+VFJ605dDSnaIApm2E3utOwDPHFZ38Ww0Yq2hW49lnxsZfbp4yn6FDL
 WbwqPP7yVik0d0cAAsPPdv9U+Jm1KuDYmSkVnREqiqvjtBwIcUnH5Xc/gl9O6lnkIiYk
 VhL9l6TrN+DQt2wAGnIhc0ENdijp3rUv/YraMyGDu6wMe9x+ZMo7AjxGpCB5GwWDzR8S
 4mEFZrxsfoOHb2BNG7md9SL+3ARxa9EvmllUIzDfD4ZcsqQgw4KkThE7J5q6hLkKOjqW
 ercg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
 b=i4eRIFKcStzjrcmug40IcY7BLfeuwBBaLiqsP42X252TCHEvW3qc0qvl6RZTZHLjZm
 WgO5Fx2bGQoPv+AUdk6Ni7sYWfLPeg2JsvwpiyUGuxdePp0n2WIECRYbRCBNlGdALg+J
 TXIOYTeAxFxYz4sftJUNbFscRzWbtVeWOCOtzle4pJh4HayVyOzCWCEkMsZT/ArajGOT
 ZYK3aLFjr8LVQm+QkPntOS1bwyuPNPXCFCBF5rOecUQi/fCuFqxDWNQJkNyVU5M1v9/E
 pv8Z93AAyKy4r8Q1XXydXBaCEqPIzrBIf9tMNw9mcmulsuhVLQR6lR9gWRwyDsdwzfVr
 RZgg==
X-Gm-Message-State: APjAAAV5McZaA7WGoSpLkUfn5r36BknIYFzzJgFoNCrcFiqrqRCFT27V
 Q3c8fj2PpJ+d0Dzl1w8qXxR/OQ==
X-Google-Smtp-Source: APXvYqxt9kYRUX4/TWB3mOIj77BhJmpABYE2zE095tt7JwCrrSgoc6T05CxabiOshYqLLsydsy93lQ==
X-Received: by 2002:a17:902:6b02:: with SMTP id
 o2mr8483559plk.99.1565200173396; 
 Wed, 07 Aug 2019 10:49:33 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id w1sm489442pjt.30.2019.08.07.10.49.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:49:32 -0700 (PDT)
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
 <1565166794966.57397@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
Date: Wed, 7 Aug 2019 10:49:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166794966.57397@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Wed, 07 Aug 2019 17:49:37 -0000

On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
> @@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>          /* As length is under guest control, handle illegal values. */
>          return;
>      }
> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>                                   MEMTXATTRS_UNSPECIFIED);
>  }

Here is an example of where Paolo is quite right -- you cannot simply add MO_TE
via size_memop().  In patch 22 we see

> @@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>          val = pci_get_byte(buf);
>          break;
>      case 2:
> -        val = cpu_to_le16(pci_get_word(buf));
> +        val = pci_get_word(buf);
>          break;
>      case 4:
> -        val = cpu_to_le32(pci_get_long(buf));
> +        val = pci_get_long(buf);
>          break;
>      default:
>          /* As length is under guest control, handle illegal values. */
>          return;
>      }
> -    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>                                   MEMTXATTRS_UNSPECIFIED);

This is a little-endian store -- MO_LE not MO_TE.


r~

