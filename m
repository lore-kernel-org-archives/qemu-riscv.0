Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOAD-0005IQ-41
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOA8-0005Gi-TR
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOA6-0007i1-Rh
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:47:40 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOA6-0007gy-Km
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:47:38 -0400
Received: by mail-pl1-x643.google.com with SMTP id b7so41472379pls.6
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N5Bp3ItJAXMZdVduIZ4v6R1Z3VWXw1mBqjlslk24EpM=;
 b=DRHlOVERoqejgaH+XVNqMExp9Yi5VP74jjZRFO+Yd3nUrcgwbzUd2bl4qdA/VhiQRW
 9vqatYvv+CBBoJN6xUFds9wG4DoNUaNYP6c7Z0LC+cNzPDCIg1NxpPZmwuquEFX7axUl
 mDd3RpSio5xbh+nvn/n4kgvn6Kt+bKcsgWsi4Vy7/uJ3uIGCVQRmu48WzLIW7q/N4Mju
 Eddaf93rlbpUI5Xgu/y/Q2LNYx8NuOxjlsbmrISMtcHKS01x/3OxUEN3+0rz4W/tnxRQ
 trSLeuGrIcIA9QloY/1wflMPAseDOM/Dsm43xfJck4jbuYlEjn/nbRu6tx7Ekp0YOkw1
 /6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N5Bp3ItJAXMZdVduIZ4v6R1Z3VWXw1mBqjlslk24EpM=;
 b=eUI7SxCZK9mDIoh7TKWp6n7r9UU1lXGut35ywz0ioJynIEib8i0d2hYdfRbBAOZkX2
 qEry/h+5ZWQyeY4Iqow8lNyR7cOMQcVN8spvP3bXJd4pkPGioQP43fX9yiq4AYUWGeD+
 W3jsNDs/3Qc4U96WVt3orHiQLhoSky+M1It3x0bT67Rj8FxQjn34vDAYpm/niAb9ymc2
 12W04qP/B3pWjIfC8Xj+r3uwNGfn30+8b3bGHxBnTRYi7lkXxfakQcahi0slWJnc88Ic
 SzUBtS/cUTor4pECI/wws7pYe5lE8zMtdtig4VmDA59r1FkvLkq0CJqGhMkFD1KzosV6
 011g==
X-Gm-Message-State: APjAAAXBCj62yeit3Tx+/zMdCUTpHhSzh9eMJrhcYQKmrF7AngULXuJl
 Ql9vnD3am9B8NL3QBbI2tDrWxQ==
X-Google-Smtp-Source: APXvYqyy2WcqvpYE99wqqW2WE5wx1J+xpxofJfHqFYLpjpHSmNvDWfUsRgUrJZGdGyfCyhIHXUgQkQ==
X-Received: by 2002:a17:902:8d97:: with SMTP id
 v23mr8562456plo.157.1565192857454; 
 Wed, 07 Aug 2019 08:47:37 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 64sm93650185pfe.128.2019.08.07.08.47.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:47:36 -0700 (PDT)
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
 <1565166604452.72353@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <96720b42-741f-5161-3344-c146fe184de3@linaro.org>
Date: Wed, 7 Aug 2019 08:47:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166604452.72353@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code
 size with MO_{8|16|32|64}
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
X-List-Received-Date: Wed, 07 Aug 2019 15:47:42 -0000

On 8/7/19 1:30 AM, tony.nguyen@bt.com wrote:
> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with
> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/s390x/s390-pci-inst.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



