Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOM7-0007lf-9d
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 12:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36623)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOM4-0007iu-F0
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOM3-00032k-CU
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:00:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOM3-00031K-4q
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:59:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id c14so41381083plo.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LwmhxqlWLO0c3ADquMqkcSBhFu0xrziYI9uK0rfmer0=;
 b=exzhypAxNEb3jr5uqvNMqBOBGhDoLriOuid+FPpCzaq38W2aku/y/TgGNIzUHrD2Uu
 Ll0UujFTLbXOJuZnp330vk25sIwDxBn+a/x5JI6EqGwVA6bUxKqjOQdLlKj5SsU+FETH
 gFPpaxv0EqsWc4PmIJzRDQh8MPXA+ga9auZ87YmFVsIKga0d0P+mA8/U1KEqKuq1FlKn
 V0EhRjdbIPareXjlKkivJ2UM9qgF9Zf2DgOvKqWeVhSVDo6TNYNskpG574l3HtS1HhZ1
 75624pq+xQPeB+FqmHUafHU2GN06qU3yRHuNqvdR6AMNoG0MYN7LAmmOyuCtreXGzfuY
 b/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LwmhxqlWLO0c3ADquMqkcSBhFu0xrziYI9uK0rfmer0=;
 b=B3Yv2nqEzLCjt7QxIG45EIbMrC5nipgCyzVUIKJI07HapmrkibZ7DdiYfXuS3yJwpV
 zqlLCXrEaNFWCn7L+1/kUaJo/ihAvvNabPUi4YnmOfSZHkZnuFAl20lSbQxrbp7nHTHD
 yvPA3VoroaNmkIQms4tQ3QgeFzjngV9Uv9jRiU2WKcKt8M5RpKeDesWysCquXqWEHeZr
 GnquqQ5dnxtmevMwrvKGuR8jLEUjjZOWgLv+AhCIIhZYzDk8KFuOKv978UtYJV/ZA7s9
 7fPnFHiaFBOFIYw78tWuoJyiiREmGRS1YI9JNZOg7Dfb1fbc+3ZSsriqjc5NwHD62HRU
 CflQ==
X-Gm-Message-State: APjAAAV3ARgQ/G9P8g8IJFCVEPQhKqJ56wXFVeppKHHYWpbEjmyHxZ/N
 J9aZfQKAJhUXma4zVN28Af2R1Q==
X-Google-Smtp-Source: APXvYqzZfClUUXKK0fiyq+vOcmEZ8OmFCKBP/Mp3+WhQktP5pDfCqZeaOGRpV1YNgSzn4XKKFrksSQ==
X-Received: by 2002:aa7:8651:: with SMTP id a17mr9985240pfo.138.1565193597931; 
 Wed, 07 Aug 2019 08:59:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p20sm132453086pgj.47.2019.08.07.08.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:59:57 -0700 (PDT)
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
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Date: Wed, 7 Aug 2019 08:59:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166687895.25037@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::630
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
X-List-Received-Date: Wed, 07 Aug 2019 16:00:01 -0000

On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
> +                          &serial_mm_ops[end == DEVICE_LITTLE_ENDIAN ? 0 : 1],

This is of course "end != DEVICE_LITTLE_ENDIAN".


r~

