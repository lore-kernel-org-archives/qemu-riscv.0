Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPaTk-0007BT-2b
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 16:56:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaTg-00079f-Lm
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:56:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaTf-00040K-3O
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:56:08 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPaTb-0003uy-9P; Wed, 21 Nov 2018 16:56:03 -0500
Received: by mail-lf1-x141.google.com with SMTP id n18so5101496lfh.6;
	Wed, 21 Nov 2018 13:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yterr/3E1i9jmbdahX5IiCFu69LQjfctoD4AVPLgZaI=;
	b=dIHUgLbTzvd5YqCA4iF9ezKDY1oKUmbsFdnC1UzUsslWTmQCP8TKS9rrniWFDYMEpn
	JH+iEo7jwo4c0qQu4XvRL2DOHyLjKjKLgTKPFvkhWurQVAkZwD1FvEEGMLnk+JWM0QQ8
	mIanWrjgCAa0X5MfVH5Qw/DxJZNZsFWxrlch9U40Zut82n4xq+RE75gl8MQmwxPRg43N
	0bvnwssL/pTcHx4dz9RDdur2oYRLJt3ErpraW8GbBQyX4W2L/xlfCl7vgI7ChulrcmBc
	szAIAvOBTfx4wA0eGHpV8aW5tRtDlzjHWY69bNVGCfhtBUBri9Nm06N3dm3ePeAm4m9Y
	19HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yterr/3E1i9jmbdahX5IiCFu69LQjfctoD4AVPLgZaI=;
	b=AixUVFeBPaQ+k7OEnXfwkbuv69BBSzmTXnw7QoDb4G7TPiWzIo5xEQe7G1AXA0gWk7
	T0lyvsbX4IWkcnfaFTohEtK3dhgFWC0OGyMnNOv5fZL8+Y0q4aoDvSEZEuYKFi+Fg+qP
	T7PWCQzU/QdWnwz5zVoT3gvarlFeVRKF2VAfRpFLP52FxtYtC/wUrIND1fL01IFhrAax
	l+S9vVKrjfSx9sq86/zpPo+gfExZ6AQ/Yq7z2IK5UU3zRlQ806KzA0R4a+rzzI+12qdf
	S1GEEvo6ICzrm8GBoOIOCG8exrPBTdmV4JqHu7WDV3c91h6k056BEwqAjBtfok+5sZGG
	1KqQ==
X-Gm-Message-State: AGRZ1gKmIGM0fvhOQP0/9rf+hWHnpuhUto2EXEmKwiXqz8oh2zsi8PkQ
	ThJsrZg3aQzFv2IgIy9ldh/2WHXvwO3ERNx67wU=
X-Google-Smtp-Source: AJdET5cn3H0VVZcJMlZrLxJ0HnZYSSdbPWc1tON06SHvOqypLMau9u44KCpWgJzMUfyVyA2Ktt8P+OCuYSZjHjQQP7Y=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr4568982lff.59.1542837361062; 
	Wed, 21 Nov 2018 13:56:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
	<0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
	<CAKmqyKNitWerbpVzQrNye3KiPj=5DVFXan4SpiN-+br_P-RG+Q@mail.gmail.com>
	<0fac09ca-12d5-1462-4456-66646f168ab5@deltatee.com>
In-Reply-To: <0fac09ca-12d5-1462-4456-66646f168ab5@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 13:55:34 -0800
Message-ID: <CAKmqyKMTxgk41cBz=hW-meCUAi-_20vguqN40f_ThRU-rsaJXA@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 6/6] hw/riscv/virt: Connect a
 VirtIO net PCIe device
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
X-List-Received-Date: Wed, 21 Nov 2018 21:56:10 -0000

On Wed, Nov 21, 2018 at 11:12 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 11:34 a.m., Alistair Francis wrote:
> >> I don't understand what this patch actually accomplishes. It doesn't
> >> seem to affect my network devices when running QEMU. Can you provide a
> >> commit message explaining this?
> >
> > Could you connect a PCIe networking device without this commit? This
> > is what the other architectures all do as well.
>
> Yes, actually.
>
> Other architectures doing something is never a sufficient justification
> to make a change. I'm also not sure how virtio relates to this patch...
>
> I'd say unless you know you're fixing something specific and can
> describe it, you should drop this patch.

It is required for networking for PCIe devices. What PCIe device works
for you without this patch? Can you tell me your command line
arguments.

Alistair

>
> Logan

