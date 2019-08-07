Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOSu-00078b-2Y
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 12:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOSo-00074Q-2r
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:07:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOSl-0004bk-R7
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:06:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOSk-0004Xm-Bc
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:06:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id m12so2882246plt.5
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=BO7jbmlKDGnmlVwJmKWpYGu5SzuK5OHVlaXrkA/URamXOvPNdz5i9VL4nijoJaodKb
 dBmxAjVjIPrBV0v+f4UtFAEDLm7vG2ee5xgC/nx9forbO/73E5hOFrL+fyteD/tSRWpm
 SxH+rHiWUkXv62yj5kZEehx89ae8+sV1R3zIuH0S0taDYZTUCEDve3u5X5GjTiWkhALQ
 ROoRVqEuegZBEEVzcJJ0kiI/jd6ubTgbGSFTlP1WhZ+6nybVROugiGBMQU2+UmSju6az
 iRxMbr8fgGyzmZFnG/t/73sXpNiEYgwBiCUlMp46lnVkKEOmlpGgp519W68+Hlbq1xsU
 Bhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=m4JtHXnjmDNFGSDe3FvM9znePB23pXm+tiRjOT3Bzh6vqSphgsaL0fzUyxYiExR9SP
 MagpVyW8QX3VbxrQxvblQzFeqyLN9ZCtrBoHa+ATmVPLMgYGoOjM7GG3w7OKzfmEIDST
 G2sOoC/ACyGAyFxRJmDcxkcQPjyrA/MU6DFwD/qo6XkpvpiNHAkx6CZf0OKOlSGx4wz9
 jCh7ZqVsj2+nX77/15uLih7noepp941IKhLyS6bhFRXlF/EaR+ghSVg87XoVoyHpVu7e
 SB7kJP3BWlvDjy6UAxtu6Mlj6FzJyow54nho/uH0BkDlr3WpMVberiR9Wap0s9vssku6
 nt9Q==
X-Gm-Message-State: APjAAAVhnWgrZOKAi9f+qeBuhTJB5v30tUvGX+2kM7/dPuSkz0VlrykN
 /rUx8I6j5Yq/jbg/ou+KGOiHCw==
X-Google-Smtp-Source: APXvYqzKuDCIJn1srmeieaPi42oYx/ffxFAs1Ng06KJDLBUrxHZmY3i9IH2yaR+JOggoBNqXpR5eDQ==
X-Received: by 2002:a63:1455:: with SMTP id 21mr8320380pgu.116.1565194012775; 
 Wed, 07 Aug 2019 09:06:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s43sm387653pjb.10.2019.08.07.09.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
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
 <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <82ad9758-4afb-251d-383b-802c59b48d6a@linaro.org>
Date: Wed, 7 Aug 2019 09:06:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62b
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
X-List-Received-Date: Wed, 07 Aug 2019 16:07:02 -0000

On 8/7/19 8:59 AM, Richard Henderson wrote:
> On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
>> +                          &serial_mm_ops[end == DEVICE_LITTLE_ENDIAN ? 0 : 1],
> 
> This is of course "end != DEVICE_LITTLE_ENDIAN".

And by that I mean drop the ?: operator.


r~


