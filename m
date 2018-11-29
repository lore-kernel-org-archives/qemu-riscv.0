Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gSAo8-0003hM-9W
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 20:07:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSAo6-0003Wz-4s
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 20:07:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSAo4-0002Rh-EL
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 20:07:53 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:37358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gSAnz-0001xk-GD; Wed, 28 Nov 2018 20:07:47 -0500
Received: by mail-lf1-x130.google.com with SMTP id p17so165051lfh.4;
	Wed, 28 Nov 2018 17:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ORnyWYk4fBYcc9xCZvVSExNso80YwA2ALmYZ5birQxQ=;
	b=Iw0qSmPkLmWoRezP90FojPJI8Rhlj+GI71G5TiVD530t4NcTtfUuGvrLff5PO7p6SC
	agfgFSHNF1TojFuxlT80HSlclTfeybahrsHgWgtUzISBo5RbYQUc3hXDvfzIfcsDIus6
	mbBvxO1yZIPtL6b6PvGrk9ACUEx9iIVq6EBzJFguvARmd8Ft8YY9I1iQkUdDf57wwpFO
	QiqxSlIkNH+5/M5LXKoYKI9ODuie164D294lIxebcVUpUse0hJzwzXmfpbcNr3I4ZsT3
	PNNymPTD97CYLpVTNbxNDl9PKs6nrR3baizfcRxYrZbh5RC5/0NWwQ9/6nkuJFgpl+BA
	KQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ORnyWYk4fBYcc9xCZvVSExNso80YwA2ALmYZ5birQxQ=;
	b=LHyZffwZjbzS/SXNuSs3nM5FwJ7FNSSWj/KQZN+j8X4jHcQtsYOmZIn7UUr1H9l1tc
	35Q/+ajba5Tk9g3v7lMPWO3LQc/gED7lY5wvTzHEVkhaSVVDbj7LAQYKikLoJby0uZDF
	ziXR8nPC53GMH3if/ZKoWPXHYtsRnr6ITkMNtTy7QqNrFvVZMQKJSxve6VdTrc92QXi5
	bm7Kg7u3tkmYt0m9/We4WEcqmNydcjt9lhfdCua/OZCnCfqD5vuJtgZNa8FTwjaHX3Ef
	5Nt6KFaLAW+bsDjETzCex6NBDG0rF+tebz/aLhv3zCB1VNAHwxALH6KI49wUOUAlT9nd
	v/eQ==
X-Gm-Message-State: AGRZ1gLgPJqkNJIYa62jmIcIrV9ZwsVzHUivdxAKz9MEFcCfwzR/jkG1
	6sXriFrG2znI+fnmKsDAuYPaLo9AbmHUpI1dA3s=
X-Google-Smtp-Source: AJdET5euFWGzMh6VQwIncE0e6xpH/uSWuMrruWizLroBZVuVqs/KZyfM42YVdSITFiDVyOCKUiUMHCUMgOSGKbvPMdQ=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr24092205lfb.132.1543453625426;
	Wed, 28 Nov 2018 17:07:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<aa41323b013a6c77e28d487d49026df36d60e4c5.1543352682.git.alistair.francis@wdc.com>
	<ea1df40c-ce6c-16a0-4256-298f32748c6c@linaro.org>
In-Reply-To: <ea1df40c-ce6c-16a0-4256-298f32748c6c@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Nov 2018 17:06:38 -0800
Message-ID: <CAKmqyKMDJuX=eqbfG2ZLjmVJySf9SGGK2bdhmV6jS_jODGUkTA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::130
Subject: Re: [Qemu-riscv] [RFC v2 14/24] riscv: tcg-target: Add branch and
 jump instructions
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
X-List-Received-Date: Thu, 29 Nov 2018 01:07:55 -0000

On Wed, Nov 28, 2018 at 12:15 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/27/18 1:08 PM, Alistair Francis wrote:
> > +static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
> > +{
> > +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> > +
> > +    if (offset == sextract64(offset, 0, 26)) {
> > +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> > +    } else {
> > +        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
> > +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_TMP0, 0);
> > +    }
> > +}
> > +
> > +static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
> > +{
> > +    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
> > +    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
> > +    if (offset == sextract64(offset, 1, 20) << 1) {
>
> s/20/26/
>
> Seems like there ought to be more shared code between tcg_out_call_int and
> tcg_out_goto_long, really.

I think tcg_out_goto_long can just be removed and replaced with
tcg_out_call() right?

Alistair

>
>
> r~

