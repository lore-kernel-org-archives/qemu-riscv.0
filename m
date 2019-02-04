Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqaCS-0003mo-2Z
	for mharc-qemu-riscv@gnu.org; Mon, 04 Feb 2019 04:05:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqaCN-0003ke-8h
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 04:05:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqaCM-0002x7-8Z
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 04:05:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gqaCJ-0002sp-Tg; Mon, 04 Feb 2019 04:05:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F86A1326AA;
	Mon,  4 Feb 2019 09:05:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-5.ams2.redhat.com [10.36.117.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 887ED8BA8D;
	Mon,  4 Feb 2019 09:05:43 +0000 (UTC)
To: Palmer Dabbelt <palmer@sifive.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <mhng-99c129ef-4e70-4840-b80f-7b3c6b806083@palmer-si-x1c4>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <01c75f94-26ae-ffa4-dd46-4dd019702fa0@redhat.com>
Date: Mon, 4 Feb 2019 10:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mhng-99c129ef-4e70-4840-b80f-7b3c6b806083@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Feb 2019 09:05:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.2,
 Part 3
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
X-List-Received-Date: Mon, 04 Feb 2019 09:05:54 -0000

On 2019-02-02 09:41, Palmer Dabbelt wrote:
> On Thu, 31 Jan 2019 01:51:52 PST (-0800), Peter Maydell wrote:
>> On Thu, 31 Jan 2019 at 06:39, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 2019-01-30 20:01, Palmer Dabbelt wrote:
>>> > On Wed, 30 Jan 2019 09:45:33 PST (-0800), eblake@redhat.com wrote:
>>> >> On 1/30/19 11:35 AM, Palmer Dabbelt wrote:
>>> >>> The following changes since commit
>>> >>> 5385a5988c8a55bebdc878c05b96648579b5d6e0:
>>> >>>
>>> >>>=C2=A0=C2=A0 hw/virtio/virtio-balloon: zero-initialize the
>>> virtio_balloon_config
>>> >>> struct (2019-01-21 17:20:36 +0000)
>>> >>>
>>> >>> are available in the Git repository at:
>>> >>>
>>> >>>=C2=A0=C2=A0 git://github.com/palmer-dabbelt/qemu.git
>>> >>> tags/riscv-for-master-3.2-part3
>>> >>>
>>> >>> for you to fetch changes up to
>>> 461ab9de46d085a37b0da6f096aadc4e0dda4d4c:
>>> >>>
>>> >>>=C2=A0=C2=A0 target/riscv: fix counter-enable checks in ctr() (201=
9-01-29
>>> >>> 11:33:38 -0800)
>>> >>>
>>> >>> ----------------------------------------------------------------
>>> >>> RISC-V Patches for 3.2, Part 3
>>> >>
>>> >> There is no 3.2 release; the next release is named 4.0.=C2=A0 Howe=
ver,
>>> if you
>>> >> don't want to bother with sending a v2 pull request just to fix th=
e
>>> >> merge commit message, that's okay with me.
>>> >
>>> > Ah, sorry.=C2=A0 I think I'm just going to leave it as is, I'll get=
 it
>>> right
>>> > next time.
>>>
>>> Also note that you used "PR RFC" in the title ... so not sure whether
>>> Peter's scripts will catch this PR as a valid one...
>>
>> My mail filter finds these RFC pullrequests, yes. I'm then
>> relying on my manual brain to not actually apply them.
>> (If it's a slow day I might do a test merge on them, but
>> usually my queue is full enough that I don't get to them
>> before the real PR appears.)
>=20
> Ah, OK -- do you want me to do something else?

At least I got a little bit confused by "PR RFC" ... I think some other
maintainers rather send out patch series marked with "PATCH" first, and
add some non-pull-request cover letter with a text like "I'm intending
to send a pull request for this soon, please review one more time...".
Then after a day or two, once Patchew checked the series and nobody else
complained, they send a real "PULL" request.
(at least that's how I saw the handling on the mailing list in the past,
not sure whether Peter has a different point of view here, though).

 Thomas

