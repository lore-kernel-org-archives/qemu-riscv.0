Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOsbq-0003Bn-UA
	for mharc-qemu-riscv@gnu.org; Mon, 19 Nov 2018 18:05:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gOsbo-0003AF-HM
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 18:05:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gOsbh-0005x2-FV
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 18:05:31 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:42209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gOsba-0005so-GX; Mon, 19 Nov 2018 18:05:22 -0500
Received: by mail-lf1-x12c.google.com with SMTP id l10so18958159lfh.9;
	Mon, 19 Nov 2018 15:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FmDx9hstBMRmfTLKm1AVSZ7dUslpG7DA6+QPuclcZno=;
	b=oAIFH9/i+BjLltHxnMGQ+uVr8e+8kKu582Z2nC6yZMl7weEWFwQh417o2ZTdPRPaRZ
	TNZTKAhzNUGD5pGAm7oZYQ9SUERBBwYICRtZntwzxEMHCBWznVtvhoKvjrcoXqiVRdeq
	ghOxQGJamDI0Vek3iwXb4FKQQLoIx5IjrcetAKs6sHpt++kv2xB+1cFsJWL+7CaV+6Q7
	TTiUSo3j7D7O5P+f/y3qc20Xk4klFV2Xjuu8Vqh5PtFw/5d0636lAY9wFRZ0zNbpo/9N
	OB1duJcl7FW/Kpc1WJxW1WOE1ukeK7UWa3xVJX3znoQwLCxnnmtTXjGI+Z+pXIQX0MEW
	XREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FmDx9hstBMRmfTLKm1AVSZ7dUslpG7DA6+QPuclcZno=;
	b=sHwEaiJGx0H3j5IbBlamMEVaQrRqeQ+DXY4REibPMGeea7n/cLu8zdsA+VCul5c3Un
	K/GMI0pUYF6kjy2Az0WnTaaw786KZ+c/P3CMvuc7NjkmOqELhN8BZ1dHiotF855/YViB
	Iia0WBj9NMXr4oj2NP2lS12jtoN/EQYryaAD3zayzgkuDjGDG2DUTVLJzeBmUcsh8fW9
	W+TU9LMMDtpqjGS/402snF/nhMvzMe9J5Ny28goOcjqrj1hsEHItajLBwIrNtRXybczN
	YBcIh2LYJGwVhGO+0dS6q6s7vVfYT17LMn84WwlFF1O6UilwR9HtpcJdtLvc/EjsU5Sh
	yTRg==
X-Gm-Message-State: AGRZ1gJMYrnpsdelypzfeMQYbBIcnTarrSPByAr3VSQwC+1QuCHDL8gS
	JJN6YDaUUBSbwaKQOi4gihabYODSixf4Gm8cCJE=
X-Google-Smtp-Source: AJdET5c63l7vuleQUJM+ngSCANRcG5ojfeMMZMRyuwzovMCuzKbyHdoo7c64ootGrpxXQdSJSuKv+N4Er7TPDqJ69ek=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr10975701lff.59.1542668720834;
	Mon, 19 Nov 2018 15:05:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<cd89e90aeb79ed438aaee6cfa02ca42a36d633b6.1542321076.git.alistair.francis@wdc.com>
	<2aa0f464-c9c4-3d59-81da-952279f56843@linaro.org>
In-Reply-To: <2aa0f464-c9c4-3d59-81da-952279f56843@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Nov 2018 15:04:53 -0800
Message-ID: <CAKmqyKN9DQkZUp=+hRwC5AwaX+X0oYgt4=L2Pw8dWAauzS59QQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::12c
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 20/23] riscv: tcg-target: Add
 the target init code
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
X-List-Received-Date: Mon, 19 Nov 2018 23:05:37 -0000

On Fri, Nov 16, 2018 at 9:26 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/15/18 11:36 PM, Alistair Francis wrote:
> > +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L0);
> > +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L1);
> > +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);
>
> Why are these three reserved?

Do these not need to be? I thought we had to reserve them.

Alistair

>
>
> r~

