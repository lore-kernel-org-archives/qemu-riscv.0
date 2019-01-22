Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm3ru-00030l-HJ
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 16:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm3rt-0002zy-2m
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:46:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm3rp-0003KJ-Ak
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:45:59 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:37923)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gm3rj-0003D7-PQ; Tue, 22 Jan 2019 16:45:54 -0500
Received: by mail-lf1-x143.google.com with SMTP id a8so47984lfk.5;
	Tue, 22 Jan 2019 13:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xsfwJkxZ4O9MITlJmRuRFSUc1Nf64adrAxKNo2uTiqw=;
	b=LCatc0jLdgfxOe1wabvwZu7v/Sk2EOMDlq/aDrzalir2Ka29WQ+IXS9UkePJkY4w6w
	wf4Ao4yvEWN4OrkiWJNnLOnFNlWFKkR0wqutLCONWVischaCBpPsYLVKkvxXsirCOhdd
	W3xxz+CtsxdQfKgAPuZD/P8fyNyADzGLNNtqgFD05Qsjm8oqCJLf5aKYes2YkxLdmTPi
	wCHAOn6fXn9sgJMvQHzA70us+gHMalFcfjiUOdhRLjBadjh1Oj6W772FE8MuiHGCrb5a
	515IGnfgVEDZpARl0k+0viWhBzCw6mRjPQsJ6yXglBf5mAfFOtD1KcsqUj4piHAjdhsi
	dA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xsfwJkxZ4O9MITlJmRuRFSUc1Nf64adrAxKNo2uTiqw=;
	b=i1upI7TBJVzMduaZ4nO5bmUnzEHBQaOC9FYtYDgoMC+XxEoCINgC+5yslKjji4WUlA
	MWgdfYzOFQiMdKs9INvUwNXkfL2FO2Ri5+4z0uz3r3gddl6wpqtLrR9N2a9z13RKAECY
	GatiKcRY0ZwZFCgyjSTm2/kevmVHaWXEbBCyXef7x+OejYAyVcVTMyCxn47km7Ch1cve
	YpBgSgV2ZwtdOl3WQApVdw2lS+T+MMhDiqYiSL39OO4qCmQN9/Kyg+xW7RHnIJhgBuSD
	QoDKpRIyeRJe6DpyxrusnWKa9J28vT83WzgyRIJX3EF1pDkn1UuWojQQlckt/FgvlWYe
	NnMQ==
X-Gm-Message-State: AJcUukeNRzROAc1E7khz28BUDvkipbYUB0aqOcGT6DwSiXAbIgRItixy
	mDIfHkUJsnVTX5PfCFLtDuf3+HQnH6d5VoY/WUI=
X-Google-Smtp-Source: ALg8bN4x46uZfUKpCBU9eQpbAGoZoArNVl3vQ8uAvOWQgJ2JAzDMdRB4Pa1EoP2kUknjyXtT82aCDVBRU9v5tic9QOs=
X-Received: by 2002:a19:9b50:: with SMTP id d77mr22574148lfe.137.1548193548725;
	Tue, 22 Jan 2019 13:45:48 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220951.4962-1-jimw@sifive.com>
	<f3e26863-4624-2c8f-5a9d-f3e76b7e6f0e@linaro.org>
	<CAFyWVaYnSCDnX7j3XugT8zMw-wC=EdXiEJevb1pJkvzfD_qfGg@mail.gmail.com>
In-Reply-To: <CAFyWVaYnSCDnX7j3XugT8zMw-wC=EdXiEJevb1pJkvzfD_qfGg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jan 2019 13:45:21 -0800
Message-ID: <CAKmqyKP3wOiHvpqyFZZCzy3c7sJP86P30JXUA0P2jAvRL7QgbQ@mail.gmail.com>
To: Jim Wilson <jimw@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Tue, 22 Jan 2019 21:46:01 -0000

On Sun, Dec 30, 2018 at 11:22 AM Jim Wilson <jimw@sifive.com> wrote:
>
> On Sat, Dec 29, 2018 at 2:23 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> > On 12/29/18 9:09 AM, Jim Wilson wrote:
> > > +int csr_register_map[] = {
> >
> > static const?
>
> If I add static const here, then I get a build error if this patch is
> applied to the tree but the following patch #5 that uses the variable
> is not applied.  Though I suppose I could fix that if I put the static
> const in patch 5.  That would look a little funny but would work.
>
> > Putting an initialized variable in a header file doesn't seem right.  Is this
> > supposed to be a declaration that is shared between c files?
>
> I did it this way for two reasons.  It makes it easier to keep the
> register mapping consistent with the gdb csr file, if the gdb csr file
> happens to change in the future.  We can just do a line by line
> comparison of the gdb csr file against the csr-map.h file to verify
> that the csr names match.  And it makes for a cleaner patch if the gdb
> csr file register numbering gets fixed in the future, in that case we
> can just delete this file and change a few lines to stop using this
> variable.
>
> This variable is only meant to be used in one file, the
> target/riscv/gdbstubs.c file.

I think it makes more sense to just define the variable in the
gdbstubs.c file then. Can you move it to patch 5?

Alistair

>
> Jim
>

