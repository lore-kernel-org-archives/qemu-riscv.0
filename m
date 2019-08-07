Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdc-0006Nm-PA
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46492)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvJOu-00085b-Qr
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvJOl-0003r0-HG
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:42:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvJOh-0003mx-Nn
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 06:42:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so81293215wms.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 03:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RK6l3NcbPdkNrqzfgxFAPB3AcnYTmuMm/yEayizkoGM=;
 b=qoF5IUYiBNxvPpDt9qILdGO0rRAvSy9Tul15MRgsTzi5vg5x+znflNhBa6eN1im1KJ
 mUfsJIODYA/WsIP2DJWht5AW+vz6EhPYgv0Dzog23OrK8LpB+AObefsmWMsq+Hv2KPJk
 eQNvKGZ7B2z/4X4d597scJfYtCwGP5VKSOYwCfiYfQIXvFGSVduEV1rpeKCeAU5NYDyj
 ofiup+eEaXdm5XASfiWkaEeYW+H2r8TUd5BkWSQMG/64mFJyDepoThT3GT/Mtwp6PfJV
 630qJOsFzKfPffv8KgbxcXDA2ZYvw/pB+pRkDjGuNx0H8X01E5tn8ewpxODuP9RDMxy9
 eSMQ==
X-Gm-Message-State: APjAAAW9z251nMkhnDklcHtia+LZ1qPmbv5wpqJDKuRJHHfJVdhUrv33
 m/7f2UAoRSVR7ku0O3kEGmXuqw==
X-Google-Smtp-Source: APXvYqy9hj4IVv4iNb7hdS8YWvrZpBE1Hrpzca1t19wjkLc7WPMgYH2QNsu2RpzXYBzClduT/WHecQ==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr10171537wmi.38.1565174542531; 
 Wed, 07 Aug 2019 03:42:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id c3sm92411304wrx.19.2019.08.07.03.42.19
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:42:21 -0700 (PDT)
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
 <1565166668830.25608@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <962f4d91-c1c4-7e97-5297-11c546d823f0@redhat.com>
Date: Wed, 7 Aug 2019 12:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166668830.25608@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 15/26] build: Correct
 non-common common-obj-* to obj-*
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
X-List-Received-Date: Wed, 07 Aug 2019 10:42:37 -0000

On 07/08/19 10:31, tony.nguyen@bt.com wrote:
> Preparation for replacing device_endian with MemOp.
> 
> Device realizing code with MemorRegionOps endianness as
> DEVICE_NATIVE_ENDIAN is not common code.
> 
> Corrected devices were identified by making the declaration of
> DEVICE_NATIVE_ENDIAN conditional upon NEED_CPU_H and then listing
> what failed to compile.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>

The general approach makes sense.  However, most of these should not be
DEVICE_NATIVE_ENDIAN.  I can help with some of them.

Paolo

