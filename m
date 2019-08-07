Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvNkb-0000PQ-WA
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNTo-0005K0-O8
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNTn-0007j5-Gj
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:03:56 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38355)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvNTn-0007hb-93
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:03:55 -0400
Received: by mail-pl1-x642.google.com with SMTP id m12so2632739plt.5
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
 b=m9hc/ZPvf0oKc2ofnxDXra2HBXylt4M9/iWEUE7A5+da5UzFcS1Z34iSyHOVMpgboZ
 /zuam3ye+iOLSDNyFXcXzCUY8t+9fHGeYqEYkwBXawuqvSSKS8sGizofeh5fhFc/+9T3
 gIj6f2kpuUao/ZW7UIO1wQ0fARYx41FxM3/++1o6dxqc67PoB6Qqt6Dp2ZxjF/eH0lxb
 OK+rLmcul5O7v32jpHVyLKV76RdtM+OvM4r/CcbUtL0k33qf7zDlg9AFBWhZ96Rnl337
 m2W6aRjhJreJhSDt9gG+YToZ+oArpXUp/c74GgjRbP4ERag95UU5rT52M3BbogifA7FL
 itOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
 b=D5hcY3Jp9Qlj70wmlJmQVNIUIARvSW+7RGtvDsZcnxinLNuOV2Z7t3Mddl+sI5D+BU
 vNjLEvXlzWnkQCy6Cnlu5KrLlDxBZntH8CV9gKM7UBGc4sxViDzgRrEbcJZWc3VIafiE
 u/hQsCqX1/OZOqZenunr4WEit3Ee7c9TPp1yHArXDkftwVbE6CdXwJa+uNiOobEoHyPN
 Gx+f/KZ4Iy7PZ45fDYVHKm146sXXeAR2PknjsGqcSK1n9TBhcJ1pTLUVnhD8SDgqvg7l
 Gdx+Gzox04s+l+HjEPHdp+VyvLRglGJifQFciRbsax0/CqyPhHpV2e+t6kXCfV1liOgv
 LKlA==
X-Gm-Message-State: APjAAAWSEKEcQRwaTyLwV5/yIM+xshcFN9qbjCzfjBGVdS2wS/OyNNro
 vdkosnNGP8mtGL+eSlU7QtOlUQ==
X-Google-Smtp-Source: APXvYqyAOIfGUzAREqA7EGLNEB0s/1IU1ofPjQgwemIv4dsGo32q9YA/L1lnNFbdY00miSOuTPKNbQ==
X-Received: by 2002:a62:ac11:: with SMTP id v17mr9765690pfe.236.1565190234054; 
 Wed, 07 Aug 2019 08:03:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a128sm104461852pfb.185.2019.08.07.08.03.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:03:53 -0700 (PDT)
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
 <1565166771281.2734@bt.com> <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b0906e2-0d51-7de4-c99e-8d2e1af62efe@linaro.org>
Date: Wed, 7 Aug 2019 08:03:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-Mailman-Approved-At: Wed, 07 Aug 2019 11:21:17 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 19/26] exec: Delete
 DEVICE_HOST_ENDIAN
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
X-List-Received-Date: Wed, 07 Aug 2019 15:03:58 -0000

On 8/7/19 3:22 AM, Paolo Bonzini wrote:
> On 07/08/19 10:32, tony.nguyen@bt.com wrote:
>> +#if defined(HOST_WORDS_BIGENDIAN)
>> +    .endianness = MO_BE,
>> +#else
>> +    .endianness = MO_LE,
>> +#endif
> 
> Host endianness is just 0, isn't it?

Yes.  Just leaving a comment to that effect here for the one use is probably
sufficient.


r~

