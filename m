Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goJqk-0000VO-KN
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jan 2019 22:14:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1goJqi-0000SY-Ft
	for qemu-riscv@nongnu.org; Mon, 28 Jan 2019 22:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1goJon-000657-Tn
	for qemu-riscv@nongnu.org; Mon, 28 Jan 2019 22:12:10 -0500
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:37708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1goJon-000645-PL
	for qemu-riscv@nongnu.org; Mon, 28 Jan 2019 22:12:09 -0500
Received: by mail-vs1-xe44.google.com with SMTP id n13so11152902vsk.4
	for <qemu-riscv@nongnu.org>; Mon, 28 Jan 2019 19:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJlvKXnjEElDDt7N9CTltqQ90TiryN4W+KkJADq9iA4=;
	b=hElcdDorDS2fp+ISTdKD9yQvZOdTS5kJTC7Bemxe9/TkhQELo3cPM2gmfbFmqaGBLk
	+ommwpyArTpCgKlbPktF6h3KzrlNcL9sEDdGN3y7Ymz6Wql1Rnw9GcYglKcIIEfbdyNR
	R2rXkcB46u4JVzIN2TUNPcaLaIQ9F0punKOKAmV7c08yiyIP3eTbwJof8wuQMCHVygzs
	HQTjkJ4xOo5gO3qZcIypLXI0TuiAyBYPlJ53rJQFGsWyKLe9d0otdII7xhX8mO7XXIcs
	vR064xmcKO/F+YR757b9XEPL0r9JoctWWFKXAqqu93FeHSJ+/cx3lriQs29qH6+HREo6
	CzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJlvKXnjEElDDt7N9CTltqQ90TiryN4W+KkJADq9iA4=;
	b=K24NR2zgS2TC7tyGQ9hOAYpLDk0O++sCONEaZQ1gq1V2AhH0LaX3TLIOLJvM4gh+3J
	ENwL3pjefe4vM+EaWMfYkXO/IJyAzrGzZVRBDs1fgox5wS0ulJhiRLrE1mkiRT2qAsA3
	wFGkNB6sCDJ+uN846qdptSmqMms5ii8IupqWkgh52oiPEry/vNU7gh+OuIqQ/o8ICIQJ
	BNzcLdwtioD+brsNJ/+kPFr9zQR1QgfkxW+igPgvzcpyLEWRtkP2ngpX80pE5tzp9I8F
	FZMUSCTHp7EwZBQDeW/oTlQhm+gSZxfJqrCxM62CADUIc5lAbKXrsPwxwqwmSdiBJ0Ch
	/Znw==
X-Gm-Message-State: AJcUukfXmWQeLUxyApNMDW2uIOhPfGpdfqcc/IsMtQ2BB2iT5cuMUAh8
	U/mi4HlEnhg8oK0br0lqYfhV/7E90Tk7g8IzIHOIpA==
X-Google-Smtp-Source: ALg8bN7I+Z/uwkDhdCQCLi5JYY9cP9wPhdoPDHj4NBC+55/vCu6sZV46fd3qaZjovLlLPlukPZH2l+vNmhgn7Q1LXEM=
X-Received: by 2002:a67:4e5d:: with SMTP id c90mr10662060vsb.72.1548731528967; 
	Mon, 28 Jan 2019 19:12:08 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228221102.5080-1-jimw@sifive.com>
	<CAKmqyKMT7F_ziNjbdTU08ph33DnSkKyt+dSMSVXLVZffSvBu-w@mail.gmail.com>
In-Reply-To: <CAKmqyKMT7F_ziNjbdTU08ph33DnSkKyt+dSMSVXLVZffSvBu-w@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Mon, 28 Jan 2019 19:11:58 -0800
Message-ID: <CAFyWVaYACGYvUe2ehYiT0hjJR4bUc44ZG5niEdT7mJOMXxGVpg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e44
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 5/5 v2] RISC-V: Add hooks to
 use the gdb xml files.
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
X-List-Received-Date: Tue, 29 Jan 2019 03:14:09 -0000

On Tue, Jan 22, 2019 at 1:52 PM Alistair Francis <alistair23@gmail.com> wrote:
> You can get env and then check for floating point support:
>
> CPURISCVState *env = &cs->env;
> if (env->misa_mask & RVF) {
> ...

I needed this which wasn't hard to figure out.
    RISCVCPU *cpu = RISCV_CPU(cs);
    CPURISCVState *env = &cpu->env;
    if (env->misa & RVF) {

The tricky bit was figuring out how to test it, because I wasn't sure
if making registers conditional would actually work.  I figured out
that using -machine sifive_e gives me a target with no fpu, and
playing with that a bit I get the expected result, which is that the
FP regs don't print anymore.  The FP related CSRs still do, but that
would require gdb fixes I think, because gdb knows that they are both
FP regs and CSR, and tries to print them both ways.  That leads to a
more general problem of figuring out exactly which CSRs a particular
target implements, which is a bigger problem than I have time to fix
at the moment, and should be handled as a separate problem.

Since my patch set is now a month old, I'll rebase onto current master
and post a version 3 patch set.

Jim

