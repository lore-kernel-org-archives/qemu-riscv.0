Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvNw8-0007V5-Eo
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55315)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNw1-0007Ja-5L
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNvy-00060Y-Ua
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:33:04 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvNvv-0005yg-VZ
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:33:00 -0400
Received: by mail-pl1-x641.google.com with SMTP id t14so41331642plr.11
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
 b=Pm0ASyo6gkiTF1odBo/wLrQ9b3UHH+oZYk7XYC9NpzMYsKNFRl52Mu4JBUmbB+BDUC
 kugOta70MyufphqLT2e2rAFQlAMXXx/T62QwK4Lw14rDNpI1qgpWJDlfCh16Bp6y9Xel
 mJXUOrkRGAipCUzXVV/qLiOQXqU0vb99giE+3bio6CSDCZhWKUAVmaCeI0UxJJKXjC+4
 vzIDp/gid/yWVx5jKdm6f4cv+zKGh7V2mpFEm3RFp89koj4WSK+bjzIPfZPscO8D7spO
 Im60t3LUpqFn9Bs+C2BATyFHuRB00RprI8qgwMoyfcTuEdki6RVRyD9HwdrAJ5I1yEZ+
 ZO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
 b=mkkPvNJk10mXa33WGeuE2AITg55wCMb+aE03pbBh/fbTG7Mu0Zka1LTG3uLD3qXVrI
 SJOzaMNld02cHYvIkbdxZ96sGabNaX/6b3zWLt9sO56GDmfQp/wi6GA8lpvdsn/munR9
 5tWIxw1PmDOXN60cDSbzkG0UW31tV6Dq/2d5rxIMqNLw+tHebx+4QElYwMMj2yq/+mIp
 EYI4Ofrib8wwEFk113Zab25l5zRvZwk5igMuaTslGvuCBLMoyyUfPRKxxm+2DBvac1+w
 nDl4ncyMFf/Rc+j2yyXJiQxnyxwAtXCqZ1Aue7euEBMi8bd1sRRPIJgi1oWsCaC4MCy3
 rmtg==
X-Gm-Message-State: APjAAAXZalJ304BXYX07AJdUZ3nAcB6r0loZDpOLTjbYMb4gQFMrr6kr
 Vz8RFfrg4bVHc3u7o0c39kwEwA==
X-Google-Smtp-Source: APXvYqxZDmuQ1/uBp64/WjLXtTgxvrI6W4xVriZ8CSJVCoy0a/msLNTPxIMU/toN0D9wtJfEhe90IA==
X-Received: by 2002:a62:64d4:: with SMTP id y203mr9807270pfb.91.1565191977649; 
 Wed, 07 Aug 2019 08:32:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 131sm112852110pfx.57.2019.08.07.08.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:32:56 -0700 (PDT)
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
 <1565166562774.65589@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b1ac6757-94aa-2358-2802-4cb3a3aef1d2@linaro.org>
Date: Wed, 7 Aug 2019 08:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166562774.65589@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 10/26] cputlb: Access
 MemoryRegion with MemOp
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
X-List-Received-Date: Wed, 07 Aug 2019 15:33:07 -0000

On 8/7/19 1:29 AM, tony.nguyen@bt.com wrote:
> The memory_region_dispatch_{read|write} operand "unsigned size" is
> being converted into a "MemOp op".
> 
> Convert interfaces by using no-op size_memop.
> 
> After all interfaces are converted, size_memop will be implemented
> and the memory_region_dispatch_{read|write} operand "unsigned size"
> will be converted into a "MemOp op".
> 
> As size_memop is a no-op, this patch does not change any behaviour.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


