Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvNu7-0004mu-Hj
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNu0-0004lR-JV
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNtv-0004ox-GS
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:31:00 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38284)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvNts-0004l7-9B
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:30:53 -0400
Received: by mail-pl1-x636.google.com with SMTP id m12so2740880plt.5
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pCpCz+CvOCQ4pr1rksowSTze+rOo02yQPlaBVcHqATE=;
 b=XZ+7YslttNOCrt7toERtmFJPyciz+nlLvKU+YMjuaKFeRqjyiTNJhpHnxCBA656sv5
 bXm9lc6HoVEsiYbeBFc5D1YUYCZ1DL3Mz54Mu7QB1zOf3pQm/CErkxyPK4hFFd/E2VOf
 l3ASNiZQFQVF6qKGV/KonB+hx+5hF+qoIAOsTVl52DCvyeKxpAb/6ha/4FQd5+UTR1r1
 l+Sw1Q+wryV/0jsnRdS19fFEnG9eY5PNMZ3PJb1Noi/QFkqdr1GDxJuPR9JZegDVV1ZA
 ZxOsjL58c+r99JCaLAs0+ab+rWmV7PC/7XE3JCbCWv9G1sRw30q1h4eGIFHWlliDZtIW
 Mc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pCpCz+CvOCQ4pr1rksowSTze+rOo02yQPlaBVcHqATE=;
 b=ON+7J44pZv2arpZJjrVw1/sl5iu9xKkCttAdpVqfqHv1EiSP83XuMrOOFzg1YmrO56
 R6lAd1DceD4EFJibhlUEOoCPy7U1dHIzANvtBSDwK02yRQjd1JK9fhPQU8GtSOWt5Hc3
 DqitUvpjOb5zRMzxICS27mJLcrsGojBg0BQsAaWl9nN122ZUKQLo7uOBty4jEbr75ecK
 jAWbdHDFbSkEp+DvGvBd79N0xb9cryzafsJCLu8Y7IlvHeGkAEppSzBo3mRd3eXsmLku
 +Gwgz0vqAZyaUbMRJx2Bb5106KACTeB11fAnGJUq3SHSw53jil/fWu0nQeWcoeTVTYId
 tN3A==
X-Gm-Message-State: APjAAAVesLq6ud/S4EExCNaarkygLOUPH2YQQvDIrppevsgmkCOBdp6y
 Ek+/tEVjKdWvXkZvsFO+iedRJQ==
X-Google-Smtp-Source: APXvYqyzEKXZhyWbZHS9mUCJhdYcCK08eh017J9JqBLo284jw3umKEd2sQYd69ZxwNR55VZOhXHr6A==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id
 d20mr533420pjw.28.1565191850899; 
 Wed, 07 Aug 2019 08:30:50 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r12sm75560234pgb.73.2019.08.07.08.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:30:50 -0700 (PDT)
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
 <1565166407497.21726@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ebba4aef-c264-53c2-a503-e82219a2df35@linaro.org>
Date: Wed, 7 Aug 2019 08:30:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166407497.21726@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 03/26] memory: Introduce
 size_memop
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
X-List-Received-Date: Wed, 07 Aug 2019 15:31:04 -0000

On 8/7/19 1:26 AM, tony.nguyen@bt.com wrote:
> +/* Size in bytes to MemOp.  */
> +static inline MemOp size_memop(unsigned size)
> +{
> +    /*
> +     * FIXME: No-op to aid conversion of memory_region_dispatch_{read|write}
> +     * "unsigned size" operand into a "MemOp op".
> +     */
> +    return size;
> +}
> +

Return type should remain unsigned until patch 11.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


