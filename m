Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gL04C-0008UC-En
	for mharc-qemu-riscv@gnu.org; Fri, 09 Nov 2018 01:14:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gL04A-0008Ta-Nt
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 01:14:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gL049-00086o-QS
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 01:14:50 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gL049-0007RU-Fe
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 01:14:49 -0500
Received: by mail-ot1-x342.google.com with SMTP id z33so665213otz.11
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 22:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=c6EJKhpaaR+rZTL7WJJJFmlA07yICWbRp+VKE2sn2zc=;
	b=RBGQrrxkMWoaDzuQMkfFiv5zJiooM6BxEmxCSiAC1oPjLWFFTv92d+HRRgh5KFfe3Z
	OOB3Jh354n6OZvANORjpqv4XbC4lbtwVTZeVsQP3buLleK3rxo1gNSe8VmLUMwGYtBjI
	jySEIkx6wEnKjsA54NryhE/B5jkX2BLmh3Y8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=c6EJKhpaaR+rZTL7WJJJFmlA07yICWbRp+VKE2sn2zc=;
	b=Mci2s+PrS9stmaK2tnY8txDW5nXdKIxU6mIFCxyIq/h3DqVB7xZz+5Az2BEdpg82I8
	A0Dvecl6T+bN0rD2vISotW12O8myiSHymALwUXnXo/0gGt8L2prMXQcmTYVndTDPsb25
	7egE+LW196SHent40Aycyl/uV059aIZFr6n3HCzaOWZhrbbjgdn7WxqeNH7ELSyAe3ig
	VjIDQIo19dYQZnG1fTcSzdYnRP4dMnzEBzGmS6iQzvOCaWZc4Pk2Nj8vZfyhFleziVDn
	47jPDDk0y6U7JRpCAof/baE/geT+q9Hksoj6r5OnCeujHGFcvT7Pfwjr33r5zh1PheUK
	M0Vg==
X-Gm-Message-State: AGRZ1gIF5/j98P2z3bhclecRovRQ3mY04+MI2XP/rD4z4gvWuUKe0M4X
	QMshTq48XAERt4JKSWrMz8Et4A==
X-Google-Smtp-Source: AJdET5dAkFa+JlWe2QIa5vskiB+DnjP4mYZnGUV1XgqY7cs3xPWey3a7Thd0pB8k+O9FE3IEaStvUQ==
X-Received: by 2002:a9d:212d:: with SMTP id i42mr4323861otb.146.1541744074932; 
	Thu, 08 Nov 2018 22:14:34 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.6.75])
	by smtp.gmail.com with ESMTPSA id
	j13sm2183547oth.48.2018.11.08.22.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 22:14:33 -0800 (PST)
To: Palmer Dabbelt <palmer@sifive.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Michael Clark <mjc@sifive.com>, sagark@eecs.berkeley.edu,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <mhng-133c83c5-d4e7-402a-935f-3ed9ca6b44b3@palmer-si-x1c4>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1012b899-dc7d-fd87-7a87-cf5abba77754@linaro.org>
Date: Fri, 9 Nov 2018 07:14:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <mhng-133c83c5-d4e7-402a-935f-3ed9ca6b44b3@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 0/2] target/riscv: Bugfixes
 found in decodetree conversion
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
X-List-Received-Date: Fri, 09 Nov 2018 06:14:51 -0000

On 11/8/18 8:12 PM, Palmer Dabbelt wrote:
> * We don't take advantage of the ordering bits on fences, which could allow us
>  to emit less conservative fences.  This would presumably increase  performance.

Yes.

> * We treat fences as NOPs under "#ifndef CONFIG_USER_ONLY", which is a bug.

Ah yes, I'd forgotten this one.  This is a bug, in that multi-threaded user
programs do not get the memory ordering that they requested.

Hard to see, obviously, since the emulator has its own memory operations,
barriers, and locks.  But once we have a lot of the hot path of the user
program compiled, there's a lot less of that.


>     case OPC_RISC_FENCE:
> -#ifndef CONFIG_USER_ONLY
>         if (ctx->opcode & 0x1000) {
>             /* FENCE_I is a no-op in QEMU,
>              * however we need to end the translation block */
> @@ -1777,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env,
> DisasContext *ctx)
>             /* FENCE is a full memory barrier. */
>             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>         }
> -#endif
>         break;

Yes, this is minimally correct.


r~

