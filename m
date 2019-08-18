Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzHG1-00082U-MY
	for mharc-qemu-riscv@gnu.org; Sun, 18 Aug 2019 05:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzHFt-000818-01
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 05:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzHFo-0003mc-Kg
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 05:13:40 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzHFo-0003lu-Ag
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 05:13:36 -0400
Received: by mail-wr1-x442.google.com with SMTP id s18so5621762wrn.1
 for <qemu-riscv@nongnu.org>; Sun, 18 Aug 2019 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
 b=c4moUhMktTQM2REJR3Kcvd9R3Y3KbtNUkR2Xkmm19hB5a7iUHB9KfzaHvOOwR7fOQ4
 PdCVC/1lHi09tEPQJN52Tj3oxl4vtX6SFjQHt51h5dQQLuNOsivYsti+z4orzwNOUXZe
 T+WEI3E1iPcWB4sOHtD1K7IReWiE3Oc/KfYqFaLuUck5j8jnHRsLcdGXn9/0XoV6K8sD
 9p1wj8n4iSAV+rOGUX5RBK7kMAD/HVgDjrIQRUBc16/ADf2e52ozi9QrVChaun7K/Z15
 7mVZz5iifK7lius9LzxXoBM3OUa1tsFtsyMKjrLbC4CxDliOx8150Jy9eq4+/XEteiFM
 XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
 b=dC31ZqXS2b1cAAXhgC36hS98WI9nDfuU2E8j5Zts+9DiaLOlyMlveDYK1H+nUzZBS4
 W0hrCYy9IABcDBpVxplub3J3MqclVOen569zWfbmkXnYZ3gdyXx67O+/Vc7wiFHvpoil
 XAVO/h5TVvBsZoGEIQ3tm8lnw+zhFkPbLoT33W6UFat8CEwZi4wBP+HjNBgrbvjBpKwA
 TSvC2mnjHAtwadNz5ZluQbn9lg7GsBCwvBswnw8Kaa2FECOX1QMzdCqCgv2Gj7uZgiFq
 RT5Dk3RZFt/95enTpdBHxV6U8GmtA2dWQyZwpHbZXK6Q7ijEaFgqEBIroFWKq3hsYVTK
 6+bg==
X-Gm-Message-State: APjAAAUxE21NBlgjCIN0e5sVzwKNJHM4XB/mwjwVp1nD0j8hlb8FU1R6
 0wHAE45as3L6KpT8VuQPG4YXRg==
X-Google-Smtp-Source: APXvYqx8mpO+txpXVJos3FkBAMd7w2U/VbzwDL8sGtDlgK3w1mDE1haj1s2PxyiYa+Ysj6ypriit0Q==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr20563632wrj.66.1566119614901; 
 Sun, 18 Aug 2019 02:13:34 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id k9sm9410852wrq.15.2019.08.18.02.13.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 02:13:33 -0700 (PDT)
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
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b53bdb6b-278e-7359-8cfb-48d8d07adc1f@linaro.org>
Date: Sun, 18 Aug 2019 10:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
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
X-List-Received-Date: Sun, 18 Aug 2019 09:13:43 -0000

On 8/16/19 7:28 AM, tony.nguyen@bt.com wrote:
> Tony Nguyen (42):
>   configure: Define TARGET_ALIGNED_ONLY in configure
>   tcg: TCGMemOp is now accelerator independent MemOp
>   memory: Introduce size_memop
>   target/mips: Access MemoryRegion with MemOp
>   hw/s390x: Access MemoryRegion with MemOp
>   hw/intc/armv7m_nic: Access MemoryRegion with MemOp
>   hw/virtio: Access MemoryRegion with MemOp
>   hw/vfio: Access MemoryRegion with MemOp
>   exec: Access MemoryRegion with MemOp
>   cputlb: Access MemoryRegion with MemOp
>   memory: Access MemoryRegion with MemOp
>   hw/s390x: Hard code size with MO_{8|16|32|64}
>   target/mips: Hard code size with MO_{8|16|32|64}
>   exec: Hard code size with MO_{8|16|32|64}

I have queued these 14 patches to tcg-next:

  https://github.com/rth7680/qemu/tree/tcg-next

I agree with the downthread conversation with Phil that the middle device
patches should be split out to a different series.

I have some questions on some of the last few patches, and I don't know how
they would interact cherry-picking from those, so I've left them for now.

I had some trouble applying your patches, as they're encoded quoted-printable,
and "git am" doesn't like that.  If possible, please use "git send-email" to
post your next patch set.


r~

