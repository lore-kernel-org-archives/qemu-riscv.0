Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpqsG-00039i-IQ
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 03:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gpqsE-00037z-9W
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 03:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gpqsC-00045K-Dp
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 03:42:02 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gpqs8-0003m0-Df
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 03:41:58 -0500
Received: by mail-ed1-x534.google.com with SMTP id x30so7423262edx.2
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 00:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=XweveY+2exMin3k7L2xbvtW7dtmR/C0BIlK1Zp8cQ90=;
	b=Mf59uS+3Yo+Jfu23tr3Qa5aikBIg0vOKzJvBGaNzsnjFqE1OwwuPgSCO6qag5NkcCx
	CloPPu3TWB9v4ae3kqA0jbZQolvRd1k+cXwXxUlL2pq0OGbl7QmYA75mHyJQWLbrFMcV
	Vj3ghifcBjcxlTxJ6NZWv+wpqGcNhq0hYyTmUkt6nmVE7Djq5ihEJ+bDA4q1AWGtfKPL
	z1iNoZY/KmzRla/vX7Wf8BZNFfYwI2tOqmbG+rKU9JHRh3pog/Es38zhLzuONXrXIsmP
	jL9N6OokuynKYYfrFSMLILjlHGD/7YQNft57nMHKOkrAsyYaXZcR4hhAjLrqu4le24cn
	DyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=XweveY+2exMin3k7L2xbvtW7dtmR/C0BIlK1Zp8cQ90=;
	b=OM+ZrSgNeYS6n/w9l0yykXLVEz0VeG3ncCvw/15PuOhGJpiLxB3sQQ+DbWPO6doTqp
	3Yws/s7DpE16L7OX3MoAlSSLzdirjfPE3YTGW6jmSP4iMir+OMAvbqLl/mEazvVSryh4
	CIKJ2Pp+AVFvqIYp6s2bLY+k4zsuwF9sbRd02BwyCGSv92MFZn2kYfwwcfy+5kvrTjy0
	FEjpW1TeMQ8BzoMKN4EI9sbnsYfMbi8k5mHmSZlDkpoM5bTGoh5GoIcPgtTF71sAbvIP
	ySnpHbX+fY21kecalpGq1OifpkqUOOTnGoqn1PB9v+4Rimg262iRycs8sQKtTEkTagaP
	S7xw==
X-Gm-Message-State: AJcUukeviRtQMuRi0JBxD5qyOkhk2aN6fcHM1RxrcwqK+8eZEsrUgvfy
	d6Tg+3MEH0Kerr1IkuT+gNfRiA==
X-Google-Smtp-Source: ALg8bN7CSbZOFbeH/bAjcfLm27c7+CVxkiJKeXxC+jOCP1CfG7Dz1UCQVL+2qdLDMRDzepQpcy1fiA==
X-Received: by 2002:a50:ad0b:: with SMTP id y11mr40957423edc.113.1549096903109;
	Sat, 02 Feb 2019 00:41:43 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id
	l17sm2592390edc.56.2019.02.02.00.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 00:41:42 -0800 (PST)
Date: Sat, 02 Feb 2019 00:41:42 -0800 (PST)
X-Google-Original-Date: Sat, 02 Feb 2019 00:40:21 PST (-0800)
In-Reply-To: <547f1afb-cce5-e456-5466-87ba333859b8@redhat.com>
CC: eblake@redhat.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: thuth@redhat.com
Message-ID: <mhng-540aa736-f429-48d0-9823-6f4abe456ffd@palmer-si-x1c4>
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
X-List-Received-Date: Sat, 02 Feb 2019 08:42:03 -0000

On Wed, 30 Jan 2019 22:39:35 PST (-0800), thuth@redhat.com wrote:
> On 2019-01-30 20:01, Palmer Dabbelt wrote:
>> On Wed, 30 Jan 2019 09:45:33 PST (-0800), eblake@redhat.com wrote:
>>> On 1/30/19 11:35 AM, Palmer Dabbelt wrote:
>>>> The following changes since commit
>>>> 5385a5988c8a55bebdc878c05b96648579b5d6e0:
>>>>
>>>>   hw/virtio/virtio-balloon: zero-initialize the virtio_balloon_config
>>>> struct (2019-01-21 17:20:36 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://github.com/palmer-dabbelt/qemu.git
>>>> tags/riscv-for-master-3.2-part3
>>>>
>>>> for you to fetch changes up to 461ab9de46d085a37b0da6f096aadc4e0dda4d4c:
>>>>
>>>>   target/riscv: fix counter-enable checks in ctr() (2019-01-29
>>>> 11:33:38 -0800)
>>>>
>>>> ----------------------------------------------------------------
>>>> RISC-V Patches for 3.2, Part 3
>>>
>>> There is no 3.2 release; the next release is named 4.0.  However, if you
>>> don't want to bother with sending a v2 pull request just to fix the
>>> merge commit message, that's okay with me.
>>
>> Ah, sorry.  I think I'm just going to leave it as is, I'll get it right
>> next time.
>
> Also note that you used "PR RFC" in the title ... so not sure whether
> Peter's scripts will catch this PR as a valid one...

It's actually meant not to: my blow is to send out these as a test to see if 
there's anything wrong, and then if there is to fix it up.  I'm less worried 
about the text of the pull request and more about making sure I didn't screw up 
a patch, which is the only reason I wasn't worried about picking up your 
suggested change.

