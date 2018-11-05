Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJj5R-0000Cm-Bw
	for mharc-qemu-riscv@gnu.org; Mon, 05 Nov 2018 12:54:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gJj5P-0000BW-Fj
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 12:54:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gJj5O-000450-QI
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 12:54:51 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gJj5M-0003gY-Au; Mon, 05 Nov 2018 12:54:48 -0500
Received: by mail-lj1-x242.google.com with SMTP id u6-v6so8911875ljd.1;
	Mon, 05 Nov 2018 09:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zhcg3mddHYRXgcL/xTpRWnjOSixJuOAjALopCvxwQvA=;
	b=HnsnPLBVcJTM0cGwAXU97/prTOjmBfBLDaNrRkPQX99cScAGQw/Ylh6NhuH1H8Ivrt
	VXHep0mIr1eAE2Ry3gyqQO2zDNWXomgmEq6iybqxryu4Z5ltfHsqjuVyiHVUWnlbwnGT
	fVsqQvhbQoyztJCOSsj8VYeOaBx4ywH8N7WsmFqtJNjzryagKk/89T6MzuiKWpONAoQQ
	pShLjOxAJO4G752ZHlKnQhr+9rZw+V+LPxD5Cr42CZnoe8tapGAcQod4KllakYuSfYJ1
	NI/LeIT8/D/2TD24sk4HLjy6l0daAT9yDZKm+qiVqkO/Mb9P+7FHuOBu5ISnL3twAdoB
	F/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zhcg3mddHYRXgcL/xTpRWnjOSixJuOAjALopCvxwQvA=;
	b=D5D2bmvrf3VaXvK+GI/yTCcqsmD4ICiID+CjxcIMqfYDYnHQMe1JC2W5X4NPiEw7QZ
	KvGqlsHSUfpaT5WxqdLgckg72HacYisPdTrTzroBfIp2YiuWgrKZfYVxa1807o++zpbK
	iizDq2Qeh1AHlBLAkiAkBh3ztAzq7iHsyhXVNRnWJtjcTJybKfKdjstnWG8U0Gwecenv
	KVV/GpZNa5k/fGfgalWkRbxdEZLf1aeLoq7dtfjWxv69zbL1RhMz3JtCM7RnBXRXqQZW
	sNH+9ZAtQ1UCgXKP/ULLr5ER5VSosFetgN1yeG6ejgw+80fSVQ81QtoirMROI4sWfeTv
	gdRw==
X-Gm-Message-State: AGRZ1gIILRJ2aGNvjcfSMTkF7N4zIlxUaxkCAutTbB2cVyVF4PjBtEh1
	FoKu+7NxWRWIbHUg49vB1vYEjxRUAfZeChM8WH0=
X-Google-Smtp-Source: AJdET5dX6AK0VhbSjNp0pRJ18x4dJ3q5581wea2iJJ+ddEyQAuuWiroUSgdFKTgiFqflDFKnVi04wupq4vTLPxrDrhA=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr7656442lja.111.1541440469528; 
	Mon, 05 Nov 2018 09:54:29 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_mT2FT=t+Fw7=7aUgDkX1b64oqFS99_jFN7_12MRCx+g@mail.gmail.com>
In-Reply-To: <CAFEAcA_mT2FT=t+Fw7=7aUgDkX1b64oqFS99_jFN7_12MRCx+g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Nov 2018 09:54:02 -0800
Message-ID: <CAKmqyKPuKUUkXuFW9v6Zo+Yid_U9ye_Dx5Nai5273NYSD7B+2A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] coverity-spotted memory leak in
 hw/riscv/spike.c
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
X-List-Received-Date: Mon, 05 Nov 2018 17:54:52 -0000

On Mon, Nov 5, 2018 at 5:42 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Hi; Coverity has noticed a memory leak in hw/riscv/spike.c:
> it malloc()s memory into config_string(), but never frees it.
> (CID 1391015). This isn't a very serious leak since the function
> only ever runs once, but it would be nice to fix this for 3.1
> (it is the only coverity error in the riscv code, and one of
> just 8 unaddressed for QEMU as a whole).
>
> Incidentally, "malloc and then snprintf" would be better
> done using g_strdup_printf(), which automatically allocates
> sufficient memory for the string, avoiding the need to
> try to pre-calculate the right size.

I can check this out today. Thanks for pointing it out.

Alistair

>
> thanks
> -- PMM
>

