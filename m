Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpqsE-00037y-9N
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 03:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gpqsC-00037i-Aw
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 03:42:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gpqs8-0003yY-CV
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 03:41:58 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gpqs4-0003oO-G1
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 03:41:54 -0500
Received: by mail-ed1-x534.google.com with SMTP id h15so7404905edb.4
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 00:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=gzZmf96R0rco9imWTSBwHorvbQIIOMUDDrzwXQOw654=;
	b=asaYOHUAP8PK/kTkq7VtKEZKtyFUSJtM1VT5hHJD1bctUytSp0OgG29eEXiETTGal2
	LM3HoUuATyEYWO/nOqIP7o/Us4aFBGqX0IdHHDAU2Cx/cRmn3HjU3tSF5sHHq4kH3GJO
	abqIKMvuUZ+k6H79Oz2Ouc6ZS1bDEprETw30UPCCy/CEkUvCscsPRXHRs3jqCuIDdMfv
	dZRoBkVx3rqWGnrfWaTlApSvVAth+ra9P14wZ6pGttxzk4AKg+rDDslojZb8YdPpcp8D
	ACOnA2Vuahc+PvRokYWE4JdwbdWN0OrT5f7npT8VIwAtmEmL//9TowCkuGcKAFb5AXKw
	kGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=gzZmf96R0rco9imWTSBwHorvbQIIOMUDDrzwXQOw654=;
	b=R8qDye43LFp8Fg5ZR5H5U2Qhrk5oFGfiuC3HXrJqhnwHcTh8Xl3dnoONzoEyHqPN+V
	yvNv6Sg3Kv0BpKl3b1zNH3enpbxyIBdlL4oCT8719Y76GvYxLqLmYVT6+5SsrMj6y7Hl
	r4WyrPNnY3mKXQK4q3TaNuUps8WYdGXiM9PXRo9uR6cO1KoQPHuElJzM9yOr0wDVunHp
	Bo6DSFDy7JcT3e2aGjiGm37GgjwcmweggLZmVouoepdM9mXTfbOEvyz05xSVpgjOCjr8
	mY0dHuyudbmE+K5L8gLneHvMfKHCUAlkD4Xm2GlsEUpvS0GaQ/RlJdFkgfBmmy7BA/GS
	QA7A==
X-Gm-Message-State: AJcUukfoRTB33kXqHgryBVMSYVZ+t71wxz0FSwYz4NRdusOzzoXxmxUz
	ZOZUGczn/BkBOjetenHiT76sv3kLbFkrJQ==
X-Google-Smtp-Source: ALg8bN5NAnusTn8lcq2ojyZLjc2XVfdyRr0cE4hvhzAIlXnHm9wZmHxF3Gd5CsR4DBbBX3pUOgHM9Q==
X-Received: by 2002:a50:b1af:: with SMTP id m44mr41588605edd.47.1549096904767; 
	Sat, 02 Feb 2019 00:41:44 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id
	e17sm1587027ejb.29.2019.02.02.00.41.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 00:41:44 -0800 (PST)
Date: Sat, 02 Feb 2019 00:41:44 -0800 (PST)
X-Google-Original-Date: Sat, 02 Feb 2019 00:41:32 PST (-0800)
In-Reply-To: <CAFEAcA_hP=iuqWrVoqRjRhge27uC8VOJTjfATj2DMY0Hh5HHxA@mail.gmail.com>
CC: thuth@redhat.com, eblake@redhat.com, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-99c129ef-4e70-4840-b80f-7b3c6b806083@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::534
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
X-List-Received-Date: Sat, 02 Feb 2019 08:42:01 -0000

On Thu, 31 Jan 2019 01:51:52 PST (-0800), Peter Maydell wrote:
> On Thu, 31 Jan 2019 at 06:39, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 2019-01-30 20:01, Palmer Dabbelt wrote:
>> > On Wed, 30 Jan 2019 09:45:33 PST (-0800), eblake@redhat.com wrote:
>> >> On 1/30/19 11:35 AM, Palmer Dabbelt wrote:
>> >>> The following changes since commit
>> >>> 5385a5988c8a55bebdc878c05b96648579b5d6e0:
>> >>>
>> >>>   hw/virtio/virtio-balloon: zero-initialize the virtio_balloon_config
>> >>> struct (2019-01-21 17:20:36 +0000)
>> >>>
>> >>> are available in the Git repository at:
>> >>>
>> >>>   git://github.com/palmer-dabbelt/qemu.git
>> >>> tags/riscv-for-master-3.2-part3
>> >>>
>> >>> for you to fetch changes up to 461ab9de46d085a37b0da6f096aadc4e0dda4d4c:
>> >>>
>> >>>   target/riscv: fix counter-enable checks in ctr() (2019-01-29
>> >>> 11:33:38 -0800)
>> >>>
>> >>> ----------------------------------------------------------------
>> >>> RISC-V Patches for 3.2, Part 3
>> >>
>> >> There is no 3.2 release; the next release is named 4.0.  However, if you
>> >> don't want to bother with sending a v2 pull request just to fix the
>> >> merge commit message, that's okay with me.
>> >
>> > Ah, sorry.  I think I'm just going to leave it as is, I'll get it right
>> > next time.
>>
>> Also note that you used "PR RFC" in the title ... so not sure whether
>> Peter's scripts will catch this PR as a valid one...
>
> My mail filter finds these RFC pullrequests, yes. I'm then
> relying on my manual brain to not actually apply them.
> (If it's a slow day I might do a test merge on them, but
> usually my queue is full enough that I don't get to them
> before the real PR appears.)

Ah, OK -- do you want me to do something else?

