Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBp3M-0003F0-Av
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 19:12:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBp3I-0003DQ-TZ
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBp3H-0007RM-D0
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:12:16 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:42408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hBp38-0005iR-JN; Wed, 03 Apr 2019 19:12:07 -0400
Received: by mail-lf1-x142.google.com with SMTP id b7so330472lfg.9;
	Wed, 03 Apr 2019 16:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CTt/jLIRuotKBbsJDgLnpVygmzry6CI7fXm7Xyq3uAQ=;
	b=nqADsAOldBtoqMbcUsTu2uxmGxZgKps+JvgjLkrvAo+t5IEc7RfXBHLffj1SKiPaXz
	a2dMQEs9aWNCb20a3Ai8KeWkQ+x3g+VvX6h6PxeTWFgHRYHn9Uv96DmbwxuH6iaqUUEg
	XvggnGUvoFSumboFb1wzfiMxvpTu4iAXuqpemamRE5qrsqOXz7KXMPieZJ03caQTf21I
	G5bpC9Av3V2ZBo4TBJlmIWqOHBK0cWB7WzX7MzQHFfgnwoTwu6ULX4JBeDIvKoZ1KzHd
	bVLSksgk88hA9qZQAF5VBnSyzpUfbA7rEhztPWLJNc7t0fm7Bccqz7pwkirAdcu8+wJR
	kfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CTt/jLIRuotKBbsJDgLnpVygmzry6CI7fXm7Xyq3uAQ=;
	b=K1NJ1YPp1X76AW2IJd6RDV3k/UGLXCO7d4DYLoNTHx067FvteuTMkostjFyDvgrqQh
	d69+AlWp3CXeyUYDGOhI2rWbxgw7dUT+xt/1YsPEcOi/i6zSF2aDpfoUCjo+cvKVwhuf
	byC9CQkNzldmK4LobKP8bUGKdT5m3QRvjwTrPjshrCCFNUz7d7pXuk27WQboR14gyXNc
	3wF4vvNvivKUUhd7LLU2tSaMT81ViPWplc0uhM2aLS5St7L25Q4XzZjxjLCgBEGnoQho
	z1D3MhfL6/zUGOYuprZgxPO4n2661O/wFen0dw01hmRLcKurgq6bD4QfkcoBWI8SgtlM
	o4AA==
X-Gm-Message-State: APjAAAVks/DXlb8asVexOW6GP/gUn1Gd3VPfsDqMhN9g8Kt+3TYTzvZf
	TmvGHIBRCkOFu4psOYmbGsxOf0qfdodSKiVylBU=
X-Google-Smtp-Source: APXvYqy/D1q6WX0L51Gntd3B6F0+BPikjY4bQJ91fPQp7wtlkijWFLwuccAnK8seQLxdk0BU0PNQ7Q779+IsTmfmGJI=
X-Received: by 2002:a19:c51a:: with SMTP id w26mr1211844lfe.59.1554333102234; 
	Wed, 03 Apr 2019 16:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVHadZt5Vho5sy6FGVgUW_yvYZg7BGDiGJFtRBCquyOXZA@mail.gmail.com>
In-Reply-To: <CANnJOVHadZt5Vho5sy6FGVgUW_yvYZg7BGDiGJFtRBCquyOXZA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Apr 2019 16:10:13 -0700
Message-ID: <CAKmqyKNVno+jR_PYxgnyqQOSQFCn_ai7GH+hYPgaO=fkqHDa6A@mail.gmail.com>
To: Jonathan Behrens <fintelia@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Do not allow
 sfence.vma from user mode
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
X-List-Received-Date: Wed, 03 Apr 2019 23:12:18 -0000

On Mon, Apr 1, 2019 at 1:39 PM Jonathan Behrens <fintelia@gmail.com> wrote:
>
> The 'sfence.vma' instruction is privileged, and should only ever be allowed
> when executing in supervisor mode or higher.
>
> Jonathan
>
> Signed-off-by: Jonathan Behrens <fintelia@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/op_helper.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index b7dc18a41e..644d0fb35f 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -145,9 +145,10 @@ void helper_tlb_flush(CPURISCVState *env)
>  {
>      RISCVCPU *cpu = riscv_env_get_cpu(env);
>      CPUState *cs = CPU(cpu);
> -    if (env->priv == PRV_S &&
> -        env->priv_ver >= PRIV_VERSION_1_10_0 &&
> -        get_field(env->mstatus, MSTATUS_TVM)) {
> +    if (!(env->priv >= PRV_S) ||
> +        (env->priv == PRV_S &&
> +         env->priv_ver >= PRIV_VERSION_1_10_0 &&
> +         get_field(env->mstatus, MSTATUS_TVM))) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      } else {
>          tlb_flush(cs);
> --
> 2.20.1

