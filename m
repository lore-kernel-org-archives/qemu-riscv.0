Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6H2u-0001n5-Gt
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i6H2q-0001dt-1N
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i6H2n-00073q-KJ
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:25:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41202)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i6H2n-00072x-Az
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:25:05 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D897D7FDFA
 for <qemu-riscv@nongnu.org>; Fri,  6 Sep 2019 16:25:03 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id n3so1092825wmf.3
 for <qemu-riscv@nongnu.org>; Fri, 06 Sep 2019 09:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/n7rfOXa0Gr0vTe+0rtKUocHOJlwWpwosmHm6nE4ZQ8=;
 b=LBhkCHUgUph6oggGBYCS5CqLvAYeRmZRz7swvWw8dkUeJITpq0Pz+rltQjHD0Zhw5G
 DwaMwKyn33cQiQywfPOetnxbYGSiKsIDfzQVz5azxScb2LNmYzDH2g7VQgGal7jztFjl
 Q74SdotyLM0jvmUiQEAWRulIjGiLNsHBFT2zKS8S7/6nzJne4elJDVvTDIDgX7kCMNIc
 k6yEiYrRC+WZFCCQIxp6vA+qs3BbsED6mIU2dYjWVWJU4czUlHzR4SHZ8ZQymp5zjjVG
 Wdps/Y2VIfezdvZcAzD8NVh0NNS8u5kYd1vOe/+TsHVtk01j51sSjGc0wVbqu/g9+uM2
 ywXw==
X-Gm-Message-State: APjAAAWN3ajI6YHKJBuhuumY2oB/bThxQLR1LurLOlEbuhBxmyXA7lfk
 SEp46GPzOt64o0hFPmB0f4KEMB8gU2HWR7ZUqpfjegdKDEUxvnwaHutkYc7u7MdJxhNF32TCPdJ
 Fw29es9besHHa0XM=
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr7385279wmj.37.1567787102306;
 Fri, 06 Sep 2019 09:25:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoFOX642wyvgRl1YEWYNWuRIqF3JmxKa04qyRUCtKEfiaxSKa6uiXWNKmCVzeFz3OfuyaGOw==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr7385266wmj.37.1567787102146;
 Fri, 06 Sep 2019 09:25:02 -0700 (PDT)
Received: from [192.168.1.48] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id e30sm8817196wra.48.2019.09.06.09.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 09:25:01 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
 <1567786819-22142-10-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f6578928-afbb-8441-71ce-ff203775ccd0@redhat.com>
Date: Fri, 6 Sep 2019 18:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1567786819-22142-10-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v8 09/32] riscv: roms: Remove
 executable attribute of opensbi images
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
X-List-Received-Date: Fri, 06 Sep 2019 16:25:10 -0000

On 9/6/19 6:19 PM, Bin Meng wrote:
> Like other binary files, the executable attribute of opensbi images
> should not be set.

Ideally we'd have checkpatch warning for incorrect permissions when
adding blobs under pc-bios/.

>=20
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>=20
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4:
> - new patch to remove executable attribute of opensbi images
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin
>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 =3D> 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bi=
n
>  mode change 100755 =3D> 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jum=
p.bin
>  mode change 100755 =3D> 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bi=
n
>=20
> diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi=
-riscv32-virt-fw_jump.bin
> old mode 100755
> new mode 100644
> diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/ope=
nsbi-riscv64-sifive_u-fw_jump.bin
> old mode 100755
> new mode 100644
> diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi=
-riscv64-virt-fw_jump.bin
> old mode 100755
> new mode 100644
>=20

