Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsDCN-0003Kj-89
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 15:56:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsDCL-0003KS-Cr
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:56:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsDCK-0008VP-42
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:56:33 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gsDCJ-0008Pm-GC; Fri, 08 Feb 2019 15:56:31 -0500
Received: by mail-lj1-x244.google.com with SMTP id a16so37907ljb.11;
	Fri, 08 Feb 2019 12:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cZu2gantGAIjQdlyQ/9VewqrdaN0Te4QUeJv/IWfFAc=;
	b=SRt0RB1vC18NcpcC4zDtCuKNwZpoIxJg8jvnCt8tVWbEWsuEHWQIoiV4LqS20rCvmo
	tOMzbogh0bnghA22wh4muCaNlBlvofDIqZQzXzO/ZIx+tVpz+pLN0asdy/m84jQczKFq
	KFB7+YuOCCZB2qiT/Uc7tXJ2yelXcPvdTxP8bafdnYDPj5Bm4tx1gbp/YfBA6vyZOgdy
	IeZ16XxDS3hjsvNSopagb29B++vgdpI2Le/UyDxr8BHo3MjXct0JUGPpk1peYI5cj9W3
	u3pSbibQnpWSUNdXfqFBzoGTX36B8i3+GCkJ/V5uzZFyZP4eutJ2DFVAlO/Ho+R3bof0
	Ivtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cZu2gantGAIjQdlyQ/9VewqrdaN0Te4QUeJv/IWfFAc=;
	b=NIv0Q3HQxcQR5a0bHTDvKRfxmiyc0P7VG85+JYzJYeDoRQS8GkdWN8lR9IFmF932/0
	M/bU2OOSm3dIDCplQO16tZMwdEML6XkXRZn0DJhZ52GT5n2vR3mhhKJhhtCybgLweyhB
	YS9T2xUNMDGMbljAi/vP+5XnnmlmYjAdTeweUmEWyaOjEuJ3HNOS92hdGAelJyVFBZx6
	GMRaEVdSY7QM0oCwoW9AqofjSvh9/1xza+1rLoSGXpJ8oq1wjW9uCk85uvV+Tz1vvNJU
	DGii2Wxo68pwxw30g1oJWGd/b7+ECBXZBm3tLf0NXRF8F/LndMKN9W2P2s/92C9Pz4yQ
	IQGQ==
X-Gm-Message-State: AHQUAuYtRW6juKbU//LWQwQwWYO560SmcXI/5J9odanY/MmQ9Hxl1vjK
	3pwYUOCmhtDfQ4AN2VxXlBQwrh2AW4i2M3Q99LOgc2mT
X-Google-Smtp-Source: AHgI3IZY5B2/0Jj6pFLCzOOC8UAC2WFYBLVA6PRpOIshwbwxUgp75FFvNpMGdR8L+aWAvMtxJjwBexyHBcFu2PCJDpw=
X-Received: by 2002:a2e:9e95:: with SMTP id
	f21-v6mr14031092ljk.128.1549652275825; 
	Fri, 08 Feb 2019 10:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20190130210350.16757-1-luke.r.nels@gmail.com>
In-Reply-To: <20190130210350.16757-1-luke.r.nels@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Feb 2019 10:57:17 -0800
Message-ID: <CAKmqyKNPpRKYJunZLQrbNE9LmXLKkMcGUdghe3Ry6kO=R9TQLw@mail.gmail.com>
To: Luke Nelson <luke.r.nels@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>, lukenels@pm.me,
	Michael Clark <mjc@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: Fix pmpcfg register
 indexing
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
X-List-Received-Date: Fri, 08 Feb 2019 20:56:34 -0000

On Wed, Jan 30, 2019 at 2:20 PM Luke Nelson <luke.r.nels@gmail.com> wrote:
>
> pmpcfg_csr_{read,write} do not correctly handle accesses to PMP
> configurations 8 through 15 (CSR pmpcfg2) on RV64.
>
> The current code computes the pmpcfg index using:
>
>   (reg_index * sizeof(target_ulong))
>
> This is incorrect on RV64.  For example, when reg_index is 2 (i.e.,
> pmpcfg2), the computed configuration index will be 16-23, which
> should be 8-15.
>
> A correct way is to use (reg_index * 4) instead, which works for
> both RV32 and RV64.
>
> Cc: Xi Wang <xi.wang@gmail.com>
> Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>

Good catch!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 15a5366616..a1bee56c86 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -311,9 +311,8 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>      }
>
>      for (i = 0; i < sizeof(target_ulong); i++) {
> -        cfg_val = (val >> 8 * i)  & 0xff;
> -        pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
> -            cfg_val);
> +        cfg_val = (val >> (i * 8)) & 0xff;
> +        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>      }
>  }
>
> @@ -328,7 +327,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>      target_ulong val = 0;
>
>      for (i = 0; i < sizeof(target_ulong); i++) {
> -        val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
> +        val = pmp_read_cfg(env, (reg_index * 4) + i);
>          cfg_val |= (val << (i * 8));
>      }
>
> --
> 2.19.1
>
>

