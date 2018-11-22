Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPpFQ-0002cz-3C
	for mharc-qemu-riscv@gnu.org; Thu, 22 Nov 2018 08:42:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPkzP-0007wx-DZ
	for qemu-riscv@nongnu.org; Thu, 22 Nov 2018 04:09:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPkzO-0005WG-Gx
	for qemu-riscv@nongnu.org; Thu, 22 Nov 2018 04:09:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPkzG-0005E6-7u; Thu, 22 Nov 2018 04:09:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C95D3300441E;
	Thu, 22 Nov 2018 09:09:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-181.ams2.redhat.com [10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 114FA5C21E;
	Thu, 22 Nov 2018 09:09:16 +0000 (UTC)
To: Palmer Dabbelt <palmer@sifive.com>, philmd@redhat.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <mhng-ce1dc513-eb34-4ace-b3a2-248347025887@palmer-si-x1c4>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <1a6f23a1-fba1-578b-38cb-4274177ee7d5@redhat.com>
Date: Thu, 22 Nov 2018 10:09:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mhng-ce1dc513-eb34-4ace-b3a2-248347025887@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 22 Nov 2018 09:09:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 22 Nov 2018 08:42:23 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.1 1/2] MAINTAINERS: Any
 file with "riscv" in the name is a RISC-V file
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 09:09:36 -0000

On 2018-11-22 02:44, Palmer Dabbelt wrote:
> On Wed, 21 Nov 2018 16:29:09 PST (-0800), philmd@redhat.com wrote:
>> On 22/11/18 0:46, Palmer Dabbelt wrote:
>>> There was a recent thread about unmaintained files in QEMU where it w=
as
>>> noted that a few RISC-V related files had slipped through the pattern=
s
>>> in our MAINTAINERS file entry.=C2=A0 This patch adds some more aggres=
sive
>>> pattern matching in an attempt to rectify this situation.
>>>
>>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>>> ---
>>> =C2=A0 MAINTAINERS | 2 ++
>>> =C2=A0 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 1032406c5607..e89adc81d5d5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -255,6 +255,8 @@ F: target/riscv/
>>> =C2=A0 F: hw/riscv/
>>> =C2=A0 F: include/hw/riscv/
>>> =C2=A0 F: disas/riscv.c
>>> +K: riscv

Please be very careful with the "K:" lines ... you could suddenly end up
being a "maintainer" for files that you did not expect. For example,
after applying your patch, I guess the following commands will tell you
that you're the maintainer of these files:

 script/get_maintainer.pl -f MAINTAINERS
 script/get_maintainer.pl -f qapi/misc.json
 script/get_maintainer.pl -f configure
 ...

For this reason, we've limited the "K:" lines in MAINTAINERS so far to
files that contain the regex "^Subject:", too (so that they only match
patches with the keyword in the subject).

>>> +N: riscv
>>
>> QEMU doesn't support the 'N' tag.
>> I see from the Linux kernel:
>>
>> =C2=A0=C2=A0 N: Files and directories with regex patterns.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N:=C2=A0=C2=A0 [^a-z]tegra=C2=A0=C2=A0=C2=
=A0=C2=A0 all files whose path contains the word tegra
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 One pattern per line.=C2=A0 Multiple N:=
 lines acceptable.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scripts/get_maintainer.pl has different=
 behavior for files that
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 match F: pattern and matches of N: patt=
erns.=C2=A0 By default,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_maintainer will not look at git log=
 history when an F: pattern
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 match occurs.=C2=A0 When an N: match oc=
curs, git log history is used
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to also notify the people that have git=
 commit signatures.
>>
>> Should we add this feature to checkscript?
>=20
> Ah, I didn't check because I just copied this from our Linux entry.=C2=A0
> It's pretty much the core of what I'm trying to do here so if it's easy
> then that'd be great.
>=20
> Unfortunately I don't know how to do so.

Try to export the commits eb90d0855 and bbbe96ed8 from the Linux kernel
git and see whether the patches can be applied to our version of
get_maintainers.pl, too.

 HTH,
  Thomas

