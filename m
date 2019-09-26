Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDODL-00046I-Op
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 03:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDODI-00044h-QK
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 03:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDODG-0004pX-EL
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 03:29:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41928
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDODG-0004oc-BO
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 03:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569482958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=/cGhteoZZJM+vapsRTgKYXtTysqbQNmn8NRXYFFQri8=;
 b=GBd2aZnhw7Xtq4WN+kA5S0iDSoecZ7Cc8595DfSAVGV2Zuqz/Bb7mrV80Ek6qkpwYZ5jF+
 yBFMEzfu2VaGC/ytdfnwb/f6P0mKO3BQKCVn+iyk10ChUWXfZGiDxniGq8lsnlSjjMZrPq
 UnRDtA8QucRga8UOB0Qff+jeHiPwd/w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-ig8FfeaGPkGh3zPFAKPcLg-1; Thu, 26 Sep 2019 03:29:14 -0400
Received: by mail-wr1-f69.google.com with SMTP id a15so561522wrq.4
 for <qemu-riscv@nongnu.org>; Thu, 26 Sep 2019 00:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iDJmicGAl96yidCuawMr1CMMu54lmfAcQ3Il8nPoQpk=;
 b=Jh7HogDLk5JQkMB20jsSYxtvGGiapsZsiebRZqpOl0pDqb+eqMyJxcCjokBkB0OSzT
 NhvJkhlZFomG2zoRmoyp/FDyf258y3UZaMCHiwfjLCH5nK/q+sg7nlxV5FgBQ99iANvt
 QpTNqIPjC3JkO4fD/XqnDscfCHDI1xCUayy0ksyeANSxsmdbDghfYW3mI/+eMYMHUyWg
 1+q/zca8Wis8oy18wnzgMOxt4ClrLJ0RP+RB226V+JxzDohMLKaHVpFmKmwIF/kv91yj
 bXHZi0ta/Kypc4IqQo3crT8eRRhsPDj/ADXiL2Jd58zMLT1anEFIK/LuUhisrogIz2Nh
 z62w==
X-Gm-Message-State: APjAAAXAl2hgsJW13rsX/4z9exAcj9NTaquiWoR0praWW7DBOuAYFp7Q
 dR6fsuEb20VZUn1WQ5on2tJFLfAAUDl76xfGToxyjL7x4PVcVP6rqxycvTmx8Ne/1CcVscs5a4m
 9CkvWM5bOMNQext8=
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr1763100wmb.95.1569482953430; 
 Thu, 26 Sep 2019 00:29:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytWh9o/+F5HwiXhX4OCTQ27hOmu6kO4GRZHJI2D7s1OaF+YcfghSexKpmUXgflgUkJ82HKHw==
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr1763088wmb.95.1569482953208; 
 Thu, 26 Sep 2019 00:29:13 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id o188sm2839780wma.14.2019.09.26.00.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2019 00:29:12 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-discuss@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e08a9d80-a797-76a9-b1e5-6ccbef0b1c37@redhat.com>
Date: Thu, 26 Sep 2019 09:29:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: ig8FfeaGPkGh3zPFAKPcLg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 26 Sep 2019 07:29:22 -0000

On 9/26/19 1:30 AM, Alex Benn=C3=A9e wrote:
> The 32 bit hosts are already a second class citizen especially with
> support for running 64 bit guests under TCG. We are also limited by
> testing as actual working 32 bit machines are getting quite rare in
> developers personal menageries. For TCG supporting newer types like
> Int128 is a lot harder with 32 bit calling conventions compared to
> their larger bit sized cousins. Fundamentally address space is the
> most useful thing for the translator to have even for a 32 bit guest a
> 32 bit host is quite constrained.
>=20
> As far as I'm aware 32 bit KVM users are even less numerous. Even
> ILP32 doesn't make much sense given the address space QEMU needs to
> manage.
>=20
> Lets mark these machines as deprecated so we can have the wailing and
> gnashing of teeth now and look to actually dropping the support in a
> couple of cycles.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/configure b/configure
> index 542f6aea3f..776fd460b5 100755
> --- a/configure
> +++ b/configure
> @@ -728,7 +728,7 @@ ARCH=3D
>  # Normalise host CPU name and set ARCH.
>  # Note that this case should only have supported host CPUs, not guests.
>  case "$cpu" in
> -  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
> +  ppc64|s390|s390x|sparc64|riscv64)
>      supported_cpu=3D"yes"
>    ;;
>    ppc64le)
> @@ -737,7 +737,6 @@ case "$cpu" in
>    ;;
>    i386|i486|i586|i686|i86pc|BePC)
>      cpu=3D"i386"
> -    supported_cpu=3D"yes"
>    ;;
>    x86_64|amd64)
>      cpu=3D"x86_64"
> @@ -745,19 +744,22 @@ case "$cpu" in
>    ;;
>    armv*b|armv*l|arm)
>      cpu=3D"arm"
> -    supported_cpu=3D"yes"

I think linux-user is quite used in embedded stuff such NAS.

Eventually this public don't need edge QEMU, it might keep using QEMU
v5.0.stable until all NAS/embedded devices are 64-bit...

>    ;;
>    aarch64)
>      cpu=3D"aarch64"
>      supported_cpu=3D"yes"
>    ;;
> -  mips*)
> +  mips64*)
>      cpu=3D"mips"
>      supported_cpu=3D"yes"
>    ;;
> +  mips*)
> +    cpu=3D"mips"

Similarly I can imagine linux-user being used on some routers.

> +  ;;
>    sparc|sun4[cdmuv])
>      cpu=3D"sparc"
> -    supported_cpu=3D"yes"
> +  ;;
> +  x32|riscv32)

x32 is borderline :) but yes, pointers are 32-bit.

>    ;;
>    *)
>      # This will result in either an error or falling back to TCI later
> @@ -6438,12 +6440,12 @@ if test "$supported_cpu" =3D "no"; then
>      echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELE=
ASES!"
>      echo
>      echo "CPU host architecture $cpu support is not currently maintained=
."
> -    echo "The QEMU project intends to remove support for this host CPU i=
n"
> -    echo "a future release if nobody volunteers to maintain it and to"
> -    echo "provide a build host for our continuous integration setup."
> -    echo "configure has succeeded and you can continue to build, but"
> -    echo "if you care about QEMU on this platform you should contact"
> -    echo "us upstream at qemu-devel@nongnu.org."
> +    echo "The QEMU project intends to remove support for all 32 bit host=
"
> +    echo "CPUs in a future release. 64 bit hosts will need a volunteer"
> +    echo "to maintain it and to provide a build host for our continuous"
> +    echo "integration setup. configure has succeeded and you can continu=
e"
> +    echo "to build, but if you care about QEMU on this platform you"
> +    echo "should contact us upstream at qemu-devel@nongnu.org."
>  fi
> =20
>  if test "$supported_os" =3D "no"; then
>=20


