Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOBB-0007Y2-8O
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOB2-0007RP-VR
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOB2-0008Kq-0q
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:48:36 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46500)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOB1-0008KA-QW
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:48:35 -0400
Received: by mail-pl1-x641.google.com with SMTP id c2so41392505plz.13
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=IK+EC8rxSLj6GnhhMqmFSBOePtP4VGVXguG7qL48rfGiQnzRq4ct9g7jz1KwQ+ZFNw
 CTnE50cpiGbWhKHIInyj7AxKpvzUGkGykuEnQgWG2IUbKeaN+ems8FkmPgx8Ex4+kFD1
 tXsycNBHqgk3W/q+TgXl55usAJSoLowUlCU2OM5Tcpx4HYLD9DkQT0JoOSsPf+/CYexH
 EOSw7eT9wff9WPsOs2RP8iAVYrjEOazEnOEHMSWcdNjcEyyqbuRCDO4fapIWJH9RH7NM
 y7JsyIccajdyh5IN5l8M/xTx3F+rCeNU03PdY3Adi3YNmEwkoqo6YHXnsghfPoYxwQT2
 GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=hCyNAT4fdU30qeE3jERZe9NBCkHcvIFp82i9/oZaRwroTLfvu0+rNF2yHSOYO6WLB9
 n78k/BPFtlkAxtHy/qkqMHOKZHJbuQMHwdUpnWq28cYHezqWt4FIKn9CLxkvG8B8SPaa
 JKjBXpd49u+rrhBAjqFB2GnRrauKczbXd8VNs1lVyif+4BCW3lxHuP1xJHlV+8HE58ac
 cMtT4x3Di+K3OdhYABTUW3VP/ggUTZ0Gkss2DXXYVk68qU5LObXBPVciPaoKAzLmKQas
 orOv7paN57hnHtuTnzsYOsuiqo+YyffzlwTyHHJJ+1oHkdDXwqdZ5SLonYtGOLiqIJp1
 A7DQ==
X-Gm-Message-State: APjAAAU4Erzz8AkCD3TWwM/gEI8kABmIZsVHslN5XDtkZvTzTgEqMHBs
 B+yjn6CB2qt76+h5gqnFMZqwTg==
X-Google-Smtp-Source: APXvYqyNog3De3+XAOQ8+7tLtpVuHhFeBrAofS85n6QRADl8JNRs6vEyXF5uH0HNH0kJXkAI1KBdEg==
X-Received: by 2002:a62:5253:: with SMTP id g80mr9900905pfb.179.1565192914835; 
 Wed, 07 Aug 2019 08:48:34 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f14sm10154655pgu.8.2019.08.07.08.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:48:33 -0700 (PDT)
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
 <1565166644883.25395@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bc5dbc6e-c690-35fa-8090-2b695891a02a@linaro.org>
Date: Wed, 7 Aug 2019 08:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166644883.25395@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 14/26] exec: Hard code size
 with MO_{8|16|32|64}
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
X-List-Received-Date: Wed, 07 Aug 2019 15:48:38 -0000

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
>  memory_ldst.inc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



