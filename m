Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOHe-0002T1-O2
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60839)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOHb-0002Qo-TI
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOHa-00048A-Ju
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:55:23 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOHa-000474-6V
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:55:22 -0400
Received: by mail-pl1-x644.google.com with SMTP id b7so41502018pls.6
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
 b=rjJA277UKjGXhHdTw07ZfW3C5Mn6ZbEDCyfEzYhzyY5Fa6hqywzzPHsfVqhjmsY1xd
 swUGLSFFlIfDfAfMlqMngfwVZO6uXvboimYFhSbZ2cmSQSMK6PClDl/OID2BpXOt13Pd
 U2cOUPTWvLOpP7nh5Xeo9afmgoeSdlhfEFRUqA71QsbwvshALi+Qzfk0g/enc95E4z7h
 i5tdWDwKeM4+P1UwQwPHD2IUFy4X6tQQB312FSE/2X0v0sHI0VNQdcTK41kBrmdl49eh
 MulrE+5MtbI4z8k+ssVC20xJJ9kiczTOLWOvAXbhyjkgBmI8VDQ9JuzBl/kEiyyUub+i
 HQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
 b=MVa+M84BtQECLaGhZvvqWgNvPUtZ7yX72lga3C/W95Zt29RLIuYYeVfoDyAkoybEx3
 jJ9vCVi+MJtZTTvTbdW/pENej2X9DCJpvdvdVGLrKU+Ggo5NNE0GKx2al5FVwUwzrgWj
 fEU78u65iw5mwben38vgZgjbBfXq38USw+YxKK2pIPEE77fSzeBIc/QaY3UTAkQngfI/
 +Rt9F7YEIIUnq4kXbZURFOlxy0A6GoZtC4UIFrhwGwZrmF1DplntjMLM569bpCzT058u
 +DWoIt4t3+8wd4MWfCd9LOCIbFAqAMyObt0Gl+1NgQPz5mURezwNzG2sPNBYtNR8AUFK
 xbdQ==
X-Gm-Message-State: APjAAAWQSlW22exBW/yvh7mVRIGUivW5Ry1U1PPma9d6vk9sv2zKGd/I
 RGRTvkG/ecD4cRH8EpuybJI5gQ==
X-Google-Smtp-Source: APXvYqwIO3zpV1oWn1WTT9oo13fQBavOvrIiC2GODyL0n0Zg2Nz8i5QgHeaYS7+9K7WlPGsK/Ms0Lw==
X-Received: by 2002:a17:902:8d92:: with SMTP id
 v18mr8949359plo.211.1565193321031; 
 Wed, 07 Aug 2019 08:55:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm98279530pfo.138.2019.08.07.08.55.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:55:20 -0700 (PDT)
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
 <1565166687895.25037@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <28cf72ed-7a4e-668f-40ca-71a2c7fbeca5@linaro.org>
Date: Wed, 7 Aug 2019 08:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166687895.25037@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 16/26] exec: Map
 device_endian onto MemOp
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
X-List-Received-Date: Wed, 07 Aug 2019 15:55:25 -0000

On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
> Preparation to replace device_endian with MemOp.
> 
> Mapping device_endian onto MemOp limits behaviour changes to this
> relatively smaller patch.
> 
> The next patch will replace all device_endian usages with the
> equivalent MemOp. That patch will be large but have no behaviour
> changes.
> 
> A subsequent patch will then delete unused device_endian.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/char/serial.c          | 18 ++++++------------
>  include/exec/cpu-common.h | 10 +++++++---
>  2 files changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

