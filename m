Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gdgfJ-0000fH-PQ
	for mharc-qemu-riscv@gnu.org; Sun, 30 Dec 2018 14:22:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gdgfH-0000eM-ET
	for qemu-riscv@nongnu.org; Sun, 30 Dec 2018 14:22:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gdgfG-0002It-Ow
	for qemu-riscv@nongnu.org; Sun, 30 Dec 2018 14:22:23 -0500
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:33070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gdgfG-0002II-Ka
	for qemu-riscv@nongnu.org; Sun, 30 Dec 2018 14:22:22 -0500
Received: by mail-ua1-x941.google.com with SMTP id t8so8213735uap.0
	for <qemu-riscv@nongnu.org>; Sun, 30 Dec 2018 11:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Cf76ZvcyyScr5GEqqEh2/KmXBfcCmmSTuN6DWtKhjM=;
	b=YPE4AtUg7Ll2WdVBVwZvs1WbtGI3Yn29tv9uPBoBRNezhORf7b8YUoGzX9pDYLW8xZ
	bkPicsxcqU+ytIrv1XiZu/KSvvYsFznVxy2JNcdwSlnLvtpRXKnF7bkbwq95eChmTbmL
	Jp2AhqVxKJVBf0+zDOKqaFEXoAQIBPGCqAPqNj5WNiEKHaTeOMrZFpULEpWlu6/uflM6
	oJ/jc3HaO8p70ZilNSz/GcsYEwdVWLUlophF26wLu8aOy0A6gYm88t2nSRymPaSXBqIy
	7XxwKGN3i4a+SjJAR+TARVHeNXOwg9uNQiscczGPRsI3vxAwW2zRHN2EwSw5Dad9oAjm
	0J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Cf76ZvcyyScr5GEqqEh2/KmXBfcCmmSTuN6DWtKhjM=;
	b=abnMZhb2vdsD3+Hj8VpLWPcEvuNC8/LY4tunCocVinM5xTZEe6qThjeM0V8MubWIwR
	ZuQ1M35R2Xj7MzxKwoY0BtVk96qOocPiUQysH2weeFQThJfSwNxC3kVSGGCqLHjp6upD
	FXjca3PA9sfZXvj9q+zIY2hDQ0rrcD1dsL3D05MuzyrVD/fBNzecxZUrGTVV1V6DjLpC
	86+umuit09sMgBMboEXWhQRlNj5xiA3HeJLnnbvU595Xyioord8QsVVQgXSh3wQRIfmz
	iWMYfndUwgC7BGbj/xk8hEsdgUtzqOhDreTmjelnHQjLyAcJfM9fNUR0RxDkDXKxv7Rh
	M6gQ==
X-Gm-Message-State: AJcUukdpnrZV4jcJJ4NLWA9ghmeMF1L4JPs51e1gKeCWr8pCD8J53Ybl
	fA2Wwdp3GWmUhBu3K1PdLIEJEUqUI3vedBciRuucHA==
X-Google-Smtp-Source: ALg8bN7L9Elg710z3nN4XZ7Eb4vmmjM2QH1dvzu+x2xWKCUT9Jv+sI7D8LFMo+GOx62lrHnu7oDw7y9MTZ02g9eCa/A=
X-Received: by 2002:a9f:35f1:: with SMTP id u46mr13429747uad.136.1546197741415;
	Sun, 30 Dec 2018 11:22:21 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220951.4962-1-jimw@sifive.com>
	<f3e26863-4624-2c8f-5a9d-f3e76b7e6f0e@linaro.org>
In-Reply-To: <f3e26863-4624-2c8f-5a9d-f3e76b7e6f0e@linaro.org>
From: Jim Wilson <jimw@sifive.com>
Date: Sun, 30 Dec 2018 11:22:10 -0800
Message-ID: <CAFyWVaYnSCDnX7j3XugT8zMw-wC=EdXiEJevb1pJkvzfD_qfGg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 3/5 v2] RISC-V: Map gdb CSR
 reg numbers to hw reg numbers.
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
X-List-Received-Date: Sun, 30 Dec 2018 19:22:24 -0000

On Sat, Dec 29, 2018 at 2:23 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 12/29/18 9:09 AM, Jim Wilson wrote:
> > +int csr_register_map[] = {
>
> static const?

If I add static const here, then I get a build error if this patch is
applied to the tree but the following patch #5 that uses the variable
is not applied.  Though I suppose I could fix that if I put the static
const in patch 5.  That would look a little funny but would work.

> Putting an initialized variable in a header file doesn't seem right.  Is this
> supposed to be a declaration that is shared between c files?

I did it this way for two reasons.  It makes it easier to keep the
register mapping consistent with the gdb csr file, if the gdb csr file
happens to change in the future.  We can just do a line by line
comparison of the gdb csr file against the csr-map.h file to verify
that the csr names match.  And it makes for a cleaner patch if the gdb
csr file register numbering gets fixed in the future, in that case we
can just delete this file and change a few lines to stop using this
variable.

This variable is only meant to be used in one file, the
target/riscv/gdbstubs.c file.

Jim

