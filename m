Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdh-0006an-KW
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43061)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvJ5a-0003hc-P4
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvJ5Z-00011c-Me
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:22:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvJ5Z-00010x-EK
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:22:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so69073612wmc.4
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0XSyHvDMekjafpUZd/bGO/uyC3MKHMOWHaWq6AQGhdI=;
 b=WhfPJkIvJG2FnJnYPR53P7MEVdg3foum9hFyahdU3YK5tHHCLi4cL1oipY187paIO6
 eeQsvDvyJaPMVQ1bhepGXOo0yOVb+LVqLe78iLCtS04kAAGxOVsHqnlTWYtLrFCSk84O
 84GICY89RKD6f4rFG8KE3mR4Ju1UET40/bIGejBIA7ekKGA89G9WUkBWiegV8PBOH15N
 wkO141LRmmG+uGbou1sHUS0/ENajb0y7IUE7zf63779Wy2b2tK93cqk8nLDUB5lyZ5SA
 /isXzu4Y4nJ9o3pqTch9hdmac4Sascm23Njjnth7LFASJ+bZcxOZ85xKblLS6X4j7dW9
 7MsA==
X-Gm-Message-State: APjAAAVpdsl1vyzEYrpgahAI/ZXnWh683yp0VMqRTxAarZimnLe+v9W6
 bLc3K4Siz2em5wVjB5omimCE5g==
X-Google-Smtp-Source: APXvYqyVdY+KG9VE8VYjZChr/Tap/FiuNTb/CIypvYv6TYC5AN3XTQir8qL5hSYXXEgG+OiXanVDmA==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr9662688wmd.118.1565173356318; 
 Wed, 07 Aug 2019 03:22:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id c15sm12952891wrb.80.2019.08.07.03.22.32
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:22:35 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 lersek@redhat.com, jasowang@redhat.com, jiri@resnulli.us,
 ehabkost@redhat.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com,
 palmer@sifive.com, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
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
 huth@tuxfamily.org, jcd@tribudubois.net, stefanb@linux.ibm.com
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166771281.2734@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
Date: Wed, 7 Aug 2019 12:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166771281.2734@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
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
X-List-Received-Date: Wed, 07 Aug 2019 10:22:39 -0000

On 07/08/19 10:32, tony.nguyen@bt.com wrote:
> +#if defined(HOST_WORDS_BIGENDIAN)
> +    .endianness = MO_BE,
> +#else
> +    .endianness = MO_LE,
> +#endif

Host endianness is just 0, isn't it?

Paolo

