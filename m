Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyXq4-0005my-2c
	for mharc-qemu-riscv@gnu.org; Tue, 26 Feb 2019 03:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gyXq1-0005lb-Uf
	for qemu-riscv@nongnu.org; Tue, 26 Feb 2019 03:11:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gyXq1-0000Ux-9L
	for qemu-riscv@nongnu.org; Tue, 26 Feb 2019 03:11:41 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <amagdy.afifi@gmail.com>)
	id 1gyXpx-0000Sr-Jv; Tue, 26 Feb 2019 03:11:37 -0500
Received: by mail-qk1-x742.google.com with SMTP id z13so7061837qki.2;
	Tue, 26 Feb 2019 00:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q02msDFppbxQrb/byAPFoE1Oj/587Epzxne4eRp2dE0=;
	b=q1CgR2Np8RaS2hBtxOxchkSjz3t1WSDTMmlwiTF/I4dgUr90ZVpSoy93WwbTsWT81G
	JDrVJ7yDVLNzljsNV4fxkB5v8fFFxseKB/Ki8h1KIG8n58KBmrsQJFphhivUpMlO1UKy
	tI08IndzzMG+b+tBaajHnqLTAIoK8NkSqlsXpoUrX8heRnLQXZLUhy4F2N49zaZ7hoja
	4+IPMep048uyiUaENG6bv/bHlFEqhw5dTaLFpUWEidCPiNZDkZaoeIm3nLg8PuWVm7dP
	h4bxRCS1E7A5aY0u7QH387slzAQeZHX63oZ4J8924jd7bxmz8SWH4ZjcUxJ2pon2s446
	Kpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q02msDFppbxQrb/byAPFoE1Oj/587Epzxne4eRp2dE0=;
	b=MuLmqlqyhwQYFE2EGBO6fkV9S2prRTxFVPynMOBFU2d/3zwFmHnqOyO959GXhrt9P7
	0LlYZMF06RmC+4dhXURUUxLnFO7zmdrMROdK5J5FbsDjhct4C9l99OUMDFARD1nK9onC
	+POVBdL0kVeDflIolffrFyz970WhQMPSO81EYmMOF92l56B0HtOFv0cBBmVulDH7JQae
	Z8vK72oz2Z0fTxMGHwTpvnMr958KuFno1Tg5lYHHWXfPmAEoo5hTp/J1HlEIMbpNRaHd
	07xlDG6AMhcWfW2oad0pCNyQptkVx1J/dZ3AO2erSz6c6rzZQHVv7Vq/glJcTocQEIhk
	9MAQ==
X-Gm-Message-State: AHQUAuYcWFjKz0DjKvzhj/dJrTtns2rB8VcZAeUw3OYvWbOCBUwPliv2
	mOIaw4Y4H3gjL7IbQKe11vm2pEduFc4C1qgsSgs=
X-Google-Smtp-Source: AHgI3IYvPrI1rs7Czv5qYBPdAZq10AJ2gSOehHqLOd/9Hmr5SZk/kieJg4SMxVRHvElwxLBYUsC3mZwGcC5Vyh+SKnI=
X-Received: by 2002:a37:b142:: with SMTP id a63mr16081630qkf.16.1551168694109; 
	Tue, 26 Feb 2019 00:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
	<f782bdde-2a42-c612-5769-1cde42e7c2a4@linaro.org>
	<CAKV=O7mWBKQzVJRJT-bGW0Ojvb7eFraGniqG1-qPidZWHtp8Ew@mail.gmail.com>
	<bf134899-fa0b-2a27-dffd-92369805fd50@linaro.org>
	<CAKV=O7n02WMfgmfFqtC9OBgHppPYVO4RXPnKyfU8y872Lnr=zQ@mail.gmail.com>
In-Reply-To: <CAKV=O7n02WMfgmfFqtC9OBgHppPYVO4RXPnKyfU8y872Lnr=zQ@mail.gmail.com>
From: Amed Magdy <amagdy.afifi@gmail.com>
Date: Tue, 26 Feb 2019 10:11:23 +0200
Message-ID: <CAKV=O7nO_7XUt7PEr55BMWxn4SDFGgqjStHsYH9UPDLXu4MpUg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, 
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com, 
	Alistair.Francis@wdc.com
Content-Type: multipart/alternative; boundary="000000000000ffcc020582c79a69"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: Add proper alignment
 check and pending 'C' extension upon misa writes
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
X-List-Received-Date: Tue, 26 Feb 2019 08:11:42 -0000

--000000000000ffcc020582c79a69
Content-Type: text/plain; charset="UTF-8"

>
>
>> > It seems to me that the C extension can be enabled at any point, since
>> if C is
>> > off, you know that the next insn is aligned modulo 4.
>> >
>>
>
>  > Ok, This is mostly right. When C extension is enabled 32-bit base
> instructions can be aligned on 2 bytes boundaries instead of 4 bytes only.
> > So multiple enables and disables of C bit at different code areas
> theoretically may require this check on C extension enable. I'm not really
> >sure, may be this is might not  be a practical use scenario.
>

 This paragraph considers the current implementation of csr write for misa
register.

--000000000000ffcc020582c79a69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><font color=3D"#741b47">&gt; It seems to me that th=
e C extension can be enabled at any point, since if C is<br>&gt; off, you k=
now that the next insn is aligned modulo 4.<br>
&gt;<br></font></blockquote><div>=C2=A0</div><div><font color=3D"#741b47">=
=C2=A0&gt; Ok, This is mostly right. When C extension is enabled 32-bit bas=
e instructions can be aligned on 2 bytes boundaries instead of 4 bytes only=
. &gt; So multiple enables and disables of C bit at different code areas th=
eoretically may require this check on C extension enable. I&#39;m not reall=
y &gt;sure, may be this is might not=C2=A0 be a practical use scenario.</fo=
nt></div></div></div></div></blockquote><div><br></div><div>=C2=A0This para=
graph considers the current implementation of csr write for misa register.<=
/div><div>=C2=A0<br></div></div></div>

--000000000000ffcc020582c79a69--

