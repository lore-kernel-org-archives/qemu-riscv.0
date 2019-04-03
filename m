Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBpd5-0002X3-GM
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 19:49:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBpd2-0002V7-O7
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:49:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBpOA-0005uc-JZ
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:33:52 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hBpO0-0005bK-S6; Wed, 03 Apr 2019 19:33:42 -0400
Received: by mail-lj1-x242.google.com with SMTP id k8so373694lja.8;
	Wed, 03 Apr 2019 16:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7eD8+8D+QxESEed2f/lfyuury4uaZ9o08tV2RBKmE0g=;
	b=JHZozpd+P+Qn1DK069srAUyicV2or4Ve/CJF5DtMgafvAk+2X8GyiW7fe+aDQdJ7g9
	HkKTwEHmCYM4/gpECplNKD7fTi7jx522ipnHAea+SPuh8pK8TNiT4wKN48qsvqGmE/dv
	2dN3+XwHO64BuKibKWFd7sFDLIiik8SU/eMzxd73Q/vsqo3Z6rb4ax4CZ6UtHQuHFTe3
	Leod0f2MUfPsuTok/h3xK9V/QhcwK9qz1oSrWdX8sA6Wel2zWcAops3O+4z7SE/AdLmA
	AQkWtDyBjz3lO4IhOjFnuYLvdALPYi/uXXLdET/jhRcmwQX6/KRo0GG4GdD/tymuGUnt
	NvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7eD8+8D+QxESEed2f/lfyuury4uaZ9o08tV2RBKmE0g=;
	b=bnNd5eU4HmOAwVf56weIU/sHezerzwARLk031tQzF4o45CCSlyQzgPtSuSFfZGqwb4
	Oey4YO5kLgjTdFZgnMm5bGsOdVDsEJ8RUKSdfAUjGB+qH9va9huFRT8W84nXZ9A8I2K8
	ODAE30feqg6dmPswQTHS7Xp9RlDDhc8318DkAo9qJgoWKBtfgL18r03v0N09zzEFYP12
	eknBxmX/USf+6nmyrvDjdD9bP8p/PDG1T2V9gDW2BA7WZyquxhUcqmtvtyuymFU51XOF
	FYu3oIioxyujtA4lA2ZUys1K25/8uyb7uP5xvC25/zJThI7/bEcE6lNWBds51cPM3uvJ
	aSPw==
X-Gm-Message-State: APjAAAVV96E+IiRbfN2GBmrCQD1UuDBFxlHoEspxbo2DYG46NrGEZsQL
	QxCObVIQjB9Yp4i+ArudLriV00UrUWCG/QSwUOs=
X-Google-Smtp-Source: APXvYqxWUfDi5pWO/HqkHfM06IuhI+pg/Mm7/vid/q/1gpC07XfpRdC+R4DopWw03PxhDY+DEIku1dXQ9tSyZ61ZyWg=
X-Received: by 2002:a2e:9843:: with SMTP id e3mr1385417ljj.28.1554334419083;
	Wed, 03 Apr 2019 16:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553712571.git.alistair.francis@wdc.com>
	<mhng-9286e210-d632-41e0-b30d-cfdef1a43396@palmer-si-x1c4>
In-Reply-To: <mhng-9286e210-d632-41e0-b30d-cfdef1a43396@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Apr 2019 16:32:11 -0700
Message-ID: <CAKmqyKOAMGBcgRscu9QzpQYsA=qTeGgkK+03F=0YRhtzUFaXVw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v2 0/2] Update the QEMU PLIC
 addresses
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
X-List-Received-Date: Wed, 03 Apr 2019 23:49:14 -0000

On Wed, Mar 27, 2019 at 8:23 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 27 Mar 2019 11:51:15 PDT (-0700), Alistair Francis wrote:
> > This series updates the PLIC address to match the documentation.
> >
> > This fixes: https://github.com/riscv/opensbi/issues/97
> >
> > V2:
> >  - Squash patches to ensure biesctability
> >
> > Alistair Francis (2):
> >   riscv: plic: Fix incorrect irq calculation
> >   riscv: plic: Log guest errors
> >
> >  hw/riscv/sifive_plic.c      | 16 +++++++++++-----
> >  hw/riscv/sifive_u.c         |  2 +-
> >  include/hw/riscv/sifive_e.h |  2 +-
> >  include/hw/riscv/sifive_u.h |  4 ++--
> >  include/hw/riscv/virt.h     |  2 +-
> >  5 files changed, 16 insertions(+), 10 deletions(-)
> >
> > --
> > 2.21.0
>
> Thanks, I've got these on for-master.  I'll let them sit for a bit to see if
> there are any other comments, but
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Ping! Just want to make sure these make it into 4.0

Alistair

