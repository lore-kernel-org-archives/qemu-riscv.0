Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvO1U-0007qT-F3
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvO1S-0007mB-94
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvO1R-0001dH-1g
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:38:42 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35927)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvO1Q-0001bV-OV
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:38:40 -0400
Received: by mail-pl1-x642.google.com with SMTP id k8so41395617plt.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
 b=i93jK2k/eEXh/s5xW1NmBkmQdMpYgRueUNEoEdJA6BS31ztY69Nyq37PzB8JWgF/lB
 N2QggwEh+vXbE8yDZPdhbPCNs0FbqBNCaZg+W6bSfQYwPvAobo5VaiN/W5YbNrMvxcD1
 hv+UI9zNGPrqr5SBmpb9h3Vw2jWsRSwKHReaK94/BuxPBGUg0+4921bA++dX8FzcktRa
 owHMylkON/p9jPIv0+CHmH8QDPZHix4j35wdxNDV6Z4vJAcRX3VANUvcgnh4qsslStCu
 o85HUpzh9lFKIsWqFwfELJx1tnvDB9unjbM51K9ehFFBvtfGg5d+N/pBvBa/srZCdjLH
 u6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
 b=YqYbnb8kUfE2GMBxiXaSihgUrzqFzinhNW8XRmUVaQwh72YxUuDcaDCQE9t6RNF+qh
 gov980A1MsizaRu2G6vZB+V/QdYhzHDbgpMAEpuIr4qJ3uRlf6F7olD1Oy0QE3ow/VmH
 bC6JjFYQxGF3Efc7Apbg9j5ufFrbfNsADE3U65RRbal5XyT+fcKY5j+24spvZRu3iFpV
 jUIswZwudp5NCqeRvp4Bba2TKT2ziXtSvKaC1y1lamOrvBHc1gp7DRi7nqP/PySZiBJD
 u8IdZl1Zm82Eim+2Q06WOe/dd1CTdh8LrUYWvqT4/wxPsz6TUQW8De4/8VBQH7ZB5csy
 y7Yg==
X-Gm-Message-State: APjAAAXT8TqsSHYBJehhvv0vg3LPV6Ah5wSY1+RIxHi3ORkv4mg+EnEL
 Mslf8RRMW+ZH+y23aTnoTWr5gw==
X-Google-Smtp-Source: APXvYqxnVZu0/r8eCA+v13Jb+SQhfMD4VTKhziLeLvCX8Oeim2Ryxf4eL+v3g8JSdPwsPbUuCoe+zw==
X-Received: by 2002:a17:902:7894:: with SMTP id
 q20mr2067641pll.339.1565192318272; 
 Wed, 07 Aug 2019 08:38:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f88sm316107pjg.5.2019.08.07.08.38.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:38:36 -0700 (PDT)
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
 <1565166587275.42474@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <652ad19a-ad54-7854-7d3e-03f1032cba7e@linaro.org>
Date: Wed, 7 Aug 2019 08:38:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166587275.42474@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 11/26] memory: Access
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
X-List-Received-Date: Wed, 07 Aug 2019 15:38:43 -0000

On 8/7/19 1:29 AM, tony.nguyen@bt.com wrote:
> Convert memory_region_dispatch_{read|write} operand "unsigned size"
> into a "MemOp op".
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/memop.h  | 18 +++++++++++++-----
>  include/exec/memory.h |  9 +++++----
>  memory.c              |  7 +++++--
>  3 files changed, 23 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +/* MemOp to size in bytes.  */
> +static inline unsigned memop_size(MemOp op)
> +{
> +    return 1 << ((op) & MO_SIZE);
> +}

s/(op)/op/

This is no longer a macro requiring such things.


r~

