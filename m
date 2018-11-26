Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRJNp-00054D-OV
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 11:05:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJNl-0004wW-1O
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 11:05:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJNf-00042V-Jc
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 11:05:05 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRJNY-0003zk-4v; Mon, 26 Nov 2018 11:04:56 -0500
Received: by mail-lf1-x142.google.com with SMTP id b20so13928016lfa.12;
	Mon, 26 Nov 2018 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fkVH9nNZfZ5TyMoZzlUcS1I6nVnzMDOFfaIfUpsif2I=;
	b=o8XyIrNplkzxbbF86YfRDqRHZicn9O5mx3Z16kf39gR4eTh4H798ida/TfQrUp22lw
	NeFTsV22V7Aycaqui3Af+wHLEMAF3I8WHY5Fd+zYN6Yy3AZ0EJPBbag45IVrdNawJvqm
	w8GcK0jF1H/tAsmSo7A/KHJBJ0Ig7Q5ZoYmeOryy2upl4pSKkzGEWsjvdIk6K3uNBgkN
	ONP5uYifQkH/jrsFqkoLQYtSDR94C6cPI72K4uOYVu/9Y7uV7hOYqeIZ5Xcae0yp6oM+
	9qvBFr0Y9RDxu3F8kJelN+S363XrVkfkNHewFSwToGXgQrxMsx7lqSO7mjZcz14ynNkN
	N9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fkVH9nNZfZ5TyMoZzlUcS1I6nVnzMDOFfaIfUpsif2I=;
	b=XBk7ucN9lPeaJgHqwbQnwlMUsENBgETvaZbx4tbdGOUGI2YOB8DEP3IOa3/SswDtON
	/jOY5JRgVRVZY1Ut/Du6hfJWwuGn04mLXDbF3beyiI1nd/vBq/uyoVfWfTRaFGTJFEgJ
	AlyDv3uLiqsxE6hCT5lHAgdvAz0jAN6aID2+RDMyfCt7SLmemzdcsotL8dAOxNFWOOOe
	TNINNxRsY3NzWAkiirca+A7kdL87Md7pzCU6NCaw/QWoalAVtGR5t7/bryW7l6DbWlkK
	6pTcRLEy8UEbLIVdCTfu2pU8hTAXjwe5M5UB257rSyHLWW1UHzAbAns33X0YjrJ6Ye9+
	qy7g==
X-Gm-Message-State: AGRZ1gLhfsjnGeClI6AuB3JnPUEIu1eH22U5AvSXQQJuVUeEeg0M2Ffg
	H25WgL6HiwtrgTfPD9Kd+AFx93P8mkC3TmWa3I8=
X-Google-Smtp-Source: AJdET5eD7PIpd1WUWg5+u8rsY3lzjwL/oUACSExeziH5LrJl7QRkTZKuLpnFPBTkxJYjJ8C6u0iuQ78+vCfFIiCNHbE=
X-Received: by 2002:a19:ae03:: with SMTP id f3mr17039739lfc.86.1543248294728; 
	Mon, 26 Nov 2018 08:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20181126032038.22044-1-maozhongyi@cmss.chinamobile.com>
In-Reply-To: <20181126032038.22044-1-maozhongyi@cmss.chinamobile.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Nov 2018 08:04:26 -0800
Message-ID: <CAKmqyKOMsHi4wr4xDkhSxEou1k9hxvgUtu_94bBQ35fgKAvvKw@mail.gmail.com>
To: maozhongyi@cmss.chinamobile.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv/cpu: use
 device_class_set_parent_realize
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
X-List-Received-Date: Mon, 26 Nov 2018 16:05:12 -0000

On Sun, Nov 25, 2018 at 7:21 PM Mao Zhongyi
<maozhongyi@cmss.chinamobile.com> wrote:
>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a025a0a3ba..5e8a2cb2ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -330,8 +330,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      CPUClass *cc = CPU_CLASS(c);
>      DeviceClass *dc = DEVICE_CLASS(c);
>
> -    mcc->parent_realize = dc->realize;
> -    dc->realize = riscv_cpu_realize;
> +    device_class_set_parent_realize(dc, riscv_cpu_realize,
> +                                    &mcc->parent_realize);
>
>      mcc->parent_reset = cc->reset;
>      cc->reset = riscv_cpu_reset;
> --
> 2.17.1
>
>
>
>

