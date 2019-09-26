Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDVgq-0006WS-Mp
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 11:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDVgm-0006Nz-7x
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 11:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDVgj-0000Gg-M7
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 11:28:15 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDVgi-0000Fb-M1
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 11:28:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id f22so3050359wmc.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Sep 2019 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=4wK0RZCTcEazdzPAKObyHDNw9KgRIqAnCbP1QCI6pJU=;
 b=NPHz2nzhMFscJMnlOomR8c3ft92PoUYNDLe8y/JGVm22q+5V+VOSruw2e+uGYhF3nF
 Q+m0g+MKRGrp1nGO0tjC/gj0WGRn6t8kTvidVZwRGY+YSaarz5NFYD0REQyybzelyYkN
 xwRIBLujNfEDY0dWkC3ezTPY3fdWfwO1WzWmIH5lKqJqxMGIlCAkmRQjQW7RU9s2gL6G
 BRuAt7O2wjle5tPUpxj4N6A+I3aM0z2tcLmC+4xbT0a8KDpIVNJB9nTMqbv+uEaU+4hA
 JiYlOyMUmXc67TOoauoROMO/WPmklP1XM3EPg1oV844aHK3MR/N5fFtJdcNsz0JLLex0
 uhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=4wK0RZCTcEazdzPAKObyHDNw9KgRIqAnCbP1QCI6pJU=;
 b=VuSBks8hQPzdFj7k8UztwQnpBdpYFQbhK8lWApMwxHPsqsb+xAjS/k39dhDPDl6ZvK
 sv2OZ5d8m0gaPiLqoTen2XPJcig3vjdeYo8WPRnpjbgwJUYX7vfgbT2KX3hHCQknpUa9
 Gvf8/m6xvoEpk/jCG3C9V5P2fboBuLZPmPJI6gamDWAUBmgQekpGchfJzmZI27BUD1XK
 IzQdkmLox2++xUCBJTNRz84zhfENFrO62pm5mCtLXHUfb4gcDete4a80galZwacrWc46
 qBQllryX8oKw334Wrfd11fpEv2ouwYojcU7ReCZlsAj5o9JaP7RJ5AtcuRm30kVU4bP/
 oWaA==
X-Gm-Message-State: APjAAAUIGdHqCmI59w/bE+3mcJ8f9W/3AReWDUUboeQpnthSwvlgGAuW
 sGLSKoVV3aQDELFPwsAKRy03yA==
X-Google-Smtp-Source: APXvYqxbq9iIGB4kbgtDZPGi+PeG7zmAJHODiExH79+6Vw46D7HyhQbrgN7XqZmyrzprF5VzuH28DA==
X-Received: by 2002:a1c:980e:: with SMTP id a14mr3315727wme.99.1569511630427; 
 Thu, 26 Sep 2019 08:27:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q192sm5033836wme.23.2019.09.26.08.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:27:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D81D21FF87;
 Thu, 26 Sep 2019 16:27:08 +0100 (BST)
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <0a2c56da-173e-2abd-de76-e38a649e8f25@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-discuss@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
In-reply-to: <0a2c56da-173e-2abd-de76-e38a649e8f25@redhat.com>
Date: Thu, 26 Sep 2019 16:27:08 +0100
Message-ID: <87ef039iyb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
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
X-List-Received-Date: Thu, 26 Sep 2019 15:28:19 -0000


Thomas Huth <thuth@redhat.com> writes:

> On 26/09/2019 01.30, Alex Benn=C3=A9e wrote:
>> The 32 bit hosts are already a second class citizen especially with
>> support for running 64 bit guests under TCG. We are also limited by
>> testing as actual working 32 bit machines are getting quite rare in
>> developers personal menageries. For TCG supporting newer types like
>> Int128 is a lot harder with 32 bit calling conventions compared to
>> their larger bit sized cousins. Fundamentally address space is the
>> most useful thing for the translator to have even for a 32 bit guest a
>> 32 bit host is quite constrained.
>>
>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>> ILP32 doesn't make much sense given the address space QEMU needs to
>> manage.
>>
>> Lets mark these machines as deprecated so we can have the wailing and
>> gnashing of teeth now and look to actually dropping the support in a
>> couple of cycles.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  configure | 24 +++++++++++++-----------
>>  1 file changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 542f6aea3f..776fd460b5 100755
>> --- a/configure
>> +++ b/configure
>> @@ -728,7 +728,7 @@ ARCH=3D
>>  # Normalise host CPU name and set ARCH.
>>  # Note that this case should only have supported host CPUs, not guests.
>>  case "$cpu" in
>> -  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
>> +  ppc64|s390|s390x|sparc64|riscv64)
>
> I think you can also remove "s390". "s390" is the 32-bit variant,
> "s390x" is the 64-bit variant.
>
>>      supported_cpu=3D"yes"
>>    ;;
>>    ppc64le)
>> @@ -737,7 +737,6 @@ case "$cpu" in
>>    ;;
>>    i386|i486|i586|i686|i86pc|BePC)
>>      cpu=3D"i386"
>> -    supported_cpu=3D"yes"
>>    ;;
>>    x86_64|amd64)
>>      cpu=3D"x86_64"
>> @@ -745,19 +744,22 @@ case "$cpu" in
>>    ;;
>>    armv*b|armv*l|arm)
>>      cpu=3D"arm"
>> -    supported_cpu=3D"yes"
>>    ;;
>>    aarch64)
>>      cpu=3D"aarch64"
>>      supported_cpu=3D"yes"
>>    ;;
>> -  mips*)
>> +  mips64*)
>>      cpu=3D"mips"
>>      supported_cpu=3D"yes"
>>    ;;
>> +  mips*)
>> +    cpu=3D"mips"
>> +  ;;
>>    sparc|sun4[cdmuv])
>>      cpu=3D"sparc"
>> -    supported_cpu=3D"yes"
>> +  ;;
>> +  x32|riscv32)
>
> You forgot to add "ppc" (and "s390") here.
>
>>    ;;
>>    *)
>>      # This will result in either an error or falling back to TCI later
>> @@ -6438,12 +6440,12 @@ if test "$supported_cpu" =3D "no"; then
>>      echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE REL=
EASES!"
>>      echo
>>      echo "CPU host architecture $cpu support is not currently maintaine=
d."
>> -    echo "The QEMU project intends to remove support for this host CPU =
in"
>> -    echo "a future release if nobody volunteers to maintain it and to"
>> -    echo "provide a build host for our continuous integration setup."
>> -    echo "configure has succeeded and you can continue to build, but"
>> -    echo "if you care about QEMU on this platform you should contact"
>> -    echo "us upstream at qemu-devel@nongnu.org."
>> +    echo "The QEMU project intends to remove support for all 32 bit hos=
t"
>> +    echo "CPUs in a future release. 64 bit hosts will need a volunteer"
>> +    echo "to maintain it and to provide a build host for our continuous"
>> +    echo "integration setup. configure has succeeded and you can contin=
ue"
>> +    echo "to build, but if you care about QEMU on this platform you"
>> +    echo "should contact us upstream at qemu-devel@nongnu.org."
>>  fi
>>
>>  if test "$supported_os" =3D "no"; then
>
> In case this gets accepted, we also might want to deprecate the
> qemu-system-i386, qemu-system-arm and qemu-system-ppc targets, since
> they are AFAIK just a subset of qemu-system-x86_64, qemu-system-aarch64
> and qemu-system-ppc64. But that's likely something for a later patch, I
> think.

Yes this is purely for the host side. I'm not intending to deprecate any
guest support.

>
>  Thomas


--
Alex Benn=C3=A9e

