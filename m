Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFvAc-0000bQ-Eu
	for mharc-qemu-riscv@gnu.org; Thu, 03 Oct 2019 03:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iFvAa-0000b8-7R
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 03:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iFvAY-00048z-LY
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 03:04:59 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30586
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iFvAY-00048s-Ic
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 03:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570086298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6ltcGQLZfldS8yXWHTgjtks/bc5B9SoVXaYQ5Gcnwo=;
 b=KKy7W5t+tNTytNDQ72Dj+pXptji5/K5S42y6a6CxTOoL9IRRzkUONkni+x1WpE2cbyBzwC
 QMLiDgMBjLyxsTBaDPZ4TNXD7TuGMyYEiatkVfxLcC19vpfK5p9RqRE2YZsXMEnoYKWdbI
 aWTdpmrUVMB3dDMut4BdMpivEzWWf3g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-h7LtOYx_OAaJpaJgGyk-nA-1; Thu, 03 Oct 2019 03:04:54 -0400
Received: by mail-wm1-f71.google.com with SMTP id o8so731812wmc.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2019 00:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ehvHZDO8kG+zG/2KzYQqnzm1x88Z2sej/c5l+4eo2l4=;
 b=JrUQLQYj3SbyWrM2He29KeIHUqmASt7KUo0vpLMBGqEzHF2BSK3d7dprss6pL2YxiK
 Lzmtsv3viln9mQx9MOnzXB1Cd1MVPu5OTBv9/0rbmL4DdRnyOr4LPGcTuaFS/3D+JLLz
 qiU+Gm83T3i9GxUsoktuxSe4vcinJi+e2MiEHBwhrPuySeXiTHR40ICQlNWx50KRo0HR
 vi8RrAVEdAmTfD7SFCHN1tWKCsgTvMykJvga+7JEMnpAJnHbUiVHbFSXftFEcqE8c/7d
 uNSnOiuCe606Eij5KNbiTHIVkVo0hvwhEgo4agKht7b/gLCZaipvIrtEdkLUEfSAtFL/
 tRVg==
X-Gm-Message-State: APjAAAWNJmdyeKsk8apaEHMohUWs5ZFhP9nYAMWN1UTNlP4IELicS5nX
 iL2q4vecpBLTgs9Prai9tgbNBMe4LeeGkVtpSTelyVBKKuY+yOP91Nh2HEwHULUH9kbGMZB9EUA
 KyHYkQD+puKuYp78=
X-Received: by 2002:adf:eec5:: with SMTP id a5mr1720112wrp.191.1570086292923; 
 Thu, 03 Oct 2019 00:04:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyMkMIF21P9FdlT28VM+54ZAxwp7xiHRhi4Ff1yPBYYGOniGnwlSAlf6AmRK47Sf1TfmWPkA==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr1720094wrp.191.1570086292716; 
 Thu, 03 Oct 2019 00:04:52 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b15sm1557775wmb.28.2019.10.03.00.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2019 00:04:52 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] riscv/boot: Fix possible memory leak
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@sifive.com, bmeng.cn@gmail.com,
 peter.maydell@linaro.org
References: <4cba4d80e570372183b6685a26c72fa3e907bb51.1570051975.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b26817c1-c2ae-6637-1cb2-81187b6682bc@redhat.com>
Date: Thu, 3 Oct 2019 09:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <4cba4d80e570372183b6685a26c72fa3e907bb51.1570051975.git.alistair.francis@wdc.com>
Content-Language: en-US
X-MC-Unique: h7LtOYx_OAaJpaJgGyk-nA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 03 Oct 2019 07:05:01 -0000

On 10/2/19 11:34 PM, Alistair Francis wrote:
> Coverity (CID 1405786) thinks that there is a possible memory leak as
> we don't guarentee that the memory allocatd from riscv_find_firmware()

typos: 'guarantee', 'allocated'

> is freed. This is a false positive, but let's tidy up the code to fix
> the warning.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/boot.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2e92fb0680..7fee98d2f8 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -38,7 +38,7 @@ void riscv_find_and_load_firmware(MachineState *machine=
,
>                                     const char *default_machine_firmware,
>                                     hwaddr firmware_load_addr)
>   {
> -    char *firmware_filename;
> +    char *firmware_filename =3D NULL;
>  =20
>       if (!machine->firmware) {
>           /*
> @@ -70,14 +70,11 @@ void riscv_find_and_load_firmware(MachineState *machi=
ne,
>            * if no -bios option is set without breaking anything.
>            */
>           firmware_filename =3D riscv_find_firmware(default_machine_firmw=
are);
> -    } else {
> -        firmware_filename =3D machine->firmware;
> -        if (strcmp(firmware_filename, "none")) {
> -            firmware_filename =3D riscv_find_firmware(firmware_filename)=
;
> -        }
> +    } else if (strcmp(machine->firmware, "none")) {
> +        firmware_filename =3D riscv_find_firmware(machine->firmware);
>       }
>  =20
> -    if (strcmp(firmware_filename, "none")) {
> +    if (firmware_filename) {
>           /* If not "none" load the firmware */
>           riscv_load_firmware(firmware_filename, firmware_load_addr);
>           g_free(firmware_filename);
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


