Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOjO-0000pn-Ls
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 12:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOjM-0000ko-Bv
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOjL-0005bg-Ac
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:24:04 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOjL-0005aj-31
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:24:03 -0400
Received: by mail-pl1-x641.google.com with SMTP id a93so41495706pla.7
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
 b=y0bRoBWsit3vYVWoy2IIyQk2NlSE9Whdckg2ww8rJWfzkOyqG34pue44La9x5ZZXWM
 qrQe/8ZUXeINHn01gTY+5T2q4i8qP8tGe/+c7uVc1nZntD7ApW8gWrsaOHVqaigbYFXq
 zz7aLv6I2zYmeG5Jv/EtpA7A2X1U5ftBtkok6NKqk/4GZgVsklw8N6uD0f3eETNB86xK
 Slx0/+AvvMaK9/r3UPLrfytNDzazCOsPMzugsLRpTNma7avbpR0/5ZnWL0IPFj1rAD9i
 uSTrIk9RTgXOESR9qRVIFIsh1YOgv9PGBfO3EBPtzIVvFbU87YFURq+XJmUikprQhf70
 axPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
 b=IIK8Zh1XomMq2435VmpufDpu5INYIc6WxI/1z+HAySMW9HBJePwf4VZoc4eZBid2Zt
 qI4fbI56OUYSfP1KVM+GKMmVc/tIU/JU5gqbnyh7QJ/fmkPTop3NVchyZoau9IWjkN3t
 jRukeFWAciyDMIt6Bvbs4Ej4isZjOdNWN8ZuMiDdrnlL/5EyCJuHKLFOmCNs4iq4zaAq
 aydP3VtbDq2Gx8wnwKD4d18ZE/s2CvuYUbXJKHYWyrQLU4UpG7NDYX3Kwsef8adULauP
 G55TwWz6dq0yFvYN1PEQwLKv5/wJaitnt64BTr2bu6ZqKAfQL+aNGa3pxxSVxFKHw0bh
 3sRQ==
X-Gm-Message-State: APjAAAUJZxfymYMEZgv0tAK+epGh9chTlEqagYIChxUeL6QAjizHRYfZ
 wYyCpzd4tOk4o7NkMEnTvWC98g==
X-Google-Smtp-Source: APXvYqzGXsQ8gfFJWMfJ6Wvw945mfh1EAHw+jqqHuUYS5VC5Evf2TyBzsxToaNuHhVuyolzFfmcvtA==
X-Received: by 2002:a63:e901:: with SMTP id i1mr8256677pgh.451.1565195042061; 
 Wed, 07 Aug 2019 09:24:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id j5sm107874000pfi.104.2019.08.07.09.23.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:24:01 -0700 (PDT)
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
 <1565166747494.26346@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5afaa158-e9a4-96c5-841a-e4ffc041b35d@linaro.org>
Date: Wed, 7 Aug 2019 09:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166747494.26346@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 18/26] exec: Delete
 device_endian
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
X-List-Received-Date: Wed, 07 Aug 2019 16:24:05 -0000

On 8/7/19 1:32 AM, tony.nguyen@bt.com wrote:
> device_endian has been made redundant by MemOp.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/cpu-common.h | 8 --------
>  1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


