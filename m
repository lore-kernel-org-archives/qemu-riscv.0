Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdb-0006Jm-4j
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvLSq-0007gh-Lb
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 08:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvLSp-0001ll-A0
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 08:54:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37262)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvLSo-0001kf-VW
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 08:54:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id f17so79890552wme.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 05:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qxz+qOxxiF4zyH6SFPksO+z9p6DoRe1NfIyM1b8xgLo=;
 b=bQtVqxxRVcexb3bCW/umxBdl5O8NtMoXeCb4JZHU08liOqm14ViyQ8HFdY5FHOzZ5G
 SO/E84kqLkE1rCGWlXNQGA5Uw+rAYejfgcaLYs4DQi4GdMYcNtd3mjnRA0wRUdEbZgtF
 yukFxLM1DXcyz7ahKT2Row87i6s4zja3+xv3IK3AE0q8RKqXWZYSBQbYvAPOmdR0lzH9
 cKE5XxV9tw8yuXfcLkp4EPjb5s+nOS0iSQoF6aXtDDKZtUteRCRTLr4vTUPYCyD9fiAA
 QRJ96dVadXit7Ow/Mu//M9FcqyQp0Cqb4nsJtT6++RsfCqtrilIiMxg7fM5U1CLQtO7W
 kBzg==
X-Gm-Message-State: APjAAAXu720usL9dTjJigB0ahgcrKP2kO3bjdR/G4JIKXccc2L6aMrPW
 afYwznssslQD2HwO4CHQIAuFBg==
X-Google-Smtp-Source: APXvYqx61lLaCyYesDNdvwewasVUT/A65a9cVj8wjHg2wQ+UynM0qhk2bBNGpqeZ28ZkTv8fSSNq8A==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr10411525wmc.175.1565182485721; 
 Wed, 07 Aug 2019 05:54:45 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id q18sm113799140wrw.36.2019.08.07.05.54.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 05:54:45 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: rth@twiddle.net, pbonzini@redhat.com, mst@redhat.com,
 imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 xiaoguangrong.eric@gmail.com, alistair@alistair23.me,
 peter.maydell@linaro.org, b.galvani@gmail.com, clg@kaod.org,
 andrew@aj.id.au, joel@jms.id.au, i.mitsyanko@gmail.com, robh@kernel.org,
 peter.chubb@nicta.com.au, sundeep.lkml@gmail.com, jan.kiszka@web.de,
 balrogg@gmail.com, eric.auger@redhat.com, kraxel@redhat.com,
 michael@walle.cc, kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 keith.busch@intel.com, marcandre.lureau@redhat.com,
 Andrew.Baumann@microsoft.com, edgar.iglesias@gmail.com,
 antonynpavlov@gmail.com, chouteau@adacore.com, frederic.konrad@adacore.com,
 huth@tuxfamily.org, mark.cave-ayland@ilande.co.uk, hpoussin@reactos.org,
 arikalo@wavecomp.com, balaton@eik.bme.hu, gxt@mprc.pku.edu.cn,
 david@gibson.dropbear.id.au, deller@gmx.de, ehabkost@redhat.com,
 sstabellini@kernel.org, anthony.perard@citrix.com, paul.durrant@citrix.com,
 aurelien@aurel32.net, amarkovic@wavecomp.com, berto@igalia.com,
 magnus.damm@gmail.com, minyard@acm.org, pburton@wavecomp.com,
 jslaby@suse.cz, jcd@tribudubois.net, andrew.smirnov@gmail.com,
 green@moxielogic.com, jasowang@redhat.com, dmitry.fleytman@gmail.com,
 sw@weilnetz.de, jiri@resnulli.us, crwulff@gmail.com, marex@denx.de,
 lersek@redhat.com, proljc@gmail.com, shorne@gmail.com,
 yuval.shaia@oracle.com, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, walling@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, david@redhat.com,
 fam@euphon.net, hare@suse.com, atar4qemu@gmail.com, stefanb@linux.ibm.com,
 alex.williamson@redhat.com, jcmvbkbc@gmail.com, laurent@vivier.eu,
 stefanha@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
 <1565181666201.26324@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0523c403-bdae-bb5d-8996-20b57cd5d7cf@redhat.com>
Date: Wed, 7 Aug 2019 14:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565181666201.26324@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
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
X-List-Received-Date: Wed, 07 Aug 2019 12:54:49 -0000

On 8/7/19 2:41 PM, tony.nguyen@bt.com wrote:
> On 8/7/19 8:37 PM, Philippe Mathieu-Daudé wrote:
> 
>> I'm confused I think I already reviewed various patches of your previous
> ​> series but don't see my Reviewed-by tags.​>
> Apologies Philippe! I am the confused one here =/
> 
> Will append.
> 
> Thank you very much for the reviews and qemu-devel newbie tips so far. I
> have felt very welcome.

Well for a newbie you did an impressive series!

The 'Reviewed-by' or 'Tested-by' tags help the maintainers to process
patches.

Since reviewing a series is time-consuming, if you iterate over a series
without changing some patchs, you should collect and amend the tags the
reviewers gave you, this way it helps them keep track of patches
reviewed and patches waiting for review.

In my case I find it very confuse when I look at a patch I already gave
my R-b tag and the tag is not here, I re-review the patch looking for
differences.

Often a reviewer asks for easy changes, and uses "with this changes:
R-b". If you addresses his comments you can then add his tag in the next
version.

If you split a reviewed patch in various, it is also OK to keep the tags
in all the splitted patches.

Regards,

Phil.

